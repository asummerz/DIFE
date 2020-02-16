package com.bit.dife03.vo;

import java.util.Date;

public class DroneVo {
	private String dro_no;
	private String dro_name;
	private String dro_series;
	private String dro_series_no;
	private String dro_made;
	private String dro_photo;
	private String dro_info;
	private String dro_content;
	private String dro_conphoto_01;
	private String dro_conphoto_02;
	private int dro_price;
	private String dro_series_md;
	
	private Date bas_rental;
	private Date bas_return;
	
	private String ren_no;
	private String ren_name;
	private String ren_loc;
	private String pos_amount;	
	
	private String first;
	private Date first_time;
	private String last;
	private Date last_time;
	public DroneVo(String dro_no, String dro_name, String dro_series, String dro_series_no, String dro_made,
			String dro_photo, String dro_info, String dro_content, String dro_conphoto_01, String dro_conphoto_02,
			int dro_price, String dro_series_md, Date bas_rental, Date bas_return, String ren_no, String ren_name,
			String ren_loc, String pos_amount, String first, Date first_time, String last, Date last_time) {
		super();
		this.dro_no = dro_no;
		this.dro_name = dro_name;
		this.dro_series = dro_series;
		this.dro_series_no = dro_series_no;
		this.dro_made = dro_made;
		this.dro_photo = dro_photo;
		this.dro_info = dro_info;
		this.dro_content = dro_content;
		this.dro_conphoto_01 = dro_conphoto_01;
		this.dro_conphoto_02 = dro_conphoto_02;
		this.dro_price = dro_price;
		this.dro_series_md = dro_series_md;
		this.bas_rental = bas_rental;
		this.bas_return = bas_return;
		this.ren_no = ren_no;
		this.ren_name = ren_name;
		this.ren_loc = ren_loc;
		this.pos_amount = pos_amount;
		this.first = first;
		this.first_time = first_time;
		this.last = last;
		this.last_time = last_time;
	}
	public DroneVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getDro_no() {
		return dro_no;
	}
	public void setDro_no(String dro_no) {
		this.dro_no = dro_no;
	}
	public String getDro_name() {
		return dro_name;
	}
	public void setDro_name(String dro_name) {
		this.dro_name = dro_name;
	}
	public String getDro_series() {
		return dro_series;
	}
	public void setDro_series(String dro_series) {
		this.dro_series = dro_series;
	}
	public String getDro_series_no() {
		return dro_series_no;
	}
	public void setDro_series_no(String dro_series_no) {
		this.dro_series_no = dro_series_no;
	}
	public String getDro_made() {
		return dro_made;
	}
	public void setDro_made(String dro_made) {
		this.dro_made = dro_made;
	}
	public String getDro_photo() {
		return dro_photo;
	}
	public void setDro_photo(String dro_photo) {
		this.dro_photo = dro_photo;
	}
	public String getDro_info() {
		return dro_info;
	}
	public void setDro_info(String dro_info) {
		this.dro_info = dro_info;
	}
	public String getDro_content() {
		return dro_content;
	}
	public void setDro_content(String dro_content) {
		this.dro_content = dro_content;
	}
	public String getDro_conphoto_01() {
		return dro_conphoto_01;
	}
	public void setDro_conphoto_01(String dro_conphoto_01) {
		this.dro_conphoto_01 = dro_conphoto_01;
	}
	public String getDro_conphoto_02() {
		return dro_conphoto_02;
	}
	public void setDro_conphoto_02(String dro_conphoto_02) {
		this.dro_conphoto_02 = dro_conphoto_02;
	}
	public int getDro_price() {
		return dro_price;
	}
	public void setDro_price(int dro_price) {
		this.dro_price = dro_price;
	}
	public String getDro_series_md() {
		return dro_series_md;
	}
	public void setDro_series_md(String dro_series_md) {
		this.dro_series_md = dro_series_md;
	}
	public Date getBas_rental() {
		return bas_rental;
	}
	public void setBas_rental(Date bas_rental) {
		this.bas_rental = bas_rental;
	}
	public Date getBas_return() {
		return bas_return;
	}
	public void setBas_return(Date bas_return) {
		this.bas_return = bas_return;
	}
	public String getRen_no() {
		return ren_no;
	}
	public void setRen_no(String ren_no) {
		this.ren_no = ren_no;
	}
	public String getRen_name() {
		return ren_name;
	}
	public void setRen_name(String ren_name) {
		this.ren_name = ren_name;
	}
	public String getRen_loc() {
		return ren_loc;
	}
	public void setRen_loc(String ren_loc) {
		this.ren_loc = ren_loc;
	}
	public String getPos_amount() {
		return pos_amount;
	}
	public void setPos_amount(String pos_amount) {
		this.pos_amount = pos_amount;
	}
	public String getFirst() {
		return first;
	}
	public void setFirst(String first) {
		this.first = first;
	}
	public Date getFirst_time() {
		return first_time;
	}
	public void setFirst_time(Date first_time) {
		this.first_time = first_time;
	}
	public String getLast() {
		return last;
	}
	public void setLast(String last) {
		this.last = last;
	}
	public Date getLast_time() {
		return last_time;
	}
	public void setLast_time(Date last_time) {
		this.last_time = last_time;
	}
	
}