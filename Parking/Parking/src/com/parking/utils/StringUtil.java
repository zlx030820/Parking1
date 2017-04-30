package com.parking.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class StringUtil {

	public static boolean isEmpty(String str){
		if("".equals(str)|| str==null){
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean isNotEmpty(String str){
		if(!"".equals(str)&&str!=null){
			return true;
		}else{
			return false;
		}
	}
	
	public static String getTFormatString(String tdate) {  
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");  
        String str ="";  
        try {  
            java.util.Date date = format1.parse(tdate);  
            SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
             str = format2.format(date);  
        } catch (ParseException e) {  
            e.printStackTrace();  
        }  
        return str;  
    }  
	
	public static String getTimeFormatString(String tdate) {  
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");  
        String str ="";  
        try {  
            java.util.Date date = format1.parse(tdate);  
            SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
             str = format2.format(date);  
        } catch (ParseException e) {  
            e.printStackTrace();  
        }  
        return str;  
    } 

}
