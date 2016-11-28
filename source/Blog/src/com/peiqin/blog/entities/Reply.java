package com.peiqin.blog.entities;


public class Reply {

	private Integer rid;
	private Post post;
	private User user;
	private String neirong;
	private String replyday;
	
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getNeirong() {
		return neirong;
	}
	public void setNeirong(String neirong) {
		this.neirong = neirong;
	}
	public String getReplyday() {
		return replyday;
	}
	public void setReplyday(String replyday) {
		this.replyday = replyday;
	}
	
}
