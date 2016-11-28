package com.peiqin.blog.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.peiqin.blog.entities.Category;
import com.peiqin.blog.entities.Post;
import com.peiqin.blog.entities.Reply;
import com.peiqin.blog.entities.User;
import com.peiqin.blog.service.CategoryService;
import com.peiqin.blog.service.PostService;
import com.peiqin.blog.service.ReplyService;

public class PostAction extends ActionSupport implements ModelDriven<Post>, Preparable, SessionAware {

	@Resource(name = "categoryService")
	private CategoryService categoryService;
	@Resource(name = "postService")
	private PostService postService;
	@Resource(name = "replyService")
	private ReplyService replyService;
	private Post post;
	private Map<String, Object> session;
	private Integer cid;
	private String ctxt;
	private String pid;
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPid() {
		return pid;
	}
	
	public void setCtxt(String ctxt) {
		this.ctxt = ctxt;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}
	
	public String viewActicle(){
		Integer spid = 0;
		try{
			spid = Integer.parseInt(pid);
		}catch(Exception e){
			this.addActionError("输入错误");
			return "error";
		}
		List<Post> pageBean2 = postService.findHot();
		session.put("hot", pageBean2);
		post = postService.findActicleByPid(spid);
		int psid = 0;
		psid = Integer.parseInt(pid);
		List<Reply> replies = replyService.findRepliesByPid(spid);
		System.out.println(replies);
		session.put("replies", replies);
		if(post == null){
			this.addActionError("没有该文章");
			return "error";
		}
		session.put("post", post);
		return "acticle";
	}
	
	public void prepareViewActicle(){
		
	}

	public String postActicle() {
		System.out.println(ctxt);
		Category category = categoryService.findByCid(cid);
		post.setCategory(category);
		User user = (User) session.get("loginuser");
		post.setUser(user);
		post.setView(0);
		postService.save(post);
		return "postSuccess";
	}

	public void preparePostActicle() {
		System.out.println("preparePostActicle");
		post = new Post();
	}

	public String beforePost() {
		List<Category> categories = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("categories", categories);
		return "beforePost";
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Post getModel() {
		// TODO Auto-generated method stub
		return post;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session = arg0;
	}
}
