package com.parking.entity;

public class User {
	private String  id;
	private String username;
	private String password;
	private String administra;
	private float balance;
	
	
	public float getBalance() {
		return balance;
	}
	public void setBalance(float balance) {
		this.balance = balance;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAdministra() {
		return administra;
	}
	public void setAdministra(String administra) {
		this.administra = administra;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", administra=" + administra + ", balance="
				+ balance + "]";
	}

}
