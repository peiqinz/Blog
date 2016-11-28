package com.peiqin.blog.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.peiqin.blog.entities.Category;
@Component
public class CategoryDao {
	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public List<Category> findAll(){
		String hql = "from Category";
		return  getSession().createQuery(hql).list();
	}

	public Category findByCid(Integer cid) {
		String hql = "from Category where cid = ?";
		Category category = (Category) getSession().createQuery(hql).setInteger(0, cid).uniqueResult();
		if(category != null){
			return category;
		}else{
			return null;
		}
	}
	
	
}
