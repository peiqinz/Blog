package com.peiqin.blog.entities;

public class FileInfo {
	private Integer fid;
	private String fname;
	private User user;
	private String fplace;
	private Integer dtime;
	private String contentType;

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getContentType() {
		return contentType;
	}

	public Integer getFid() {
		return fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getFplace() {
		return fplace;
	}

	public void setFplace(String fplace) {
		this.fplace = fplace;
	}

	public Integer getDtime() {
		return dtime;
	}

	public void setDtime(Integer dtime) {
		this.dtime = dtime;
	}
}
