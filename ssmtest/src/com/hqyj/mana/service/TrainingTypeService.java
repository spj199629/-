package com.hqyj.mana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mana.dao.TrainningTypeMapper;
import com.hqyj.mana.pojo.TrainningType;

@Service
public class TrainingTypeService {
	
	@Autowired
	TrainningTypeMapper tt;
	
	public List<TrainningType> search(TrainningType t){
		return tt.selectAll(t);
	}
	
	public boolean update(TrainningType t) {
		if(tt.updateByPrimaryKey(t)>0) {
			return true;
		}
		return false;
	}
	
	public boolean add(TrainningType t) {
		if(tt.insert(t)>0){
			return true;
		}
		return false;
	}
	
	public boolean del(int typeid) {
		if(tt.deleteByPrimaryKey(typeid)>0){
			return true;
		}
		return false;
	}
}
