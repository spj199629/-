package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.RecruitStatus;

public interface RecruitStatusMapper {
    int deleteByPrimaryKey(Integer statusid);

    int insert(RecruitStatus record);

    int insertSelective(RecruitStatus record);

    RecruitStatus selectByPrimaryKey(Integer statusid);

    int updateByPrimaryKeySelective(RecruitStatus record);

    int updateByPrimaryKey(RecruitStatus record);
    
    List<RecruitStatus> selectAll(RecruitStatus e);
}