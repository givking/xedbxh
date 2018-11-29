package com.scder.cszh.volunteer.dao;

import java.util.List;

import com.scder.cszh.volunteer.model.Volunteer;

public interface VolunteerDao {
public List<Volunteer> getVolunteerList(String sql) throws Exception;
}
