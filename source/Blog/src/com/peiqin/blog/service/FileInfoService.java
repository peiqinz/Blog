package com.peiqin.blog.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.peiqin.blog.dao.FileInfoDao;
import com.peiqin.blog.entities.FileInfo;
import com.peiqin.blog.entities.User;

@Service
public class FileInfoService {
	@Resource(name = "fileInfoDao")
	private FileInfoDao fileInfoDao;
	
	public List<FileInfo> findFilesByUser(User user){
		return fileInfoDao.findFilesByUid(user.getUid());
	}
	
	public FileInfo findFileByFid(Integer fid){
		return fileInfoDao.findFileByFid(fid);
	}

	public void save(FileInfo fileInfo) {
		// TODO Auto-generated method stub
		fileInfoDao.save(fileInfo);
	}

	public void deleteFileByFid(Integer fid) {
		fileInfoDao.delete(fid);
	}
}
