package com.peiqin.blog.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.peiqin.blog.entities.Category;
import com.peiqin.blog.entities.Post;
import com.peiqin.blog.service.CategoryService;
import com.peiqin.blog.service.PostService;
import com.peiqin.blog.util.PageBean;

public class IndexAction extends ActionSupport implements ModelDriven<Post>, Preparable, SessionAware{

	private Post post;
	private Map<String, Object>	session;
	@Resource(name = "postService")
	private PostService postService;
	@Resource(name = "categoryService")
	private CategoryService categoryService;
	private Integer page;
	
	public void setPage(Integer page) {
		this.page = page;
	}
	
	public String execute(){
		PageBean<Post> pageBean = postService.findAll(page);
		List<Category> categories = categoryService.findAll();
		List<Post> pageBean2 = postService.findHot();
		session.put("hot", pageBean2);
		session.put("pageBean", pageBean);
		for(Category category : categories){
			session.put("c"+category.getCid(), category.getCname());
		}
		return "index";
	}
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	@Override
	public void prepare() throws Exception {
		
	}

	@Override
	public Post getModel() {
		return post;
	}
	
}
