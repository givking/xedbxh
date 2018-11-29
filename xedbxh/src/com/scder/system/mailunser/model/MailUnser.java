package com.scder.system.mailunser.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
@Entity
@Table(name="alecms_mailunser")
public class MailUnser {
	private Integer id;
	private String ucontent;
	private String createtime;
	private Integer ask_id;
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Lob
	public String getUcontent() {
		return ucontent;
	}
	public void setUcontent(String ucontent) {
		this.ucontent = ucontent;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public Integer getAsk_id() {
		return ask_id;
	}
	public void setAsk_id(Integer ask_id) {
		this.ask_id = ask_id;
	}

}
