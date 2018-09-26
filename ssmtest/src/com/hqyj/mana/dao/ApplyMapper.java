package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.Apply;

public interface ApplyMapper {
    int deleteByPrimaryKey(Integer aid);

    int insert(Apply record);

    int insertSelective(Apply record);

    Apply selectByPrimaryKey(Integer aid);

    int updateByPrimaryKeySelective(Apply record);

    int updateByPrimaryKey(Apply record);
    
    List<Apply> selectAll(Apply a);
    
    Apply selectbyapplyid(int applyid);
}