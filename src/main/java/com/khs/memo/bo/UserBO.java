package com.khs.memo.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khs.memo.common.EncryptUtils;
import com.khs.memo.dao.UserDAO;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	public int addUser(String loginId,String password,String name, String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
}
