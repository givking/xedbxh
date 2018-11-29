package com.scder.utils;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;


public class AleTools {

	public static String getFileName(){
		Date date= new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddhhmmss");
		return sd.format(date);
	}
	public  static   String result(boolean flag,String error){
		if(!StringUtils.isEmpty(error)){
		error=error.replace("\\r\\n", "");
		}
		return "{result:" + flag + ",msg:'" + error+ "'}";
		
	}
	
	public static String getCurrentSystemDateTimeToString(String formatStr){
		if(null == formatStr) return null;
		SimpleDateFormat sdf = new SimpleDateFormat(formatStr);
		return sdf.format(new Date());
	}
	
	public static String getChinaChar(String str){
		try {
			String result = new String(str.getBytes("iso-8859-1"),"utf-8");
			return result;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
