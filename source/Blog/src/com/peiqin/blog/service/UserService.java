package com.peiqin.blog.service;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.stereotype.Service;

import com.peiqin.blog.dao.UserDao;
import com.peiqin.blog.entities.User;
import com.peiqin.blog.util.MailUtils;
import com.peiqin.blog.util.UUIDUtils;

@Service
public class UserService {

	@Resource(name = "userDao")
	private UserDao userDao;

	public void registerUser(User user) throws AddressException, MessagingException {
		String code = UUIDUtils.getUUID() + UUIDUtils.getUUID();
		user.setCode(code);
		user.setStatus(0);
		userDao.register(user);
		MailUtils.sendMail(user.getEmail(), code);
	}
	
	public User login(User existuser){
		User user = userDao.login(existuser);
		if(user != null){
			return user;
		}
		return null;
	}

	public String findUserByUsername(String username) {
		User check = userDao.findUserByUsername(username);
		if(check != null){
			return "error";
		}else{
			return "success";
		}
	}

	public String findUserByEmail(String email) {
		User check = userDao.findUserByEmail(email);
		if(check != null){
			return "error";
		}else{
			return "success";
		}
	}

	public void saveInfo(User user) {
		userDao.update(user);
	}

	public User findUserByUid(Integer uid) {
		User user = userDao.findByUid(uid);
		if(user != null){
			return user;
		}
		return null;
	}
}
