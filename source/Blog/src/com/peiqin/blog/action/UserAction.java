package com.peiqin.blog.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.peiqin.blog.entities.User;
import com.peiqin.blog.service.UserService;

public class UserAction extends ActionSupport implements ModelDriven<User>, Preparable, SessionAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource(name = "userService")
	private UserService userService;
	private Map<String, Object> session;
	private String checkcode1;
	private User user;
	private Map<String, Object> map = new HashMap<>();
	private String username;
	private String email;
	private String newpassword;
	private String oldpassword;
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	
	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String logout(){
		session.remove("loginuser");
		return "index";
	}
	
	public String modifyPassword(){
		User user = (User) session.get("loginuser");
		String password = user.getPassword();
		if(password.equals(oldpassword)){
			user.setPassword(newpassword);
			userService.saveInfo(user);
			return "myInfomation";
		}
		return "passwordwrong";
		
	}
	
	public String registerUser() throws AddressException, MessagingException{
		String checkcode = (String) session.get("checkcode");
		if(checkcode.equalsIgnoreCase(checkcode1)){
			String checkUsername = userService.findUserByUsername(user.getUsername());
			if(checkUsername.equals("error")){
				this.addActionError("用户名已被注册");
				return "regist";
			}
			String checkEmail = userService.findUserByEmail(user.getEmail());
			if(checkEmail.equals("error")){
				this.addActionError("邮箱已被注册");
				return "regist";
			}
			userService.registerUser(user);
			this.addActionMessage("注册成功，请去激活邮箱");
			return "registSuccess";
		}
		this.addActionError("验证码错误");
		return "regist";
	}
	
	public String loginUser(){
		User loginuser = userService.login(user);
		if(loginuser != null){
			session.put("loginuser", loginuser);
			return "loginSuccess";
		}
		this.addActionMessage("用户名或密码错误");
		return "loginFail";
	}
	
	public void prepareLoginUser(){
		user = new User();
	}
	
	public void prepareRegisterUser(){
		user = new User();
	}

	public String validateUsername(){
		System.out.println("验证用户名"+username);
		
		if(userService.findUserByUsername(username).equals("error")){
			System.out.println(username+"   0");
			map.put("validateUsername", 0);
		}else{
			map.put("validateUsername", 1);
			System.out.println(username+"   1");
		}
		return "ajax-success";
	}
	
	public String validateEmail(){
		if(userService.findUserByEmail(email).equals("error")){
			System.out.println(email+"   0");
			map.put("validateEmail", 0);
		}else{
			map.put("validateEmail", 1);
			System.out.println(email+"   1");
		}
		return "ajax-success";
	}
	
	public String saveInfo(){
		userService.saveInfo(user);
		return "myInfomation";
	}
	
	public void prepareSaveInfo(){
		user = (User) session.get("loginuser");
	}
	
	public String findUserByUid(){
		return "information";
	}
	
	public void prepareFindUserByUid(){
		user = (User) session.get("loginuser");
		Integer uid = user.getUid();
		user = userService.findUserByUid(uid);
	}
	
	public Map<String, Object> getMap() {
		return map;
	}
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session = arg0;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	
	public void setCheckcode1(String checkcode1) {
		this.checkcode1 = checkcode1;
	}
}
