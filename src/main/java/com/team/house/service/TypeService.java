package com.team.house.service;

import com.github.pagehelper.PageInfo;
import com.team.house.entity.Type;
import com.team.house.util.Page;

import java.util.List;

public interface TypeService {
    /**
     * 类型查询 分页
     * @param page
     * @return
     */
    PageInfo<Type> getTypeByPage(Page page);

    //添加
    int addType(Type type);

    //查询单条
    Type getSingleType(Integer id);

    //修改
    int updateType(Type type);

    //删除
    int deleteType(Integer id);

    //批量删除
    int deleteMoreType(Integer[] ids);

    //加载下拉列表  查询所有房屋类型
    List<Type> getAllType();
}
