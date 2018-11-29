package com.scder.system.roleres.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="alecms_role_res")
public class RoleRes {
	private Integer id;
	private Integer role_id;
	private Integer res_id;
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public Integer getRes_id() {
		return res_id;
	}
	public void setRes_id(Integer res_id) {
		this.res_id = res_id;
	}

}
