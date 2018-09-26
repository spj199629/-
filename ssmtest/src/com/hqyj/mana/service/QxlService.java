package com.hqyj.mana.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hqyj.mana.dao.AdminMapper;
import com.hqyj.mana.dao.P_R_RelMapper;
import com.hqyj.mana.dao.PowerMapper;
import com.hqyj.mana.dao.RoleMapper;
import com.hqyj.mana.dao.UrrelMapper;
import com.hqyj.mana.pojo.P_R_Rel;
import com.hqyj.mana.pojo.Role;
import com.hqyj.mana.pojo.Urrel;

@Service
public class QxlService {
	
	@Autowired
	UrrelMapper umap;
	@Autowired
	P_R_RelMapper pmap;
	@Autowired
	PowerMapper wmap;
	@Autowired
	RoleMapper rmap;
	@Autowired
	AdminMapper amap;
	@Autowired
	HttpSession session;
	
	public int searchbyusername(String username) {
		return umap.searchbyusername(username);
	}
	
	public List<Integer> searchpidbyrid(int rid){
		return pmap.searchpidbyrid(rid);
	}
	
	public String searchvaluebypid(int pid) {
		return wmap.searchvaluebypid(pid);
	}
	
	public boolean add(String value) {
		if(wmap.insertpowervalue(value)>0) {
			return true;
		}
		return false;
	}
	
	public List<Urrel> searchurrel(){
		return umap.selectAll();
	}
	
	public List<Role> searchrole(){
		return rmap.selectAll();
	}
	
	public boolean addrole(Role r) {
		if(rmap.insert(r)>0) {
			return true;
		}
		return false;
	}
	
	public boolean updatebyusername(Urrel r) {
		if(umap.updatebyusername(r)>0) {
			return true;
		}
		return false;
	}
	
	public boolean deluser(String username) {
		if(umap.delbyusername(username)>0&&amap.deleteByPrimaryKey(username)>0) {
			return true;
		}
		return false;
	}
	
	public boolean delrole(int rid) {
		if(rmap.deleteByPrimaryKey(rid)>0) {
			return true;
		}
		return false;
	}
	
	public List<String> searchhadpower(int rid){
		return wmap.selecthadpower(rid);
	}
	
	public List<String> searchnothavepower(int rid){
		return wmap.selectnothavepower(rid);
	}
	
	public boolean insertpower(String power) {
		try {
			int pid = wmap.selectpidbypower(power);

			int rid = (Integer)session.getAttribute("rid");
			P_R_Rel pr = new P_R_Rel();
			pr.setPid(pid);
			pr.setRid(rid);
			System.out.println(rid);
			if(pmap.insertbypid(pr)>0) {
				return true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
}
