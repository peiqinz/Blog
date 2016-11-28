package com.peiqin.blog.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.opensymphony.xwork2.inject.Container;
import com.peiqin.blog.entities.Post;
import com.peiqin.blog.entities.Reply;
import com.peiqin.blog.entities.User;
import com.peiqin.blog.service.PostService;
import com.peiqin.blog.service.ReplyService;

public class ReplyAction extends ActionSupport implements SessionAware, ModelDriven<Reply>, Preparable{

	private Reply reply;
	private Map<String, Object> session;
	@Resource(name = "postService")
	private PostService postService;
	@Resource(name = "replyService")
	private ReplyService replyService;
	private String pid;
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPid() {
		return pid;
	}
	public String saveReply(){
		Integer rpid = 0;
		System.out.println(pid);
		try {
			
			rpid = Integer.parseInt(pid);
			System.out.println(rpid);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		Post post = postService.findActicleByPid(rpid);
		reply.setPost(post);
		User user = (User) session.get("loginuser");
		reply.setUser(user);
		replyService.saveReply(reply);
		return SUCCESS;
	}
	
	public void prepareSaveReply(){
		reply = new Reply();
	}
	
	@Override
	public void prepare() throws Exception {
		
	}

	@Override
	public Reply getModel() {
		// TODO Auto-generated method stub
		return reply;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	
}
