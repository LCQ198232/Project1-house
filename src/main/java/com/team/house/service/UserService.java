package com.team.house.service;

import com.github.pagehelper.PageInfo;
import com.team.house.entity.Users;
import com.team.house.util.UserCondition;

public interface UserService {
    //带条件查询用户信息
    PageInfo<Users> getUserByPage(UserCondition condition);

    //注册(添加)
    int insertUser(Users users);

    //做验证 用户名验证
    int checkName(String name,Integer isadmin);

    //做登录验证(前台登录操作)
    Users getUser(String name);




    //查询单条
    Users getSingleUser(Integer id);

    //修改
    int updateUser(Users users);

    //批量删除
    int deleteMoreUser(Integer[] ids);

    //删除单条
    int deleteUser(Integer id);



}
