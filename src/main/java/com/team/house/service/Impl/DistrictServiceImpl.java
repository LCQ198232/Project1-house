package com.team.house.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.house.entity.District;
import com.team.house.entity.DistrictExample;
import com.team.house.mapper.DistrictMapper;
import com.team.house.mapper.StreetMapper;
import com.team.house.service.DistrictService;
import com.team.house.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

@Service
public class DistrictServiceImpl implements DistrictService {

    @Autowired
    private DistrictMapper districtMapper;
    @Autowired
    private StreetMapper streetMapper;

    @Override
    public PageInfo<District> getDistrictBypage(Page page) {

        //pagehelper
        PageHelper.startPage(page.getPage(),page.getRows());
        //list
        DistrictExample example=new DistrictExample();
        List<District> districts = districtMapper.selectByExample(example);
        //pageinfo
        PageInfo<District> info=new PageInfo<>(districts);

        return info;
    }

    @Override
    public int addDistrict(District district) {
        return districtMapper.insertSelective(district);
    }

    @Override
    public District getDistrict(Integer id) {
        return districtMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateDistrict(District district) {
        return districtMapper.updateByPrimaryKeySelective(district);
    }

    @Override
    @Transactional //添加事务支持
    public int deleteDistrict(Integer[] ids) {
        DistrictExample example=new DistrictExample();
        DistrictExample.Criteria criteria = example.createCriteria();
        List<Integer> list = Arrays.asList(ids);
        criteria.andIdIn(list);
        //批量删除街道
        streetMapper.deleteMoreStreet(ids);
        //批量删除区域
        districtMapper.deleteByExample(example);
        return 1;
    }

    @Override
    @Transactional  //添加事务支持
    public int deleteDistrictById(Integer id) {

        //删除街道
        streetMapper.deleteStreetById(id);
        //删除区域
        districtMapper.deleteByPrimaryKey(id);

        return 1;
    }

    @Override
    public List<District> getDistrictList() {
        DistrictExample example=new DistrictExample();
        return districtMapper.selectByExample(example);
    }
}
