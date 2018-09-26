package com.hqyj.mana.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.mana.pojo.Apply;
import com.hqyj.mana.service.ApplyService;

@Controller
public class ApplyController {

	@Autowired
	ApplyService aservice;
	
	@RequestMapping(method=RequestMethod.GET,value="yprecord.do")
	public Object apply() {
		return "yprecord";
	}
	@RequestMapping(method=RequestMethod.GET,value="searchapply.do")
	@ResponseBody
	public Object searchapply(Apply a){
		return aservice.search(a);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="addapply.do")
	@ResponseBody
	public Object addapply(Apply a) {
		return aservice.add(a);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="delapply.do")
	@ResponseBody
	public Object delapply(int aid) {
		return aservice.del(aid);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="updateapply.do")
	@ResponseBody
	public Object updateapply(Apply a) {
		return aservice.update(a);
	}
}
