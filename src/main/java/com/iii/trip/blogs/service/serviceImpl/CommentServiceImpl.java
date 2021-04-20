package com.iii.trip.blogs.service.serviceImpl;

import java.util.List;

import com.iii.trip.blogs.model.ArticleBean;
import com.iii.trip.blogs.model.CommentBean;

public interface CommentServiceImpl {
	//新增
	void insertComment(ArticleBean articleBean);
	//查詢
	List<CommentBean> getAllComment();
	
	//根據PK查單筆留言
	CommentBean getCommentByPk(Integer pk);
	
	//修改
	void updateComment(CommentBean comment);

}
