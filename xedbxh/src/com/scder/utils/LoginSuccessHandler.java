package com.scder.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.stereotype.Component;

import com.scder.system.systemuser.model.SystemUser;


@Component("loginSuccessHandler")
public class LoginSuccessHandler extends
		SavedRequestAwareAuthenticationSuccessHandler {
	private List<SystemUser> userlist = new ArrayList<SystemUser>();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws ServletException, IOException {
		UserDetailsImpl ud = (UserDetailsImpl) authentication.getPrincipal();
		SystemUser u = ud.getUser();
		userlist.add(u);
		HttpSession session = request.getSession();
		session.setAttribute("user", u);
		response.sendRedirect(request.getContextPath() + "/home");
	}

	@Override
	public void setRequestCache(RequestCache requestCache) {
		// TODO Auto-generated method stub
		super.setRequestCache(requestCache);
	}

}
