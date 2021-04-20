package com.iii.trip.blogs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii.trip.blogs.dao.daoImpl.CommentImpl;
import com.iii.trip.blogs.model.ArticleBean;
import com.iii.trip.blogs.model.CommentBean;
import com.iii.trip.blogs.service.serviceImpl.CommentServiceImpl;

@Service
public class CommentService implements CommentServiceImpl {

	@Autowired
	CommentImpl comdaoImpl;
	

	@Override
	public List<CommentBean> getAllComment() {
		return comdaoImpl.getAllComment();
	}

	@Override
	public void insertComment(ArticleBean articleBean) {
		comdaoImpl.insertComment(articleBean);
	}

	@Override
	public void updateComment(CommentBean upcomment) {
		comdaoImpl.updateComment(upcomment);
		
	}

	@Override
	public CommentBean getCommentByPk(Integer pk) {
		return comdaoImpl.getCommentByPk(pk);
	}

	
}
