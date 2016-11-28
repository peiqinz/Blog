package com.peiqin.blog.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.peiqin.blog.dao.ReplyDao;
import com.peiqin.blog.entities.Reply;

@Service
public class ReplyService {
	@Resource(name = "replyDao")
	private ReplyDao replyDao;
	
	public void saveReply(Reply reply){
		reply.setReplyday(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		replyDao.saveReply(reply);
	}

	public List<Reply> findRepliesByPid(Integer pid) {
		return replyDao.findRepliesByPid(pid);
	}
}
