package com.parking.service.impl;

import java.util.List;
import java.util.Map;

import com.parking.dao.interf.UserDao;
import com.parking.entity.Advice;
import com.parking.entity.PageBean;
import com.parking.entity.User;
import com.parking.service.interf.UserService;



public class UserServiceImpl implements UserService{

	private UserDao userDao;
	private int currentPage;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public User CheckUser(String username,String password,String administra) {
		// TODO Auto-generated method stub
		return userDao.CheckUser(username,password,administra);
	}

	@Override
	public int RegisterUser(String username,String password) {
		// TODO Auto-generated method stub
		return userDao.RegisterUser(username,password);
	}

	@Override
	public List<User> getUsertable() {
		// TODO Auto-generated method stub
		return userDao.getUsertable();
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return userDao.delete(id);
	}

	@Override
	public int addSuggestion(Advice advice) {
		// TODO Auto-generated method stub
		return userDao.addSuggestion(advice);
	}

//	@Override
//	public List<Advice> getAllAdvices(int pageindex) {
//		return userDao.getAllAdvices(pageindex);
//	}

	@Override
	public List<Advice> getAllAdvices() {
		return userDao.getAllAdvices();
	}	
	
	@Override
	public User adminCheckUser(String username, String password,
			String administra) {
		// TODO Auto-generated method stub
		return userDao.adminCheckUser(username,password,administra);
	}

	@Override
	public int registerAdminUser(String username, String password,
			String administra) {
		// TODO Auto-generated method stub
		return userDao.registerAdminUser(username,password,administra);
	}

	@Override
	public User userMessage(String id) {
		// TODO Auto-generated method stub
		return userDao.userMessage(id);
	}

	@Override
	public int userUpdate(String id, String password) {
		// TODO Auto-generated method stub
		return userDao.userUpdate(id,password);
	}


	
	//分页
	@Override
	public PageBean queryForPage(int pageSize, int page) {
		// TODO Auto-generated method stub
		final String sqlString = "select * from advice";
		int allRow = userDao.getAllRowCount(sqlString);
		int totalPage=PageBean.countTotalPage(pageSize,allRow);
		final int offset=PageBean.countOffset(pageSize,page);
		final int length=pageSize;
		final int current=PageBean.countCurrentPage(page);
		List<Advice>list = userDao.queryForPage(sqlString,offset,length);
		
		
		
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		
		pageBean.setCurrentPage(currentPage);
		
		pageBean.setAllRow(allRow);
		pageBean.setList(list);
		pageBean.setTotalPage(totalPage);
		pageBean.init();
		return pageBean;
	}

	@Override
	public int deleteAdvice(String id) {
		// TODO Auto-generated method stub
		return userDao.deleteAdvice(id);
	}

	@Override
	public int accountUpdate(String id, String balance) {
		// TODO Auto-generated method stub
		return userDao.accountUpdate(id,balance);
	}
	
	
}
