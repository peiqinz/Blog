package com.peiqin.blog.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.peiqin.blog.entities.FileInfo;
@Component
public class FileInfoDao {

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public List<FileInfo> findFilesByUid(Integer uid){
		String hql = "from FileInfo f where f.user.uid = ?";
		return getSession().createQuery(hql).setInteger(0, uid).list();
	}
	
	public FileInfo findFileByFid(Integer fid){
		return (FileInfo) getSession().get(FileInfo.class, fid);
	}

	public void save(FileInfo fileInfo) {
		getSession().save(fileInfo);
	}

	public void delete(Integer fid) {
		// TODO Auto-generated method stub
		String hql = "delete from FileInfo where fid = ?";
		getSession().createQuery(hql).setInteger(0, fid).executeUpdate();
	}
}
