package com.scder.system.examination.model;

import java.util.List;

import com.scder.system.examunser.model.ExamUnser;

public class ExaminationVo {
	private Examination examin;
	private List<ExamUnser> examunlist;
	private Integer count=0;
	public Examination getExamin() {
		return examin;
	}
	public void setExamin(Examination examin) {
		this.examin = examin;
	}
	public List<ExamUnser> getExamunlist() {
		return examunlist;
	}
	public void setExamunlist(List<ExamUnser> examunlist) {
		this.examunlist = examunlist;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	
	

}
