 package com.parking.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.crypto.Data;

import org.springframework.jdbc.support.incrementer.DataFieldMaxValueIncrementer;

import com.parking.entity.Park;
import com.parking.entity.Space;
import com.parking.entity.User;
import com.parking.service.interf.ParkService;
import com.parking.utils.Struts2Utils;



public class ParkAction {
	
	private Map<String, Object> result=new HashMap<String, Object>();
	public Map<String, Object> getResult() {
		return result;
	}
	public void setResult(Map<String, Object> result) {
		this.result = result;
	}
	
	private ParkService parkService;
	public ParkService getParkService() {
		return parkService;
	}
	public void setParkService(ParkService parkService) {
		this.parkService = parkService;
	}
	public String addPark() {
		String name =(String) Struts2Utils.getHttpServletRequest().getParameter("name");
		String x = (String)Struts2Utils.getHttpServletRequest().getParameter("x");
		String y = (String)Struts2Utils.getHttpServletRequest().getParameter("y");
		String spaceNum = (String)Struts2Utils.getHttpServletRequest().getParameter("spaceNum");
		Park park=new Park();
		park.setName(name);
		park.setX(Float.parseFloat(x));
		park.setY(Float.parseFloat(y));
		park.setSpaceNum(Integer.parseInt(spaceNum));
		int addPark = parkService.addPark(park);
	    if (addPark==0) {
			result.put("flag", 0);
		}else {
			result.put("flag", 1);
		}
		return "JSONRESULT";
	}
	
	public String getMySpace() {
		User currentUser=(User) Struts2Utils.getSession().get("user");	
		if (currentUser==null) {
			return "needlogin";
		}
		List<Space> spaces = parkService.getSpacesByUserID(currentUser.getId());
		Struts2Utils.getSession().put("spaces", spaces);
		return "myspace";
	}
	
	
	public String getSpaceByParkId() {
		String park_id =(String) Struts2Utils.getHttpServletRequest().getParameter("park_id");
		List<Space> spaces = parkService.getSpaceByParkID(park_id);
		Struts2Utils.getSession().put("park_id", park_id);
		Struts2Utils.getSession().put("spaces", spaces);
		result.put("flag", spaces);
		return "spacebypark";
	}
	
	public String getSpaceByParkId2() {
		String park_id =(String) Struts2Utils.getHttpServletRequest().getParameter("park_id");
		List<Space> spaces = parkService.getSpaceByParkID(park_id);
		Struts2Utils.getSession().put("park_id", park_id);
		Struts2Utils.getSession().put("spaces", spaces);
		result.put("flag", spaces);
		return "spacebypark1";
	}
	
	
	
	public String getParkById() {
		String park_id =(String) Struts2Utils.getHttpServletRequest().getParameter("park_id");
		Park park = parkService.getParkById(park_id);
		if (park!=null) {
			result.put("park", park);
		}else {
			result.put("park",null);
		}
		return "JSONRESULT";
	}
	
	public String addSpace(){
		 	String id =  (String)Struts2Utils.getHttpServletRequest().getParameter("id");
			User currentUser=(User) Struts2Utils.getSession().get("user");	
			if (currentUser==null) {
				return "needlogin";
			}
			Space space=new Space();
			space.setId(id);
            space.setRemark(currentUser.getId());
		    int addSpace = parkService.addSpace(space);
		    //在struts页面注册对于页面或者方法，这里Struts配置文件注册的是重定向的方法
		    Struts2Utils.getSession().put("id", id);
			return "addspace";
		
	}
	
	
	public String outSpace() {
	 	String id =  (String)Struts2Utils.getHttpServletRequest().getParameter("id");
	 	Space outSpace = parkService.outSpace(id);
	 	String t1=outSpace.getStart_time();
	 	String t2=outSpace.getEnd_time();
	 	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 	try {
			Date t3=df.parse(t1);
			Date t4=df.parse(t2);
			long diff = t4.getTime() - t3.getTime();
			long minutes = diff / (1000 * 60); 
			double feiyong=0;
			if(minutes<30){
				feiyong=10;
			}
			else if(minutes>30  && minutes<120){
				feiyong=10+(minutes-30)*0.2;
			}
			else{
				feiyong=28+(minutes-30)*0.15;
			}
			
			Struts2Utils.getSession().put("feiyong", feiyong);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 	Struts2Utils.getSession().put("outSpace", outSpace);
		return "outspace";
		
	}
	
	public String ParkList(){
		List<Park> parklist = parkService.getparkList();
//		Struts2Utils.set2Request("parklist", parklist);
		Struts2Utils.getSession().put("parklist", parklist);
		return "parklist";
	}
	
	public String ParkList2(){
		List<Park> parklist = parkService.getparkList();
//		Struts2Utils.set2Request("parklist", parklist);
		result.put("parklist",parklist);
		return "JSONRESULT";
	}
	
	public String  delete() {
		String id =  (String)Struts2Utils.getHttpServletRequest().getParameter("id");
		int delete = parkService.delete(id);
		if (delete==0) {
			result.put("flag", 0);
		}else {
			result.put("flag", 1);
	}
	return "JSONRESULT";
		//return "SUCCESS";
	}
	
	public String updatePark(){
		String id =(String) Struts2Utils.getHttpServletRequest().getParameter("id");
		String name =(String) Struts2Utils.getHttpServletRequest().getParameter("name");
		String x = (String)Struts2Utils.getHttpServletRequest().getParameter("x");
		String y = (String)Struts2Utils.getHttpServletRequest().getParameter("y");
		String spaceNum = (String)Struts2Utils.getHttpServletRequest().getParameter("spaceNum");
		Park park=new Park();
		park.setId(id);
		park.setName(name);
		park.setX(Float.parseFloat(x));
		park.setY(Float.parseFloat(y));
		park.setSpaceNum(Integer.parseInt(spaceNum));
		int updatePark = parkService.updatePark(park);
		if (updatePark==0) {
			result.put("flag", 0);
		}else {
			result.put("flag", 1);
		}
		return "updatepark";
	}
	//模糊查询
	private String namex;
	public String getNamex() {
		return namex;
	}
	public void setNamex(String namex) {
		this.namex = namex;
	}
	public String getParksNameList(){
		String namex =(String) Struts2Utils.getHttpServletRequest().getParameter("namex");
		List<Park> parks = parkService.getParksNameList(namex);
		result.put("flag", parks);
		return "JSONRESULT";
		
		
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
