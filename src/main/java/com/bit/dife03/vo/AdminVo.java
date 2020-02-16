package com.bit.dife03.vo;

import java.util.Date;

public class AdminVo {
	private String mem_no;
	private int mem_lev;
	private String mem_id;
	private String mem_pwd;
	private String mem_pwd_check;
	private String mem_name;
	private Date mem_birth;
	private String mem_gender;
	private String mem_tel;
	private String mem_email;
	private String mem_fname;
	private String first;
	private Date first_time;
	private String last;
	private Date last_time;
	private int mem_point;
	
	public AdminVo(String mem_no, int mem_lev, String mem_id, String mem_pwd, String mem_pwd_check, String mem_name,
			Date mem_birth, String mem_gender, String mem_tel, String mem_email, String mem_fname, String first,
			Date first_time, String last, Date last_time, int mem_point) {
		super();
		this.mem_no = mem_no;
		this.mem_lev = mem_lev;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_pwd_check = mem_pwd_check;
		this.mem_name = mem_name;
		this.mem_birth = mem_birth;
		this.mem_gender = mem_gender;
		this.mem_tel = mem_tel;
		this.mem_email = mem_email;
		this.mem_fname = mem_fname;
		this.first = first;
		this.first_time = first_time;
		this.last = last;
		this.last_time = last_time;
		this.mem_point = mem_point;
	}
	public AdminVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public int getMem_lev() {
		return mem_lev;
	}
	public void setMem_lev(int mem_lev) {
		this.mem_lev = mem_lev;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_pwd_check() {
		return mem_pwd_check;
	}
	public void setMem_pwd_check(String mem_pwd_check) {
		this.mem_pwd_check = mem_pwd_check;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public Date getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(Date mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_fname() {
		return mem_fname;
	}
	public void setMem_fname(String mem_fname) {
		this.mem_fname = mem_fname;
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
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}
	
	
}
