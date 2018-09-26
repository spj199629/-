package com.hqyj.mana.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.hqyj.mana.dao.DpetMapper;
import com.hqyj.mana.dao.EmployerTransMapper;
import com.hqyj.mana.pojo.Dpet;
import com.hqyj.mana.pojo.EmployerTrans;

@Controller
public class AboutTransService {
	
	@Autowired
	DpetMapper dmap;
	@Autowired
	EmployerTransMapper emap;
	@Autowired
	HttpServletRequest request;
	
	public List<String> selectnewdept(String olddept){
		return dmap.selectnewdept(olddept);
	}
	
	public List<Dpet> selectAll(){
		return dmap.selectAll();
	}
	
	public List<EmployerTrans> selectAllt(){
		return emap.selectAll();
	}
	public boolean addtrans(EmployerTrans tr) {
		if(emap.insert(tr)>0) {
			return true;
		}
		return false;
	}
	
	public int getdepthadnumber(String deptname) {
		return dmap.selecthavenumber(deptname);
	}
	
	public Dpet searchbydeptname(String deptname) {
		return dmap.selectbydeptname(deptname);
	}
	
	public boolean updatedept(Dpet dept) {
		if(dmap.updateByPrimaryKey(dept)>0) {
			return true;
		}
		return false;
	}
	
	
}
