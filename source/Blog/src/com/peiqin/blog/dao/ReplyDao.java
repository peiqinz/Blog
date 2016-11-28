package com.peiqin.blog.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.peiqin.blog.entities.Reply;
@Component
public class ReplyDao {

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public List<Reply> findRepliesByPid(Integer pid){
		String hql = "from Reply r where r.post.pid = ?";
		return getSession().createQuery(hql).setInteger(0, pid).list();
	}
	
	public void saveReply(Reply reply){
		getSession().save(reply);
	}
}
