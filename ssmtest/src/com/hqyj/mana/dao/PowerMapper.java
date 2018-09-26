package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.Power;

public interface PowerMapper {
    int deleteByPrimaryKey(Integer pid);

    int insert(Power record);

    int insertSelective(Power record);

    Power selectByPrimaryKey(Integer pid);

    int updateByPrimaryKeySelective(Power record);

    int updateByPrimaryKey(Power record);
    
    String searchvaluebypid(int pid);
    
    int insertpowervalue(String value);
    
    List<String> selecthadpower(Integer rid);
    
    List<String> selectnothavepower(Integer rid);
    
    Integer selectpidbypower(String power);
}