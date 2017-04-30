package com.parking.dao.interf;

import java.util.List;

import com.parking.entity.Park;
import com.parking.entity.Space;



public interface ParkDao {
	//增加停车场
	public int addPark(Park park);
	//删除停车场
	public int delete(String id);
	//修改停车场
	public int updatePark(Park park);
	//根据name模糊查询停车场信息
	public List<Park> getParksNameList(String namex);
	//根据parkid列出某个车位信息
	public List<Space> getSpaceByParkID(String parkId); 
	//列出停车场信息
	public List<Park> getparkList();
	//用户使用某个车库
	public int addSpace(Space space);
	//用户停用某个车库
	public Space outSpace(String id);
	
	Park getParkById(String id);
	List<Space> getSpacesByUserID(String id);



}
