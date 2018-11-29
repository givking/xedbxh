package com.scder.client.webcenter.controller;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.util.Random;

public class CheckCode {
	
	 /** 
     * ��֤��ͼƬ�Ŀ�ȡ� 
     */  
    private int width = 100;  
    /** 
     * ��֤��ͼƬ�ĸ߶ȡ� 
     */  
    private int height = 26;  
    /** 
     * ��֤��������� 
     */  
    private Random random = new Random();  
      
    public CheckCode(){}  
    /** 
     * ���������ɫ 
     * @param fc    ǰ��ɫ 
     * @param bc    ����ɫ 
     * @return  Color���󣬴�Color������RGB��ʽ�ġ� 
     */  
    public Color getRandomColor(int fc, int bc) {  
        if (fc > 255)  
            fc = 200;  
        if (bc > 255)  
            bc = 255;  
        int r = fc + random.nextInt(bc - fc);  
        int g = fc + random.nextInt(bc - fc);  
        int b = fc + random.nextInt(bc - fc);  
        return new Color(r, g, b);  
    }  
      
    /** 
     * ���Ƹ����� 
     * @param g Graphics2D������������ͼ�� 
     * @param nums  �����ߵ����� 
     */  
    public void drawRandomLines(Graphics2D g ,int nums ){  
        g.setColor(this.getRandomColor(160, 200)) ;  
        for(int i=0 ; i<nums ; i++){  
            int x1 = random.nextInt(width) ;  
            int y1 = random.nextInt(height);  
            int x2 = random.nextInt(12) ;  
            int y2 = random.nextInt(12) ;  
            g.drawLine(x1, y1, x2, y2) ;  
        }  
    }  
      
    /** 
     * ��ȡ����ַ����� 
     *      �˺������Բ����ɴ�Сд��ĸ�����֣�������ɵ��ַ��� 
     * @param length    ����ַ����ĳ��� 
     * @return  ����ַ��� 
     */  
    public String drawRandomString(int length , Graphics2D g){  
        StringBuffer strbuf = new StringBuffer() ;  
        String temp = "" ;  
        int itmp = 0 ;  
        for(int i=0 ; i<length ; i++){  
            switch(random.nextInt(5)){  
            case 1:     //����A��Z����ĸ  
                itmp = random.nextInt(26) + 65 ;  
                temp = String.valueOf((char)itmp);  
                break;  
            case 2:  
                itmp = random.nextInt(26) + 97 ;  
                temp = String.valueOf((char)itmp);  
 
            default:  
                itmp = random.nextInt(10) + 48 ;  
                temp = String.valueOf((char)itmp) ;  
                break;  
            }  
            Color color = new Color(20+random.nextInt(20) , 20+random.nextInt(20) ,20+random.nextInt(20) );  
            g.setColor(color) ;  
            //��������תһ���ĽǶ�  
            AffineTransform trans = new AffineTransform();  
            trans.rotate(random.nextInt(45)*3.14/180, 15*i+8, 7) ;  
            //��������  
            float scaleSize = random.nextFloat() + 0.8f ;  
            if(scaleSize>1f)  
                scaleSize = 1f ;  
            trans.scale(scaleSize, scaleSize) ;  
            g.setTransform(trans) ;  
            g.drawString(temp, 15*i+18, 14) ;  
              
            strbuf.append(temp) ;  
        }  
        g.dispose() ;  
        return strbuf.toString() ;  
    }  
    public int getWidth() {  
        return width;  
    }  
    public void setWidth(int width) {  
        this.width = width;  
    }  
    public int getHeight() {  
        return height;  
    }  
    public void setHeight(int height) {  
        this.height = height;  
    }  

}
