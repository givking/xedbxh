package com.scder.utils;

public class BookPage {
	private Integer curentpage=1;
	private Integer pagebefroe;
	private Integer pageafter;
	private Integer pagelistcount=8;
	private Integer resultcount;
	private Integer pagecount;
	private Integer curentpagecount; 
	
	public Integer getCurentpagecount() {
	
		curentpagecount=(this.curentpage-1)*this.pagelistcount;
		return curentpagecount;
	}
	public void setCurentpagecount(Integer curentpagecount) {
	
		this.curentpagecount = curentpagecount;
	}
	public Integer getCurentpage() {
		return curentpage;
	}
	public void setCurentpage(Integer curentpage) {
	
		if(curentpage==null||curentpage<1){
			curentpage=1;
			
		}
		this.curentpage = curentpage;
	}
	public Integer getPagebefroe() {
		pagebefroe=curentpage-1<1?1:curentpage-1;
		return pagebefroe;
	}
	public void setPagebefroe(Integer pagebefroe) {
		this.pagebefroe = pagebefroe;
	}
	public Integer getPageafter() {
		pageafter=this.curentpage+1>this.pagecount?this.pagecount:this.curentpage+1;
		
		return pageafter;
	}
	public void setPageafter(Integer pageafter) {
		this.pageafter = pageafter;
	}
	public Integer getPagelistcount() {
		return pagelistcount;
	}
	public void setPagelistcount(Integer pagelistcount) {
		this.pagelistcount = pagelistcount;
	}
	public Integer getResultcount() {
		return resultcount;
	}
	public void setResultcount(Integer resultcount) {
		this.resultcount = resultcount;
	}
	public Integer getPagecount() {
		if(this.resultcount%this.pagelistcount!=0){
	pagecount=this.resultcount/this.pagelistcount+1;
		}
		else{
			pagecount=this.resultcount/this.pagelistcount;
			
		}
		return pagecount;
	}
	public void setPagecount(Integer pagecount) {
		this.pagecount = pagecount;
	}

}
