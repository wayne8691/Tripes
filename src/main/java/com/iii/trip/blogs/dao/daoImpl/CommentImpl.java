package com.iii.trip.blogs.dao.daoImpl;

import java.util.List;

import com.iii.trip.blogs.model.ArticleBean;
import com.iii.trip.blogs.model.CommentBean;

public interface CommentImpl {
	//新增留言
	public void insertComment (ArticleBean articleBean);
	
	//修改留言
	public void updateComment(CommentBean upComment);
	
	//查詢留言
	public List<CommentBean> getAllComment();

	CommentBean getCommentByPk(Integer pk);

}
