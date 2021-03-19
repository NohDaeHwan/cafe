package com.cafe.service;

import com.cafe.domain.user.User;
import com.cafe.domain.user.dao.UserDao;
import com.cafe.domain.user.dto.JoinReqDto;
import com.cafe.domain.user.dto.LoginReqDto;
import com.cafe.domain.user.dto.UpdateReqDto;

public class UserService {
	
	private UserDao userDao;
	
	public UserService() {
		userDao = new UserDao();
	}
	
	public int join(JoinReqDto dto) {
		int result = userDao.save(dto);
		return result;
	}

	public User login(LoginReqDto dto) {
		return null;		
	}
	
	public int update(UpdateReqDto dto) {
		return -1;
	}
	
	public int idCheck(String username) {
		int result = userDao.findById(username);
		return result;
	}
	
}
