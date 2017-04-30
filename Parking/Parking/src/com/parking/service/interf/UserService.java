package com.parking.service.interf;

import java.util.List;
import java.util.Map;

import com.parking.entity.Advice;
import com.parking.entity.PageBean;
import com.parking.entity.User;



public interface UserService {
	public User CheckUser(String username,String password,String administra);
	public int RegisterUser(String username,String password);
	public List<User> getUsertable();
	public int  delete(String id);
	public int  addSuggestion(Advice advice) ;
	
	public List<Advice> getAllAdvices();
//	public List<Advice> getAllAdvices(int pageindex);
	
	
	public User adminCheckUser(String username, String password,
			String administra);
	public int registerAdminUser(String username, String password,
			String administra);
	public User userMessage(String id);
	public int userUpdate(String id, String password);
	
	public int deleteAdvice(String id);
	
	//分页
	public PageBean queryForPage(int pageSize,int currentPage);
	public int accountUpdate(String id, String balance);

}
