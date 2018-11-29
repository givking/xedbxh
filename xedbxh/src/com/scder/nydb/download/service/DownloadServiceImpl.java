package com.scder.nydb.download.service;


import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.scder.common.BaseDao;
import com.scder.common.BaseServiceSupport;
import com.scder.nydb.download.dao.DownloadDao;
import com.scder.nydb.download.model.Download;

@Service("downloadService")
@Transactional
public class DownloadServiceImpl extends BaseServiceSupport implements DownloadService {
	DownloadDao downloaddao;
	@Override
	@Resource(name="downloaddao")
	public void setBasedao(BaseDao basedao) {
		this.basedao = basedao;
		downloaddao = (DownloadDao)basedao;
	}
	@Override
	public List<Download> getDownloadList(String sql) throws Exception {
		
		return downloaddao.getDownloadList(sql);
	}
	@Override
	public List<Download> getSelfDownloadList() throws Exception {
		// TODO Auto-generated method stub
		return downloaddao.getSelfDownloadList();
	}


}
