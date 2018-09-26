package com.hqyj.mana.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.mana.pojo.Role;
import com.hqyj.mana.pojo.Urrel;
import com.hqyj.mana.service.QxlService;

@Controller
public class SystemController {
	
	@Autowired
	QxlService qservice;
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping(method=RequestMethod.GET,value="qxfenpei.do")
	public Object pxfenpei() {
		return "qxfenpei";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="usermanage.do")
	public Object usermanage() {
		return "usermanage";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchurrel.do")
	@ResponseBody
	public Object searchurrel(){
		return qservice.searchurrel();
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchrole.do")
	@ResponseBody
	public Object searchrole(){
		return qservice.searchrole();
	}
	
	@RequestMapping(method=RequestMethod.GET,value="addrole.do")
	@ResponseBody
	public Object addrole(Role r){
		return qservice.addrole(r);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="updateurrel.do")
	@ResponseBody
	public Object updateurrel(Urrel r){
		return qservice.updatebyusername(r);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="deluser.do")
	@ResponseBody
	public Object deluser(String username){
		return qservice.deluser(username);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="delrole.do")
	@ResponseBody
	public Object delrole(int rid){
		return qservice.delrole(rid);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchhadpower.do")
	@ResponseBody
	public Object searchhadpower(int rid){
		session.setAttribute("rid", rid);
		System.out.println(session.getAttribute("rid"));
		return qservice.searchhadpower(rid);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchnothavepower.do")
	@ResponseBody
	public Object searchnothavepower(int rid){
		session.setAttribute("rid", rid);
		return qservice.searchnothavepower(rid);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="addpower.do")
	@ResponseBody
	public Object addpower(String power){
		return qservice.insertpower(power);
	}
}
