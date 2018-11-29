package com.scder.cszh.volunteer.service;

import java.util.List;

import com.scder.cszh.volunteer.model.Volunteer;

public interface VolunteerService {
	
	public List<Volunteer> getVolunteerList(String sql) throws Exception;
}
