package com.peiqin.blog.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.peiqin.blog.dao.CategoryDao;
import com.peiqin.blog.entities.Category;
@Service
public class CategoryService {

	@Resource(name = "categoryDao")
	private CategoryDao categoryDao;
	
	public List<Category> findAll(){
		return categoryDao.findAll();
	}

	public Category findByCid(Integer cid) {
		return categoryDao.findByCid(cid);
	}
}
