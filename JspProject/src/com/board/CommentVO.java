package com.board;

public class CommentVO {
 private int cnum;
 private String userid;
 private String regdate;
 private String msg;
 private int bnum;
 
public int getBnum() {
	return bnum;
}
public void setBnum(int bnum) {
	this.bnum = bnum;
}
public int getCnum() {
	return cnum;
}
public void setCnum(int cnum) {
	this.cnum = cnum;
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public String getRegdate() {
	return regdate;
}
public void setRegdate(String regdate) {
	this.regdate = regdate;
}
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}
 
}
