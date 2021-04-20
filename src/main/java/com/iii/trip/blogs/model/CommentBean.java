package com.iii.trip.blogs.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;



@Entity
@Table(name = "Comment")
@Component
public class CommentBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer comment_id;
	
	@Column(name = "userid")
	private String useridString;
	
	@Column(name = "comment")
	private String comment;
	
	//DeputyComment的FK
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_deputyComment_id", referencedColumnName = "comment_id")
	private List<DeputyCommentBean> DeputyCommentBeanComment_id=new ArrayList<DeputyCommentBean>();

	@Column(name = "guestTime")
	private String guesttime;
	

	public CommentBean() {
		super();
	}


	public CommentBean( String comment, String guesttime,String useridString) {
		super();
		this.useridString = useridString;
		this.comment = comment;
		this.guesttime = guesttime;
	}

	
	public Integer getComment_id() {
		return comment_id;
	}

	public void setComment_id(Integer comment_id) {
		this.comment_id = comment_id;
	}

	public String getUseridString() {
		return useridString;
	}

	public void setUseridString(String useridString) {
		this.useridString = useridString;
	}

	public List<DeputyCommentBean> getDeputyCommentBeanComment_id() {
		return DeputyCommentBeanComment_id;
	}

	public void setDeputyCommentBeanComment_id(List<DeputyCommentBean> deputyCommentBeanComment_id) {
		DeputyCommentBeanComment_id = deputyCommentBeanComment_id;
	}

	public String getGuesttime() {
		return guesttime;
	}

	public void setGuesttime(String guesttime) {
		this.guesttime = guesttime;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	

}
