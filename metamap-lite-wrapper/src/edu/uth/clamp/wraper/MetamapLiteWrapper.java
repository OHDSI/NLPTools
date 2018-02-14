package edu.uth.clamp.wraper;

import gov.nih.nlm.nls.metamap.document.FreeText;
import gov.nih.nlm.nls.metamap.lite.types.Entity;
import gov.nih.nlm.nls.metamap.lite.types.Ev;
import gov.nih.nlm.nls.ner.MetaMapLite;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import bioc.BioCDocument;

public class MetamapLiteWrapper {
	MetaMapLite metaMapLiteInst = null;
	
	public MetamapLiteWrapper( String baseDir )
			throws ClassNotFoundException,
				InstantiationException,
				NoSuchMethodException,
				IllegalAccessException,
				IOException {
		Properties myProperties = MetaMapLite.getDefaultConfiguration();
		MetaMapLite.expandModelsDir(myProperties, baseDir + "/models");
		MetaMapLite.expandIndexDir(myProperties, baseDir + "/ivf/strict");
		myProperties.setProperty("metamaplite.excluded.termsfile", baseDir + "/specialterms.txt");
		metaMapLiteInst = new MetaMapLite(myProperties);
	}
	
	public String run(String sent)
			throws InvocationTargetException, Exception {
		StringBuilder sb = new StringBuilder();
		BioCDocument document = FreeText.instantiateBioCDocument( sent );
		List<BioCDocument> documentList = new ArrayList<BioCDocument>();
		documentList.add(document);
		List<Entity> entityList = metaMapLiteInst.processDocumentList(documentList);
		for (Entity entity : entityList) {
			for (Ev ev : entity.getEvSet()) {
				sb.append( "MetaMapLite\t" );
				sb.append( ev.getConceptInfo().getCUI() );
				sb.append( "\t" );
				sb.append( ev.getScore() );
				sb.append( "\t" );
				sb.append( ev.getStart() );
				sb.append( "\t" );
				sb.append( (ev.getStart() + ev.getLength() ) );
				sb.append( "\t" );
				sb.append( sent.substring( ev.getStart(), ev.getStart() + ev.getLength() ) );
				sb.append( "\n" );
			}
		}
		return sb.toString();
	}
	
	public String runDocument( String doc ) 
			throws IllegalAccessException, InvocationTargetException, IOException, Exception {
		StringBuilder sb = new StringBuilder();
		BioCDocument document = FreeText.instantiateBioCDocument( doc );
		List<BioCDocument> documentList = new ArrayList<BioCDocument>();
		documentList.add(document);
		List<Entity> entityList = metaMapLiteInst.processDocumentList(documentList);
		
		for (Entity entity : entityList) {
			for (Ev ev : entity.getEvSet()) {
				sb.append( "MetaMapLite\t" );
				sb.append( ev.getConceptInfo().getCUI() );
				sb.append( "\t" );
				sb.append( ev.getScore() );
				sb.append( "\t" );
				int s = ev.getStart();
				s = doc.indexOf( ev.getText(), s );
				sb.append( s );
				sb.append( "\t" );
				sb.append( (s + ev.getLength() ) );
				sb.append( "\t" );
				sb.append( doc.substring( s, s + ev.getLength() ) );
				sb.append( "\n" );
			}
		}
		return sb.toString();
	}

	
	public static void main( String[] argv ) throws IllegalAccessException, InvocationTargetException, Exception {
		long ts = 0;
		long ts1 = 0;
		int count = 0;
		
		ts = System.currentTimeMillis();
		MetamapLiteWrapper metamapLite = new MetamapLiteWrapper( "resources/metamap/" );
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
			
			StringBuilder sb = new StringBuilder();
			BufferedReader infile = new BufferedReader( new FileReader( file ) );
			String line;
			while( ( line = infile.readLine() ) != null ) {
				sb.append( line );
				sb.append( "\n" );
			}
			infile.close();
			String doc = sb.toString();
			FileWriter outfile = new FileWriter( new File( "output/" + file.getName() ) );

			ts = System.currentTimeMillis();
			String ret = metamapLite.runDocument( doc );
			ts1 += System.currentTimeMillis() - ts;
			count += 1;
			System.out.println( "mmLite, " + count + ", " + ts1 / 1000 + " seconds.");
			outfile.write( ret );
			outfile.close();
		}

		return;
	}
}
