package com.parking.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.parking.entity.Advice;
import com.parking.entity.PageBean;
import com.parking.entity.User;
import com.parking.service.interf.UserService;
import com.parking.utils.Struts2Utils;

public class UserAction {
	
	private Map<String, Object> result=new HashMap<String, Object>();
	
	private int page;
	private PageBean pageBean;
	
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public Map<String, Object> getResult() {
		return result;
	}
	public void setResult(Map<String, Object> result) {
		this.result = result;
	}
	
	
	private UserService userService;
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

//用户注册
	public String register() {
		String username =(String) Struts2Utils.getHttpServletRequest().getParameter("username");
		String password = (String)Struts2Utils.getHttpServletRequest().getParameter("password");
		
		int registerUser = userService.RegisterUser(username,password);
		if (registerUser==0) {
			result.put("flag", 0);
		}else {
			result.put("flag", 1);
		}
		return "JSONRESULT";
	}


	//管理员注册
	public String adminregister() {
		String username =(String) Struts2Utils.getHttpServletRequest().getParameter("username");
		String password = (String)Struts2Utils.getHttpServletRequest().getParameter("password");
		String administra = "1";
		int registerUser = userService.registerAdminUser(username,password,administra);
		if (registerUser==0) {
			result.put("flag", 0);
		}else {
			result.put("flag", 1);
		}
		return "JSONRESULT";
	}

	
	//添加评论
	public String addAdvice(){
		String message =(String) Struts2Utils.getHttpServletRequest().getParameter("message");
		User currentUser=(User) Struts2Utils.getSession().get("user");	
        Advice advice=new Advice();
        advice.setUsername(currentUser.getUsername());
        advice.setMessage(message);
        advice.setUser_id(currentUser.getId());   
        int addSuggestion = userService.addSuggestion(advice);
        if (addSuggestion==0) {
			result.put("flag", 0);
		}else {
			result.put("flag", 1);
		}
		return "JSONRESULT";
	}
	
//	public String getAdvice(){
//		String pageindex = Struts2Utils.getHttpServletRequest().getParameter("pageindex");
//        List<Advice> allAdvices = userService.getAllAdvices(Integer.valueOf(pageindex));
//        result.put("flag", allAdvices);
//		return "JSONRESULT";
//	}
	
	
	//获取评论
	public String getAdvice(){
        List<Advice> allAdvices = userService.getAllAdvices();
        Struts2Utils.getSession().put("allAdvices",allAdvices);
		return "allAdvices";
	}
	
	//获取评论
	public String findAllAdvice(){
	     List<Advice> allAdvices = userService.getAllAdvices();
	     Struts2Utils.getSession().put("allAdvices",allAdvices);
		 return "findAllAdvice";
	}
	
//删除评论
	 public String adviceDelete(){
		 String id = (String)Struts2Utils.getHttpServletRequest().getParameter("id");
		 int adviceDelete = userService.deleteAdvice(id);
		 if (adviceDelete==0) {
				result.put("flag", 0);
			}else {
				result.put("flag", 1);
			}
		 return "JSONRESULT";
		 }
	
	
	//用户登录
	public String login() {
		String username =(String) Struts2Utils.getHttpServletRequest().getParameter("username");
		String password = (String)Struts2Utils.getHttpServletRequest().getParameter("password");
		String administra = "0";
		User checkUser = userService.CheckUser(username,password,administra);
		if(checkUser!= null){
			//登录成功，将返回的logininfo，存入userSession，便于分发的其他网页使用
			Struts2Utils.getSession().put("user", checkUser);	
			result.put("flag", true);	//这个网页使用
		}
		else{
			String error="您输入的密码错误！";
			result.put("flag", false);
			result.put("error", error);
		}
		return "JSONRESULT";
	}
	
	
	
	
	
	public String adminlogin() {
		String username =(String) Struts2Utils.getHttpServletRequest().getParameter("username");
		String password = (String)Struts2Utils.getHttpServletRequest().getParameter("password");
		String administra = "1";
		com.parking.entity.User admincheckUser = userService.adminCheckUser(username,password,administra);
		if(admincheckUser!= null){
			//登录成功，将返回的logininfo，存入userSession，便于分发的其他网页使用
			Struts2Utils.getSession().put("user", admincheckUser);	
			result.put("flag", true);	//这个网页使用
		}
		else{
			String error="您输入的密码错误！";
			result.put("flag", false);
			result.put("error", error);
		}
		return "JSONRESULT";
	}
	
	public String loginOut(){
		Struts2Utils.getSession().remove("user");
		return "loginOut";
	}


	
//显示全部用户列表
	public String userList(){
			List<User> userList = userService.getUsertable();
			Struts2Utils.set2Request("userList", userList);
			return "userList";
	}
	
	
//费用列表
	public String userList1(){
		List<User> userList = userService.getUsertable();
		Struts2Utils.set2Request("userList", userList);
		return "userList1";
}
//显示个人用户信息
	public String userMessage(){
		String id = Struts2Utils.getHttpServletRequest().getParameter("id");
		User userMessage = userService.userMessage(id);
		Struts2Utils.getSession().put("userMessage", userMessage);
		return "userMessage";
}
	
//用户信息修改更新
	public String updateUser(){
		String id = Struts2Utils.getHttpServletRequest().getParameter("id");
		String password = (String)Struts2Utils.getHttpServletRequest().getParameter("userPw1");
		int userUpdate = userService.userUpdate(id,password);
		return "userUpdate";
	}
	//用户消费完以后自动修改余额
	public String updateaccount(){
		String id = Struts2Utils.getHttpServletRequest().getParameter("id");
		String balance = (String)Struts2Utils.getHttpServletRequest().getParameter("balance");
		int accountUpdate = userService.accountUpdate(id,balance);
		return "accountUpdate";
		
	}
	
	//管理员直接改变用户余额
	public String Updatefeiyong(){
		String id = Struts2Utils.getHttpServletRequest().getParameter("id");
		String balance = (String)Struts2Utils.getHttpServletRequest().getParameter("balance");
		int accountUpdate = userService.accountUpdate(id,balance);
		return "Updatefeiyong";
		
	}	
	
	
	
	//删除用户
	public String delete(){
		String id = Struts2Utils.getHttpServletRequest().getParameter("id");
		int delete = userService.delete(id);
		if (delete==0) {
			result.put("flag", false);
		}else {
			result.put("flag", true);
	    }
	    return "JSONRESULT";
	}
	
	public String listAdvice(){
		pageBean=userService.queryForPage(10, page);
		return "listAdvice";
	}
	// 调整更新页面操作
		private String id ;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String Update() {
			id = Struts2Utils.getHttpServletRequest().getParameter("id");
	 	    return "UPDATE";
		}
	
}
