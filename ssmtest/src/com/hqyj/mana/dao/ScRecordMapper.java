package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.ScRecord;

public interface ScRecordMapper {
    int deleteByPrimaryKey(Integer ygid);

    int insert(ScRecord record);

    int insertSelective(ScRecord record);

    ScRecord selectByPrimaryKey(Integer ygid);

    int updateByPrimaryKeySelective(ScRecord record);

    int updateByPrimaryKey(ScRecord record);
    
    List<ScRecord> selectAll(ScRecord sc);
}