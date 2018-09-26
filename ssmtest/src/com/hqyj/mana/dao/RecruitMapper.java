package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.Recruit;

public interface RecruitMapper {
    int deleteByPrimaryKey(Integer applyid);

    int insert(Recruit record);

    int insertSelective(Recruit record);

    Recruit selectByPrimaryKey(Integer applyid);

    int updateByPrimaryKeySelective(Recruit record);

    int updateByPrimaryKey(Recruit record);
    
    List<Recruit> selectAll(Recruit e);
}