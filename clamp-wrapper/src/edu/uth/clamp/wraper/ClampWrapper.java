package edu.uth.clamp.wraper;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.uima.UIMAException;
import org.apache.uima.jcas.JCas;

import clamp.license.control.ClampLicenseFile;
import clamp.license.control.CmdOnlineActivator;
import edu.uth.clamp.config.ConfigUtil;
import edu.uth.clamp.config.ConfigurationException;
import edu.uth.clamp.io.DocumentIOException;
import edu.uth.clamp.nlp.encoding.RxNormEncoderUIMA;
import edu.uth.clamp.nlp.encoding.UmlsEncoder;
import edu.uth.clamp.nlp.structure.ClampNameEntity;
import edu.uth.clamp.nlp.structure.ClampRelation;
import edu.uth.clamp.nlp.structure.ClampSection;
import edu.uth.clamp.nlp.structure.ClampSentence;
import edu.uth.clamp.nlp.structure.ClampToken;
import edu.uth.clamp.nlp.structure.Document;
import edu.uth.clamp.nlp.structure.XmiUtil;
import edu.uth.clamp.nlp.uima.DocProcessor;
import edu.uth.clamp.nlp.uima.UmlsEncoderUIMA;
import edu.uth.clamp.nlp.util.UmlsLicenseValidator;

public class ClampWrapper {
	List<DocProcessor> procList = null;
	
	public ClampWrapper(String pipelinePath, String umlsName, String umlsPass,
			String umlsIndex, String rxnormIndex ) throws ConfigurationException, IOException, DocumentIOException {
		File pipelineJar = new File(pipelinePath);
		procList = new ArrayList<DocProcessor>();

		if (pipelineJar.getName().endsWith(".pipeline")) {
			procList = ConfigUtil.importPipelineFromFile(pipelineJar);
		} else if (pipelineJar.getName().endsWith(".jar")) {
			procList = ConfigUtil.importPipelineFromJar(pipelineJar);
		}

		for (DocProcessor proc : procList) {
			if (proc instanceof UmlsEncoderUIMA) {
				boolean umlsValid = checkUMLS(umlsName, umlsPass, umlsIndex);
				if (umlsValid) {
					File umlsIndexFile = new File(umlsIndex);
					((UmlsEncoderUIMA) proc).setIndexDir(umlsIndexFile);
				} else {
					System.out
							.println("This pipeline contains UMLS encoder, as a result, umls account and index folder are required. Set -U -P -i");
					throw new ConfigurationException(
							"invalid umls user or invalid umls lucene dir");
				}
			}
			if( proc instanceof RxNormEncoderUIMA ) {
				boolean umlsValid = checkUMLS(umlsName, umlsPass, umlsIndex);
				if (umlsValid) {
					((RxNormEncoderUIMA) proc).setIndex( rxnormIndex );
				} else {
					System.out
							.println("This pipeline contains UMLS encoder, as a result, umls account and index folder are required. Set -U -P -i");
					throw new ConfigurationException(
							"invalid umls user or invalid umls lucene dir");
				}
			}
		}
	}
	
	
	public String runDocument( String docStr ) throws UIMAException {
		JCas aJCas = XmiUtil.createJCas();
		aJCas.setDocumentText( docStr );
		for( DocProcessor proc : procList ) {
			if( proc instanceof UmlsEncoderUIMA ) {
				((UmlsEncoderUIMA)proc).setOffsetFix( false );
			}
			proc.process( aJCas );
		}

		Document doc = new Document( aJCas );
		StringBuilder sb = new StringBuilder();
		
		for( ClampSection sec : doc.getSections() ) {
			for( ClampNameEntity cne : XmiUtil.selectNE( doc.getJCas(), sec.getBegin(), sec.getEnd() ) ) {
				if( cne.getSemanticTag().equals( "problem" ) ) {
					OmopNLPRecord r = new OmopNLPRecord( doc, sec, cne );
					sb.append( r.toString() + "\n" );
				} else if( cne.getSemanticTag().equals( "drug" ) ) {
					OmopNLPRecord r = new OmopNLPRecord( doc, sec, cne );
					sb.append( r.toString() + "\n" );
				} else if( cne.getSemanticTag().equals( "treatment" ) ) {
					OmopNLPRecord r = new OmopNLPRecord( doc, sec, cne );
					sb.append( r.toString() + "\n" );
				} else if( cne.getSemanticTag().equals( "test" ) ) {
					OmopNLPRecord r = new OmopNLPRecord( doc, sec, cne );
					sb.append( r.toString() + "\n" );
				} else if( cne.getSemanticTag().equals( "labtest" ) ) {
					OmopNLPRecord r = new OmopNLPRecord( doc, sec, cne );
					sb.append( r.toString() + "\n" );
				}
			}
		}
		return sb.toString();
	}


