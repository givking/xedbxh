package com.scder.utils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;

import com.scder.system.resource.model.Resource;
import com.scder.system.systemuser.model.SystemUser;


public class UserDetailsImpl implements UserDetails {
	private static final long serialVersionUID = -216263290910274376L;
	private SystemUser user;
	private List<Resource> reslist;

	public UserDetailsImpl() {

	}

	public SystemUser getUser() {
		return user;
	}

	public void setUser(SystemUser user) {
		this.user = user;
	}

	public UserDetailsImpl(SystemUser user, List<Resource> reslist) {
		super();
		this.user = user;
		this.reslist = reslist;
		
	}

	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		if (reslist != null && reslist.size() != 0) {
			for (Resource res : reslist) {
				if (null != res) {
					authorities.add(new GrantedAuthorityImpl(res.getIdentity()));
				}
			}

		}

		return authorities;
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getAccount();
	}

	@Override
	public boolean isAccountNonExpired() {
		// if (user.isRemoved() || !user.isEnable()) {
		// return false;
		// }
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// if (user.isRemoved() || !user.isEnable()) {
		// return false;
		// }
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
		// return user.isEnable();
	}

	public List<Resource> getRolelist() {
		return reslist;
	}

	public void setRolelist(List<Resource> reslist) {
		this.reslist = reslist;
	}
	public boolean equals(Object obj) {
		if (obj instanceof UserDetailsImpl) {
			UserDetailsImpl ud = (UserDetailsImpl) obj;
		if (ud.getUsername().equals(this.getUsername())) {
		
		return true;
		}
		}
		
		return false;
		}

		public int hashCode() {
		return getUsername().hashCode();
		} 

}
