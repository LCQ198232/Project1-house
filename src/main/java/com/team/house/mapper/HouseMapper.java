package com.team.house.mapper;

import com.team.house.entity.House;
import com.team.house.entity.HouseExample;
import com.team.house.util.HouseCondition;

import java.util.List;

public interface HouseMapper {
    int deleteByPrimaryKey(String id);

    int insert(House record);

    int insertSelective(House record);

    List<House> selectByExample(HouseExample example);

    House selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(House record);

    int updateByPrimaryKey(House record);

    List<House> getHouseByUid(Integer uid,Integer isdel);

    House getHouse(String id);

    //查询审核房屋
    List<House> getHouseByIsPass(HouseCondition condition);


    //查询浏览房屋信息
    List<House> getBroswerHouse(HouseCondition condition);
}