	private static boolean checkUMLS( String umlsUsername, String umlsPassword, String umlsIndex ) {
        try {
            if( umlsUsername == null || umlsPassword == null || umlsUsername.isEmpty() || umlsPassword.isEmpty() ) {
                System.out.println( "Validation failed. \nPlease double check your umls user name and password." );
                System.out.println( "Umls user name and password is required in order to run clamp's pipeline." );
                return false;
            }
            else if( !UmlsLicenseValidator.isValidUmlsUser( umlsUsername, umlsPassword ) ) {
                System.out.println( "Validation failed. \nPlease double check your umls user name and password." );
                System.out.println( "Umls user name and password is required in order to run clamp's pipeline." );
                return false;
            }
        } catch( IOException e ) {
            e.printStackTrace();
            System.out.println( "Connection error, cannot validate umls user name and password." );
            System.out.println( "Validation failed. \nPlease double check your umls user name and password." );
            System.out.println( "Umls user name and password is required in order to run clamp's pipeline." );
            return false;
        }
        if( umlsIndex == null || umlsIndex.isEmpty() ) {
            return false;
        }

        File umlsIndexFile = new File( umlsIndex );
        if( !umlsIndexFile.exists() ) {
            System.out.println( "cannot find umls index directory. index=[" + umlsIndex + "]" );
            return false;
        } else if( !umlsIndexFile.isDirectory() ) {
            System.out.println( "umls index should be a directory. index=[" + umlsIndex + "]" );
            return false;
        }
        return true;
    }
	
	public static int registerCLAMP() {
		String license = System.getProperty( "CLAMPLicenceFile" );
		if( license == null ) {
			System.setProperty( "CLAMPLicenceFile", "CLAMP.LICENSE" );
		}
		
		File licenseFile = ClampLicenseFile.getLicenseFile();
		ClampLicenseFile file = new ClampLicenseFile( licenseFile );
		long remainingSeconds = file.getRemainingSeconds();
		if( remainingSeconds < 0 ) {
			CmdOnlineActivator activator = new CmdOnlineActivator();
			if( activator.activate() < 0 ) {
				return -1;
			} else {
				return 0; 
			}
		}
		return 0;
	}


	public static void main( String[] argv ) throws IllegalAccessException, InvocationTargetException, Exception {
		if( registerCLAMP() < 0 ) {
			return;
		}
		
		long ts = 0;
		long ts1 = 0;
		int count = 0;
		
		ts = System.currentTimeMillis();
		ClampWrapper clamp = new ClampWrapper( "resources/clamp/clamp-ner-attribute.pipeline", "YOUR_UMLS_USER_NAME", "YOUR_UMLS_USER_PASSWORD", "resources/clamp/umls_index/", "resources/clamp/rxnorm_index/" );
		ts1 += System.currentTimeMillis() - ts;
		System.out.println( "Clamp, " + count + ", " + ts1 / 1000 + " seconds.");
		
		
		
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
			String ret = clamp.runDocument( doc );
			ts1 += System.currentTimeMillis() - ts;
			count += 1;
			System.out.println( "clamp, " + count + ", " + ts1 / 1000 + " seconds.");
			outfile.write( ret );
			outfile.close();
			
		}

		return;
	}
}
