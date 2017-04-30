/**
 * 
 */
package com.parking.utils;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 * @author Sun Lianwei
 * 工具类
 */
public class HibernateUtils {

	private static SessionFactory sessionFactory;
	private static Session session;
	
	static{
//		Configuration cfg=new Configuration().configure();
//		
//		StandardServiceRegistryBuilder ssrb=new StandardServiceRegistryBuilder().applySettings(cfg.getProperties());
//		ServiceRegistry service=ssrb.build();
//		sessionFactory=cfg.buildSessionFactory(service);
	}
	private HibernateUtils(){
	}
	public static SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	/**
	 * 获取session对象
	 */
	public static Session getSession(){
		session=getSessionFactory().getCurrentSession();
		return session;
	}
	/**
	 * 关闭session对象
	 */
	public static void closeSession(){
		if(session!=null&&session.isOpen()){
			session.close();
		}
	}
	
	public static void closeSession(Session session){
		if(session!=null&&session.isOpen()){
			session.close();
		}
	}
}
