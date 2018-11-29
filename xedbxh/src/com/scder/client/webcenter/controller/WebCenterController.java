package com.scder.client.webcenter.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scder.cszh.donation.controller.DonationController;
import com.scder.cszh.donation.service.DonationService;
import com.scder.nydb.download.controller.DownloadController;
import com.scder.nydb.download.model.Download;
import com.scder.nydb.download.service.DownloadService;
import com.scder.system.article.model.Article;
import com.scder.system.article.service.ArticleService;
import com.scder.system.document.controller.DocumentController;
import com.scder.system.examination.service.ExaminationService;
import com.scder.system.examunser.model.UnserContent;
import com.scder.system.examunser.service.ExamunserService;
import com.scder.system.mailask.model.MailAsk;
import com.scder.system.mailask.model.MailAskVo;
import com.scder.system.mailask.service.MailAskService;
import com.scder.system.mailunser.service.MailUnserService;
import com.scder.system.menu.model.Menu;
import com.scder.system.menu.model.MenuVo;
import com.scder.system.menu.service.MenuService;
import com.scder.system.paper.model.Paper;
import com.scder.system.paper.service.PaperService;
import com.scder.system.webcase.model.WebCase;
import com.scder.system.webcase.service.WebCaseService;
import com.scder.system.webtable.service.WebTableService;
import com.scder.utils.AleTools;
import com.scder.utils.BookPage;
import com.scder.utils.ChangeDateFormat;
import com.scder.utils.HtmlToText;

