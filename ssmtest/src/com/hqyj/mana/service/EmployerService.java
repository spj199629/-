package com.hqyj.mana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mana.dao.EmployerMapper;
import com.hqyj.mana.pojo.Employer;
import com.hqyj.mana.pojo.EmployerHt;

@Service
public class EmployerService {

	@Autowired
	EmployerMapper emp;
	//��ѯ����
	public List<Employer> search(Employer e){
		if(e.getName()!=null&&!e.getName().equals("")){
			e.setName("%"+e.getName()+"%");
		}
		
		return emp.selectAll(e);
	}
	public Employer searchbyid(int ygid) {
		return emp.selectByPrimaryKey(ygid);
	}
	
	/**
	 * ����
	 * @param e
	 * @return
	 */
	public boolean add(Employer e){
		
		if(emp.insertSelective(e)>0){
			return true;
		}
		return false;
	}
	/**
	 * �޸�
	 * @param e
	 * @return
	 */
	public boolean update(Employer e){
		if(emp.updateByPrimaryKeySelective(e)>0){
			return true;
		}
		return false;
	}
	/**
	 * ɾ��
	 * @param id
	 * @return
	 */
	public boolean del(int id){
		if(emp.deleteByPrimaryKey(id)>0){
			return true;
		}
		return false;
	}
	
	public Employer serachidbyname(String name) {
		return emp.selectByName(name);
		
	}
	
	public List<Employer> searchdesc(Employer e){
		return emp.selectAllbytimedesc(e);
	}
	
	public List<Employer> searchasc(Employer e){
		return emp.selectAllbytimeasc(e);
	}
	
}
