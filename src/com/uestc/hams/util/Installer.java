package com.uestc.hams.util;

import java.util.HashSet;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.uestc.hams.entity.Privilege;
import com.uestc.hams.entity.Role;
import com.uestc.hams.entity.User;


@Component//交给容器管理，事务才起作用
public class Installer {

	@Resource
	private SessionFactory sessionFactory;
	
	
	@Transactional//这里需要事务
	public void install(){
		Session session = sessionFactory.getCurrentSession();
		//保存超级管理员用户
		User user= new User();
		user.setLoginName("admin");
		user.setName("超级管理员");
		user.setPassword(DigestUtils.md5Hex("admin"));
		session.save(user);
		//权限数据
		Privilege menu,menu1,menu2,menu3,menu4,menu5,menu6,menu7,menu8,menu9,menu10;
		Privilege menu20,menu21,menu22,menu23,menu24,menu25,menu26,menu27;
		//各自权限
		HashSet<Privilege> hamsDoctor=new HashSet<Privilege>();
		HashSet<Privilege> hamsRecorder=new HashSet<Privilege>();
		HashSet<Privilege> hamsDistricIns= new HashSet<Privilege>();
		HashSet<Privilege> commonUser = new HashSet<Privilege>();
		//系统管理模块
		menu=new Privilege("系统管理",null, null);
		session.save(menu);
		//menu1=new Privilege("角色管理", "/hamSystem/role_list.action", menu);将工程和扩展名
		menu1=new Privilege("角色管理", "/role_list", menu);
		menu2=new Privilege("机构信息数据维护", "/districtIns_list", menu);
		menu3=new Privilege("用户管理", "/user_list", menu);
		//session.save(new Privilege("机构列表", "/districtIns_list", menu2));
		session.save(new Privilege("机构增加", "/districtIns_add", menu2));//因为在设置拦截器时是将UI去掉再进行考虑的
		session.save(new Privilege("机构修改", "/districtIns_edit", menu2));
		session.save(new Privilege("机构删除", "/districtIns_delete", menu2));
		hamsDistricIns.add(menu2);
		session.save(new Privilege("用户增加", "/user_add", menu3));
		session.save(new Privilege("用户修改", "/user_edit", menu3));
		session.save(new Privilege("用户删除", "/user_delete", menu3));
		session.save(new Privilege("用户列表", "/user_list", menu3));
		session.save(new Privilege("初始化密码", "/user_initPassword", menu3));
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);
		
		//健康档案模块
		menu=new Privilege("健康档案",null,null);
		session.save(menu);
		
		menu1=new Privilege("居民个人档案","/archive_doctorArchiveList",menu);
		hamsRecorder.add(menu1);
		hamsDoctor.add(menu1);
		//session.save(new Privilege("机构列表", "/archive_list", menu2));
		session.save(new Privilege("居民个人档案添加", "/archive_add", menu1));
		session.save(new Privilege("居民个人档案修改", "/archive_edit", menu1));
		session.save(new Privilege("居民个人档案删除", "/archive_delete", menu1));
		
		menu2=new Privilege("家庭档案", "/family_list", menu);
		session.save(new Privilege("家庭档案增加", "/family_add ", menu2));
		session.save(new Privilege("家庭档案修改", "/family_edit", menu2));
		session.save(new Privilege("家庭档案删除", "/family_delete", menu2));
		session.save(new Privilege("家庭成员列表", "/family_info ", menu2));
		session.save(new Privilege("家庭成员增加", "/family_memberAdd", menu2));
		session.save(new Privilege("家庭成员删除", "/family_memberDelete", menu2));
		
		hamsRecorder.add(menu2);
		hamsDoctor.add(menu2);
		
		menu3=new Privilege("健康体检", "/phyExam_archiveList", menu);
		session.save(new Privilege("健康体检增加", "/phyExam_add", menu3));
		session.save(new Privilege("健康体检修改", "/phyExam_edit", menu3));
		session.save(new Privilege("健康体检删除", "/phyExam_delete", menu3));
		hamsDoctor.add(menu3);
		hamsRecorder.add(menu3);
		session.save(menu);
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);
		
		menu = new Privilege("血压",null,null);
		session.save(menu);
		menu1 = new Privilege("上传历史","/bloodPressure_list",menu);
		session.save(new Privilege("血压增加","/bloodPressure_add",menu1));
		session.save(new Privilege("血压删除","/bloodPressure_delete",menu1));		
		//menu2 = new Privilege("血压波形","/bloodPressure_list",menu);
		session.save(new Privilege("血压波形","/bloodpressure_waveUI",menu1));		
		session.save(menu1);
		//session.save(menu2);	
		commonUser.add(menu);
		commonUser.add(menu1);
		
		menu=new Privilege("医患互动",null, null);
		hamsDoctor.add(menu);
		commonUser.add(menu);
		menu1 = new Privilege("留言","/messageText_homeUI",menu);
		hamsDoctor.add(menu1);
		commonUser.add(menu1);
		session.save(menu);		
		session.save(menu1);	
		
		session.save(new Role("医生",hamsDoctor));
		session.save(new Role("记录员",hamsRecorder));
		session.save(new Role("机构管理员",hamsRecorder));
		session.save(new Role("一般用户",commonUser));

	}
	
	/**
	 *  这里添加额外功能
	 */
	public void addPrivilege(){
		
		
	}
	
	/**
	 * 这里不需要放在tomcat里自动执行，可以通过java命令来自动执行安装
	 * 这里为单独的程序
	 * @param args
	 */
	public static void main(String[] args) {

		ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
		Installer installer= (Installer) ac.getBean("installer");
		installer.install();
	}

}
