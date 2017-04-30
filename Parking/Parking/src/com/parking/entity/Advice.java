package com.parking.entity;

public class Advice {
	
	private String id;
	private String message;
	private String createdtime;
	private String user_id;
	private String username;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getCreatedtime() {
		return createdtime;
	}
	public void setCreatedtime(String createdtime) {
		this.createdtime = createdtime;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "Advice [id=" + id + ", message=" + message + ", createdtime="
				+ createdtime + ", user_id=" + user_id + ", username="
				+ username + "]";
	}
	
}
