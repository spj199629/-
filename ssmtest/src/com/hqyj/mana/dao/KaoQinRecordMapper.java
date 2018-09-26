package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.KaoQinRecord;

public interface KaoQinRecordMapper {
    int deleteByPrimaryKey(Integer recordid);

    int insert(KaoQinRecord record);

    int insertSelective(KaoQinRecord record);

    KaoQinRecord selectByPrimaryKey(Integer recordid);

    int updateByPrimaryKeySelective(KaoQinRecord record);

    int updateByPrimaryKey(KaoQinRecord record);
    
    List<KaoQinRecord> selectAll(KaoQinRecord record);
    
    List<KaoQinRecord> selectByType(String type);
    
    List<KaoQinRecord> selectByYgid (int ygid);
    
    List<Integer> selectjcmoneybyid(int ygid);
    
}