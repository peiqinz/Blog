package com.peiqin.blog.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.peiqin.blog.entities.Post;
import com.peiqin.blog.service.PostService;
import com.peiqin.blog.util.PageBean;

import freemarker.core.Macro;

public class CategoryAction extends ActionSupport implements SessionAware{
	private Map<String, Object> session;
	private Integer cid;
	private Integer page;
	@Resource(name = "postService")
	private PostService postService;
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	
	public String execute(){
		PageBean<Post> posts = postService.findAllByCid(cid,page);
		session.put("pageBean", posts);
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session = arg0;
	}
}
