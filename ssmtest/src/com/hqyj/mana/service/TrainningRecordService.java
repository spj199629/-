package com.hqyj.mana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mana.dao.TrainningRecordMapper;
import com.hqyj.mana.pojo.TrainningRecord;

@Service
public class TrainningRecordService {
	
	@Autowired
	TrainningRecordMapper rmp;
	public List<TrainningRecord> search(TrainningRecord t){
		return rmp.selectAll(t);
	}
	
	public boolean add(TrainningRecord t) {
		if(rmp.insertSelective(t)>0) {
			return true;
		}
		return false;
	}
	
	public boolean del(int recordid) {
		if(rmp.deleteByPrimaryKey(recordid)>0) {
			return true;
		}
		return false;
	}
}
