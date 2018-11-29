package com.scder.system.paper.model;

import java.util.List;

import com.scder.system.examination.model.ExaminationVo;

public class PaperVo {
	private Paper paper;
    private List<ExaminationVo> examvolist;
	public Paper getPaper() {
		return paper;
	}
	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	public List<ExaminationVo> getExamvolist() {
		return examvolist;
	}
	public void setExamvolist(List<ExaminationVo> examvolist) {
		this.examvolist = examvolist;
	}
    
}
