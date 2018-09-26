package com.hqyj.mana.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.mana.pojo.EmployerFile;
import com.hqyj.mana.pojo.EmployerHt;
import com.hqyj.mana.service.EmployerFileService;
import com.hqyj.mana.service.EmployerHtService;

@Controller
public class EmployerHtController {
	
	@Autowired
	EmployerHtService service;

	@RequestMapping(method=RequestMethod.GET,value="employerHtPage.do")
	public Object employerHtPage(){
		return "employerhtpage";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchht.do")
	@ResponseBody
	public Object searchht(EmployerHt e){
		return service.search(e);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchhtdesc.do")
	@ResponseBody
	public Object searchdesc(EmployerHt e){
		return service.searchdesc(e);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchhtasc.do")
	@ResponseBody
	public Object searchtasc(EmployerHt e){
		return service.searchasc(e);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="delht.do")
	@ResponseBody
	public Object delht(int htid) {
		return service.delbyhtid(htid);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="addht.do")
	@ResponseBody
	public Object addht(EmployerHt e) {
		return service.add(e);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="updateht.do")
	@ResponseBody
	public Object updateht(EmployerHt e) {
		return service.update(e);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchbyname.do")
	@ResponseBody
	public Object searchbyname(String name) {
		return service.serachbyname(name);
	}
}
