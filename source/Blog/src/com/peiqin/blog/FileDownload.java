package com.peiqin.blog;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.peiqin.blog.entities.FileInfo;
import com.peiqin.blog.service.FileInfoService;
import com.peiqin.blog.service.UserService;

public class FileDownload extends ActionSupport{  
	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "fileInfoService")
	private FileInfoService fileInfoService;
	private Integer fid;
	public void setFid(Integer fid) {
		this.fid = fid;
	}
  
    public Long getContentLength(){
		FileInfo file = fileInfoService.findFileByFid(fid);
		File f = new File(ServletActionContext.getServletContext().getRealPath("/")+file.getFname());
		return f.length();
	}
	
	public InputStream getDownloadFile() throws FileNotFoundException{
		FileInfo file = fileInfoService.findFileByFid(fid);
		String path = file.getFplace();
		return ServletActionContext.getServletContext().getResourceAsStream("js/bootstrap.js");
	}
	
    @Override  
    public String execute() throws Exception {  
          
        return SUCCESS;  
    }  
  
}  
