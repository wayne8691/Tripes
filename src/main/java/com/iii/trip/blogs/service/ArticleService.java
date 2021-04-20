package com.iii.trip.blogs.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii.trip.blogs.dao.daoImpl.ArticleDAOImpl;
import com.iii.trip.blogs.dao.daoImpl.ArticleRepository;
import com.iii.trip.blogs.model.ArticleBean;
import com.iii.trip.blogs.service.serviceImpl.ArticleServiceImpl;

@Service
public class ArticleService implements ArticleServiceImpl {

	@Autowired
	ArticleDAOImpl daoImpl;
	@Autowired
	private ArticleRepository articleRepository;

	
	@Override
	public List<ArticleBean> queryArticle() {
		return daoImpl.queryArticle();
	}

	@Override
	public void saveArticle(ArticleBean ArticleData) {
		 daoImpl.saveArticle(ArticleData);

	}
	@Override
	public Integer deleteArticle(Integer pk) {
		return daoImpl.deleteArticle(pk);

	}

	@Override
	public void updateArticle(ArticleBean art) {
		 daoImpl.updateArticle(art);

	}
	

	@Override
	public ArticleBean getArticleBeanByPkey(Integer pk) {
		return daoImpl.getArticleBeanByPkey(pk);
	}

	@Override
	public List<ArticleBean> queryArticleOderbytime() {
		return daoImpl.queryArticleOderbytime();
	}

	@Override
	public void updateCount(Integer id) {
		Optional<ArticleBean> findById = articleRepository.findById(id);
		
		ArticleBean articleBean = findById.get();
		
		Integer count = articleBean.getArtclickcount();
		count++;
		articleBean.setArtclickcount(count);
	}

}
