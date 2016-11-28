package com.peiqin.blog.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.peiqin.blog.entities.FileInfo;
import com.peiqin.blog.entities.User;
import com.peiqin.blog.service.FileInfoService;
import com.peiqin.blog.service.UserService;

public class UploadDownloadAction extends ActionSupport implements SessionAware{

	private Map<String, Object> session;
	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "fileInfoService")
	private FileInfoService fileInfoService;
	
	private File file;
	private String fileContentType;
	private String fileFileName;
	private Integer fid;
	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public String uploadPhoto() throws IOException{
	BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
	try {
			User user = (User) session.get("loginuser");
			System.out.println(user.getUsername());
			String username = user.getUsername();
			System.out.println(fileFileName);
			FileInputStream fis = new FileInputStream(file);
			String path = ServletActionContext.getServletContext().getRealPath("/")+
					"img\\" + username;
			File f = new File(path);
			if(!f.exists()){
				f.mkdirs();
			}
			FileOutputStream fos = new FileOutputStream(path+"\\"+fileFileName);
			System.out.println(path+"\\"+fileFileName);
			bis = new BufferedInputStream(fis);
			bos = new BufferedOutputStream(fos);
			byte[] b = new byte[1024];
			int length = 0;
			while((length = bis.read(b)) > 0){
				bos.write(b, 0, length);
				bos.flush();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (bos != null){
				bos.close();
			}
			if (bis != null){
				bis.close();
			}
		}
		User user = (User) session.get("loginuser");
		User usertemp = userService.findUserByUid(user.getUid());
		usertemp.setUserphoto("img\\"+user.getUsername()+"\\"+fileFileName);
		userService.saveInfo(usertemp);
		session.put("loginuser", usertemp);
		return "myInfomation";
	}

	public String uploadFile() throws IOException{
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			FileInputStream fis = new FileInputStream(file);
			User user = (User) session.get("loginuser");
			String path = ServletActionContext.getServletContext().getRealPath("/")+
					"File\\"+ user.getUsername();
			File f = new File(path);
			if(!f.exists()){
				f.mkdirs();
			}
			FileOutputStream fos = new FileOutputStream(path + "\\" + fileFileName);
			bis = new BufferedInputStream(fis);
			bos = new BufferedOutputStream(fos);
			int length = 0;
			byte[] b = new byte[1024];
			while((length = bis.read(b))>0){
				bos.write(b, 0, length);
				bos.flush();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			if(bis != null){
				bis.close();
			}
			if(bos != null){
				bos.close();
			}
		}
		User user = (User) session.get("loginuser");
		FileInfo fileInfo = new FileInfo();
		fileInfo.setDtime(0);
		fileInfo.setFname(fileFileName);
		fileInfo.setFplace("File\\"+ user.getUsername()+"\\"+fileFileName);
		fileInfo.setUser(user);
		fileInfoService.save(fileInfo);
		return "myInfomation";
	}
	
	public String deleteFile(){
		FileInfo fileInfo = fileInfoService.findFileByFid(fid);
		if(fileInfo == null){
			this.addActionError("无该文件");
			return "error";
		}
		String path = fileInfo.getFplace();
		int index = path.indexOf("\\", 5);
		String username = path.substring(5, index);
		System.out.println(username);
		User user = (User) session.get("loginuser");
		if(username.equals(user.getUsername())){
			fileInfoService.deleteFileByFid(fid);
			String location = ServletActionContext.getServletContext().getRealPath("/")+fileInfo.getFplace();
			File file = new File(location);
			System.out.println(location);
			if(!file.exists()){
				System.out.println("不存在");
			}else{
				file.delete();
			}
			return "myInfomation";
		}
		this.addActionError("你无权删除");
		return "error";
	}
	
	public InputStream getDownloadFile() throws FileNotFoundException{
		FileInfo file = fileInfoService.findFileByFid(fid);
		String path = file.getFplace();
		return ServletActionContext.getServletContext().getResourceAsStream(path);
	}
	
	public String getFileName() throws UnsupportedEncodingException{
		FileInfo file = fileInfoService.findFileByFid(fid);
		return new String(file.getFname().getBytes(),"utf-8");
	}
	
	public String downloadFile(){
		return SUCCESS;
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	
}
