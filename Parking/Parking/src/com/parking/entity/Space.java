package com.parking.entity;

public class Space {
   private String id;
   private int  num;
   private int  shiyong;
   private String park_id;
   private String start_time;
   private String end_time;
   private String createdtime;
   private String remark;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public int getshiyong() {
	return shiyong;
}
public void setshiyong(int shiyong) {
	this.shiyong = shiyong;
}
public String getPark_id() {
	return park_id;
}
public void setPark_id(String park_id) {
	this.park_id = park_id;
}
public String getStart_time() {
	return start_time;
}
public void setStart_time(String start_time) {
	this.start_time = start_time;
}
public String getEnd_time() {
	return end_time;
}
public void setEnd_time(String end_time) {
	this.end_time = end_time;
}
public String getCreatedtime() {
	return createdtime;
}
public void setCreatedtime(String createdtime) {
	this.createdtime = createdtime;
}
public String getRemark() {
	return remark;
}
public void setRemark(String remark) {
	this.remark = remark;
}
@Override
public String toString() {
	return "Space [id=" + id + ", num=" + num + ", shiyong=" + shiyong
			+ ", park_id=" + park_id + ", start_time=" + start_time
			+ ", end_time=" + end_time + ", createdtime=" + createdtime
			+ ", remark=" + remark + "]";
}
   
}
