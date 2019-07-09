package com.team.house.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.house.entity.District;
import com.team.house.entity.Street;
import com.team.house.entity.StreetExample;
import com.team.house.mapper.DistrictMapper;
import com.team.house.mapper.StreetMapper;
import com.team.house.service.StreetService;
import com.team.house.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StreetServiceImpl implements StreetService {
    @Autowired
    private StreetMapper streetMapper;
    @Autowired
    private DistrictMapper districtMapper;

    @Override
    public PageInfo<Street> getStreetBypage(Integer id,Page page) {

        PageHelper.startPage(page.getPage(),page.getRows());
        StreetExample example=new StreetExample();
        StreetExample.Criteria criteria = example.createCriteria();
        criteria.andDistrictIdEqualTo(id);
        List<Street> streets = streetMapper.selectByExample(example);
        PageInfo<Street> info=new PageInfo<>(streets);
        return info;

    }
//添加
    @Override
    public int addStreet(Street street) {
        return streetMapper.insertSelective(street);
    }
//修改
    @Override
    public int updateStreet(Street street) {
        return streetMapper.updateByPrimaryKeySelective(street);
    }
//查询单条用于回显
    @Override
    public Street getStreet(Integer id) {
        return streetMapper.selectByPrimaryKey(id);
    }
//删除
    @Override
    public int deleteStreet(Integer id) {
        return streetMapper.deleteByPrimaryKey(id);
    }
//批量删除
    @Override
    public int deleteMoreStreet(Integer[] ids) {
        return streetMapper.deleteMoreStreet(ids);
    }

    //加载区域下的街道
    @Override
    public List<Street> getStreetByDid(Integer id) {
        StreetExample example=new StreetExample();
        StreetExample.Criteria criteria = example.createCriteria();
        criteria.andDistrictIdEqualTo(id);
        return streetMapper.selectByExample(example);
    }

}
