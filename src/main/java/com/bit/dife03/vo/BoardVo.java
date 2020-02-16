package com.bit.dife03.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVo {
	private int boa_no;
	private String mem_no;
	private String boa_title;
	private String boa_contents;
	private String boa_pwd;
	private int boa_rating;
	private Date boa_regdate;
	private String regdate;
	private int boa_view;
	private String boa_answer;
	private String boa_sort;
	private String boa_category;
	private String boa_fname;
	private int boa_ref;
	private int boa_level;
	private int boa_step;
	private String first;
	private Date first_time;
	private String last;
	private Date last_time;
	private MultipartFile upload;
	private String mem_name;
	
	public BoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardVo(int boa_no, String mem_no, String boa_title, String boa_contents, String boa_pwd, int boa_rating,
			Date boa_regdate, String regdate, int boa_view, String boa_answer, String boa_sort, String boa_category,
			String boa_fname, int boa_ref, int boa_level, int boa_step, String first, Date first_time, String last,
			Date last_time, MultipartFile upload, String mem_name) {
		super();
		this.boa_no = boa_no;
		this.mem_no = mem_no;
		this.boa_title = boa_title;
		this.boa_contents = boa_contents;
		this.boa_pwd = boa_pwd;
		this.boa_rating = boa_rating;
		this.boa_regdate = boa_regdate;
		this.regdate = regdate;
		this.boa_view = boa_view;
		this.boa_answer = boa_answer;
		this.boa_sort = boa_sort;
		this.boa_category = boa_category;
		this.boa_fname = boa_fname;
		this.boa_ref = boa_ref;
		this.boa_level = boa_level;
		this.boa_step = boa_step;
		this.first = first;
		this.first_time = first_time;
		this.last = last;
		this.last_time = last_time;
		this.upload = upload;
		this.mem_name = mem_name;
	}

	public int getBoa_no() {
		return boa_no;
	}

	public void setBoa_no(int boa_no) {
		this.boa_no = boa_no;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public String getBoa_title() {
		return boa_title;
	}

	public void setBoa_title(String boa_title) {
		this.boa_title = boa_title;
	}

	public String getBoa_contents() {
		return boa_contents;
	}

	public void setBoa_contents(String boa_contents) {
		this.boa_contents = boa_contents;
	}

	public String getBoa_pwd() {
		return boa_pwd;
	}

	public void setBoa_pwd(String boa_pwd) {
		this.boa_pwd = boa_pwd;
	}

	public int getBoa_rating() {
		return boa_rating;
	}

	public void setBoa_rating(int boa_rating) {
		this.boa_rating = boa_rating;
	}

	public Date getBoa_regdate() {
		return boa_regdate;
	}

	public void setBoa_regdate(Date boa_regdate) {
		this.boa_regdate = boa_regdate;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getBoa_view() {
		return boa_view;
	}

	public void setBoa_view(int boa_view) {
		this.boa_view = boa_view;
	}

	public String getBoa_answer() {
		return boa_answer;
	}

	public void setBoa_answer(String boa_answer) {
		this.boa_answer = boa_answer;
	}

	public String getBoa_sort() {
		return boa_sort;
	}

	public void setBoa_sort(String boa_sort) {
		this.boa_sort = boa_sort;
	}

	public String getBoa_category() {
		return boa_category;
	}

	public void setBoa_category(String boa_category) {
		this.boa_category = boa_category;
	}

	public String getBoa_fname() {
		return boa_fname;
	}

	public void setBoa_fname(String boa_fname) {
		this.boa_fname = boa_fname;
	}

	public int getBoa_ref() {
		return boa_ref;
	}

	public void setBoa_ref(int boa_ref) {
		this.boa_ref = boa_ref;
	}

	public int getBoa_level() {
		return boa_level;
	}

	public void setBoa_level(int boa_level) {
		this.boa_level = boa_level;
	}

	public int getBoa_step() {
		return boa_step;
	}

	public void setBoa_step(int boa_step) {
		this.boa_step = boa_step;
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

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	@Override
	public String toString() {
		return "BoardVo [boa_no=" + boa_no + ", mem_no=" + mem_no + ", boa_title=" + boa_title + ", boa_contents="
				+ boa_contents + ", boa_pwd=" + boa_pwd + ", boa_rating=" + boa_rating + ", boa_regdate=" + boa_regdate
				+ ", regdate=" + regdate + ", boa_view=" + boa_view + ", boa_answer=" + boa_answer + ", boa_sort="
				+ boa_sort + ", boa_category=" + boa_category + ", boa_fname=" + boa_fname + ", boa_ref=" + boa_ref
				+ ", boa_level=" + boa_level + ", boa_step=" + boa_step + ", first=" + first + ", first_time="
				+ first_time + ", last=" + last + ", last_time=" + last_time + ", upload=" + upload + ", mem_name="
				+ mem_name + "]";
	}
	
	
}
