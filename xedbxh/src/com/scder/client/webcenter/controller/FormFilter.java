package com.scder.client.webcenter.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class FormFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		String url = req.getServletPath();
		String wcode = req.getParameter("code");
		String realcode = (String)req.getSession().getAttribute("idcode");
		if(wcode!=null&&wcode.equals(realcode)){
			chain.doFilter(request, response);
		}else{
			req.setAttribute("mes", "wrong");
			if("/webcenter/addwebmailask".equals(url)){
				request.getServletContext().getRequestDispatcher("/webcenter/webmailaskview?menu_id=18").forward(request, response);	
			}else{
				request.getServletContext().getRequestDispatcher("/webcenter/webonlineaskview?menu_id=19").forward(request, response);	
				
			}
			
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
