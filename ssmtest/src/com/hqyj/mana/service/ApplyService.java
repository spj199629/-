package com.hqyj.mana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mana.dao.ApplyMapper;
import com.hqyj.mana.pojo.Apply;

@Service
public class ApplyService {

	@Autowired
	ApplyMapper amap;
	
	public List<Apply> search(Apply a) {
		return amap.selectAll(a);
	}
	
	public boolean add(Apply a) {
		if(amap.insert(a)>0) {
			return true;
		}
		return false;
	}
	
	public boolean del(int aid) {
		if(amap.deleteByPrimaryKey(aid)>0) {
			return true;
		}
		return false;
	}
	
	public boolean update(Apply a) {
		if(amap.updateByPrimaryKey(a)>0) {
			return true;
		}
		return false;
	}
	
	public Apply searchbyapplyid(int applyid) {
		return amap.selectbyapplyid(applyid);
	}
}
