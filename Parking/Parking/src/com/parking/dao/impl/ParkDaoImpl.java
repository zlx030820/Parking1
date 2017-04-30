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
import org.hibernate.type.IntegerType;
import org.hibernate.type.StringType;

import com.parking.dao.interf.ParkDao;
import com.parking.entity.Park;
import com.parking.entity.Space;

public class ParkDaoImpl  implements ParkDao{
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public int addPark(Park park) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		int executeUpdate = 0;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		String nowDate=sdf.format(new java.util.Date()); 
		String ParkID=UUID.randomUUID().toString();
		String sqlString="insert into parking  values ('"+ParkID+"','"+park.getName()+"',"+park.getX()+","+park.getY()+",'"+nowDate+"',"+park.getSpaceNum()+",'',null)";
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
		if (executeUpdate==1) {
			for (int i = 0; i < park.getSpaceNum(); i++) {
				addParkSpace(ParkID, i+1);
			}
		}
		return executeUpdate;
	}

	public int  addParkSpace(String parkId,int num) {
		// TODO Auto-generated method stub
				Session session=sessionFactory.openSession();
				Transaction tr = session.beginTransaction();
				int executeUpdate = 0;
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
				String nowDate=sdf.format(new java.util.Date()); 
				String SpaceId=UUID.randomUUID().toString();
				String sqlString="insert into space  values ('"+SpaceId+"',"+num+","+0+",'"+parkId+"','"+nowDate+"','"+nowDate+"','"+nowDate+"','')";
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
	public List<Space> getSpaceByParkID(String parkId) {
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		List<Space> list=null;
		String sqlString="select * from space where park_id = '"+parkId+"' order by num";
		try {
			Query query=session.createSQLQuery(sqlString).addScalar("id", StringType.INSTANCE)
					.addScalar("num", IntegerType.INSTANCE)
					.addScalar("shiyong", IntegerType.INSTANCE)
					.addScalar("park_id",StringType.INSTANCE)
					.addScalar("start_time", StringType.INSTANCE)
					.addScalar("end_time", StringType.INSTANCE)
					.addScalar("createdtime", StringType.INSTANCE)
					;
			query.setResultTransformer(Transformers.aliasToBean(Space.class));
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
	public int addSpace(Space space) {
		Session session=sessionFactory.openSession();
		Transaction tr=session.beginTransaction();
		int executeUpdate = 0;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		String nowDate=sdf.format(new java.util.Date()); 
		String sqlString="update space set shiyong = "+1+", start_time = '"+nowDate+"' , remark = '"+space.getRemark()+"' where id= '"+space.getId()+"'";
		try {
			Query query=session.createSQLQuery(sqlString);
			query.setResultTransformer(Transformers.aliasToBean(Space.class));
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
	public Space outSpace(String id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tr=session.beginTransaction();
		int executeUpdate = 0;
		List<Space> list = null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		String nowDate=sdf.format(new java.util.Date()); 
		String sqlString="update space set shiyong = "+0+", end_time = '"+nowDate+"' , remark = '' where  id= '"+id+"'";
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
		if (executeUpdate==1) {
		 list = getTime(id);
			};
		return list.get(0);
	}
	
	public List<Space> getTime(String id){
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		List<Space> list=null;
		String sqlString="select * from space where id = '"+id+"'";
		try {
			Query query=session.createSQLQuery(sqlString).addScalar("id", StringType.INSTANCE)
					.addScalar("num", IntegerType.INSTANCE)
					.addScalar("shiyong", IntegerType.INSTANCE)
					.addScalar("park_id",StringType.INSTANCE)
					.addScalar("start_time", StringType.INSTANCE)
					.addScalar("end_time", StringType.INSTANCE)
					.addScalar("createdtime", StringType.INSTANCE)
					;
			query.setResultTransformer(Transformers.aliasToBean(Space.class));
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
	public List<Park> getparkList() {
		Session session=sessionFactory.openSession();
		Transaction tr=session.beginTransaction();
		String sqlString = "select * from parking order by createdtime DESC";
		List<Park> list = null;
		try {
			Query query=session.createSQLQuery(sqlString)
				
					.addScalar("id", StringType.INSTANCE)
					.addScalar("name", StringType.INSTANCE)
					.addScalar("x", FloatType.INSTANCE)
					.addScalar("y", FloatType.INSTANCE)
					.addScalar("createdtime", StringType.INSTANCE)
					.addScalar("spaceNum", IntegerType.INSTANCE);
				
			query.setResultTransformer(Transformers.aliasToBean(Park.class));
			        list=query.list();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		for (Park park : list) {
			int leftNum = getLeftNum(park.getId());
			park.setLeftNum(leftNum);
		}
		return list;
	}
	
	
	public int  getLeftNum(String parkid) {
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		List<Park> list=null;
		String sqlString="SELECT COUNT(*) As leftNum FROM space where space.shiyong=0 and park_id = '"+parkid+"'";

		try {
			Query query=session.createSQLQuery(sqlString).addScalar("leftNum", IntegerType.INSTANCE);
			query.setResultTransformer(Transformers.aliasToBean(Park.class));
			list= query.list();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		return list.get(0).getLeftNum();
	}
	
	
	@Override
	public int delete(String id) {
		Session session=sessionFactory.openSession();
		Transaction tr=session.beginTransaction();
		
		int executeUpdate = 0;
		String sqlString="delete parking,space from parking left join space on parking.id=space.park_id where parking.id= '"+id+"' ";
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
	public int updatePark(Park park) {
		Session session=sessionFactory.openSession();
		Transaction tr=session.beginTransaction();
		int executeUpdate = 0;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		String nowDate=sdf.format(new java.util.Date()); 
		String ParkID = park.getId();
		/*String sqlString="delete space from parking left join space on parking.id=space.park_id where parking.id= '"+ParkID+"' "+"update parking set name = '"+park.getName()+"', x = '"+park.getX()+"' , y = '"+park.getY()+"' ,createdtime= '"+nowDate+"' ,spaceNum= '"+park.getSpaceNum()+"' where  id= '"+park.getId()+"'";*/
		String delString="delete space from parking left join space on parking.id=space.park_id where parking.id= '"+ParkID+"'";
		String sqlString="update parking set name = '"+park.getName()+"', x = '"+park.getX()+"' , y = '"+park.getY()+"' ,createdtime= '"+nowDate+"' ,spaceNum= '"+park.getSpaceNum()+"' where  id= '"+park.getId()+"'";

		try {
			Query query1=session.createSQLQuery(delString);
			Query query2=session.createSQLQuery(sqlString);
			executeUpdate = query1.executeUpdate();
			executeUpdate = query2.executeUpdate();
			System.out.println("executeUpdate："+executeUpdate);
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		if (executeUpdate==1) {
			for (int i = 0; i < park.getSpaceNum(); i++) {
				addParkSpace(ParkID, i+1);
			}
		}
		return executeUpdate;
	}
	@Override
	public List<Park> getParksNameList(String namex) {
		
			Session session=sessionFactory.openSession();
			Transaction tr = session.beginTransaction();
			List<Park> list=null;
			String sqlString="select * from parking where name like '%" +namex+ "%' ";
	
			try {
				Query query=session.createSQLQuery(sqlString).addScalar("name", StringType.INSTANCE)
						.addScalar("x", FloatType.INSTANCE)
						.addScalar("y", FloatType.INSTANCE)
						.addScalar("createdtime",StringType.INSTANCE)
						.addScalar("spaceNum", IntegerType.INSTANCE)
						.addScalar("remark", StringType.INSTANCE)
						;
				query.setResultTransformer(Transformers.aliasToBean(Park.class));
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
	public Park getParkById(String id) {
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		List<Park> list=null;
		String sqlString="select * from parking where id ='" +id+ "'";

		try {
			Query query=session.createSQLQuery(sqlString).addScalar("name", StringType.INSTANCE)
					.addScalar("x", FloatType.INSTANCE)
					.addScalar("y", FloatType.INSTANCE)
					.addScalar("createdtime",StringType.INSTANCE)
					.addScalar("spaceNum", IntegerType.INSTANCE)
					.addScalar("remark", StringType.INSTANCE)
					;
			query.setResultTransformer(Transformers.aliasToBean(Park.class));
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
	public List<Space> getSpacesByUserID(String id) {
		Session session=sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		List<Space> list=null;
		String sqlString="select * from space where remark ='" +id+ "' order by createdtime ";

		try {
			Query query=session.createSQLQuery(sqlString).addScalar("id", StringType.INSTANCE)
					.addScalar("num", IntegerType.INSTANCE)
					.addScalar("shiyong", IntegerType.INSTANCE)
					.addScalar("park_id",StringType.INSTANCE)
					.addScalar("start_time", StringType.INSTANCE)
					.addScalar("end_time", StringType.INSTANCE)
					.addScalar("createdtime", StringType.INSTANCE)
					;
			query.setResultTransformer(Transformers.aliasToBean(Space.class));
			list= query.list();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			tr.commit();
		    session.close();
		}
		for (int i = 0; i < list.size(); i++) {
			Park park = getParkById(list.get(i).getPark_id());
			list.get(i).setPark_id(park.getName());
		}
		return list;
	}
	
}
