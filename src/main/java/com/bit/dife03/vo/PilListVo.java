package com.bit.dife03.vo;

import java.util.Date;

public class PilListVo {
	private int list_no;
	private String pil_no;
	private String mem_name;
	private String pil_title;
	private int pil_cateInfo;
	private String pil_photo;
	private String pil_locInfo;
	private String pil_info;
	private int pil_star;
	
	private String pil_ok;
	private String pil_portfolio;
	private String pil_profile;
	private int pil_career;
	private String pil_drone;
	private String pil_qualification;
	private String pil_contact;
	private String pil_intro;
	private String first;
	private Date first_time;
	private String last;
	private Date last_time;
	
	public PilListVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public PilListVo(int list_no, String pil_no, String mem_name, String pil_title, int pil_cateInfo, String pil_photo,
			String pil_locInfo, String pil_info, int pil_star, String pil_ok, String pil_portfolio, String pil_profile,
			int pil_career, String pil_drone, String pil_qualification, String pil_contact, String pil_intro,
			String first, Date first_time, String last, Date last_time) {
		super();
		this.list_no = list_no;
		this.pil_no = pil_no;
		this.mem_name = mem_name;
		this.pil_title = pil_title;
		this.pil_cateInfo = pil_cateInfo;
		this.pil_photo = pil_photo;
		this.pil_locInfo = pil_locInfo;
		this.pil_info = pil_info;
		this.pil_star = pil_star;
		this.pil_ok = pil_ok;
		this.pil_portfolio = pil_portfolio;
		this.pil_profile = pil_profile;
		this.pil_career = pil_career;
		this.pil_drone = pil_drone;
		this.pil_qualification = pil_qualification;
		this.pil_contact = pil_contact;
		this.pil_intro = pil_intro;
		this.first = first;
		this.first_time = first_time;
		this.last = last;
		this.last_time = last_time;
	}


	public int getList_no() {
		return list_no;
	}
	public void setList_no(int list_no) {
		this.list_no = list_no;
	}
	public String getPil_no() {
		return pil_no;
	}
	public void setPil_no(String pil_no) {
		this.pil_no = pil_no;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getPil_title() {
		return pil_title;
	}
	public void setPil_title(String pil_title) {
		this.pil_title = pil_title;
	}
	public int getPil_cateInfo() {
		return pil_cateInfo;
	}
	public void setPil_cateInfo(int pil_cateInfo) {
		this.pil_cateInfo = pil_cateInfo;
	}
	public String getPil_photo() {
		return pil_photo;
	}
	public void setPil_photo(String pil_photo) {
		this.pil_photo = pil_photo;
	}
	public String getPil_locInfo() {
		return pil_locInfo;
	}
	public void setPil_locInfo(String pil_locInfo) {
		this.pil_locInfo = pil_locInfo;
	}
	public String getPil_info() {
		return pil_info;
	}
	public void setPil_info(String pil_info) {
		this.pil_info = pil_info;
	}
	public int getPil_star() {
		return pil_star;
	}
	public void setPil_star(int pil_star) {
		this.pil_star = pil_star;
	}
	
	public String getPil_ok() {
		return pil_ok;
	}


	public void setPil_ok(String pil_ok) {
		this.pil_ok = pil_ok;
	}


	public String getPil_portfolio() {
		return pil_portfolio;
	}


	public void setPil_portfolio(String pil_portfolio) {
		this.pil_portfolio = pil_portfolio;
	}


	public String getPil_profile() {
		return pil_profile;
	}


	public void setPil_profile(String pil_profile) {
		this.pil_profile = pil_profile;
	}


	public int getPil_career() {
		return pil_career;
	}


	public void setPil_career(int pil_career) {
		this.pil_career = pil_career;
	}


	public String getPil_drone() {
		return pil_drone;
	}


	public void setPil_drone(String pil_drone) {
		this.pil_drone = pil_drone;
	}


	public String getPil_qualification() {
		return pil_qualification;
	}


	public void setPil_qualification(String pil_qualification) {
		this.pil_qualification = pil_qualification;
	}


	public String getPil_contact() {
		return pil_contact;
	}


	public void setPil_contact(String pil_contact) {
		this.pil_contact = pil_contact;
	}


	public String getPil_intro() {
		return pil_intro;
	}


	public void setPil_intro(String pil_intro) {
		this.pil_intro = pil_intro;
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


	@Override
	public String toString() {
		return "PilInfoVo [list_no=" + list_no + ", pil_no=" + pil_no + ", mem_name=" + mem_name + ", pil_title="
				+ pil_title + ", pil_cateInfo=" + pil_cateInfo + ", pil_photo=" + pil_photo + ", pil_locInfo="
				+ pil_locInfo + ", pil_info=" + pil_info + ", pil_star=" + pil_star + "]";
	}
}
