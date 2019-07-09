package com.team.house.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.house.entity.Type;
import com.team.house.entity.TypeExample;
import com.team.house.mapper.TypeMapper;
import com.team.house.service.TypeService;
import com.team.house.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {

    @Autowired
    private TypeMapper typeMapper;

    @Override
    public PageInfo<Type> getTypeByPage(Page page) {

        PageHelper.startPage(page.getPage(),page.getRows());
        TypeExample example=new TypeExample();
        List<Type> types = typeMapper.selectByExample(example);
        PageInfo<Type> info=new PageInfo<>(types);

        return info;
    }
   //添加
    @Override
    public int addType(Type type) {
        return typeMapper.insertSelective(type);
    }
//查询单条用于修改的回显
    @Override
    public Type getSingleType(Integer id) {
        return typeMapper.selectByPrimaryKey(id);
    }
//修改
    @Override
    public int updateType(Type type) {
        return typeMapper.updateByPrimaryKeySelective(type);
    }
    //删除
    @Override
    public int deleteType(Integer id) {
        return typeMapper.deleteByPrimaryKey(id);
    }
//批量删除
    @Override
    public int deleteMoreType(Integer[] ids) {
        return typeMapper.deleteMoreType(ids);
    }

    //加载房屋类型下拉列表
    @Override
    public List<Type> getAllType() {
        TypeExample example=new TypeExample();
        return typeMapper.selectByExample(example);
    }


}
