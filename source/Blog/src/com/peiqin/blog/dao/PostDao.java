package com.peiqin.blog.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.peiqin.blog.entities.Post;

@Component
public class PostDao {

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public void save(Post post){
		getSession().save(post);
	}

	public Integer findCount() {
		String hql = "select count(*) from Post";
		Long l = (Long) getSession().createQuery(hql).uniqueResult();
		return l.intValue();
	}

	public List<Post> findPostByPage(Integer begin, Integer limit) {
		String hql = "from Post";
		return getSession().createQuery(hql).setFirstResult(begin).setMaxResults(limit).list();
	}

	public Post findActicleByPid(Integer pid) {
		return (Post) getSession().get(Post.class, pid);
	}

	public List<Post> findHot() {
		List<Post> list = getSession().createCriteria(Post.class).addOrder(Order.desc("view")).setMaxResults(10).list();
		return list;
	}

	public Integer findCountByCid(Integer cid) {
		String hql = "select count(*) from Post p where p.category.cid = ?";
		Long l = (Long) getSession().createQuery(hql).setInteger(0, cid).uniqueResult();
		return l.intValue();
	}

	public List<Post> findPostByPageAndCid(Integer cid, Integer begin, int i) {
		String hql = "from Post p where p.category.cid = ?";
		List<Post> list = getSession().createQuery(hql).setInteger(0, cid).setFirstResult(begin).setMaxResults(i).list();
		return list;
	}
	
}
