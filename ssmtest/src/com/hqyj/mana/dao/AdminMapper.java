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
     * 登录
     * @param a 输入用户名和密码的用户对象
     * @return 如果用户名和密码输入正确了，就拿到了这个对象，反之得到就是null
     */
    Admin login(Admin a);
    
}