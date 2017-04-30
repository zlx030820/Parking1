package com.parking.service.impl;

import java.util.List;

import com.parking.dao.interf.ParkDao;
import com.parking.entity.Park;
import com.parking.entity.Space;
import com.parking.service.interf.ParkService;

public class ParkServiceImpl implements ParkService {
	private ParkDao parkDao;
	public ParkDao getParkDao() {
		return parkDao;
	}
	public void setParkDao(ParkDao parkDao) {
		this.parkDao = parkDao;
	}

	@Override
	public int addPark(Park park) {
		return parkDao.addPark(park);
	}
	@Override
	public List<Space> getSpaceByParkID(String parkId) {
		// TODO Auto-generated method stub
		return parkDao.getSpaceByParkID(parkId);
	}
	@Override
	public int addSpace(Space space) {
		// TODO Auto-generated method stub
		return parkDao.addSpace(space);
	}
	@Override
	public Space outSpace(String id) {
		// TODO Auto-generated method stub
		return parkDao.outSpace(id);
	}
	@Override
	public List<Park> getparkList() {
		// TODO Auto-generated method stub
		return parkDao.getparkList();
	}
	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return parkDao.delete(id);
	}
	@Override
	public int updatePark(Park park) {
		// TODO Auto-generated method stub
		return parkDao.updatePark(park);
	}
	@Override
	public List<Park> getParksNameList(String namex) {
		// TODO Auto-generated method stub
		return parkDao.getParksNameList(namex);
	}
	@Override
	public Park getParkById(String id) {
		// TODO Auto-generated method stub
		return parkDao.getParkById(id);
	}
	@Override
	public List<Space> getSpacesByUserID(String id) {
		return parkDao.getSpacesByUserID(id);
	}
}
