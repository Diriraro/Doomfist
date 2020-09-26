package com.doom.s1.qnacheck;

import java.sql.Date;

public class QnaCheckVO {

	private long qc_key;
	private String id;
	private long qc_check;
	private long qna_storekey;
	private String qc_title;
	private Date qc_date;
	
	
	public String getQc_title() {
		return qc_title;
	}
	public void setQc_title(String qc_title) {
		this.qc_title = qc_title;
	}
	public Date getQc_date() {
		return qc_date;
	}
	public void setQc_date(Date qc_date) {
		this.qc_date = qc_date;
	}
	public long getQc_key() {
		return qc_key;
	}
	public void setQc_key(long qc_key) {
		this.qc_key = qc_key;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getQc_check() {
		return qc_check;
	}
	public void setQc_check(long qc_check) {
		this.qc_check = qc_check;
	}
	public long getQna_storekey() {
		return qna_storekey;
	}
	public void setQna_storekey(long qna_storekey) {
		this.qna_storekey = qna_storekey;
	}
	
	
	
}
