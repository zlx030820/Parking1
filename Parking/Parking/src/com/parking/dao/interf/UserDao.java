package com.parking.dao.interf;

import java.util.List;
import java.util.Map;

import com.parking.entity.Advice;
import com.parking.entity.User;

public interface UserDao {

	//登陆
	public User CheckUser(String username,String password,String administra);
	//注册
	public int RegisterUser(String username,String  password);
	//列出所有信息
	public List<User> getUsertable();
	public int  delete(String id);
	public int update(User user);
	
	public int  addSuggestion(Advice advice) ;

	
	//	public List<Advice> getAllAdvices(int pageindex);
	public List<Advice> getAllAdvices();
	
	public User adminCheckUser(String username, String password,
			String administra);
	public int registerAdminUser(String username, String password,
			String administra);
	public User userMessage(String id);
	public int userUpdate(String id, String password);
	public int deleteAdvice(String id);
	
//分页
	public List queryForPage(final String sqlString,final int offset,final int length);
	public int getAllRowCount(String sqlString);
	public int accountUpdate(String id, String balance);
	
}
