package com.peiqin.blog.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.peiqin.blog.entities.User;

@Component
public class UserDao {

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public User login(User user){
		String hql = "from User where email = ? and password = ?";
		return (User) getSession().createQuery(hql).setString(0, user.getEmail()).setString(1, user.getPassword()).uniqueResult();
	}
	
	public void register(User user){
		getSession().save(user);
	}
	
	public User findByCode(String code){
		String hql = "from User u where u.code = ?";
		return (User) getSession().createQuery(hql).setString(0, code).uniqueResult();
	}
	
	public void updateUser(User existUser){
		getSession().update(existUser);
	}

	public User findUserByUsername(String username) {
		String hql = "from User where username = ?";
		User user = (User) getSession().createQuery(hql).setString(0, username).uniqueResult();
		if(user == null){
			return null;
		}
		return user;
	}

	public User findUserByEmail(String email) {
		String hql = "from User where email = ?";
		User user = (User) getSession().createQuery(hql).setString(0, email).uniqueResult();
		if(user == null){
			return null;
		}
		return user;
	}

	public void update(User user) {
		// TODO Auto-generated method stub
		getSession().update(user);
	}

	public User findByUid(Integer uid) {
		return (User) getSession().get(User.class, uid);
	}
}
