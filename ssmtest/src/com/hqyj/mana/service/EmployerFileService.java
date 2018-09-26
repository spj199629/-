package com.hqyj.mana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mana.dao.EmployerFileMapper;
import com.hqyj.mana.pojo.Employer;
import com.hqyj.mana.pojo.EmployerFile;

@Service
public class EmployerFileService {

	@Autowired
	EmployerFileMapper empf;
	
	public List<EmployerFile> search(EmployerFile e){
		return empf.selectAll(e);
	}
	
	public boolean add(EmployerFile e){	
			if(empf.insertSelective(e)>0){
				return true;
			}
			return false;
	}
	
	public boolean del(int fileid) {
		if(empf.deleteByPrimaryKey(fileid)>0) {
			return true;
		}
		return false;
	}
	
	public boolean update(EmployerFile e) {
		if(empf.updateByPrimaryKey(e)>0) {
			return true;
		}
		return false;
	}
	
	public List<EmployerFile> searchbytypeid(int typeid){
		return empf.selectByTypeId(typeid);
	}
	
	public EmployerFile searchbyygid(int ygid){
		return empf.selectByYgId(ygid);
	}
	
	public boolean updateforcontent(EmployerFile record) {
		if(empf.updateforcontent(record)>0){
			return true;
		}
		return false;
	}
}