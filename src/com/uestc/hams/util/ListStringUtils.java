package com.uestc.hams.util;

import java.util.Arrays;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;

public class ListStringUtils {

	/**
	 * list转换为字符串
	 * @param list
	 * @param separator 分隔符
	 * @return 字符串
	 */
	public static String listToString(List<String> list,String separator){
		
		if(list != null && list.size() > 0){
			StringBuffer sb = new StringBuffer();
			for(int i=0;i<list.size();i++){
				sb.append(list.get(i)).append(separator);
			}
			String str = sb.toString();
			String str1 = str.substring(0, str.lastIndexOf(separator));
			return str1;
		}else{
			return null;
		}
		
	}
	
	/**
	 * 字符串转换为list
	 * @param str
	 * @return list
	 */
	public static List<String> stringToList(String str,String separator){
		if(str != null && str.length() > 0){
			List<String> list = Arrays.asList(str.split(separator));
			return list;
		}else{
			return null;
		}
		
		
	}
	
}
