package com.team.house.service;

import com.github.pagehelper.PageInfo;
import com.team.house.entity.District;
import com.team.house.entity.Street;
import com.team.house.util.Page;

import java.util.List;

public interface StreetService {
    /**
     * 街道查询 分页
     * @param page
     * @return
     */
    PageInfo<Street> getStreetBypage(Integer id,Page page);

    //添加
    int addStreet(Street street);

    //修改
    int updateStreet(Street street);

    //查询单条用于修改回显
    Street getStreet(Integer id);

    //删除
  int deleteStreet(Integer id);

    //批量删除
    int deleteMoreStreet(Integer[] ids);


    //加载区域下的街道
    List<Street> getStreetByDid(Integer id);

}
