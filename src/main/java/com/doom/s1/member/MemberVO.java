package com.doom.s1.member;

public class MemberVO {
	
	private String id;
	private String pw;
	private String email;
	private String name;
	private String phone;
	private int member_div;
	
	public int getMember_div() {
		return member_div;
	}
	public void setMember_div(int member_div) {
		this.member_div = member_div;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	

}