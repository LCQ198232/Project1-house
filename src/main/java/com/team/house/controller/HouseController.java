package com.team.house.controller;

import com.github.pagehelper.PageInfo;
import com.team.house.entity.House;

import com.team.house.entity.Street;
import com.team.house.service.HouseService;
import com.team.house.service.StreetService;
import com.team.house.util.HouseCondition;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController ("housecontroller2")   //以下方法全部返回异步数据
@RequestMapping("/admin/")
public class HouseController {

    @Autowired
    private HouseService houseService;
    @Autowired
    private StreetService streetService;

    //带条件的分页
    @RequestMapping("getPassOrnoPassHouse")
    public Map<String,Object> getPassHouse(HouseCondition condition){
        PageInfo<House> isPass = houseService.getHouseByIsPass(condition);

        Map<String,Object> map=new HashMap<>();
        map.put("total",isPass.getTotal());
        map.put("rows",isPass.getList());

        return map;
    }

    //加载区域类型下的街道
    @RequestMapping("getAllStreet")
    @ResponseBody
    public List<Street> getAllStreet(Integer id){
        List<Street> streets = streetService.getStreetByDid(id);
        return streets;
    }
    //查询房屋通过主键
    @RequestMapping("getHouseById")
    public House getHouseByid(String id){
        House house = houseService.getHouse(id);

        return house;
    }

    //修改审核状态
    @RequestMapping("upPass")
    public String upPass(String id,Integer ispass){

        House house=new House();
        house.setId(id);
        house.setIspass(ispass);
        int i = houseService.updateHouse(house);
        return "{\"result\":"+i+"}";
    }

}
