package com.hqyj.mana.dao;

import java.util.List;

import com.hqyj.mana.pojo.EmployerFile;

public interface EmployerFileMapper {
    int deleteByPrimaryKey(Integer fileid);

    int insert(EmployerFile record);

    int insertSelective(EmployerFile record);

    EmployerFile selectByPrimaryKey(Integer fileid);

    int updateByPrimaryKeySelective(EmployerFile record);

    int updateByPrimaryKey(EmployerFile record);
    
    List<EmployerFile> selectAll(EmployerFile e);
    
    List<EmployerFile> selectByTypeId(int typeid);
    
    EmployerFile selectByYgId(int ygid);
    
    int updateforcontent(EmployerFile record);
}