package com.scder.system.examination.service;

import java.util.List;

import com.scder.system.examination.model.Examination;

public interface ExaminationService {
	
	public List<Examination> getExaminList(String sql) throws Exception;

}
