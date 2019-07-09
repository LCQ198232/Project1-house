package com.team.house.service;

import com.github.pagehelper.PageInfo;
import com.team.house.entity.House;
import com.team.house.util.HouseCondition;
import com.team.house.util.Page;

import java.util.List;

public interface HouseService {


    //发布房屋数据  添加房屋
    int insertHouse(House house);

    //查询房屋信息
    PageInfo<House> getHouseByuId(Integer id, Page page,Integer isdel);

    //通过主键id查询房屋信息用于修改的回显
    House getHouse(String id);

    //修改房屋信息
    int updateHouse(House house);

    //删除房屋(逻辑删除)
    int delHouse(String id,Integer isdel);

    //查询房屋审核信息
    PageInfo<House> getHouseByIsPass(HouseCondition condition);


    //查询浏览房屋信息
    PageInfo<House> getBroswerHouse(HouseCondition condition);
}
