package com.scder.system.examination.dao;

import java.util.List;

import com.scder.system.examination.model.Examination;

public interface ExaminationDao {
	public List<Examination> getExaminList(String sql) throws Exception;

}
