package com.scder.common;

import java.util.List;

public class PageNation<T> {
	public List<T> datas;
	public Integer pagecount;
	public List<T> getDatas() {
		return datas;
	}
	public void setDatas(List<T> datas) {
		this.datas = datas;
	}
	public Integer getPagecount() {
		return pagecount;
	}
	public void setPagecount(Integer pagecount) {
		this.pagecount = pagecount;
	}

}
