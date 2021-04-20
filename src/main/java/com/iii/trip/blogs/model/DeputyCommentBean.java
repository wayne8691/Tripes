package com.iii.trip.blogs.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "DeputyComment")
@Component
public class DeputyCommentBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
	
	@Column(name = "userid")
	private String useridString;
	
	@Column(name="replycontent")
	private String replycontent;

	
	@Column(name = "replytime")
	private String replaytime;

	
	public DeputyCommentBean() {
		super();
	}

	public DeputyCommentBean(String useridString, String replycontent, String replaytime) {
		super();
		this.useridString = useridString;
		this.replycontent = replycontent;
		this.replaytime = replaytime;
	}

	public String getUseridString() {
		return useridString;
	}

	public void setUseridString(String useridString) {
		this.useridString = useridString;
	}

	public String getReplycontent() {
		return replycontent;
	}

	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}

	public String getReplaytime() {
		return replaytime;
	}

	public void setReplaytime(String replaytime) {
		this.replaytime = replaytime;
	}

	
	
	
}