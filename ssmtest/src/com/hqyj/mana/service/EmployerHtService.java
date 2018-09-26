package com.hqyj.mana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mana.dao.EmployerFileMapper;
import com.hqyj.mana.dao.EmployerHtMapper;
import com.hqyj.mana.pojo.EmployerHt;

@Service
public class EmployerHtService {

		@Autowired
		EmployerHtMapper ehm;
		
		public List<EmployerHt> search(EmployerHt eht){
			return ehm.selectAll(eht);
		}
		
		public List<EmployerHt> searchdesc(EmployerHt eht){
			return ehm.selectAllbyendtimedesc(eht);
		}
		
		public List<EmployerHt> searchasc(EmployerHt eht){
			return ehm.selectAllbyendtimeasc(eht);
		}
		
		public boolean delbyhtid(int htid) {
			if(ehm.deleteByPrimaryKey(htid)>0) {
				return true;
			}
			return false;
		}
		
		public boolean add(EmployerHt e) {
			if(ehm.insert(e)>0) {
				return true;
			}
			return false;
		}
		
		public boolean update(EmployerHt e) {
			if(ehm.updateByPrimaryKey(e)>0) {
				return true;
			}
			return false;
		}
		
		public EmployerHt serachbyname(String name) {
			return ehm.selectbyname(name);
		}
}
