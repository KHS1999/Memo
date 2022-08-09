package com.khs.memo.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khs.memo.user.dao.PostDAO;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	// userId, 제목, 내용 저장 기능
	public int addPost(int userId, String title, String content) {
		
		return postDAO.insertPost(userId, title, content);
	}
}
