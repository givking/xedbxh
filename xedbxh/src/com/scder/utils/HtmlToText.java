package com.scder.utils;

public class HtmlToText {
	//��html����ȡ���ı�  
	public static String StripHT(String strHtml) {  
	     String txtcontent = strHtml.replaceAll("</?[^>]+>", ""); //�޳�<html>�ı�ǩ    
	        txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");//ȥ���ַ����еĿո�,�س�,���з�,�Ʊ��    
	        return txtcontent;  
	   } 
}
