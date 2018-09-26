package com.hqyj.mana.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.mana.pojo.Apply;
import com.hqyj.mana.pojo.Recruit;
import com.hqyj.mana.pojo.RecruitStatus;
import com.hqyj.mana.service.ApplyService;
import com.hqyj.mana.service.RecruitService;

@Controller
public class RecruitController {
	
	@Autowired
	RecruitService rservice;
	@Autowired
	ApplyService aservice;

	@RequestMapping(method=RequestMethod.GET,value="zprecord.do")
//	@ResponseBody
	public Object zprecord() {
		return "zprecord";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchzp.do")
	@ResponseBody
	public Object searchzp(Recruit e){
		return rservice.search(e);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchstatus.do")
	@ResponseBody
	public Object searchstatus(RecruitStatus e){
		return rservice.search(e);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="addzp.do")
	@ResponseBody
	public Object addzp(Recruit e) {
		return rservice.add(e);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchbyapplyid.do")
	@ResponseBody
	public Object searchbyapplyid(int applyid) {
		return aservice.searchbyapplyid(applyid);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="delzp.do")
	@ResponseBody
	public Object delzp(int applyid) {
		return rservice.del(applyid);
	}
}
