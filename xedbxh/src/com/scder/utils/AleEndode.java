package com.scder.utils;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.authentication.encoding.PasswordEncoder;

public class AleEndode implements PasswordEncoder{

	@Override
	public String encodePassword(String rawPass, Object salt) {
		Md5PasswordEncoder en = new Md5PasswordEncoder();
		return en.encodePassword(rawPass, null);
	}

	@Override
	public boolean isPasswordValid(String encPass, String rawPass, Object salt) {
		// TODO Auto-generated m0ethod stub
		return encPass.equals(encodePassword(rawPass,salt));
	}

}
