package com.hqyj.mana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mana.dao.ScRecordMapper;
import com.hqyj.mana.pojo.ScRecord;

@Service
public class ScRecordService {
	
	@Autowired
	ScRecordMapper scm;
	public List<ScRecord> search(ScRecord sc){
		return scm.selectAll(sc);
	}
	public ScRecord searchbyygid(int ygid) {
		return scm.selectByPrimaryKey(ygid);
	}
	
	public boolean insert(ScRecord sc) {
		if(scm.insert(sc)>0) {
			return true;
		}
		return false;
	}
	
	public boolean del(int ygid) {
		if(scm.deleteByPrimaryKey(ygid)>0) {
			return true;
		}
		return false;
	}
	
	public boolean update(ScRecord sc) {
		if(scm.updateByPrimaryKey(sc)>0) {
			return true;
		}
		return false;
	}
	
	
}
