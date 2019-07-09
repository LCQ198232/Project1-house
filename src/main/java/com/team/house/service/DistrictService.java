package com.team.house.service;

import com.github.pagehelper.PageInfo;
import com.team.house.entity.District;
import com.team.house.util.Page;

import java.util.List;

public interface DistrictService {
    /**
     * 区域查询 分页
     * @param page
     * @return
     */
    PageInfo<District> getDistrictBypage(Page page);

    //添加
    int addDistrict(District district);

    //查询单条记录
    District getDistrict(Integer id);

    //修改
    int updateDistrict(District district);

    //批量删除
    int deleteDistrict(Integer[] ids);

    //删除单条
    int deleteDistrictById(Integer id);




    //加载区域下拉列表
    List<District> getDistrictList();

}
