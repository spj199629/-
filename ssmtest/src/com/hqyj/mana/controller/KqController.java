package com.hqyj.mana.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.mana.pojo.KaoQinRecord;
import com.hqyj.mana.pojo.KqType;
import com.hqyj.mana.pojo.ScRecord;
import com.hqyj.mana.service.KqService;
import com.hqyj.mana.service.ScRecordService;

@Controller
public class KqController {
	
	@Autowired
	KqService kservice;
	@Autowired
	ScRecordService cservice;
	
	@RequestMapping(method=RequestMethod.GET,value="kqrecord.do")
	public Object searchkqrecord(){
		
		return "kqrecord";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchkq.do")
	@ResponseBody
	public Object searchkq(KaoQinRecord kq){
		return kservice.search(kq);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchkqbyygid.do")
	@ResponseBody
	public Object searchbyygid(int ygid){
		return kservice.searchbyygid(ygid);
	} 
	
	@RequestMapping(method=RequestMethod.GET,value="searchkqbytype.do")
	@ResponseBody
	public Object searchbytype(String type){
		return kservice.searchbytype(type);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchkqtype.do")
	@ResponseBody
	public Object searchkqtype(KqType kt){
		return kservice.searchtype(kt);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="updatekq.do")
	@ResponseBody
	public Object updatekq(HttpServletRequest request,HttpServletResponse response){
		int recordid = Integer.parseInt(request.getParameter("recordid"));
		int jcmoney = Integer.parseInt(request.getParameter("jcmoney"));
		int ygid = Integer.parseInt(request.getParameter("ygid"));
		KaoQinRecord kq = kservice.searchbyrecordid(recordid);
		ScRecord sc = cservice.searchbyygid(ygid);
		int oldjcmoney = kq.getJcmoney();
		kq.setJcmoney(jcmoney);
		int changemoney = jcmoney-oldjcmoney;
		if(jcmoney>0&&oldjcmoney>0) {
			sc.setReward(sc.getReward()+changemoney);
		}else if(jcmoney>0&&oldjcmoney<0) {
			sc.setReward(sc.getReward()+jcmoney);
			sc.setFkpay(sc.getFkpay()-oldjcmoney);
		}else if(jcmoney<0&&oldjcmoney<0) {
			sc.setFkpay(sc.getFkpay()+changemoney);
		}else {
			sc.setReward(sc.getReward()-oldjcmoney);
			sc.setFkpay(sc.getFkpay()+jcmoney);
		}

		int newnumber = sc.getScnumber()+changemoney;
		
		sc.setScnumber(newnumber);
		if(kservice.update(kq)&&cservice.update(sc)) {
			return true;
		}
		return false;
	}
	
	@RequestMapping(method=RequestMethod.GET,value="addkq.do")
	@ResponseBody
	public Object addkq(HttpServletRequest request,HttpServletResponse response) {
		int jcmoney = Integer.parseInt(request.getParameter("jcmoney"));
		int ygid = Integer.parseInt(request.getParameter("ygid"));
		String type = request.getParameter("recordtype");
		String recordtime = request.getParameter("recordtime");
		KaoQinRecord kq = new KaoQinRecord(null,ygid,type,jcmoney,recordtime);
		ScRecord sc = cservice.searchbyygid(ygid);
		if(jcmoney>0) {
			sc.setReward(sc.getReward()+jcmoney);
		}else {
			sc.setFkpay(sc.getFkpay()+jcmoney);
		}
		sc.setScnumber(sc.getScnumber()+jcmoney);
		if(kservice.add(kq)&&cservice.update(sc)) {
			return true;
		}
		return false;
	}
}
