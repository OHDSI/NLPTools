package edu.uth.clamp.wraper;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.uima.UIMAException;

import edu.uth.clamp.nlp.structure.ClampNameEntity;
import edu.uth.clamp.nlp.structure.ClampRelation;
import edu.uth.clamp.nlp.structure.ClampSection;
import edu.uth.clamp.nlp.structure.ClampToken;
import edu.uth.clamp.nlp.structure.Document;
import edu.uth.clamp.nlp.structure.XmiUtil;

public class OmopNLPRecord {
	public static final int WINDOWSIZE = 40;

	long note_nlp_id;			//	Yes	Big Integer	A unique identifier for each term extracted from a note.
	long note_id;				//	Yes	integer	A foreign key to the Note table note the term was extracted from.
	String section_concept_id;	//	No	integer	A foreign key to the predefined Concept in the Standardized Vocabularies representing the section of the extracted term.
	String snippet;				//	No	string(250)	A small window of text surrounding the term.
	String offset;				//	No	string(50)	Character offset of the extracted term in the input note.
	String lexical_variant;		//	Yes	string(250)	Raw text extracted by the NLP tool.
	String note_nlp_concept_id;	//	No	integer	Foreign key to Concept table. Represents the normalized concept for extracted term. Domain of the term is represented as part of the Concept table.
	long note_nlp_source_concept_id;	//No	integer	A foreign key to a Concept that refers to the code in the source vocabulary used by the NLP system.
	String nlp_system;			//	No	string(250)	Name and version of the NLP system that extracted the term.
	String nlp_date;			//	Yes	date	The date of the note processing.
	String nlp_date_time;		//	No	datetime	The date and time of the note processing.
	String term_exists;			//	No	Boolean	Term_exists is defined as a flag that indicates if the patient actually has or had the condition. Any of the following modifiers would make Term_exists false: Negation = true; Subject = [anything other than the patient]; Conditional = true; Rule_out = true; Uncertain = very low certainty or any lower certainties. A complete lack of modifiers would make Term_exists true. For the modifiers that are there, they would have to have these values: Negation = false; Subject = patient; Conditional = false; Rule_out = false; Uncertain = true or high or moderate or even low (could argue about low).
	String term_temporal;		//	No	string(50)	Term_temporal is to indicate if a condition is “present” or just in the “past”. The following would be past: History = true; Concept_date = anything before the time of the report.
	String term_modifiers;		//	No	string(2000)	Describes compactly all the modifiers extracted by nlp system. For example, “son has rash” → “negated=no,subject=family,certainty=undef,conditional=false,general=false”. Value will be saved as one of the modifiers.

	public OmopNLPRecord( Document doc, ClampSection sec, ClampNameEntity cne ) {
		
		// 1. map section;
		// section_concept_id;
		section_concept_id = sec.getSectionName();
		
		// 2. get snippet;
		// snippet;
		
		int s = cne.getBegin() - WINDOWSIZE;
		int e = cne.getEnd() + WINDOWSIZE;
		s = sec.getBegin() > s ? sec.getBegin() : s;
		e = sec.getEnd() > e ? e : sec.getEnd();
		snippet = "";
		for( ClampToken t : XmiUtil.selectToken( doc.getJCas(), s, e) ) {
			snippet += t.textStr() + " ";
		}
		snippet = snippet.trim();
		
		// 3. get offset;
		offset = cne.getBegin() + "-" + cne.getEnd();
		
		// 4. get term;
		// term itself;
		lexical_variant = cne.textStr();
		

		
		// 6. nlp_system
		nlp_system = "CLAMP";
		
		// 7. nlp_date
		nlp_date = new SimpleDateFormat("MM/dd/yyyy").format(new Date());
		
		// 8. nlp_date_time;
		nlp_date_time = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(new Date());

		if( cne.getSemanticTag().equals( "problem" ) ) {
			parseProblem( doc, cne );
		} else if( cne.getSemanticTag().equals( "treatment" ) ) {
			parseTreatment( doc, cne );
		} else if( cne.getSemanticTag().equals( "test" ) ) {
			parseTest( doc, cne );
		} else if( cne.getSemanticTag().equals( "drug" ) ) {
			parseDrug( doc, cne );
		}
		
		Map<String, String> attrMap = new HashMap<String, String>();
		term_temporal = "";
		for( ClampRelation rel : doc.getRelations() ) {
			ClampNameEntity t = null;
			if( rel.getEntFrom().getUimaEnt().equals( cne.getUimaEnt() ) ) {
				t = rel.getEntTo();
			} else if( rel.getEntTo().getUimaEnt().equals( cne.getUimaEnt() ) ) {
				t = rel.getEntFrom();
			}
			if( t == null ) {
				continue;
			}
			String k = t.getSemanticTag();
			if( k.indexOf( ":" ) >= 0 ) {
				k = k.substring( k.lastIndexOf( ":" ) + 1 );
			}
			attrMap.putIfAbsent( k, "" );			
			attrMap.put( k,  (attrMap.get( k ) + " " + t.textStr()).trim() );
		}
		if( attrMap.containsKey( "temporal" ) ) {
			term_temporal = attrMap.get( "temporal" );
		}
		
		term_modifiers = "";
		for( String k : attrMap.keySet() ) {
			term_modifiers += k + "=[" + attrMap.get(k) + "], ";
		}
		term_modifiers = term_modifiers.trim();
		if( term_modifiers.endsWith( "," ) ) {
			term_modifiers = term_modifiers.substring(0, term_modifiers.length() - 1 );
		}
		
		term_exists = "True";
		if( cne.getAssertion() != null && cne.getAssertion().equals( "absent" ) ) {
			term_exists = "False";
		}
		if( attrMap.containsKey( "CON" ) ) {
			term_exists = "False";
		}
		if( attrMap.containsKey( "SUB" ) 
				&& attrMap.get("SUB").toLowerCase().indexOf( "patient" ) < 0
				&& attrMap.get("SUB").toLowerCase().indexOf( "pt" ) < 0
			) {
			term_exists = "False";
		}
		
		note_nlp_concept_id = cne.getUmlsCui();
	}
	
