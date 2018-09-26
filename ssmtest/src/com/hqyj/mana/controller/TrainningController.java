package com.hqyj.mana.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.mana.pojo.Employer;
import com.hqyj.mana.pojo.EmployerFile;
import com.hqyj.mana.pojo.TrainningRecord;
import com.hqyj.mana.pojo.TrainningType;
import com.hqyj.mana.service.EmployerFileService;
import com.hqyj.mana.service.EmployerService;
import com.hqyj.mana.service.TrainingTypeService;
import com.hqyj.mana.service.TrainningRecordService;

@Controller
public class TrainningController {
	
	@Autowired
	TrainingTypeService tservice;
	@Autowired
	TrainningRecordService rservice;
	@Autowired
	EmployerFileService eservice;
	@Autowired
	EmployerService emservice;
	
	@RequestMapping(method=RequestMethod.GET,value="pxtype.do")
	public Object searchpxtype(){
		
		return "pxtype";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="pxrecord.do")
	public Object searchpxrecord(){
		
		return "pxrecord";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchtype.do")
	@ResponseBody
	public Object searchtype(TrainningType t){
		
		return tservice.search(t);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="updatetype.do")
	@ResponseBody
	public Object updatetype(TrainningType t){
		
		return tservice.update(t);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="addtype.do")
	@ResponseBody
	public Object addtype(TrainningType t){
		
		return tservice.add(t);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="deltype.do")
	@ResponseBody
	public Object deltype(int typeid){
		
		return tservice.del(typeid);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchrecord.do")
	@ResponseBody
	public Object searchrecord(TrainningRecord t){
		
		return rservice.search(t);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="recordend.do")
	@ResponseBody
	public Object recordend(HttpServletRequest request,HttpServletResponse response){
		String result = request.getParameter("result");
		String remark = request.getParameter("remark");
		int ygid = Integer.parseInt(request.getParameter("ygid"));
		EmployerFile epf = eservice.searchbyygid(ygid);
		String content = epf.getContent()+result+remark;
		epf.setContent(content);
		return eservice.updateforcontent(epf);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="recordadd.do")
	@ResponseBody
	public Object recordadd(TrainningRecord t,HttpServletRequest request) {
		String name = request.getParameter("name");
		Employer emp = emservice.serachidbyname(name);
		int ygid = emp.getId();
		t.setYgid(ygid);
		return rservice.add(t);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="delrecord.do")
	@ResponseBody
	public Object delrecord(int recordid) {
		return rservice.del(recordid);
	}
}
