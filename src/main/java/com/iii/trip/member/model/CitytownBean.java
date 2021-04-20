package com.iii.trip.member.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="citytown")
public class CitytownBean {
	
	@Id
	private Integer a_zipcode_5;
	private String b_state;
	private String c_zipcode_name;
	private Float d_dlongitude;
	private Float e_latitude;
	private Integer f_population1990;
	private Integer g_allocationfactor;
	private String h_country;
	private String i_county;
	private Integer j_torder;
	public Integer getA_zipcode_5() {
		return a_zipcode_5;
	}
	public void setA_zipcode_5(Integer a_zipcode_5) {
		this.a_zipcode_5 = a_zipcode_5;
	}
	public String getB_state() {
		return b_state;
	}
	public void setB_state(String b_state) {
		this.b_state = b_state;
	}
	public String getC_zipcode_name() {
		return c_zipcode_name;
	}
	public void setC_zipcode_name(String c_zipcode_name) {
		this.c_zipcode_name = c_zipcode_name;
	}
	public Float getD_dlongitude() {
		return d_dlongitude;
	}
	public void setD_dlongitude(Float d_dlongitude) {
		this.d_dlongitude = d_dlongitude;
	}
	public Float getE_latitude() {
		return e_latitude;
	}
	public void setE_latitude(Float e_latitude) {
		this.e_latitude = e_latitude;
	}
	public Integer getF_population1990() {
		return f_population1990;
	}
	public void setF_population1990(Integer f_population1990) {
		this.f_population1990 = f_population1990;
	}
	public Integer getG_allocationfactor() {
		return g_allocationfactor;
	}
	public void setG_allocationfactor(Integer g_allocationfactor) {
		this.g_allocationfactor = g_allocationfactor;
	}
	public String getH_country() {
		return h_country;
	}
	public void setH_country(String h_country) {
		this.h_country = h_country;
	}
	public String getI_county() {
		return i_county;
	}
	public void setI_county(String i_county) {
		this.i_county = i_county;
	}
	public Integer getJ_torder() {
		return j_torder;
	}
	public void setJ_torder(Integer j_torder) {
		this.j_torder = j_torder;
	}
	
	

}
