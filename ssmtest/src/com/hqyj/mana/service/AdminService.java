package com.hqyj.mana.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.hqyj.mana.dao.AdminMapper;
import com.hqyj.mana.pojo.Admin;
/**
 * �û�����߼������࣬ʵ�ֵĹ����У���¼
 * @author wj
 *
 */
@Service
public class AdminService {
	
	//ע���û����������
	@Autowired
	AdminMapper adminMapper;
	
	//ע��request����
	
	@Autowired
	HttpServletRequest request;
	
	/**
	 * ajax��¼
	 * @param a
	 * @return ���������true��¼�ɹ�����֮ʧ��
	 */
	public boolean login(Admin a){
		Admin admin = adminMapper.login(a);
		if(admin!=null){
			//��ȡsession����
			HttpSession session =request.getSession();
			//�ѵ�¼�ɹ����û��������session��
			session.setAttribute("admin", admin);
			return true;
		}
		return false;
	}
	/**
	 * ����¼
	 * @param a
	 * @param map
	 * @return
	 */
	public String login(Admin a,ModelMap map){
			
			if(adminMapper.login(a)!=null){
				//��ȡsession���� 
				HttpSession session = request.getSession();
			
				//��session��ȡ����֤�벢�Һ��û��������֤����бȽ�
				if((session.getAttribute("valCode")+"").equalsIgnoreCase(a.getValCode())){
					
					//�洢�û���Ϣ��session��
					session.setAttribute("admin", a);
					session.setAttribute("username", a.getUsername());
					//
					return "index";
				}else{
					request.setAttribute("info", "��֤���������");
				}
			}else{
					request.setAttribute("info", "�˺Ż������������");
			}
			return "login";
		}

	/**
	 * �޸�
	 * @param a
	 * @return
	 */
	public boolean updatePwd(Admin a){
		if(adminMapper.updateByPrimaryKey(a)>0){
			return true;
		}
		return false;
	}
}
