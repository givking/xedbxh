package com.scder.system.mailask.model;

import java.util.List;

import com.scder.system.mailunser.model.MailUnser;

public class MailAskVo {
	
	private MailAsk mailask;
	private List<MailUnser> unlist;
	public MailAsk getMailask() {
		return mailask;
	}
	public void setMailask(MailAsk mailask) {
		this.mailask = mailask;
	}
	public List<MailUnser> getUnlist() {
		return unlist;
	}
	public void setUnlist(List<MailUnser> unlist) {
		this.unlist = unlist;
	}

	
}
