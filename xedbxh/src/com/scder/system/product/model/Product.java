package com.scder.system.product.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="alecms_product")
public class Product {
	private Integer id;
    private String title;
    private String createtime;
    private String discription;
    private String selmoney;
    private String realmoney;
    private String imgpath;
    private String content;
    private Integer menu_id;
    private String pic_ids;
    private Integer state;
    private Integer showid;
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
	
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public String getSelmoney() {
		return selmoney;
	}
	public void setSelmoney(String selmoney) {
		this.selmoney = selmoney;
	}
	public String getRealmoney() {
		return realmoney;
	}
	public void setRealmoney(String realmoney) {
		this.realmoney = realmoney;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(Integer menu_id) {
		this.menu_id = menu_id;
	}

	
	

	public String getPic_ids() {
		return pic_ids;
	}
	public void setPic_ids(String pic_ids) {
		this.pic_ids = pic_ids;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getShowid() {
		return showid;
	}
	public void setShowid(Integer showid) {
		this.showid = showid;
	}
    
    
}
