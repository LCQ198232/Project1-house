package com.team.house.mapper;

import com.team.house.entity.Street;
import com.team.house.entity.StreetExample;
import java.util.List;

public interface StreetMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Street record);

    int insertSelective(Street record);

    List<Street> selectByExample(StreetExample example);

    Street selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Street record);

    int updateByPrimaryKey(Street record);

    //通过区域删除街道
    int deleteStreetById(Integer did);

    //批量删除
    int deleteMoreStreet(Integer[] ids);
}