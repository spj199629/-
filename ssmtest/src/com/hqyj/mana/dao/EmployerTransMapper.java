package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.EmployerTrans;

public interface EmployerTransMapper {
    int deleteByPrimaryKey(Integer trid);

    int insert(EmployerTrans record);

    int insertSelective(EmployerTrans record);

    EmployerTrans selectByPrimaryKey(Integer trid);

    int updateByPrimaryKeySelective(EmployerTrans record);

    int updateByPrimaryKey(EmployerTrans record);
    
    List<EmployerTrans> selectAll();
}