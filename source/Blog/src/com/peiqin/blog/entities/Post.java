package com.peiqin.blog.entities;

import java.security.KeyStore.PrivateKeyEntry;
import java.util.HashSet;
import java.util.Set;

public class Post {

	private Integer pid;
	private Category category;
	private User user;
	private String title;
	private String neirong;
	private String postDay;
	private String summary;
	private Integer view;
	private Set<Reply> replies = new HashSet<>();
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNeirong() {
		return neirong;
	}
	public void setNeirong(String neirong) {
		this.neirong = neirong;
	}
	public String getPostDay() {
		return postDay;
	}
	public void setPostDay(String postDay) {
		this.postDay = postDay;
	}
	public Set<Reply> getReplies() {
		return replies;
	}
	public void setReplies(Set<Reply> replies) {
		this.replies = replies;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public Integer getView() {
		return view;
	}
	public void setView(Integer view) {
		this.view = view;
	}
}
