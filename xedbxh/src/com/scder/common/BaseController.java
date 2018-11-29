package com.scder.common;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scder.utils.AleSql;
import com.scder.utils.AleTools;
import com.scder.utils.GenericsUtils;


public abstract class BaseController<T> {
	public BaseService baseservice;
	Class<T> entityClass = GenericsUtils.getSuperClassGenricType(this.getClass(), 0);
	@RequestMapping("/add")
	@ResponseBody
	public String add(T entity,HttpServletRequest req){
		try{
			this.onAdd(entity, req);
		baseservice.save(entity);
		this.afterAdd(entity, req);
		}catch(Exception e){
			e.printStackTrace();
			return AleTools.result(false, e.getMessage());
		}
		return AleTools.result(true, null);
	}
	
	public void onAdd(T entity,HttpServletRequest req){
		
	}
	
	public void afterAdd(T entity,HttpServletRequest req){
		
	}
	//可通过req.setAttribute("dir",path)自定义附件上传路径，默认路径是document
	@RequestMapping("/addasfile")
	@ResponseBody
	public String addAsFile(T entity,@RequestParam MultipartFile[] files,HttpServletRequest req){
		
		try{
			this.onAddAsFile(entity, files, req);
			baseservice.save(entity);
			this.afterAddAsFile(entity, files, req);
	}catch(Exception e){
			e.printStackTrace();
			return AleTools.result(false, e.getMessage());
	}
		
		 return AleTools.result(true, null);
}
	
	public void onAddAsFile(T entity,@RequestParam MultipartFile[] files,HttpServletRequest req){
		
		
	}
	
	public void afterAddAsFile(T entity,@RequestParam MultipartFile[] files,HttpServletRequest req){
		
		
	}
	@RequestMapping("/delasfile")
	@ResponseBody
	public String delAsFile(String ids){
		
		try{
			this.onDelAsFile(entityClass, ids);
			if(ids!=null && !ids.equals("")){
				String[] idarr = ids.split(",");
				for(String id:idarr){
					baseservice.remove(entityClass, Integer.parseInt(id));
				}
			}
			this.afterDelAsFile(entityClass, ids);
		}catch(Exception e){
				e.printStackTrace();
				return AleTools.result(false, e.getMessage());
			}
		 return AleTools.result(true, null);
		
	}
	
	public void onDelAsFile(Class<T> entityClass,String ids){
		
	}
	
	public void afterDelAsFile(Class<T> entityClass,String ids){
		
	}
	@RequestMapping("/del")
	@ResponseBody
	public String delete(String ids){
		try{
			this.onDelete(entityClass, ids);
			if(ids!=null && !ids.equals("")){
				String[] idarr = ids.split(",");
				for(String id:idarr){
					baseservice.remove(entityClass, Integer.parseInt(id));
				}
			}
			this.afterDelete(entityClass, ids);
			
		}
		catch(Exception e){
			e.printStackTrace();
			return AleTools.result(false, e.getMessage());
		}
		 return AleTools.result(true, null);
	}
	
	
	public void onDelete(Class<T> entityClass,String ids){
		
	}
	
	public void afterDelete(Class<T> entityClass,String ids){
		
	}
	
	@RequestMapping("/update")
	@ResponseBody
	
	public String update(T entity,HttpServletRequest req){
		
		try{
			this.onUpdate(entity, req);
			baseservice.update(entity);
			this.afterUpdate(entity, req);
		}catch(Exception e){
			e.printStackTrace();
			return AleTools.result(false, e.getMessage());
		}
		
		 return AleTools.result(true, null);
	}
	
