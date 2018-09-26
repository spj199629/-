package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.P_R_Rel;

public interface P_R_RelMapper {
    int deleteByPrimaryKey(Integer prid);

    int insert(P_R_Rel record);

    int insertSelective(P_R_Rel record);

    P_R_Rel selectByPrimaryKey(Integer prid);

    int updateByPrimaryKeySelective(P_R_Rel record);

    int updateByPrimaryKey(P_R_Rel record);
    
    List<Integer> searchpidbyrid(int rid);
    
    int insertbypid(P_R_Rel pr);
}