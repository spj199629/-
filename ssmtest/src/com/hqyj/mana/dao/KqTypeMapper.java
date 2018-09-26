package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.KqType;

public interface KqTypeMapper {
    int deleteByPrimaryKey(Integer typeid);

    int insert(KqType record);

    int insertSelective(KqType record);

    KqType selectByPrimaryKey(Integer typeid);

    int updateByPrimaryKeySelective(KqType record);

    int updateByPrimaryKey(KqType record);
    
    List<KqType> selectAll(KqType kt);
    
    
}