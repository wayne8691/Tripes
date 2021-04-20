package com.iii.trip.blogs.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii.trip.blogs.dao.daoImpl.CommentImpl;
import com.iii.trip.blogs.model.ArticleBean;
import com.iii.trip.blogs.model.CommentBean;

@Repository
@Transactional
public class CommentDAO implements CommentImpl {
	
	@Autowired
	EntityManager en;
	

	//新增
	@Override
	public void insertComment(ArticleBean articleBean) {
		
		en.merge(articleBean);
	}

	//修改
	@Override
	public void updateComment(CommentBean upComment) {
		//抓取文章內容
		CommentBean updatecomment= null;
		
		updatecomment=en.find(CommentBean.class, upComment.getComment_id());
		updatecomment.setDeputyCommentBeanComment_id(upComment.getDeputyCommentBeanComment_id());
		en.merge(upComment);
		
	}
	
	//查詢
	@SuppressWarnings("unchecked")
	public List<CommentBean> getAllComment() {
		System.out.println("123123412345");
		String hql = "FROM Comment";
		
		List<CommentBean> allCommentbeans = en.createQuery(hql).getResultList();
		return allCommentbeans;
	}

	@Override
	public CommentBean getCommentByPk(Integer pk) {
		return en.find(CommentBean.class, pk);
	}


}
