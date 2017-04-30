package com.parking.dao.impl;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;
import org.hibernate.type.FloatType;
import org.hibernate.type.StringType;

import com.parking.dao.interf.UserDao;
import com.parking.entity.Advice;
import com.parking.entity.User;

public class UserDaoImpl implements UserDao {
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public User CheckUser(String username,String password,String administra) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		List<User> list=null;
		//String sqlString ="select*from user where username= '"+username+"' and password= '"+password+"' ";
		String sqlString="select * from user where username = '"+username+"' and password = '"+password+"' and administra = '0' ";
		try {
			Query query=session.createSQLQuery(sqlString).addScalar("id", StringType.INSTANCE)
					.addScalar("username", StringType.INSTANCE)
					.addScalar("password", StringType.INSTANCE)
					.addScalar("administra", StringType.INSTANCE)
					.addScalar("balance",FloatType.INSTANCE);
			query.setResultTransformer(Transformers.aliasToBean(User.class));
			list= query.list();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		if (list.size()==0) {
			return null;
		}
		return list.get(0);
	}
	
	
	public boolean  FindUserByUserName(String username) {
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		List<User> list=null;
		String sqlString="select * from user where username = '"+username+"'";
		try {
			Query query=session.createSQLQuery(sqlString).addScalar("id", StringType.INSTANCE)
					.addScalar("username", StringType.INSTANCE)
					.addScalar("password", StringType.INSTANCE);
			query.setResultTransformer(Transformers.aliasToBean(User.class));
			list= query.list();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		return list.size()==0;
		
	}
	

	@Override
	public int RegisterUser(String username, String password) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		boolean findUserByUserName = FindUserByUserName(username);
		if (!findUserByUserName) {
			return 0;//注册失败
		}
		int executeUpdate = 0;
		String sqlString="insert into user  values ('"+UUID.randomUUID().toString()+"','"+username+"','"+password+"','"+0+"','"+100+"')";
		try {
			Query query=session.createSQLQuery(sqlString);
			executeUpdate = query.executeUpdate();
			System.out.println("executeUpdate："+executeUpdate);
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		return executeUpdate;
	}
	
	

	@Override
	public List<User> getUsertable() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		List<User> list=null;
		String sqlString="select * from user";
		try {
			Query query=session.createSQLQuery(sqlString).addScalar("id", StringType.INSTANCE)
					.addScalar("username", StringType.INSTANCE)
					.addScalar("password", StringType.INSTANCE)
					.addScalar("administra", StringType.INSTANCE)
					.addScalar("balance", FloatType.INSTANCE);
			query.setResultTransformer(Transformers.aliasToBean(User.class));
			list= query.list();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		return list;
		
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		int executeUpdate = 0;
		String sqlString="delete from user where  id = '"+id+"'";
		try {
			Query query=session.createSQLQuery(sqlString);
			executeUpdate = query.executeUpdate();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		return executeUpdate ;
		
	}

	@Override
	public int update(User user) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		int executeUpdate = 0;
		String sqlString="update user set username = '"+user.getUsername()+"' and password = '"+user.getPassword()+"' where id = '"+user.getId()+"' ";
		try {
			Query query=session.createSQLQuery(sqlString);
			executeUpdate = query.executeUpdate();
			System.out.println("executeUpdate："+executeUpdate);
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		return executeUpdate;

	}
	@Override
	public int addSuggestion(Advice advice) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		int executeUpdate = 0;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		String nowDate=sdf.format(new java.util.Date()); 
		String SpaceId=UUID.randomUUID().toString();
		String sqlString="insert into advice  values ('"+SpaceId+"','"+advice.getMessage()+"','"+nowDate+"','"+advice.getUser_id()+"','"+advice.getUsername()+"')";
		try {
			Query query=session.createSQLQuery(sqlString);
			executeUpdate = query.executeUpdate();
			System.out.println("executeUpdate："+executeUpdate);
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		return executeUpdate;

	}
	@Override
	public List<Advice> getAllAdvices() {
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		List<Advice> list=null;
		String sqlString="select * from advice order by createdtime DESC";
		try {
			Query query=session.createSQLQuery(sqlString).addScalar("id", StringType.INSTANCE)
					.addScalar("message",StringType.INSTANCE)
					.addScalar("user_id", StringType.INSTANCE)
					.addScalar("username", StringType.INSTANCE)
					.addScalar("createdtime", StringType.INSTANCE)
					;
			query.setResultTransformer(Transformers.aliasToBean(Advice.class));
			list= query.list();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		return list;
	}

//	@Override
//	public List<Advice> getAllAdvices(int pageindex) {
//		Session session=sessionFactory.openSession();
//		Transaction tr = session.beginTransaction();
//		List<Advice> list=null;
//		String sqlString="select * from advice";
//		try {
//			Query query=session.createSQLQuery(sqlString).addScalar("id", StringType.INSTANCE)
//					.addScalar("message",StringType.INSTANCE)
//					.addScalar("user_id", StringType.INSTANCE)
//					.addScalar("username", StringType.INSTANCE)
//					.addScalar("createdtime", StringType.INSTANCE)
//					;
//			//分页
//			query.setResultTransformer(Transformers.aliasToBean(Advice.class));
//			query.setFirstResult(pageindex*10);
//			query.setMaxResults(10);
//			list= query.list();
//		} catch (HibernateException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally{
//			tr.commit();
//		    session.close();
//		}
//		return list;
//	}
	@Override
	public User adminCheckUser(String username, String password,
			String administra) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		List<User> list=null;
		//String sqlString ="select*from user where username= '"+username+"' and password= '"+password+"' ";
		String sqlString="select * from user where username = '"+username+"' and password = '"+password+"' and administra = '1' ";
		try {
			Query query=session.createSQLQuery(sqlString).addScalar("id", StringType.INSTANCE)
					.addScalar("username", StringType.INSTANCE)
					.addScalar("password", StringType.INSTANCE)
					.addScalar("administra", StringType.INSTANCE);
			query.setResultTransformer(Transformers.aliasToBean(User.class));
			list= query.list();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		if (list.size()==0) {
			return null;
		}
		return list.get(0);
	}

	
	@Override
	public int registerAdminUser(String username, String password,
			String administra) {
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		boolean findUserByUserName = FindUserByUserName(username);
		if (!findUserByUserName) {
			return 0;//注册失败           
		}
		int executeUpdate = 0;
		String sqlString="insert into user  values ('"+UUID.randomUUID().toString()+"','"+username+"','"+password+"','"+administra+"','"+0+"')";
		try {
			Query query=session.createSQLQuery(sqlString);
			executeUpdate = query.executeUpdate();
			System.out.println("executeUpdate："+executeUpdate);
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		return executeUpdate;
	}
	@Override
	public User userMessage(String id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		List<User> list=null;
		//String sqlString ="select*from user where username= '"+username+"' and password= '"+password+"' ";
		String sqlString="select * from user where id = '"+id+"' ";
		try {
			Query query=session.createSQLQuery(sqlString).addScalar("id", StringType.INSTANCE)
					.addScalar("username", StringType.INSTANCE)
					.addScalar("password", StringType.INSTANCE)
					.addScalar("balance",FloatType.INSTANCE);
			query.setResultTransformer(Transformers.aliasToBean(User.class));
			list= query.list();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		if (list.size()==0) {
			return null;
		}
		return list.get(0);
	}

	
	@Override
	public int userUpdate(String id, String password) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		int executeUpdate = 0;
		String sqlString="update user set password = '"+password+"' where id ='"+id+"'";
		try {
			Query query=session.createSQLQuery(sqlString);
			executeUpdate = query.executeUpdate();
			System.out.println("executeUpdate："+executeUpdate);
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		return executeUpdate;	
	}
	
	//分页
	public List queryForPage(final String sqlString,final int offset,final int length){
			Session session=sessionFactory.openSession();
			Transaction tr = session.beginTransaction();
			List<Advice> list=null;
			try {
				Query query=session.createSQLQuery(sqlString).addScalar("id", StringType.INSTANCE)
						.addScalar("message",StringType.INSTANCE)
						.addScalar("user_id", StringType.INSTANCE)
						.addScalar("username", StringType.INSTANCE)
						.addScalar("createdtime", StringType.INSTANCE)
						;
				//分页
				query.setResultTransformer(Transformers.aliasToBean(Advice.class));
				query.setFirstResult(offset);
				query.setMaxResults(length);
				list= query.list();
			} catch (HibernateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				tr.commit();
			    session.close();
			}
			return list;
		}

	@Override
	public int getAllRowCount(String sqlString) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		List<Advice> list=null;
		String sql="select * from advice";
		try {
			Query query=session.createSQLQuery(sqlString).addScalar("id", StringType.INSTANCE)
					.addScalar("message",StringType.INSTANCE)
					.addScalar("user_id", StringType.INSTANCE)
					.addScalar("username", StringType.INSTANCE)
					.addScalar("createdtime", StringType.INSTANCE)
					;
			//分页
			query.setResultTransformer(Transformers.aliasToBean(Advice.class));
			list= query.list();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		return list.size();
	}

	
	
	@Override
	public int deleteAdvice(String id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		int executeUpdate = 0;
		String sqlString="delete from advice where  id = '"+id+"'";
		try {
			Query query=session.createSQLQuery(sqlString);
			executeUpdate = query.executeUpdate();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		return executeUpdate ;
		
	}
	@Override
	public int accountUpdate(String id, String balance) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		int executeUpdate = 0;
		String sqlString="update user set balance = '"+balance+"' where id ='"+id+"'";
		try {
			Query query=session.createSQLQuery(sqlString);
			executeUpdate = query.executeUpdate();
			System.out.println("executeUpdate："+executeUpdate);
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		return executeUpdate;	
	}
}