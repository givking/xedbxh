package com.scder.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
/*转换为yyyy-MM-dd hh:mm格式*/
public class ChangeDateFormat {
	public static String dateformat_1(){
		Date date = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		return sd.format(date);
	}
	/*将年月日，时间及星期分别装入map里*/
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
		String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0)
            w = 0;
        map.put("weekday", weekDays[w]);
		return map;
	}
}