	void parseProblem( Document doc, ClampNameEntity cne ) {
		// 5. get encoding;
		// map to concept table;
		
		// 9. term_exists
		// check attributes;
		
		// 10. term_temporal;
		
		// 11. term_modifiers;
		// collect all term modifiers;
	}
	void parseTreatment( Document doc, ClampNameEntity cne ) {
		// 5. get encoding;
		// map to concept table;
		
		// 9. term_exists
		// check attributes;
		
		// 10. term_temporal;
		
		// 11. term_modifiers;
		// collect all term modifiers;
	}
	void parseTest( Document doc, ClampNameEntity cne ) {
		// 5. get encoding;
		// map to concept table;
		
		// 9. term_exists
		// check attributes;
		
		// 10. term_temporal;
		
		// 11. term_modifiers;
		// collect all term modifiers;
	}
	void parseDrug( Document doc, ClampNameEntity cne ) {
		// 5. get encoding;
		// map to concept table;
		
		// 9. term_exists
		// check attributes;
		
		// 10. term_temporal;
		
		// 11. term_modifiers;
		// collect all term modifiers;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append( section_concept_id + "\t" );
		sb.append( snippet + "\t" );
		sb.append( offset + "\t" );
		sb.append( lexical_variant + "\t" );
		sb.append( nlp_system + "\t" );
		sb.append( note_nlp_concept_id + "\t" );
		sb.append( nlp_date + "\t" );
		sb.append( nlp_date_time + "\t" );
		sb.append( term_exists + "\t" );
		sb.append( term_temporal + "\t" );
		sb.append( term_modifiers );
		return sb.toString();
	}
	
	public String dumpHtml() {
		StringBuilder sb = new StringBuilder();

		sb.append( "<td>" + section_concept_id + "</td>" );
		sb.append( "<td>" + snippet + "</td>" );
		sb.append( "<td>" + offset + "</td>" );
		sb.append( "<td>" + lexical_variant + "</td>" );
		sb.append( "<td>" + nlp_system + "</td>" );
		sb.append( "<td>" + note_nlp_concept_id + "</td>" );
		sb.append( "<td>" + nlp_date + "</td>" );
		sb.append( "<td>" + nlp_date_time + "</td>" );
		sb.append( "<td>" + term_exists + "</td>" );
		sb.append( "<td>" + term_temporal + "</td>" );
		sb.append( "<td>" + term_modifiers + "</td>" );
		
		return sb.toString();
	}
	
	
	public static void main( String[] argv ) throws UIMAException, IOException {
		
		File indir = new File( "/Users/jwang16/Documents/runtime-ClampGUI.product/MyPipeline/clamp-ner-attribute2/Data/Output/" );
		for( File file : indir.listFiles() ) {
			if( file.getName().startsWith( "." ) || !file.getName().endsWith( ".xmi" ) ) {
				continue;
			}
			System.out.println( file.getName() );
			Document doc = new Document( file );

			for( ClampSection sec : doc.getSections() ) {
				for( ClampNameEntity cne : XmiUtil.selectNE( doc.getJCas(), sec.getBegin(), sec.getEnd() ) ) {
					if( cne.getSemanticTag().equals( "problem" ) ) {
						OmopNLPRecord r = new OmopNLPRecord( doc, sec, cne );
						System.out.println( r );
					} else if( cne.getSemanticTag().equals( "drug" ) ) {
						OmopNLPRecord r = new OmopNLPRecord( doc, sec, cne );
						System.out.println( r );
					} else if( cne.getSemanticTag().equals( "treatment" ) ) {
						OmopNLPRecord r = new OmopNLPRecord( doc, sec, cne );
						System.out.println( r );
					} else if( cne.getSemanticTag().equals( "test" ) ) {
						OmopNLPRecord r = new OmopNLPRecord( doc, sec, cne );
						System.out.println( r );
					}
				}
			}
			//break;
		}
	}

}
