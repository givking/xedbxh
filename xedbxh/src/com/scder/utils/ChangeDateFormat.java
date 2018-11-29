package com.scder.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
/*ת��Ϊyyyy-MM-dd hh:mm��ʽ*/
public class ChangeDateFormat {
	public static String dateformat_1(){
		Date date = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		return sd.format(date);
	}
	/*�������գ�ʱ�估���ڷֱ�װ��map��*/
	public static Map<String,String> dateformat_2(){
		Date date = new Date();
		Map<String,String> map = new HashMap<String,String>();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd-hh:mm");
		String datef1=sd.format(date);
		String[] dates =datef1.split("-");
		map.put("year", dates[0]);
		map.put("month",dates[1]);
		map.put("day",dates[2]);
		map.put("time", dates[3]);
		String[] weekDays = {"������", "����һ", "���ڶ�", "������", "������", "������", "������"};
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0)
            w = 0;
        map.put("weekday", weekDays[w]);
		return map;
	}
}
