package com.hqyj.mana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mana.dao.RecruitMapper;
import com.hqyj.mana.dao.RecruitStatusMapper;
import com.hqyj.mana.pojo.Recruit;
import com.hqyj.mana.pojo.RecruitStatus;

@Service
public class RecruitService {
	
	@Autowired
	RecruitMapper rmap;
	@Autowired
	RecruitStatusMapper rsmap;
	
	public List<Recruit> search(Recruit e){
		return rmap.selectAll(e);
	}
	
	public boolean add(Recruit e) {
		if(rmap.insert(e)>0) {
			return true;
		}
		return false;
	}
	
	public boolean del(int applyid) {
		if(rmap.deleteByPrimaryKey(applyid)>0) {
			return true;
		}
		return false;
	}
	
	public List<RecruitStatus> search(RecruitStatus e){
		return rsmap.selectAll(e);
	}
}
