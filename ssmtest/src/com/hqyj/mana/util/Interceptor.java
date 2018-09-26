package com.hqyj.mana.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hqyj.mana.pojo.Admin;
import com.hqyj.mana.service.QxlService;


/**
 * spring aopÀ¹½ØÆ÷
 * 
 * @author wj
 *
 */
@Component
@Aspect
public class Interceptor {

	 @Autowired
	 HttpServletRequest request;
	 @Autowired
	 QxlService qxservice;
	 	
	    @Around("within(com.hqyj.mana.controller..*)&&!within(com.hqyj.mana.controller.LoginController)")
	    public Object trackInfo(ProceedingJoinPoint pjp) throws Throwable {
	 
	    	HttpSession session = request.getSession();
	    	String username = session.getAttribute("username").toString();
	    	System.out.println(username);
	    	System.out.println("À¹½ØµÄ·½·¨£º"+pjp.getSignature().getName());
	    	int rid;
			rid = qxservice.searchbyusername(username);
			if(rid==1) {
				return pjp.proceed();
			}else {
				List<Integer> pidlist = qxservice.searchpidbyrid(rid);
				int pid = 0;
			    String value = null;
			    List<String> valuelist = new ArrayList<String>();
			    for(int i=0;i<pidlist.size();i++) {		
			    	pid = pidlist.get(i);
			    	value = qxservice.searchvaluebypid(pid);
			    	valuelist.add(value);
			    }
			    if(valuelist.contains(pjp.getSignature().getName())){	    		
			    	 return pjp.proceed();
			    }
			}   	
			return "pmt";   	    
	    }

}  