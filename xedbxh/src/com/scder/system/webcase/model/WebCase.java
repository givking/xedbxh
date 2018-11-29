package com.scder.system.webcase.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="alecms_webcase")
public class WebCase {

	private Integer id;
	private String title;
	private String casenum;
	private String caseunit;
	private String createtime;
	private Integer result;
	private Integer state;
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCasenum() {
		return casenum;
	}
	public void setCasenum(String casenum) {
		this.casenum = casenum;
	}
	
	
	public String getCaseunit() {
		return caseunit;
	}
	public void setCaseunit(String caseunit) {
		this.caseunit = caseunit;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public Integer getResult() {
		return result;
	}
	public void setResult(Integer result) {
		this.result = result;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	} 
	
}
