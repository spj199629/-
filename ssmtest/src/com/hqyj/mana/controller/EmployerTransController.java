package com.hqyj.mana.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.mana.pojo.Dpet;
import com.hqyj.mana.pojo.Employer;
import com.hqyj.mana.pojo.EmployerTrans;
import com.hqyj.mana.service.AboutTransService;
import com.hqyj.mana.service.EmployerService;

@Controller	
public class EmployerTransController {

	@Autowired
	AboutTransService tservice;
	@Autowired
	HttpServletRequest request;
	@Autowired
	EmployerService eservice;
	@RequestMapping(method=RequestMethod.GET,value="employerInfo.do")
	public Object employerInfo(){
			
		return "employerinfo";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="employertransrecord.do")
	public Object employertransrecord(){
		return "employertransrecord";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="deptinfo.do")
	public Object deptinfo(){
			
		return "deptinfo";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchnewdept.do")
	@ResponseBody
	public Object search(String olddept) {
		return tservice.selectnewdept(olddept);
	}
	
	
	
	@RequestMapping(method=RequestMethod.GET,value="searchdeptinfo.do")
	@ResponseBody
	public Object search() {
		return tservice.selectAll();
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchtrans.do")
	@ResponseBody
	public Object searchtrans() {
		return tservice.selectAllt();
	}
	
	@RequestMapping(method=RequestMethod.GET,value="trans.do")
	@ResponseBody
	public Object trans() {
		String olddeptname = request.getParameter("olddept");
		String deptname = request.getParameter("deptname");
		String transreason = request.getParameter("transreason");
		String transtime = request.getParameter("transtime");
		int ygid = Integer.parseInt(request.getParameter("ygid"));
		Dpet transdept = tservice.searchbydeptname(deptname);
		if(transdept.getQynumber()==0) {
			return false;
		}
		Employer e = eservice.searchbyid(ygid);
		e.setDep(deptname);
		EmployerTrans tr = new EmployerTrans(null,ygid,olddeptname,deptname,transtime,transreason);
		tservice.addtrans(tr);
		Dpet olddept = tservice.searchbydeptname(olddeptname);
		int transdeptqy = transdept.getQynumber()-1;
		int olddeptqy = olddept.getQynumber()+1;
		transdept.setQynumber(transdeptqy);
		olddept.setQynumber(olddeptqy);
		if(tservice.updatedept(olddept)&&tservice.updatedept(transdept)&&eservice.update(e)) {
			return true;
		}
		return false;
	}
}
