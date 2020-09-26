package com.doom.s1.payFirst;

import java.sql.Date;

public class PayFirstVO {
	
	private long pf_key;
	private String id;
	private Date pf_date;
	private long pf_check;
	private long st_key;
	private String pf_stname;
	
	public long getPf_key() {
		return pf_key;
	}
	public void setPf_key(long pf_key) {
		this.pf_key = pf_key;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getPf_date() {
		return pf_date;
	}
	public void setPf_date(Date pf_date) {
		this.pf_date = pf_date;
	}
	public long getPf_check() {
		return pf_check;
	}
	public void setPf_check(long pf_check) {
		this.pf_check = pf_check;
	}
	public long getSt_key() {
		return st_key;
	}
	public void setSt_key(long st_key) {
		this.st_key = st_key;
	}
	public String getPf_stname() {
		return pf_stname;
	}
	public void setPf_stname(String pf_stname) {
		this.pf_stname = pf_stname;
	}
	
	
	

}