	public void onUpdate(T entity,HttpServletRequest req){
		
		
	}
	
public void afterUpdate(T entity,HttpServletRequest req){
		
		
}

@RequestMapping("/updateasfile")
@ResponseBody
public String updateAsFile(T entity,@RequestParam MultipartFile[] files,HttpServletRequest req){
	
	try{
		this.onUpdateAsFile(entity, files, req);
		baseservice.update(entity);
		this.afterUpdateAsFile(entity, files, req);
	}catch(Exception e){
		e.printStackTrace();
		return AleTools.result(false, e.getMessage());
	}
	
	 return AleTools.result(true, null);
}

public void onUpdateAsFile(T entity,@RequestParam MultipartFile[] files,HttpServletRequest req){
	
}
public void afterUpdateAsFile(T entity,@RequestParam MultipartFile[] files,HttpServletRequest req){
	
}
@RequestMapping("/list")
@ResponseBody
public  PageNation<T> getResultList(HttpServletRequest req){
		
		try{
			PageNation pagenation = new PageNation<T>();
			pagenation.setDatas(this.onGetResultList(pagenation, req));
		 return pagenation;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
public 	List<T> onGetResultList(PageNation<T> pagenation,HttpServletRequest req) throws Exception{
	
	Integer page = Integer.parseInt(req.getParameter("page")!=null&&!req.getParameter("page").trim().equals("")?req.getParameter("page"):"1");
	Integer rows = Integer.parseInt(req.getParameter("rows")!=null&&!req.getParameter("rows").trim().equals("")?req.getParameter("rows"):"10");
	List<String> whereList = new ArrayList<String>();
	List<Object> paramlist = new ArrayList<Object>();
	Enumeration<String> enu = req.getParameterNames();
	Integer firstResult=null;
	Integer currentPage=null;
	Integer lastPage = null;
	Integer pageCount = null;
	
	String jpql = "select o from "+entityClass.getSimpleName()+" o";
	while (enu.hasMoreElements()) {
		String paraName = enu.nextElement();
		// 判断是不是属于泛型类
		Field[] fields = entityClass.getDeclaredFields();
		String name=paraName;
		if(!paraName.contains("$")){
			name=name+"$eq";
		}
		String[] aryParaName=name.split("\\$");
		String val=req.getParameter(paraName);
	    String filedName=aryParaName[0];
		
		for (int i = 0; i < fields.length; i++) {
			Field f = fields[i];
			if (filedName.equalsIgnoreCase(f.getName())&&!StringUtils.isEmpty(val)) {
				String type = f.getType().getSimpleName();
				Object value=null;
				if(type.equals("String")){
					 value = AleTools.getChinaChar(String.valueOf(val));
				}
				if(type.equals("Integer")){
					 value = Integer.parseInt(val);
				}
				
				
				switch(aryParaName[1]){
				  case "eq":
					  whereList.add("o."+filedName+"=?");
					  paramlist.add(value);
					  break;
				  case "nq":
					  whereList.add("o."+filedName+"!=?");
					  paramlist.add(value);
					  break;
				  case "lk":
					  whereList.add("o."+filedName+" like ?");
					  paramlist.add("%"+value+"%");
					  break;
				  case "mint":
					  whereList.add("o."+filedName+" >= ?");
					  paramlist.add(value);
					  break;
				  case "maxt":
					  whereList.add("o."+filedName+" >= ?");
					  paramlist.add(value);
					  break;
					  
				}
				break;
			}
		}
			
	}
	
	Map<String,String> oderby = new HashMap<String, String>();
	if(req.getAttribute("orderby")!=null){
		
		oderby.put("o."+req.getAttribute("orderby").toString(), "desc");
	}else{
	oderby.put("o.id", "desc");
	}
	if(page!=null&&rows!=null){
		currentPage=page;
		firstResult=(page-1)*rows;
		pageCount = baseservice.count(jpql, AleSql.createSql(whereList, "and").toString(), paramlist.toArray(), oderby);
		lastPage = pageCount%rows==0?pageCount/rows:pageCount/rows+1;
    
	}
	pagenation.setPagecount(lastPage);
	
	return baseservice.resultList(firstResult, rows, jpql, AleSql.createSql(whereList, "and").toString(), paramlist.toArray(), oderby);
}

public 	List<T> afterGetResultList(PageNation<T> pagenation,HttpServletRequest req){
	return null;
}

@RequestMapping("listall")
@ResponseBody
public List<T> getResultListAll(HttpServletRequest req){
		
		try{
			
			return this.onGetResultListAll(req);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
	}

public List<T> onGetResultListAll(HttpServletRequest req) throws Exception{
	
	List<String> whereList = new ArrayList<String>();
	List<Object> paramlist = new ArrayList<Object>();
	Enumeration<String> enu = req.getParameterNames();
	
	String jpql = "select o from "+entityClass.getSimpleName()+" o";
	while (enu.hasMoreElements()) {
		String paraName = enu.nextElement();
		// 判断是不是属于泛型类
		Field[] fields = entityClass.getDeclaredFields();
		String name=paraName;
		if(!paraName.contains("$")){
			name=name+"$eq";
		}
		String[] aryParaName=name.split("\\$");
		String val=req.getParameter(paraName);
	    String filedName=aryParaName[0];
		
		for (int i = 0; i < fields.length; i++) {
			Field f = fields[i];
			if (filedName.equalsIgnoreCase(f.getName())&&!StringUtils.isEmpty(val)) {
				String type = f.getType().getSimpleName();
				Object value=null;
				if(type.equals("String")){
					 value = String.valueOf(val);
				}
				if(type.equals("Integer")){
					 value = Integer.parseInt(val);
				}
				
				switch(aryParaName[1]){
				  case "eq":
					  whereList.add("o."+filedName+"=?");
					  paramlist.add(value);
					  break;
				  case "nq":
					  whereList.add("o."+filedName+"!=?");
					  paramlist.add(value);
					  break;
				  case "lk":
					  whereList.add("o."+filedName+" like ?");
					  paramlist.add("%"+value+"%");
					  break;
				  case "mint":
					  whereList.add("o."+filedName+" >= ?");
					  paramlist.add(value);
					  break;
				  case "maxt":
					  whereList.add("o."+filedName+" >= ?");
					  paramlist.add(value);
					  break;
				  case "is_article":
					  whereList.add("o."+filedName+" = ?");
					  paramlist.add(value);
					  break;
					  
				}
				break;
			}
		}
			
	}
	
	Map<String,String> oderby = new HashMap<String, String>();
	oderby.put("o.id", "asc");

	
	return baseservice.resultListAll(jpql, AleSql.createSql(whereList, "and").toString(), paramlist.toArray(), oderby);
	
   }

public List<T> afterGetResultListAll(HttpServletRequest req){

	return null;
   }


@RequestMapping("findbyid")
@ResponseBody
public T findById(Integer id){
	try{
	this.onFindById(entityClass, id);
	T entity = baseservice.find(entityClass, id);
	this.afterFindById(entityClass, id);
	return entity;
	}catch(Exception e){
		e.printStackTrace();
	}
	return null;
}

public void onFindById(Class<T> entityClass,Integer id){
	
}

public void afterFindById(Class<T> entityClass,Integer id){
	
}

public abstract void setBaseservice(BaseService baseservice);

}
