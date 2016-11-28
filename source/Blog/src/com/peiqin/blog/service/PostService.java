package com.peiqin.blog.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.aspectj.ajdt.internal.compiler.ast.PseudoToken;
import org.springframework.stereotype.Service;

import com.peiqin.blog.dao.PostDao;
import com.peiqin.blog.entities.Post;
import com.peiqin.blog.util.PageBean;

@Service
public class PostService {

	@Resource(name = "postDao")
	private PostDao postDao;

	public void save(Post post) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		post.setPostDay(sdf.format(new Date()));
		postDao.save(post);
	}

	public PageBean<Post> findAll(Integer page) {
		PageBean<Post> pageBean = new PageBean<>();
		if(page == null){
			page = 1;
		}
		Integer limit = 8;
		pageBean.setLimit(limit);
		pageBean.setPage(page);
		Integer totalCount = postDao.findCount();
		pageBean.setTotalCount(totalCount);
		Integer begin = (page - 1) * limit;
		List<Post> list = postDao.findPostByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

	public Post findActicleByPid(Integer pid) {
		Post post = postDao.findActicleByPid(pid);
		if(post != null){
			Integer view = post.getView();
			if(view == null){
				view = 0;
			}
			post.setView(view+1);
			return post;
		}
		return null;
	}

	public List<Post> findHot() {
		return postDao.findHot();
	}

	public PageBean<Post> findAllByCid(Integer cid, Integer page) {
		PageBean<Post> posts = new PageBean<>();
		posts.setLimit(10);
		Integer begin = (page -1) * 10;
		List<Post> list = postDao.findPostByPageAndCid(cid,begin,10);
		posts.setList(list);
		posts.setPage(page);
		Integer totalCount = postDao.findCountByCid(cid);
		posts.setTotalCount(totalCount);
		return posts;
	}
}
