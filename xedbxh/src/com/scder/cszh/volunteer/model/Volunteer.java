package com.scder.cszh.volunteer.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cs_volunteer")
public class Volunteer {
	private Integer id;
	private String volname;
	private String sex;
	private String age;
	private String ident;
	private String telephone;
	private String address;
	private String email;
	private String education;
	private String job;
	private String workstate;
	private String type;
	private String volarea;
	private String voltime;
	private String createtime;
	
	public String getVolname() {
		return volname;
	}
	public void setVolname(String volname) {
		this.volname = volname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getIdent() {
		return ident;
	}
	public void setIdent(String ident) {
		this.ident = ident;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getWorkstate() {
		return workstate;
	}
	public void setWorkstate(String workstate) {
		this.workstate = workstate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getVolarea() {
		return volarea;
	}
	public void setVolarea(String volarea) {
		this.volarea = volarea;
	}
	public String getVoltime() {
		return voltime;
	}
	public void setVoltime(String voltime) {
		this.voltime = voltime;
	}
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	
	
}
