package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.EmployerHt;

public interface EmployerHtMapper {
    int deleteByPrimaryKey(Integer htid);

    int insert(EmployerHt record);

    int insertSelective(EmployerHt record);

    EmployerHt selectByPrimaryKey(Integer htid);

    int updateByPrimaryKeySelective(EmployerHt record);

    int updateByPrimaryKey(EmployerHt record);
    
    List<EmployerHt> selectAll(EmployerHt eht);
    
    List<EmployerHt> selectAllbyendtimedesc(EmployerHt eht);
    
    List<EmployerHt> selectAllbyendtimeasc(EmployerHt eht);
    
    EmployerHt selectbyname(String name);
    
}