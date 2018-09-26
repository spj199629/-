package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.Employer;
import com.hqyj.mana.pojo.EmployerHt;

public interface EmployerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Employer record);

    int insertSelective(Employer record);

    Employer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Employer record);

    int updateByPrimaryKey(Employer record);
    
    List<Employer> selectAll(Employer e);
    
    Employer selectByName(String name);
    
    List<Employer> selectAllbytimedesc(Employer e);
    
    List<Employer> selectAllbytimeasc(Employer e);
}