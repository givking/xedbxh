package com.scder.system.product.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scder.common.BaseController;
import com.scder.common.BaseService;
import com.scder.common.PageNation;
import com.scder.system.article.model.Article;
import com.scder.system.product.model.Product;
import com.scder.system.product.service.ProductService;
import com.scder.system.systemuser.model.SystemUser;
import com.scder.utils.AleSql;
import com.scder.utils.AleTools;
import com.scder.utils.FileCurrentUp;
@Controller
@RequestMapping("/product")
public class ProductController extends BaseController<Product> {
  ProductService productservice;
	@Override
	@Resource(name="productservice")
	public void setBaseservice(BaseService baseservice) {
		this.baseservice = baseservice;
		productservice = (ProductService)baseservice;
	}
	@Override
	public void onAddAsFile(Product entity, MultipartFile[] files,
			HttpServletRequest req) {
		try{
			if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
				throw new RuntimeException("lack of standardization");
			}	
			req.setAttribute("dir", "/product");
			if(files!=null && files.length>0){	
				for(MultipartFile upfile:files){
					if(!upfile.getOriginalFilename().trim().equals("")){
				   FileCurrentUp.fileUpLoad(upfile, req);
				   entity.setImgpath(req.getAttribute("fpa").toString());
					}
				}
			}

	if(entity.getCreatetime()==null||entity.getCreatetime().trim().equals("")){
			
			entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}
	
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	
	@Override
	public void onUpdateAsFile(Product entity, MultipartFile[] files,
			HttpServletRequest req) {
	
		
		try{
			if(entity.getTitle()==null||entity.getTitle().trim().equals("")){
				throw new RuntimeException("lack of standardization");
			}	
			req.setAttribute("dir", "/product");
			if(files!=null && files.length>0){	
				for(MultipartFile upfile:files){
					if(!upfile.getOriginalFilename().trim().equals("")){
						  FileCurrentUp.fileUpLoad(upfile, req);
						   entity.setImgpath(req.getAttribute("fpa").toString());
						
					}
				}
			}

	if(entity.getCreatetime()==null||entity.getCreatetime().trim().equals("")){
			
			entity.setCreatetime(AleTools.getCurrentSystemDateTimeToString("yyyy-MM-dd"));
		}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
	}
	@RequestMapping("/updateshowid")
	@ResponseBody
	public String updateShowid(Integer a_id,String showid){
		
		try{
			if(a_id!=null && showid!=null){
				Product at = this.findById(a_id);
				if(showid.equals("1")){
				at.setShowid(0);	
				}else{
					at.setShowid(1);
				}
				productservice.updateShowid(at);
				return AleTools.result(true, null);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			return AleTools.result(false, e.getMessage());
		}
		
		return null;
	}
	
	
	@RequestMapping("/findmodelviewlist")
	@ResponseBody
	 public PageNation<Object> findModelViewList(HttpServletRequest req){
		 
		 try{
			 PageNation pagenation = new PageNation<Object>();
			 Integer page = Integer.parseInt(req.getParameter("page")!=null&&!req.getParameter("page").trim().equals("")?req.getParameter("page"):"1");
				Integer rows = Integer.parseInt(req.getParameter("rows")!=null&&!req.getParameter("rows").trim().equals("")?req.getParameter("rows"):"10");
				String selkey = req.getParameter("selkey")!=null&&!req.getParameter("selkey").trim().equals("")?req.getParameter("selkey"):"";
				String titlekey = req.getParameter("titlekey")!=null&&!req.getParameter("titlekey").trim().equals("")?req.getParameter("titlekey"):"";
				List<String> whereList = new ArrayList<String>();
				Integer firstResult=null;
				Integer currentPage=null;
				Integer lastPage = null;
				Integer pageCount = null;
				String key = AleTools.getChinaChar(selkey);
				String sql = "select o.*,m.id m_id,m.title menuname from alecms_product o left join alecms_menu m on o.menu_id = m.id";	
				
				if(key!=null&&!key.equals("")){
					whereList.add("m.title like '%"+key+"%'");
					
				}
				if(titlekey!=null&&!titlekey.equals("")){
					String tkey = AleTools.getChinaChar(titlekey);
					whereList.add("o.title like '%"+tkey+"%'");
				}
				
				if(whereList.size()>0){
				sql=sql+" where "+AleSql.createSql(whereList, "and").toString();
				}
				if(page!=null&&rows!=null){
					currentPage=page;
					firstResult=(page-1)*rows;
					pageCount = productservice.getModelViewList(sql).size();
					lastPage = pageCount%rows==0?pageCount/rows:pageCount/rows+1;
			    
				}
				
				
				pagenation.setPagecount(lastPage);
				String pagesql = sql+" "+"order by o.id desc "+"limit "+firstResult+","+rows;
				pagenation.setDatas(productservice.getModelViewList(pagesql));
			 return pagenation;
			 
		 }catch(Exception e){
			 
			 e.printStackTrace();
	     }
		 
		 return null;
		 
	 }
	

}
