package com.iii.trip.blogs.service.serviceImpl;

import java.util.List;

import com.iii.trip.blogs.model.ArticleBean;

public interface ArticleServiceImpl {
	
	public List<ArticleBean> queryArticle();

	public void saveArticle(ArticleBean ArticleData);

	 Integer deleteArticle(Integer pk);

	public void updateArticle(ArticleBean art);
	
	ArticleBean getArticleBeanByPkey(Integer pk);
	
	public List<ArticleBean> queryArticleOderbytime();
	
	public void updateCount(Integer id);

}
