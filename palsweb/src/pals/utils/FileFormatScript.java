package pals.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class FileFormatScript {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
        try {
        	File file = new File("D:\\code\\pals\\palsweb\\scripts\\mysql\\countryInfo_formatted.txt");
			BufferedReader br = new BufferedReader(new FileReader(file));
			File out = new File("D:\\code\\pals\\palsweb\\scripts\\mysql\\countries.sql");
			PrintWriter bw = new PrintWriter(new FileWriter(out));
			String line;
			int i = 0;
			while( (line = br.readLine()) != null )
			{
				++i;
				String[] splitLine = line.split(",");
				String outline = "INSERT INTO country(id,code,name) VALUES("+ i + ",'" +
				    splitLine[0] + "','" + splitLine[1] + "');";
				bw.println(outline);
			}
			bw.flush();
			bw.close();
			br.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
