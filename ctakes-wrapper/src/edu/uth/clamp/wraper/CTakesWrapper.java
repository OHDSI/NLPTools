package edu.uth.clamp.wraper;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.io.IOUtils;
import org.apache.ctakes.clinicalpipeline.ClinicalPipelineFactory;
import org.apache.ctakes.typesystem.type.constants.CONST;
import org.apache.ctakes.typesystem.type.refsem.UmlsConcept;
import org.apache.ctakes.typesystem.type.textsem.IdentifiedAnnotation;
import org.apache.uima.UIMAException;
import org.apache.uima.UIMAFramework;
import org.apache.uima.analysis_engine.AnalysisEngine;
import org.apache.uima.analysis_engine.AnalysisEngineDescription;
import org.apache.uima.cas.FeatureStructure;
import org.apache.uima.fit.factory.JCasFactory;
import org.apache.uima.fit.util.JCasUtil;
import org.apache.uima.jcas.JCas;
import org.apache.uima.jcas.cas.FSArray;
import org.apache.uima.resource.ResourceInitializationException;
import org.apache.uima.resource.ResourceManager;

public class CTakesWrapper {
	
	AnalysisEngine aaeInst = null;
	
	public CTakesWrapper() throws ResourceInitializationException {
		final AnalysisEngineDescription aed = ClinicalPipelineFactory.getFastPipeline();
	    ResourceManager resMgr = UIMAFramework.newDefaultResourceManager();
	    aaeInst = UIMAFramework.produceAnalysisEngine(aed, resMgr, null);
	}
	
	public String run(String sentence) throws UIMAException {
		final JCas jcas = JCasFactory.createJCas();
		jcas.setDocumentText(sentence);
	    aaeInst.process( jcas );
	    
	    StringBuilder sb = new StringBuilder();
	    for (IdentifiedAnnotation entity : JCasUtil.select(jcas,
				IdentifiedAnnotation.class)) {
			for( String cui : getCUIs( entity ) ) {
				sb.append( "cTAKESFast\t" );
			    sb.append( cui );
				sb.append( "\t" );
				sb.append( entity.getBegin() );
			    sb.append( "\t" );
			    sb.append( entity.getEnd() );
			    sb.append( "\t" );
				sb.append( entity.getCoveredText() );
				sb.append( "\t" );
				sb.append( "polarity:[" );
				sb.append( entity.getPolarity() );
				sb.append( "], uncertain=[" );
				sb.append( entity.getUncertainty() == CONST.NE_UNCERTAINTY_PRESENT );
				sb.append( "], subject=[" );
				sb.append( entity.getSubject() );
				sb.append( "], generic=[" );
				sb.append( entity.getGeneric() == CONST.NE_GENERIC_TRUE );
				sb.append( "], condition=[" );
				sb.append( entity.getConditional() == CONST.NE_CONDITIONAL_TRUE );
				sb.append( "], history=[" );
				sb.append( entity.getHistoryOf() == CONST.NE_HISTORY_OF_PRESENT );
				sb.append( "]\n");
			}
		}
		return sb.toString();
	}
	
	public String runDocument(String doc) throws UIMAException {
		final JCas jcas = JCasFactory.createJCas();
		jcas.setDocumentText( doc );
	    aaeInst.process( jcas );
	    
	    StringBuilder sb = new StringBuilder();
		for (IdentifiedAnnotation entity : JCasUtil.select(jcas,
				IdentifiedAnnotation.class)) {
			for( String cui : getCUIs( entity ) ) {
				sb.append( "cTAKESFast\t" );
			    sb.append( cui );
				sb.append( "\t" );
				sb.append( entity.getBegin() );
			    sb.append( "\t" );
			    sb.append( entity.getEnd() );
			    sb.append( "\t" );
				sb.append( entity.getCoveredText() );
				sb.append( "\t" );
				sb.append( "polarity:[" );
				sb.append( entity.getPolarity() );
				sb.append( "], uncertain=[" );
				sb.append( entity.getUncertainty() == CONST.NE_UNCERTAINTY_PRESENT );
				sb.append( "], subject=[" );
				sb.append( entity.getSubject() );
				sb.append( "], generic=[" );
				sb.append( entity.getGeneric() == CONST.NE_GENERIC_TRUE );
				sb.append( "], condition=[" );
				sb.append( entity.getConditional() == CONST.NE_CONDITIONAL_TRUE );
				sb.append( "], history=[" );
				sb.append( entity.getHistoryOf() == CONST.NE_HISTORY_OF_PRESENT );
				sb.append( "]\n");
			}
		}
		return sb.toString();
	}

	static private Set<String> getCUIs(
			final IdentifiedAnnotation identifiedAnnotation) {
	    Set<String> cuiSet = new HashSet<String>();

		final FSArray fsArray = identifiedAnnotation.getOntologyConceptArr();
		if (fsArray == null) {
			return cuiSet;
		}
		final FeatureStructure[] featureStructures = fsArray.toArray();
		for (FeatureStructure featureStructure : featureStructures) {
			if (featureStructure instanceof UmlsConcept) {
				final UmlsConcept umlsConcept = (UmlsConcept) featureStructure;
				final String cui = umlsConcept.getCui();
				final String tui = umlsConcept.getTui();
				final double score = umlsConcept.getScore();
				//final String sem = umlsConcept.getPreferredText();
				if (tui != null && !tui.isEmpty()) {
					cuiSet.add( cui + "\t" + score );// + "_" + tui + "_{" + sem + "}" );
				} else {
					cuiSet.add( cui + "\t" + score );
				}
			}
		}
		/*String ret = "";
		for( String cui : cuiSet ) {
			if( ret.isEmpty() ) {
				ret += cui;
			} else {
				ret += "|" + cui;					
			}
		}*/
		return cuiSet;
	}
	
	public static void main( String[] argv ) throws IllegalAccessException, InvocationTargetException, Exception {
		long ts = 0;
		long ts1 = 0;
		int count = 0;
		
		ts = System.currentTimeMillis();
		CTakesWrapper ctakes = new CTakesWrapper();
		ts1 += System.currentTimeMillis() - ts;
		System.out.println( "ctakes, " + count + ", " + ts1 / 1000 + " seconds.");
		
		
		
		File indir = new File( "input/" );
		for( File file : indir.listFiles() ) {
			if( file.getName().startsWith( "." ) ) {
				continue;
			}
			if( !file.getName().endsWith( ".txt" ) ) {
				continue;
			}
			System.out.println( file.getName() );

			String doc = IOUtils.toString( new FileReader( file ) );
			FileWriter outfile = new FileWriter( new File( "output/" + file.getName() ) );

			ts = System.currentTimeMillis();
			String ret = ctakes.runDocument( doc );
			ts1 += System.currentTimeMillis() - ts;
			count += 1;
			System.out.println( "ctakes, " + count + ", " + ts1 / 1000 + " seconds.");
			outfile.write( ret );
			outfile.close();
		
		}
		return;
	}
}
