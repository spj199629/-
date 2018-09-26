package com.hqyj.mana.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.hqyj.mana.dao.AdminMapper;
import com.hqyj.mana.pojo.Admin;
/**
 * 用户表的逻辑服务类，实现的功能有：登录
 * @author wj
 *
 */
@Service
public class AdminService {
	
	//注入用户数据类对象
	@Autowired
	AdminMapper adminMapper;
	
	//注入request对象
	
	@Autowired
	HttpServletRequest request;
	
	/**
	 * ajax登录
	 * @param a
	 * @return 如果返回是true登录成功，反之失败
	 */
	public boolean login(Admin a){
		Admin admin = adminMapper.login(a);
		if(admin!=null){
			//获取session对象
			HttpSession session =request.getSession();
			//把登录成功的用户对象存入session中
			session.setAttribute("admin", admin);
			return true;
		}
		return false;
	}
	/**
	 * 表单登录
	 * @param a
	 * @param map
	 * @return
	 */
	public String login(Admin a,ModelMap map){
			
			if(adminMapper.login(a)!=null){
				//获取session对象 
				HttpSession session = request.getSession();
			
				//从session中取出验证码并且和用户输入的验证码进行比较
				if((session.getAttribute("valCode")+"").equalsIgnoreCase(a.getValCode())){
					
					//存储用户信息到session中
					session.setAttribute("admin", a);
					session.setAttribute("username", a.getUsername());
					//
					return "index";
				}else{
					request.setAttribute("info", "验证码输入错误");
				}
			}else{
					request.setAttribute("info", "账号或密码输入错误");
			}
			return "login";
		}

	/**
	 * 修改
	 * @param a
	 * @return
	 */
	public boolean updatePwd(Admin a){
		if(adminMapper.updateByPrimaryKey(a)>0){
			return true;
		}
		return false;
	}
}
