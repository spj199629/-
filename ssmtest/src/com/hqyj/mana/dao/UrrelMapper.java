package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.Urrel;

public interface UrrelMapper {
    int deleteByPrimaryKey(Integer urid);

    int insert(Urrel record);

    int insertSelective(Urrel record);

    Urrel selectByPrimaryKey(Integer urid);

    int updateByPrimaryKeySelective(Urrel record);

    int updateByPrimaryKey(Urrel record);
    
    int searchbyusername(String username);
    
    List<Urrel> selectAll();
    
    int updatebyusername(Urrel r);
    
    int delbyusername(String username);
}