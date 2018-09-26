package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.Dpet;

public interface DpetMapper {
    int deleteByPrimaryKey(Integer deptid);

    int insert(Dpet record);

    int insertSelective(Dpet record);

    Dpet selectByPrimaryKey(Integer deptid);

    int updateByPrimaryKeySelective(Dpet record);

    int updateByPrimaryKey(Dpet record);
    
    int updateqynumber(String deptname);
    
    List<String> selectnewdept(String olddept);
    
    List<Dpet> selectAll();
    
    int selectdeptnumber(String deptname);
     
    int updateqynumber(Integer qynumber);
    
    int selecthavenumber(String dept);
    
    int selectdeptqynumber(String deptname);
    
    Dpet selectbydeptname(String deptname);
}