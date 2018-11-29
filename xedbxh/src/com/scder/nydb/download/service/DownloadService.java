package com.scder.nydb.download.service;

import java.util.List;

import com.scder.nydb.download.model.Download;


public interface DownloadService {
	
	public List<Download> getDownloadList(String sql) throws Exception;
	public List<Download> getSelfDownloadList() throws Exception;
}
