package com.hqyj.mana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mana.dao.KaoQinRecordMapper;
import com.hqyj.mana.dao.KqTypeMapper;
import com.hqyj.mana.pojo.KaoQinRecord;
import com.hqyj.mana.pojo.KqType;

@Service
public class KqService {
	
	@Autowired
	KaoQinRecordMapper kqmap;
	@Autowired
	KqTypeMapper ktmap;
	
	public List<KaoQinRecord> search(KaoQinRecord kq){
		return kqmap.selectAll(kq);
	}
	
	public List<KaoQinRecord> searchbyygid(int ygid){
		return kqmap.selectByYgid(ygid);
	}
	
	public List<KaoQinRecord> searchbytype(String type){
		return kqmap.selectByType(type);
	}
	
	public List<KqType> searchtype(KqType kt){
		return ktmap.selectAll(kt);
	}
	
	public List<Integer> searchjcmoneybyygid(int ygid){
		return kqmap.selectjcmoneybyid(ygid);
	}
	
	public boolean update(KaoQinRecord e) {
		if(kqmap.updateByPrimaryKeySelective(e)>0) {
			return true;
		}
		return false;
	}
	
	public KaoQinRecord searchbyrecordid(int recordid) {
		return kqmap.selectByPrimaryKey(recordid);
	}
	
	public boolean add(KaoQinRecord e) {
		if(kqmap.insert(e)>0) {
			return true;
		}
		return false;
	}
}
