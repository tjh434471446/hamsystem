package com.uestc.hams.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TimeSearchUtil {
	/**
	 * 根据选择的起始时间和结束时间筛选记录
	 * @param time_start起始时间字符串
	 * @param time_end结束时间字符串
	 * @param timeList查询出的所有记录的时间集合
	 * @return返回由开始位置和结束位置组成的集合
	 * @throws ParseException
	 */
	public static List<Integer> timeSearch(String time_start,String time_end,List<String> timeList) throws ParseException{
		int start = 0;
		int end = 0;
		if (time_start != null && time_end != null && time_start.length() != 0 && time_end.length() != 0)
		{
			//将查询的开始时间和字符串转换为时间戳
			long timeStart = TimeSearchUtil.stringtoTimestamp(time_start).getTime();
			long timeEnd = TimeSearchUtil.stringtoTimestamp(time_end).getTime();
			for (int i = 0; i < timeList.size(); i++)
			{
				if (timeStart <= TimeSearchUtil.stringtoTimestamp(timeList.get(i)).getTime())
				{
					start = i;
					break;
				}
				else
				{
					start = i + 1;
				}
			}
			for (int i = 0; i < timeList.size(); i++)
			{
				if (timeEnd < TimeSearchUtil.stringtoTimestamp(timeList.get(i)).getTime())
				{
					end = i - 1;
					break;
				}
				else if (timeEnd == TimeSearchUtil.stringtoTimestamp(timeList.get(i)).getTime())
				{
					end = i;
					break;
				}
				else
				{
					end = i;
				}
			} 
		}
		else if ((time_start != null && time_start.length() != 0) && (time_end == null || time_end.length() == 0)) 
		{
			long timeStart = TimeSearchUtil.stringtoTimestamp(time_start).getTime();
			for (int i = 0; i < timeList.size(); i++)
			{
				if (timeStart <= TimeSearchUtil.stringtoTimestamp(timeList.get(i)).getTime())
				{
					start = i;
					break;
				}
				else
				{
					start = i + 1;
				}
			}
			end = timeList.size() - 1;
		}
		else if ((time_start == null || time_start.length() == 0) && (time_end != null && time_end.length() != 0))
		{
			long timeEnd = TimeSearchUtil.stringtoTimestamp(time_end).getTime();
			for (int i = 0; i < timeList.size(); i++)
			{
				if (timeEnd < TimeSearchUtil.stringtoTimestamp(timeList.get(i)).getTime())
				{
					end = i - 1;
					break;
				}
				else if (timeEnd == TimeSearchUtil.stringtoTimestamp(timeList.get(i)).getTime())
				{
					end = i;
					break;
				}
				else
				{
					end = i;
				}
			}
			start = 0;
		}
		else
		{
			start = 0;
			end = timeList.size() - 1;
		}
		//将开始位置和结束位置存入list
		List<Integer> list = new ArrayList<Integer>();
		list.add(start);
		list.add(end);
		
		return list;
	}
	
	/**
	 * 将string转化为timestamp
	 * @param stringTime
	 * @return
	 * @throws ParseException
	 */
	public static Timestamp stringtoTimestamp(String stringTime) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = sdf.parse(stringTime);
		Timestamp time = Timestamp.valueOf(sdf.format(date));
		return time;
	}
	
	/**
	 * 将timestamp转化为string
	 * @param timestampTime
	 * @return
	 */
	public static String timestampToString(Timestamp timestampTime){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time = sdf.format(timestampTime);
		return time;
	}
}
