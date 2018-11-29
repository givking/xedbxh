package com.scder.client.webcenter.controller;

import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Component
@RequestMapping("/webcode")
public class WebCodeView {
	
	@RequestMapping("/createcode")
	public void createCode(HttpServletRequest req,HttpServletResponse response){
		try{
          HttpSession session = req.getSession();
		 response.setHeader("Pragma", "No-cache");  
	        response.setHeader("Cache-Control", "No-cache");  
	        response.setDateHeader("Expires", 0) ;  
	        //指定生成的相应图片  
	        response.setContentType("image/jpeg") ;  
	        CheckCode idCode = new CheckCode();  
	        BufferedImage image =new BufferedImage(idCode.getWidth() , idCode.getHeight() , BufferedImage.TYPE_INT_BGR) ;  
	        Graphics2D g = image.createGraphics() ;  
	        //定义字体样式  
	        Font myFont = new Font("黑体" , Font.BOLD , 16) ;  
	        //设置字体  
	        g.setFont(myFont) ;  
	          
	        g.setColor(idCode.getRandomColor(200 , 250)) ;  
	        //绘制背景  
	        g.fillRect(0, 0, idCode.getWidth() , idCode.getHeight()) ;  
	          
	        g.setColor(idCode.getRandomColor(180, 200)) ;  
	        idCode.drawRandomLines(g, 160);  
	        session.setAttribute("idcode",  idCode.drawRandomString(3, g));
	        g.dispose() ;  
	        ImageIO.write(image, "JPEG", response.getOutputStream()) ;  
		}catch(Exception e){
			e.printStackTrace();
			
		}
	        
	  }  
	@RequestMapping("/getcode")
	@ResponseBody
	public String getCode(HttpServletRequest req){
		
		return (String)req.getSession().getAttribute("idcode");
	}
		
		
	}


