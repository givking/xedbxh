package com.scder.system.document.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="alecms_document")
public class Document {
	
	private Integer id;
	private String filename;
	private String filetype;
	private String filepath;
	private String relate_type;
	private String loadcount;
	private Integer relate_id;
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getRelate_type() {
		return relate_type;
	}
	public void setRelate_type(String relate_type) {
		this.relate_type = relate_type;
	}

	public String getLoadcount() {
		return loadcount;
	}
	public void setLoadcount(String loadcount) {
		this.loadcount = loadcount;
	}
	public Integer getRelate_id() {
		return relate_id;
	}
	public void setRelate_id(Integer relate_id) {
		this.relate_id = relate_id;
	}
	

}
