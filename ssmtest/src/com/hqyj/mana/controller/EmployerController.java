package com.hqyj.mana.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.mana.pojo.Employer;
import com.hqyj.mana.pojo.EmployerHt;
import com.hqyj.mana.service.EmployerService;

@Controller
public class EmployerController {

	@Autowired
	EmployerService service;
	SimpleDateFormat date;
	//页面跳转
	
	
	
	/**
	 * 查询
	 * @return
	 */
	@RequestMapping(method=RequestMethod.GET,value="searchinfo.do")
	@ResponseBody
	public Object searchinfo(Employer e){
		
		return service.search(e);
	}
	/**
	 * 新增
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST,value="add.do")
	@ResponseBody
	public Object add(Employer e){
		return service.add(e);
	}
	/**
	 * 修改
	 * @return
	 */
	@RequestMapping(method=RequestMethod.GET,value="update.do")
	@ResponseBody
	public Object update(Employer e){
		
		return service.update(e);
	}
	/**
	 * 删除
	 * @return
	 */
	@RequestMapping(method=RequestMethod.GET,value="del.do")
	@ResponseBody
	public Object del(int id){
		
		return service.del(id);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchinfodesc.do")
	@ResponseBody
	public Object searchdesc(Employer e){
		return service.searchdesc(e);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchinfoasc.do")
	@ResponseBody
	public Object searchtasc(Employer e){
		return service.searchasc(e);
	}
	
}
