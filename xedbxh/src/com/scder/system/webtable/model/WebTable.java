package com.scder.system.webtable.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="alecms_webtable")
public class WebTable {
	
	private Integer id;
	private String title;
	private String shortitle;
	private String createtime;
	private String anthor;
	private String clickcount;
	private String content;
	private String showid;
	private String level;
	private String menu_type;
	private String menu_id;
	private Integer state;
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
	public String getShortitle() {
		return shortitle;
	}
	public void setShortitle(String shortitle) {
		this.shortitle = shortitle;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getAnthor() {
		return anthor;
	}
	public void setAnthor(String anthor) {
		this.anthor = anthor;
	}
	public String getClickcount() {
		return clickcount;
	}
	public void setClickcount(String clickcount) {
		this.clickcount = clickcount;
	}
	@Lob
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getShowid() {
		return showid;
	}
	public void setShowid(String showid) {
		this.showid = showid;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getMenu_type() {
		return menu_type;
	}
	public void setMenu_type(String menu_type) {
		this.menu_type = menu_type;
	}
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	

}
