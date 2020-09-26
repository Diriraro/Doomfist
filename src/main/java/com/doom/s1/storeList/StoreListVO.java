package com.doom.s1.storeList;

import java.sql.Date;

public class StoreListVO {
	
	private String st_phone;
	private String st_name;
	private long st_key;
	private String st_address;
	private String id;
	private String st_kind;
	private String st_tag;
	
	
	public String getSt_phone() {
		return st_phone;
	}
	public void setSt_phone(String st_phone) {
		this.st_phone = st_phone;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public long getSt_key() {
		return st_key;
	}
	public void setSt_key(long st_key) {
		this.st_key = st_key;
	}
	public String getSt_address() {
		return st_address;
	}
	public void setSt_address(String st_address) {
		this.st_address = st_address;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getSt_kind() {
		return st_kind;
	}
	public void setSt_kind(String st_kind) {
		this.st_kind = st_kind;
	}
	public String getSt_tag() {
		return st_tag;
	}
	public void setSt_tag(String st_tag) {
		this.st_tag = st_tag;
	}
	
	//==================================================================
	
	
	private long re_num;
	private Date re_date;
	private String re_contents;
//	private String id;
//	private long st_key;
	private long re_rating;
	
	
	public long getRe_num() {
		return re_num;
	}
	public void setRe_num(long re_num) {
		this.re_num = re_num;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public String getRe_contents() {
		return re_contents;
	}
	public void setRe_contents(String re_contents) {
		this.re_contents = re_contents;
	}
//	public String getId() {
//		return id;
//	}
//	public void setId(String id) {
//		this.id = id;
//	}
//	public long getSt_key() {
//		return st_key;
//	}
//	public void setSt_key(long st_key) {
//		this.st_key = st_key;
//	}
//	
	public long getRe_rating() {
		return re_rating;
	}
	public void setRe_rating(long re_rating) {
		this.re_rating = re_rating;
	}
	

}
