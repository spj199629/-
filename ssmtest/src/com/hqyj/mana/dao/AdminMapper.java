package com.hqyj.mana.dao;

import com.hqyj.mana.pojo.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(String username);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(String username);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
    
    /**
     * ��¼
     * @param a �����û�����������û�����
     * @return ����û���������������ȷ�ˣ����õ���������󣬷�֮�õ�����null
     */
    Admin login(Admin a);
    
}