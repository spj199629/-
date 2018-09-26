package com.hqyj.mana.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.mana.pojo.KaoQinRecord;
import com.hqyj.mana.pojo.ScRecord;
import com.hqyj.mana.service.KqService;
import com.hqyj.mana.service.ScRecordService;

@Controller
public class ScRecordController {
	
	@Autowired
	KqService kservice;
	@Autowired
	ScRecordService cservice;
	@RequestMapping(method=RequestMethod.GET,value="xsrecord.do")
	public Object searchxsrecord(){
		return "xsrecord";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="searchscrecord.do")
	@ResponseBody
	public Object searchscrecord(ScRecord sc){
		return cservice.search(sc);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="addscrecord.do")
	@ResponseBody
	public Object addscrecord(HttpServletRequest request,HttpServletResponse response) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
		int ygid = Integer.parseInt(request.getParameter("ygid"));
		int basepay = Integer.parseInt(request.getParameter("basepay"));
		int meritpay = Integer.parseInt(request.getParameter("meritpay"));
		String sendtime = request.getParameter("sendtime");
		List<KaoQinRecord> kq = kservice.searchbyygid(ygid);
		ScRecord sc = new ScRecord(ygid,basepay,meritpay,0,0,0,sendtime);
		int money = 0;
		int reward = 0;
		int fkpay = 0;
		for(int i=0;i<kq.size();i++) {
			KaoQinRecord kqr = kq.get(i);	
			try {
				if(df.parse(kqr.getRecordtime()).getTime()<df.parse(sendtime).getTime()&&df.parse(kqr.getRecordtime()).getMonth()==df.parse(sendtime).getMonth()) {
					money=kqr.getJcmoney();
					if(money>0) {
						reward+=money;
					}else {
						fkpay+=money;
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}

		int scnumber = sc.getBasepay()+sc.getMeritpay()+reward+fkpay;
		sc.setFkpay(fkpay);
		sc.setReward(reward);
		sc.setScnumber(scnumber);
		return cservice.insert(sc);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="delscrecord.do")
	@ResponseBody
	public Object delscrecord(int ygid) {
		return cservice.del(ygid);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="updatescrecord.do")
	@ResponseBody
	public Object updatescrecord(HttpServletRequest request,HttpServletResponse response) {
		int ygid = Integer.parseInt(request.getParameter("ygid"));
		int basepay = Integer.parseInt(request.getParameter("basepay"));
		int meritpay = Integer.parseInt(request.getParameter("meritpay"));
		String sendtime = request.getParameter("sendtime");
		ScRecord sc = cservice.searchbyygid(ygid);
		int basepaychange = basepay-sc.getBasepay();
		int meritpaychange = meritpay-sc.getMeritpay();
		int newscnumber = sc.getScnumber()+basepaychange+meritpaychange;
		sc.setBasepay(basepay);
		sc.setSendtime(sendtime);
		sc.setMeritpay(meritpay);
		sc.setScnumber(newscnumber);
		return cservice.update(sc);
	}
}
