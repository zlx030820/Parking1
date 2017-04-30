package com.parking.entity;

public class Park {
   private String id;
   private String name;
   private float x;
   private float y;
   private int spaceNum;
   private String createdtime;
   private String remark;
   private int leftNum;
 
public int getLeftNum() {
	return leftNum;
}
public void setLeftNum(int leftNum) {
	this.leftNum = leftNum;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public float getX() {
	return x;
}
public void setX(float x) {
	this.x = x;
}
public float getY() {
	return y;
}
public void setY(float y) {
	this.y = y;
}
public int getSpaceNum() {
	return spaceNum;
}
public void setSpaceNum(int spaceNum) {
	this.spaceNum = spaceNum;
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
	return "Park [id=" + id + ", name=" + name + ", x=" + x + ", y=" + y
			+ ", spaceNum=" + spaceNum + ", createdtime=" + createdtime
			+ ", remark=" + remark + ", leftNum=" + leftNum + "]";
}
	
}
