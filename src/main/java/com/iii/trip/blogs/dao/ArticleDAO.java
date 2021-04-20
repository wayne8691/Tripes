package com.iii.trip.blogs.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii.trip.blogs.dao.daoImpl.ArticleDAOImpl;
import com.iii.trip.blogs.model.ArticleBean;

@Repository
@Transactional
public class ArticleDAO implements ArticleDAOImpl {
	
	@Autowired
	EntityManager en;
	

	//查所有
	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> queryArticle() {
		String hql = "FROM ArticleBean ";
		
		List<ArticleBean> allArtclebeans = en.createQuery(hql).getResultList();
//		allArtclebeans.get(0).getCommentBeanArticle_id().size();
		return allArtclebeans;
	}
	
	//查所有按照時間排序
	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleBean> queryArticleOderbytime() {
		String hql = " FROM ArticleBean ORDER BY publishtime DESC";
		
		List<ArticleBean> allArtclebeans = en.createQuery(hql).getResultList();
//		allArtclebeans.get(0).getCommentBeanArticle_id().size();
		return allArtclebeans;
	}

	//新增
	@Override
	public void saveArticle(ArticleBean ArticleData) {
		
		en.merge(ArticleData);
		
	}

	//刪除
	@Override
	public Integer deleteArticle(Integer pk) {
		
		ArticleBean artben = en.find(ArticleBean.class, pk);
		if (artben == null) {
			return -1;
		}
		
		en.remove(artben);
		return 1;
	}

	//更新
	@Override
	public void updateArticle(ArticleBean art) {
		ArticleBean articlebean = null;
		
		articlebean = en.find(ArticleBean.class, art.getArticleid_pk());
		articlebean.setTitle(art.getTitle());
		articlebean.setContenet(art.getContenet());
		en.merge(art);

	}

	//搜尋單筆文章
	@Override
	public ArticleBean getArticleBeanByPkey(Integer pk) {
		System.out.println("11111");
		
		return en.find(ArticleBean.class, pk);
	}
	//搜尋分類
	@Override
	public ArticleBean getArticleBeanByArtsubversion(Integer pk) {
		return null;
	}
	
	
	

}
