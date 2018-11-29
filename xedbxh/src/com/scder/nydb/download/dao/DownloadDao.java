package com.scder.nydb.download.dao;

import java.util.List;

import com.scder.nydb.download.model.Download;


public interface DownloadDao {
public List<Download> getDownloadList(String sql) throws Exception;
public List<Download> getSelfDownloadList() throws Exception;
}
