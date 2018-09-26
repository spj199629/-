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

	//ע���û����������
	@Autowired
	AdminService adminService;
	

	@Autowired
	ValCode valcode;
	//��ת����ҳ��
	@RequestMapping(method=RequestMethod.GET,value="index.do")
	public Object employerPage(){
			
		return "index";
	}
	//��ת����¼ҳ��
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
	 * ����¼
	 * @param a
	 * @param map
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST,value="loginForm.do")
	public Object loginForm(Admin a,ModelMap map){
		
		return adminService.login(a, map);
	}
	/**
	 * ajax��¼
	 * @param a
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST,value="loginAjax.do")
	@ResponseBody
	public Object loginAjax(Admin a){
		return adminService.login(a);
	}
	/**
	 * �޸�����
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
		// ������Ӧ�����͸�ʽΪͼƬ��ʽ  
	    response.setContentType("image/png");  

	    //����session����,����������֤���ֵ
	    HttpSession session = request.getSession();
	    
		//������֤��
		valcode.createCode();
		//����֤���ֵ���浽session��
		session.setAttribute("valCode", valcode.getCode());
		//����ͼƬ
		valcode.write(response.getOutputStream());
		
	}
}