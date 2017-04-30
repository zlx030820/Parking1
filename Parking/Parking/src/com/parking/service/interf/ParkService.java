package com.parking.service.interf;


import java.util.List;

import com.parking.entity.Park;
import com.parking.entity.Space;


public interface ParkService {
	public int addPark(Park park);
	public List<Space> getSpaceByParkID(String parkId); 
	//删除停车场
	public int delete(String id);
	//修改停车场
	public int updatePark(Park park);
	public List<Park> getParksNameList(String namex);
	public List<Park> getparkList();
	
	Park getParkById(String id);
	List<Space> getSpacesByUserID(String id);
	public int addSpace(Space space);
	public Space outSpace(String id);
}
