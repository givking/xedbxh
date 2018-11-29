package com.scder.utils;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public class FileCurrentUp {

public static void fileUpLoad(MultipartFile upfile,HttpServletRequest req) throws Exception{
	
	 String dir="document"; 
	 Object obj = req.getAttribute("dir");
	 if(obj!=null){
		 dir = dir+(String)obj;
	 }
	

		String realfilepath=req.getSession().getServletContext().getRealPath("");
		
			
			if(upfile.getOriginalFilename()!=null&&!upfile.getOriginalFilename().trim().equals("")){
				String ftype=upfile.getOriginalFilename().substring(upfile.getOriginalFilename().lastIndexOf(".")+1);
				 String fname=upfile.getOriginalFilename().substring(0, upfile.getOriginalFilename().lastIndexOf("."));
				String fpa=FileUpLoad.upLoadFile(upfile.getInputStream(), realfilepath, dir, AleTools.getFileName()+"."+ftype);
				req.setAttribute("ftype", ftype);
				req.setAttribute("fname", fname);
				req.setAttribute("fpa", fpa);
				req.setAttribute("realfpa", realfilepath+"\\"+fpa);
			}
			

	
}

public static Boolean copyfile(String realpath,String oupath,String filename){
	try{
		
	File f= new File(realpath);
	if(f.exists()){
		File fo = new File(oupath);
		if(!fo.exists()){
			fo.mkdirs();
			
		}
		
	FileInputStream in = new FileInputStream(f);
     FileOutputStream ou = new FileOutputStream(oupath+filename);
     byte[] b = new byte[100];
     int i= 0;
     while((i=in.read())!=-1){
      ou.write(i);
     } 
     in.close();
     ou.close();
      
	}
	
	return true;
	}catch(Exception e){
		e.printStackTrace();
	}	
	return null;
}
/*�����ļ�*/
public static void downfile(String realpath,String filename,String filetype,HttpServletResponse response) throws Exception{
	//��ȡ��վ����·��(ͨ��ServletContext����)������ȷ�������ļ�λ�ã��Ӷ�ʵ������  
   // String path = req.getSession().getServletContext().getRealPath("/")+"uploadFile";  
	filename= new String(filename.getBytes("utf-8"), "ISO8859-1" );
	//1.�����ļ�ContentType���ͣ��������ã����Զ��ж������ļ�����  
	response.setContentType("application/octet-stream;charset=UTF-8");  
    //2.�����ļ�ͷ�����һ�����������������ļ���(�������ǽ�a.pdf)  
	response.setHeader("Content-Disposition", "attachment;fileName="+filename+"."+filetype);  
    ServletOutputStream out;  
    //ͨ���ļ�·�����File����(�����·������һ��icon.png�ļ�)  
    File file = new File(realpath);  
    try {  
        FileInputStream inputStream = new FileInputStream(file);  
        //3.ͨ��response��ȡServletOutputStream����(out)  ֻ����һ��
        out = response.getOutputStream();  
        int b = 0;  
        byte[] buffer = new byte[512];  
        while (b != -1){  
            b = inputStream.read(buffer);  
            //4.д�������(out)��  
            if(b==-1) break;
            out.write(buffer,0,b);  
        }  
        inputStream.close();  
        out.flush();  
        out.close();  
    } catch (IOException e) {  
        e.printStackTrace();  
    }  
}
/*�ļ�ɾ��*/
	public static void delfile(String filename,String filepath){
		File file = new File(filepath);
		if(file.exists()){
			file.delete();
		}
	}
	
}
