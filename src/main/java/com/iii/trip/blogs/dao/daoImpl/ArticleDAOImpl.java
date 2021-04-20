package com.iii.trip.blogs.dao.daoImpl;

import java.util.List;

import com.iii.trip.blogs.model.ArticleBean;

public interface ArticleDAOImpl {
	
	//搜尋所有文章
	public List<ArticleBean> queryArticle();
	
	//新增文章
	public void saveArticle(ArticleBean ArticleData);
	
	//刪除文章
	public Integer deleteArticle(Integer pk);
	
	//更新文章
	public void updateArticle(ArticleBean art);
	
	//搜尋單筆文章
	ArticleBean getArticleBeanByPkey(Integer pk);
	
	//搜尋所有文章按時間排序
	public List<ArticleBean> queryArticleOderbytime();
	
	//搜尋分類
	ArticleBean getArticleBeanByArtsubversion(Integer pk);
	
}
