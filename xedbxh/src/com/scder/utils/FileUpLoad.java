package com.scder.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
public class FileUpLoad {

	public static String upLoadFile(InputStream in, String realfilepath, String dir,
			String filename) {

		try {
			if (in != null && realfilepath !=null && dir!=null && filename!=null) {

				File f = new File(realfilepath + "/" + dir);
				if (!f.exists()) {
					f.mkdirs();

				}
				FileOutputStream ou = new FileOutputStream(realfilepath + "/"
						+ dir +"/"+filename);
				int i = 0;
				
				while ((i = in.read()) != -1) {
					ou.write(i);
				}
				ou.flush();
				ou.close();
				in.close();
				String filepath = dir +"/"+filename;
				return filepath;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	
	
}
