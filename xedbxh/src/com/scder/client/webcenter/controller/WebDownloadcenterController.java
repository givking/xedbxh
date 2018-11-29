package com.scder.client.webcenter.controller;

import java.util.List;

import com.scder.nydb.download.model.Download;
import com.scder.nydb.download.service.DownloadService;
import com.scder.utils.BookPage;

public class WebDownloadcenterController {
	public List<Download> getShowDownloadList(DownloadService downloadservice,String orderby,Integer limit) throws Exception{
		String sql = "select o.* from ga_file o  "+orderby+" limit 0,"+limit;
		return downloadservice.getDownloadList(sql);
	}
	//��ȡ�����б���ҳ��
	public  List<Download> getDownloadList(DownloadService downloadservice,BookPage page,String orderby) throws Exception{
		
		String sql = "select o.* from ga_file o";
		page.setResultcount(downloadservice.getDownloadList(sql).size());
		List<Download> downlist = downloadservice.getDownloadList(sql+" "+orderby+" limit "+page.getCurentpagecount()+","+page.getPagelistcount());
		return downlist;
	}
	//���ݹؼ��ֻ�ȡ�����б���ҳ��
		public  List<Download> getSearchDownloadList(DownloadService downloadservice,String tit,BookPage page,String orderby) throws Exception{
			
			String sql = "select o.* from ga_file o where o.filename like concat(concat('%','"+tit+"'),'%')";
			page.setResultcount(downloadservice.getDownloadList(sql).size());
			List<Download> downlist = downloadservice.getDownloadList(sql+" "+orderby+" limit "+page.getCurentpagecount()+","+page.getPagelistcount());
			return downlist;
		}
	//��ȡ�����б�
	public  List<Download> getAllDownloadList(DownloadService downloadservice,String orderby,Integer limit) throws Exception{
		
		String sql = "select o.* from ga_file o";
		List<Download> downlist = downloadservice.getDownloadList(sql+" "+orderby+" limit 0, "+limit);
		return downlist;
	}
}
