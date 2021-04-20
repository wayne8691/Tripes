package com.iii.trip.trainandhotel.repository;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

import com.iii.trip.trainandhotel.utility.Const;

@Entity
@Table(name="city")
@Component
public class City implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column
	@GeneratedValue(generator = "id")
	@GenericGenerator(name = "id",strategy = "com.iii.trip.trainandhotel.utility.IdGenerator")
	private String id;
	
    @Column
	private String name;
    @Column(columnDefinition = "text")
	private String pic;

    
	public JSONObject toJson() {
		JSONObject json = new JSONObject();
		json.put("id", id);
		json.put("name", name);
		return json;
	}
		
	public City() {
		super();
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPic() {
		if (pic != null) {
			try {
				return pic;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return Const.DEFAULT_IMAGE;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	
}
