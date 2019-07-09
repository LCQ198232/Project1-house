package com.team.house.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.house.entity.House;
import com.team.house.entity.HouseExample;
import com.team.house.entity.Street;
import com.team.house.entity.StreetExample;
import com.team.house.mapper.HouseMapper;
import com.team.house.mapper.StreetMapper;
import com.team.house.service.HouseService;
import com.team.house.util.HouseCondition;
import com.team.house.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class HouseServiceImpl implements HouseService {

    @Autowired
    private HouseMapper houseMapper;
    @Autowired
    private StreetMapper streetMapper;


    @Override
    public int insertHouse(House house) {
        return houseMapper.insertSelective(house);
    }

    //查询房屋信息
    @Override
    public PageInfo<House> getHouseByuId(Integer id, Page page, Integer isdel) {
        PageHelper.startPage(page.getPage(), page.getRows());
        List<House> houses = houseMapper.getHouseByUid(id, isdel);
        System.out.println(houses);//isdel查询删除与未删除的房屋
        return new PageInfo<House>(houses);
    }

    @Override
    public House getHouse(String id) {
        return houseMapper.getHouse(id);
    }

    @Override
    public int updateHouse(House house) {
        return houseMapper.updateByPrimaryKeySelective(house);
    }


    //逻辑删除房屋
    @Override
    public int delHouse(String id, Integer isdel) {
        House house = new House();
        house.setId(id);
        house.setIsdel(isdel);
        return houseMapper.updateByPrimaryKeySelective(house);
    }

    //查询审核房屋信息(加入带条件查询)
    @Override
    public PageInfo<House> getHouseByIsPass(HouseCondition condition) {

         PageHelper.startPage(condition.getPage(), condition.getRows());

        List<House> list= houseMapper.getHouseByIsPass(condition);
        return new PageInfo<House>(list);
    }

    @Override
    public PageInfo<House> getBroswerHouse(HouseCondition condition) {
        PageHelper.startPage(condition.getPage(), condition.getRows());

        List<House> list= houseMapper.getBroswerHouse(condition);
        return new PageInfo<House>(list);

    }



}
