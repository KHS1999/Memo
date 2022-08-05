package com.khs.memo.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khs.memo.common.EncryptUtils;
import com.khs.memo.dao.UserDAO;
import com.khs.memo.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	public int addUser(String loginId,String password,String name, String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	
	// 아이디와 패스워드 전달 받고 일치하는 데이터 있는지 확인
	public User getUser(String loginId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
	}
}
