package com.scder.system.examunser.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="alecms_examunser")
public class ExamUnser {
	private Integer id;
	private String title;
	private String showchar;
	private String indenty;
	private String checkcount="0";
	private Integer exam_id;
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
	public String getShowchar() {
		return showchar;
	}
	public void setShowchar(String showchar) {
		this.showchar = showchar;
	}
	public String getIndenty() {
		return indenty;
	}
	public void setIndenty(String indenty) {
		this.indenty = indenty;
	}
	public String getCheckcount() {
		return checkcount;
	}
	public void setCheckcount(String checkcount) {
		this.checkcount = checkcount;
	}
	public Integer getExam_id() {
		return exam_id;
	}
	public void setExam_id(Integer exam_id) {
		this.exam_id = exam_id;
	}
	
	

}
