package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.TrainningRecord;

public interface TrainningRecordMapper {
    int deleteByPrimaryKey(Integer recordid);

    int insert(TrainningRecord record);

    int insertSelective(TrainningRecord record);

    TrainningRecord selectByPrimaryKey(Integer recordid);

    int updateByPrimaryKeySelective(TrainningRecord record);

    int updateByPrimaryKey(TrainningRecord record);
    
    List<TrainningRecord> selectAll(TrainningRecord t);
}