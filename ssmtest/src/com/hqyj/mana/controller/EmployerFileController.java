package com.hqyj.mana.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.mana.pojo.EmployerFile;
import com.hqyj.mana.service.EmployerFileService;

@Controller
public class EmployerFileController {
	
	@Autowired
	EmployerFileService service;

	@RequestMapping(method=RequestMethod.GET,value="employerPage.do")
	public Object employerPage(){
			
		return "employerpage";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="saarchfile.do")
	@ResponseBody
	public Object saarchfile(EmployerFile e){
		return service.search(e);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="addfile.do")
	@ResponseBody
	public Object addfile(EmployerFile e) {
		return service.add(e);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="delfile.do")
	@ResponseBody
	public Object delfile(int fileid) {
		return service.del(fileid);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="updatefile.do")
	@ResponseBody
	public Object updatefile(EmployerFile e) {
		return service.update(e);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchbytype.do")
	@ResponseBody
	public Object searchbytype(int typeid) {
		return service.searchbytypeid(typeid);
	}
}
