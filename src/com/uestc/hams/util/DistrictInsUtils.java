package com.uestc.hams.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.uestc.hams.entity.DistrictIns;

public class DistrictInsUtils {

	public static List<DistrictIns> getAllDistrictIns(List<DistrictIns> topList) {
		List<DistrictIns> list= new ArrayList<DistrictIns>();
		wakDepartmentTreeList(topList,"==",list);
		return list;
	}

	private static void wakDepartmentTreeList(Collection<DistrictIns> c,String perfix, List<DistrictIns> list) {
		for(DistrictIns d:c){
			
			//顶点
			DistrictIns copy=new DistrictIns();//使用副本因为原对象在session中
			copy.setName(perfix+d.getName());
			copy.setId(d.getId());
			list.add(copy);
			//子树
			wakDepartmentTreeList(d.getChildren(),"　"+perfix,list);//使用全角的空格
		}
	}

}