@Controller
@RequestMapping("/webcenter")
public class WebCenterController {
	@Resource MenuService menuservice;
	@Resource ArticleService articleservice;
	@Resource WebTableService webtableservice;
	@Resource DocumentController documentcontroller;
	@Resource MailAskService mailaskservice;
	@Resource MailUnserService mailunserservice;
	@Resource PaperService paperservice;
	@Resource ExaminationService examinationservice;
	@Resource ExamunserService examunserservice;
	@Resource WebCaseService webcaseservice;
	@Resource DonationService donationservice;
	@Resource DonationController donationcotroller;
	@Resource DownloadService downloadservice;
	@Resource DownloadController downloadcotroller;
	@RequestMapping("/clienthome")
	public String clientHome(HttpServletRequest req,ModelMap mp){
		
		try{
			WebNavController webnav = new WebNavController();
			Map<String,String> map=ChangeDateFormat.dateformat_2();
			mp.putAll(map);
			mp.put("webnav", webnav.topNav(menuservice));
			WebAticleController webart = new WebAticleController();
			//消息图片
			mp.put("news_pic", webart.getAllPicList(articleservice,"order by o.createtime desc,o.id desc", 5));
			/*滚动新闻*/
			if(webart.getAllArticleList(articleservice, 105,"order by o.createtime desc", 1).size()>0){//判断取出的list必须有值才能取get(0)
				Article art1 = webart.getAllArticleList(articleservice, 105,"order by o.createtime desc", 1).get(0);
				String snew=HtmlToText.StripHT(art1.getContent());
				mp.put("scroll_news",snew);
			}
			/*最新消息*/
			WebNavController webnav2 = new WebNavController();
			List<Object> varlist= new ArrayList<>();
			//mp.put("latest_news", webart.getAllArticleList(articleservice, null,"order by o.createtime desc,o.id desc", 8));
			List<Article> latest_arts=webart.getAllArticleList(articleservice, null,"order by o.createtime desc,o.id desc", 6);
			for(Article art:latest_arts){
				 Menu menu= webnav2.getMenuById(menuservice, Integer.valueOf(art.getMenu_id()));
				 art.setMenu_name(menu.getTitle());
			}
			mp.put("latest_news", latest_arts);
			/*协会资讯*/
			List<Article> info_arts = webart.getShowArticleList(articleservice, 85, "order by o.createtime desc,o.id desc", 7);
			for(Article art:info_arts){
				art.setContent(HtmlToText.StripHT(art.getContent()));
			}
			mp.put("ga_info", info_arts);
			/*行业动态*/
			List<Article> dyn_arts = webart.getShowArticleList(articleservice, 86, "order by o.createtime desc,o.id desc", 7);
			for(Article art:dyn_arts){
				art.setContent(HtmlToText.StripHT(art.getContent()));
			}
			mp.put("ga_dyn", dyn_arts);
			/*会员中心*/
			List<Article> artlist1;
			MenuVo vo1 = webnav.getLeftMenuvo(menuservice, 87, "order by o.no asc");
			artlist1 = webart.getTopAllArticleList(articleservice, vo1.getSublist(), "order by o.createtime desc,o.id desc",15);
			mp.put("ga_member", artlist1);
			/*政策法规*/
			List<Article> artlist2;
			MenuVo vo2 = webnav.getLeftMenuvo(menuservice, 94, "order by o.no asc");
			artlist2 = webart.getTopAllArticleList(articleservice, vo2.getSublist(), "order by o.createtime desc,o.id desc",9);
			mp.put("ga_law", artlist2);
			/*研究与杂谈*/
			List<Article> research_arts = webart.getShowArticleList(articleservice, 99, "order by o.createtime desc,o.id desc", 7);
			for(Article art:research_arts){
				art.setContent(HtmlToText.StripHT(art.getContent()));
			}
			mp.put("ga_research",research_arts);
			/*短讯中心*/
			mp.put("ga_message", webart.getShowArticleList(articleservice, 100, "order by o.createtime desc,o.id desc", 8));
			/*下载中心*/
			List<Download> downlist;
			WebDownloadcenterController webdown = new WebDownloadcenterController();
			downlist= webdown.getAllDownloadList(downloadservice, "order by o.create_time desc,o.id desc",9);
			mp.put("ga_file", downlist);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "/jspclient/ga_index";
	}
	@RequestMapping("/webarticlelist")
	public String webArticleList(Integer id,Integer page,Integer rows,HttpServletRequest req,ModelMap mp){
		try{
			WebNavController webnav = new WebNavController();
			Map<String,String> map=ChangeDateFormat.dateformat_2();
			mp.putAll(map);
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, id));
			MenuVo vo = webnav.getLeftMenuvo(menuservice, id, "order by o.no asc");
			mp.put("leftnav", vo);
			if(page == null){
				page = 1;
			}
			if(rows == null){
				rows = 8;
			}
			WebAticleController webart = new WebAticleController();
			WebDownloadcenterController webdown = new WebDownloadcenterController();
			BookPage fenye = new BookPage();
			fenye.setCurentpage(page);
			fenye.setPagelistcount(rows);
			List<Article> artlist = new ArrayList<Article>();
			List<Article> artlist2 = new ArrayList<Article>();
			List<Download> downlist;
			if(vo.getMenu().getId()==id && vo.getSublist()!=null && id!=80){/*有下级菜单的list页面*/
			 artlist = webart.getTopArticleList(articleservice, fenye, vo.getSublist(), "order by o.createtime desc,o.id desc");
			 artlist2.addAll(artlist);
			 for(Integer i=0;i<artlist.size();i++){
				artlist2.get(i).setContent(HtmlToText.StripHT(artlist.get(i).getContent()));
			 }
			 mp.put("artlist2", artlist2);
			 mp.put("artlist", artlist);
			 mp.put("page", fenye);
			 return "/jspclient/ga_list";
			 
			 /*关于协会的内容直接跳转到内容页面*/
			}else if(id==81 || id==82 || id==83 || id==84){
				try{
					artlist = webart.getArticleList(articleservice, fenye, id, "order by o.createtime desc");
					Integer art_id= artlist.get(artlist.size()-1).getId();
					WebAticleController webart2 = new WebAticleController();
					mp.put("art", webart2.getArticleById(articleservice, art_id));
				}catch(Exception e){
					e.printStackTrace();
				}
				return "/jspclient/ga_org_list";
			}else if(id==80){/*关于协会主菜单*/
				try{
					Integer subid=vo.getSublist().get(0).getId();
					artlist = webart.getArticleList(articleservice, fenye, subid, "order by o.createtime desc,o.id desc");
					Integer art_id= artlist.get(artlist.size()-1).getId();
					WebAticleController webart2 = new WebAticleController();
					mp.put("art", webart2.getArticleById(articleservice, art_id));
				}catch(Exception e){
					e.printStackTrace();
				}
				return "/jspclient/ga_org_list";
			}else if(id==101){/*下载中心列表*/
				rows = 15;
				fenye.setPagelistcount(rows);
				downlist= webdown.getDownloadList(downloadservice, fenye, "order by o.create_time desc,o.id desc");
				mp.put("artlist", downlist);
				mp.put("page", fenye);
				return "/jspclient/ga_filelist";
			}else if(id==102){/*留言中心*/
		
				return "/jspclient/ga_message_content";
			}else{/*没有下级列表的list页面*/
				 artlist = webart.getArticleList(articleservice, fenye, id, "order by o.createtime desc,o.id desc");
				 artlist2.addAll(artlist);
				 for(Integer i=0;i<artlist.size();i++){
					artlist2.get(i).setContent(HtmlToText.StripHT(artlist.get(i).getContent()));
				 }
				 mp.put("artlist2", artlist2);
				 mp.put("artlist", artlist);
				 mp.put("page", fenye);
				 return "/jspclient/ga_list";
			}
		}catch(Exception e){
			return "/util/404";
		}
	}
	/*跳转到最新消息更多列表里*/
	@RequestMapping("/webarticlelistall")
	public String webArticleListAll(Integer page,Integer rows,HttpServletRequest req,ModelMap mp){
		try{
			WebNavController webnav = new WebNavController();
			Map<String,String> map=ChangeDateFormat.dateformat_2();
			mp.putAll(map);
			mp.put("webnav", webnav.topNav(menuservice));
			if(page == null){
				page = 1;
			}
			if(rows == null){
				rows = 15;
			}
			WebAticleController webart = new WebAticleController();
			BookPage fenye = new BookPage();
			fenye.setCurentpage(page);
			fenye.setPagelistcount(rows);
			List<Article> artlist;
			if(req.getParameter("type")!=null&&req.getParameter("type").equals("all")){
				artlist= webart.getPageArticleList(articleservice, "order by o.createtime desc,o.id desc",fenye);
				mp.put("artlist", artlist);
				mp.put("page", fenye);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/jspclient/ga_latestnews_list";
	}
	@RequestMapping("/webarticlecontent")
	public String webArticleContent(Integer id,Integer menu_id,HttpServletRequest req,ModelMap mp){
		try{
			WebNavController webnav = new WebNavController();
			Map<String,String> map=ChangeDateFormat.dateformat_2();
			mp.putAll(map);
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, menu_id));
			WebAticleController webart = new WebAticleController();
			mp.put("art", webart.getArticleById(articleservice, id));
			/*上/下一篇*/
			MenuVo vo2 = webnav.getLeftMenuvo(menuservice, menu_id, "order by o.no asc");
			mp.put("next_article",webart.getNextArticleList(articleservice, vo2.getSublist(), "order by o.id desc", id,"next",menu_id));
			mp.put("before_article",webart.getNextArticleList(articleservice, vo2.getSublist(), "order by o.id asc", id,"before",menu_id));
			/*本类最新*/
			MenuVo vo1 = webnav.getLeftMenuvo(menuservice, menu_id, "order by o.no asc");
			if(vo1.getSublist()!=null){
				mp.put("this_latest",webart.getTopAllArticleList(articleservice, vo1.getSublist(), "order by o.createtime desc,o.id desc",7));
			}else{
				mp.put("this_latest",webart.getShowArticleList(articleservice, menu_id, "order by o.createtime desc,o.id desc", 7));
			}
			/*最新消息*/
			mp.put("latest_news", webart.getAllArticleList(articleservice, null,"order by o.createtime desc,o.id desc", 8));
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/jspclient/ga_content";
	}
	/*搜索*/
	@RequestMapping("/article_search")
	public String article_search(String tit,HttpServletRequest req,ModelMap mp,Integer page,Integer rows){
		
		try{
			if(page == null){
				page = 1;
			}
			if(rows == null){
				rows = 15;
			}
			BookPage fenye = new BookPage();
			fenye.setCurentpage(page);
			fenye.setPagelistcount(rows);
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			WebAticleController webart = new WebAticleController();
			if(tit!=null&&!tit.equals("")){
			List<Article> alist = webart.getSearchWebArticle(articleservice, tit, "order by o.createtime desc", fenye);
			mp.put("artlist", alist);
			mp.put("page", fenye);
			mp.put("title", tit);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/jspclient/ga_search_list";
	}
	/*下载搜索*/
	@RequestMapping("/download_search")
	public String download_search(String tit,HttpServletRequest req,ModelMap mp,Integer page,Integer rows){
		
		try{
			if(page == null){
				page = 1;
			}
			if(rows == null){
				rows = 15;
			}
			BookPage fenye = new BookPage();
			fenye.setCurentpage(page);
			fenye.setPagelistcount(rows);
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			WebDownloadcenterController webdow = new WebDownloadcenterController();
			if(tit!=null&&!tit.equals("")){
			List<Download> dlist = webdow.getSearchDownloadList(downloadservice,tit, fenye, "order by o.create_time desc");
			mp.put("dowlist", dlist);
			mp.put("page", fenye);
			mp.put("title", tit);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/jspclient/ga_download_search_list";
	}
	@RequestMapping("/webdonationcontent")
	public String webDonationContent(Integer id,Integer menu_id,HttpServletRequest req,ModelMap mp){
		
		try{
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, menu_id));
			WebDonationController webdon = new WebDonationController();
			mp.put("art", webdon.getDonationById(donationservice,id));
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/jspclient/cs_donation_content";
	}
	@RequestMapping("/govolunteer")
	public String govolunteer(Integer id,Integer menu_id,HttpServletRequest req,ModelMap mp){
		
		try{
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, menu_id));
			WebAticleController webart = new WebAticleController();
			mp.put("art", webart.getArticleById(articleservice, id));
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/jspclient/volunteer";
	}
	@RequestMapping("/webarticleabout")
	public String webArticleAbout(Integer menu_id,HttpServletRequest req,ModelMap mp){
		
		try{
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, menu_id));
			MenuVo vo = webnav.getLeftMenuvo(menuservice, menu_id, "order by o.no asc");
			mp.put("leftnav", vo);
			WebAticleController webart = new WebAticleController();
			mp.put("art", webart.getArticleAbout(articleservice, menu_id));
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/jspclient/aboutcontent";
	}
	@RequestMapping("/webtablelist")
	public String webTableList(Integer menu_id,Integer page,Integer rows,HttpServletRequest req,ModelMap mp){
		
		try{
			
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, menu_id));
			MenuVo vo = webnav.getLeftMenuvo(menuservice, menu_id, "order by o.no asc");
			mp.put("leftnav", vo);
			
			if(page == null){
				page = 1;
			}
			if(rows == null){
				rows = 15;
				
			}
			
			WebDocLoadController webdoc = new WebDocLoadController();
			BookPage fenye = new BookPage();
			fenye.setCurentpage(page);
			fenye.setPagelistcount(rows);
			List<Object> tlist =  webdoc.getTableList(webtableservice, fenye, menu_id, "order by o.createtime desc");
			mp.put("page", fenye);
			mp.put("tlist", tlist);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "/jspclient/doclist";
	}
	
	@RequestMapping("/downloaddoc")
	public void downLoadDoc(Integer id,HttpServletRequest req,HttpServletResponse resp){
		
		if(id!=null){
		documentcontroller.FileLoad(id, req, resp);
		}
		
	}
	
	@RequestMapping("/webmailaskview")
	public String webMailAskView(Integer menu_id,HttpServletRequest req,ModelMap mp){
		
		try{
			
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, menu_id));
			MenuVo vo = webnav.getLeftMenuvo(menuservice, menu_id, "order by o.no asc");
		    mp.put("leftnav", vo);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "/jspclient/email";
	}
	@RequestMapping("/addwebmailask")
	public String addWebMailAsk(MailAsk mailask,HttpServletRequest req,ModelMap mp){
		
		try{
			
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, mailask.getMenu_id()));
			MenuVo vo = webnav.getLeftMenuvo(menuservice, mailask.getMenu_id(), "order by o.no asc");
			mp.put("leftnav", vo);
			mp.put("title", mailask.getTitle());
			if(mailask!=null && mailask.getTitle()!=null&&mailask.getContent()!=null){
				mailask.setShowid(0);
				mailask.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
				mailask.setState(0);
				
				mailaskservice.addMailAsk(mailask);
				
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "/jspclient/mailsuccess";
	}
	
	
	@RequestMapping("/webmailasklist")
	public String webMailAskList(Integer menu_id,Integer page,Integer rows,HttpServletRequest req,ModelMap mp){
		
		try{
			
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, menu_id));
			MenuVo vo = webnav.getLeftMenuvo(menuservice, menu_id, "order by o.no asc");
			mp.put("leftnav", vo);
			
			if(page == null){
				page = 1;
			}
			if(rows == null){
				rows = 15;
				
			}
			BookPage fenye = new BookPage();
			WebMailAskController mailcon = new WebMailAskController();
			fenye.setCurentpage(page);
			fenye.setPagelistcount(rows);
			List<MailAsk> mlist = mailcon.getWebMailList(mailaskservice,mailunserservice, fenye, menu_id, "order by o.createtime desc");
			mp.put("page", fenye);
			mp.put("mlist", mlist);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		return "/jspclient/emaillist";
	}
	@RequestMapping("/webmailaskcontent")
	public String webMailAskContent(Integer id,Integer menu_id,HttpServletRequest req,ModelMap mp){
		
		try{
			
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, menu_id));
			MenuVo vo = webnav.getLeftMenuvo(menuservice, menu_id, "order by o.no asc");
			mp.put("leftnav", vo);
			WebMailAskController mailcon = new WebMailAskController();
			MailAskVo mvo = mailcon.getWebMvo(mailaskservice, mailunserservice, id);
			mp.put("mvo", mvo);
			
		}catch(Exception e){
			e.printStackTrace();			
		}
		
		
		return "/jspclient/emailcontent";
	}
	@RequestMapping("/webonlineaskview")
	public String webOnlineAskView(Integer menu_id,HttpServletRequest req,ModelMap mp){
		
		try{
			
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, menu_id));
			MenuVo vo = webnav.getLeftMenuvo(menuservice, menu_id, "order by o.no asc");
			mp.put("leftnav", vo);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "/jspclient/ask";
		
	}
	@RequestMapping("/addwebonlineask")
	public String addWebOnlineAsk(MailAsk mailask,HttpServletRequest req,ModelMap mp){
		
		try{
			
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, mailask.getMenu_id()));
			MenuVo vo = webnav.getLeftMenuvo(menuservice, mailask.getMenu_id(), "order by o.no asc");
			mp.put("leftnav", vo);
			mp.put("title", mailask.getTitle());
			if(mailask.getContent()!=null){
				mailask.setShowid(0);
				mailask.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
				mailask.setState(0);
				
				mailaskservice.addMailAsk(mailask);
				
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "/jspclient/mailsuccess";
		
		
		
	}
	@RequestMapping("/webonlineasklist")
	public String webOnlineAskList(Integer menu_id,Integer page,Integer rows,HttpServletRequest req,ModelMap mp){
		
		try{
			
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, menu_id));
			MenuVo vo = webnav.getLeftMenuvo(menuservice, menu_id, "order by o.no asc");
			mp.put("leftnav", vo);
			
			if(page == null){
				page = 1;
			}
			if(rows == null){
				rows = 15;
				
			}
			BookPage fenye = new BookPage();
			WebMailAskController mailcon = new WebMailAskController();
			fenye.setCurentpage(page);
			fenye.setPagelistcount(rows);
			List<MailAsk> mlist = mailcon.getWebMailList(mailaskservice,mailunserservice, fenye, menu_id, "order by o.createtime desc");
			mp.put("page", fenye);
			mp.put("mlist", mlist);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		return "/jspclient/asklist";
	}
	@RequestMapping("/webonlineaskcontent")
	public String webOnlineAskContent(Integer id,Integer menu_id,HttpServletRequest req,ModelMap mp){
		
	try{
			
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, menu_id));
			MenuVo vo = webnav.getLeftMenuvo(menuservice, menu_id, "order by o.no asc");
			mp.put("leftnav", vo);
			WebMailAskController mailcon = new WebMailAskController();
			MailAskVo mvo = mailcon.getWebMvo(mailaskservice, mailunserservice, id);
			mp.put("mvo", mvo);
			
		}catch(Exception e){
			e.printStackTrace();			
		}
		
		
		return "/jspclient/askcontent";
		
	}
	@RequestMapping("/webpaperlist")
	public String webPaperList(Integer menu_id,Integer page,Integer rows,HttpServletRequest req,ModelMap mp){
		
	try{
		
		WebNavController webnav = new WebNavController();
		mp.put("webnav", webnav.topNav(menuservice));
		mp.put("nav", webnav.getMenuById(menuservice, menu_id));
		MenuVo vo = webnav.getLeftMenuvo(menuservice, menu_id, "order by o.no asc");
		mp.put("leftnav", vo);
		
		if(page == null){
			page = 1;
		}
		if(rows == null){
			rows = 15;
		}
		
		BookPage fenye = new BookPage();
		WebPaperController wpc = new WebPaperController();
		fenye.setCurentpage(page);
		fenye.setPagelistcount(rows);
		List<Paper> plist = wpc.getWebPaperList(paperservice, fenye, "order by o.createtime desc");
		mp.put("page", fenye);
		mp.put("plist", plist);
	}catch(Exception e){
		e.printStackTrace();
	}
		
	return "/jspclient/paperlist";
		
	}
	
	@RequestMapping("/webpaper")
	public String webPaper(Integer id,Integer menu_id,HttpServletRequest req,ModelMap mp){
		
		try{
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, menu_id));
			WebPaperController wcn = new WebPaperController();
			mp.put("pvo", wcn.getPaperVo(paperservice, examinationservice, examunserservice, id));
			
		}catch(Exception e){
			e.printStackTrace();			
		}
		
		return "/jspclient/paper";
	}

	@RequestMapping("/webexamunresult")
	public String webExamunResult(String exun_ids,Integer id,Integer menu_id,String[] e_ids,String[] excontents,HttpServletRequest req,ModelMap mp){

		try{
			String datetime = AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd");
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			mp.put("nav", webnav.getMenuById(menuservice, menu_id));
			WebPaperController wcn = new WebPaperController();
			if(exun_ids!=null && !exun_ids.equals("")){
				String[] ex_idarr = exun_ids.split(",");
				for(String e_id:ex_idarr){
					wcn.webExamunser(examunserservice, Integer.parseInt(e_id));
				}
				
			}
			
			if(e_ids!=null && e_ids.length>0){
				
				for(int i=0;i<e_ids.length;i++){
					UnserContent uncontent = new UnserContent();
					uncontent.setCreatetime(datetime);
					uncontent.setExam_id(e_ids[i]);
					uncontent.setContent(excontents[i]);
					examunserservice.addUnserContent(uncontent);
				}
				
			}
			
			
			mp.put("pvo", wcn.getPaperVo(paperservice, examinationservice, examunserservice, id));
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "/jspclient/paperresult";
	}
	@RequestMapping("/webselarticle")
	public String webSelArticle(String tit,HttpServletRequest req,ModelMap mp){
		
		try{
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
			WebAticleController webart = new WebAticleController();
			if(tit!=null&&!tit.equals("")){
			List<Article> alist = webart.getSelWebArticle(articleservice, AleTools.getChinaChar(tit));
			mp.put("artlist", alist);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "/jspclient/sel";
	}
	@RequestMapping("/webpowerlist")
	public String webPowerList(Integer page,Integer rows,HttpServletRequest req,ModelMap mp){
		
		try{
			
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));

			
			if(page == null){
				page = 1;
			}
			if(rows == null){
				rows = 15;
				
			}
			WebPowerController  webpower = new WebPowerController();
			BookPage fenye = new BookPage();
			fenye.setCurentpage(page);
			fenye.setPagelistcount(rows);
	
				List<WebCase> plist = webpower.getWebCaseList(webcaseservice, fenye,"order by o.createtime desc");
			
			mp.put("page", fenye);
			mp.put("plist", plist);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/jspclient/powerlist";
	}
	@RequestMapping("/wxtwo")
	public String WxTwo(HttpServletRequest req,ModelMap mp){
		
		try{
			WebNavController webnav = new WebNavController();
			mp.put("webnav", webnav.topNav(menuservice));
		}catch(Exception e){
			e.printStackTrace();
		}

		return "/jspclient/wx";
	}
@RequestMapping("/webgwreport")	
public String WebGwReport(Integer menu_id,Integer page,Integer rows,HttpServletRequest req,ModelMap mp){
	
	try{
		
		WebNavController webnav = new WebNavController();
		mp.put("webnav", webnav.topNav(menuservice));
		mp.put("nav", webnav.getMenuById(menuservice, menu_id));
		MenuVo vo = webnav.getLeftMenuvo(menuservice, menu_id, "order by o.no asc");
		mp.put("leftnav", vo);
		WebAticleController webart = new WebAticleController();
		mp.put("make_file", webart.getShowArticleList(articleservice, 7, "order by o.createtime desc", 6));
		mp.put("make_person", webart.getShowArticleList(articleservice, 36, "order by o.createtime desc", 6));
		mp.put("make_report", webart.getShowArticleList(articleservice, 37, "order by o.createtime desc", 6));
		
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	return "/jspclient/gwreport";
}
	
	
}
