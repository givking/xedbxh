package com.scder.utils;

import java.util.Calendar;
import java.util.List;

public class AleSql {

	public static StringBuffer createSql(List<String> whereSqlList,
			String connect) {
		StringBuffer sbf = new StringBuffer();
		if (whereSqlList != null && whereSqlList.size() > 0) {
			for (int i = 0; i < whereSqlList.size(); i++) {
				if (i == 0) {
					sbf.append(whereSqlList.get(i));

				} else {
					sbf.append(" " + connect + " ");
					sbf.append(whereSqlList.get(i));
				}

			}
		}
		return sbf;
	}
	
	public static void main(String[] args) throws InterruptedException {
		  Calendar a=Calendar.getInstance();
		  System.out.println(a.get(Calendar.YEAR));//得到�?
		  System.out.println(a.get(Calendar.MONTH)+1);//由于月份是从0�?��的所以加1
		  System.out.println(a.get(Calendar.DATE));
		  }

}
