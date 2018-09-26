package com.hqyj.mana.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.mana.pojo.Admin;
import com.hqyj.mana.service.AdminService;
import com.hqyj.mana.util.ValCode;



@Controller
public class LoginController {

	//注入用户服务类对象
	@Autowired
	AdminService adminService;
	

	@Autowired
	ValCode valcode;
	//跳转到主页面
	@RequestMapping(method=RequestMethod.GET,value="index.do")
	public Object employerPage(){
			
		return "index";
	}
	//跳转到登录页面
	@RequestMapping(method=RequestMethod.GET,value="login.do")
	public Object login(){
				
			return "login";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="loginout.do")
	@ResponseBody
	public Object loginout(HttpServletRequest request,HttpSession session){
			request.getSession().invalidate();
			return true;
	}
	/**
	 * 表单登录
	 * @param a
	 * @param map
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST,value="loginForm.do")
	public Object loginForm(Admin a,ModelMap map){
		
		return adminService.login(a, map);
	}
	/**
	 * ajax登录
	 * @param a
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST,value="loginAjax.do")
	@ResponseBody
	public Object loginAjax(Admin a){
		return adminService.login(a);
	}
	/**
	 * 修改密码
	 * @param a
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST,value="updatePwd.do")
	@ResponseBody
	public Object updatePwd(Admin a){
		return adminService.updatePwd(a);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="/valCode.do")
	public void valCode(HttpServletResponse response,HttpServletRequest request) throws IOException {
		// 设置响应的类型格式为图片格式  
	    response.setContentType("image/png");  

	    //创建session对象,用来保存验证码的值
	    HttpSession session = request.getSession();
	    
		//生成验证码
		valcode.createCode();
		//将验证码的值保存到session中
		session.setAttribute("valCode", valcode.getCode());
		//生成图片
		valcode.write(response.getOutputStream());
		
	}
}