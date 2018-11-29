package com.scder.nydb.download.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.scder.common.BaseDaoSupport;
import com.scder.nydb.download.model.Download;
import com.scder.system.menu.model.Menu;

@Component("downloaddao")
public class DownloadDaoImpl extends BaseDaoSupport implements DownloadDao{

	@Override
	public List<Download> getDownloadList(String sql) throws Exception {
		Query q = em.createNativeQuery(sql, Download.class);
		return q.getResultList();
	}
	//HQL·½·¨
	@Override
	public List<Download> getSelfDownloadList() throws Exception {
		//String sql = "select * from cs_download ";
		Query q=em.createQuery(" from Download");
		//Query q = em.createNativeQuery(sql);
		return q.getResultList();
	}

}
