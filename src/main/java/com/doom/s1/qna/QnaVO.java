package com.doom.s1.qna;

import java.sql.Date;

public class QnaVO{

	private long qna_storekey;
	private String qna_title;
	private String id;
	private String qna_contents;
	private Date qna_date;
	private String qna_phone;
	private String qna_kind;
	private String qna_tag;
	
	
	public String getQna_tag() {
		return qna_tag;
	}
	public void setQna_tag(String qna_tag) {
		this.qna_tag = qna_tag;
	}
	public long getQna_storekey() {
		return qna_storekey;
	}
	public void setQna_storekey(long qna_storekey) {
		this.qna_storekey = qna_storekey;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQna_contents() {
		return qna_contents;
	}
	public void setQna_contents(String qna_contents) {
		this.qna_contents = qna_contents;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_phone() {
		return qna_phone;
	}
	public void setQna_phone(String qna_phone) {
		this.qna_phone = qna_phone;
	}
	
	public String getQna_kind() {
		return qna_kind;
	}
	public void setQna_kind(String qna_kind) {
		this.qna_kind = qna_kind;
	}
	
	
	
}
