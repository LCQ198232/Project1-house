package com.team.house.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.house.entity.Users;
import com.team.house.entity.UsersExample;
import com.team.house.mapper.UsersMapper;
import com.team.house.service.UserService;
import com.team.house.util.MD5Utils;
import com.team.house.util.UserCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UsersMapper usersMapper;

    @Override
    public PageInfo<Users> getUserByPage(UserCondition condition) {
        PageHelper.startPage(condition.getPage(), condition.getRows());

        UsersExample example = new UsersExample();
        UsersExample.Criteria criteria = example.createCriteria();

        if (condition.getName() != null) {
            criteria.andNameLike("%" + condition.getName() + "%");
        }
        if (condition.getTelephone() != null) {
            criteria.andTelephoneLike("%" + condition.getTelephone() + "%");
        }

        List<Users> users = usersMapper.selectByExample(example);
        PageInfo<Users> info = new PageInfo<>(users);
        return info;
    }

    @Override
    public Users getSingleUser(Integer id) {
        return usersMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateUser(Users users) {
        return usersMapper.updateByPrimaryKeySelective(users);
    }

    @Override
    public int deleteMoreUser(Integer[] ids) {
        return usersMapper.deleteMoreUser(ids);
    }

    @Override
    public int deleteUser(Integer id) {
        return usersMapper.deleteByPrimaryKey(id);
    }

    //登录验证
    @Override
    public Users getUser(String name) {
        UsersExample example = new UsersExample();
        UsersExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(name);
        List<Users> list = usersMapper.selectByExample(example);
        if (list.size() == 0) {
            return null;
        } else {
            return list.get(0);
        }
    }

    //注册用户
    @Override
    public int insertUser(Users users) {

        if (users.getIsadmin() == 0) {
            //设置为注册用户
            users.setIsadmin(0);
            //密码加密 进行md5加密:确保数据的安全性
            String password = MD5Utils.md5Encrypt(users.getPassword());

            users.setPassword(password);
            return usersMapper.insertSelective(users);
        } else {
            //设置为注册用户
            users.setIsadmin(1);
            //密码加密 进行md5加密:确保数据的安全性
            String password = MD5Utils.md5Encrypt(users.getPassword());

            users.setPassword(password);
            return usersMapper.insertSelective(users);
        }

    }

    //注册验证
    @Override
    public int checkName(String name, Integer isadmin) {
        UsersExample example = new UsersExample();
        UsersExample.Criteria criteria = example.createCriteria();
        if (isadmin == 0) {
            criteria.andIsadminEqualTo(0);//表示前台普通用户
            criteria.andNameEqualTo(name);
            List<Users> list = usersMapper.selectByExample(example);
            return list.size();
        } else {
            criteria.andIsadminEqualTo(1);//表示后台管理员用户
            criteria.andNameEqualTo(name);
            List<Users> list = usersMapper.selectByExample(example);
            return list.size();
        }

    }
}
