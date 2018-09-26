package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.TrainningType;

public interface TrainningTypeMapper {
    int deleteByPrimaryKey(Integer typeid);

    int insert(TrainningType record);

    int insertSelective(TrainningType record);

    TrainningType selectByPrimaryKey(Integer typeid);

    int updateByPrimaryKeySelective(TrainningType record);

    int updateByPrimaryKey(TrainningType record);
    
    List<TrainningType> selectAll(TrainningType t);
    
}