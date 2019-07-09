package com.team.house.controller;

import com.github.pagehelper.PageInfo;
import com.team.house.entity.District;
import com.team.house.entity.Street;
import com.team.house.service.StreetService;
import com.team.house.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/")
public class StreetController {
    @Autowired
    private StreetService streetService;

    @RequestMapping("getStreet")
    @ResponseBody
    public Map<String, Object> getStreet(Integer id,Page page) {
        PageInfo<Street> streetBypage = streetService.getStreetBypage(id,page);
        Map<String, Object> map = new HashMap<>();
        map.put("rows", streetBypage.getList());
        map.put("total", streetBypage.getTotal());
        return map;
    }

    //添加
    @RequestMapping("addStreet")
    @ResponseBody
    public String addStreet(Street street) {
        int i=0;
        if(street.getName()!=null&&!street.getName().trim().equals("")){
           i = streetService.addStreet(street);
            return"{\"result\":"+i+"}";
        }else {
            i=-1;
            return"{\"result\":"+i+"}";
        }

    }

    //修改
    @RequestMapping("updateStreet")
    @ResponseBody
    public String updateStreet(Street street) {
        int i = streetService.updateStreet(street);
        return"{\"result\":"+i+"}";
    }


    //查询单条
    @RequestMapping("getSingleStreet")
    @ResponseBody
    public Street getSingleStreet(Integer id) {
        Street street = streetService.getStreet(id);
        return street;
    }


    //删除
    @RequestMapping("deleteStreet")
    @ResponseBody
    public String deleteStreet(Integer id) {
        int i = streetService.deleteStreet(id);
        return"{\"result\":"+i+"}";
    }


    //批量删除
    @RequestMapping("deleteMoreStreet")
    @ResponseBody
    public String deleteMoreStreet(Integer[] ids) {
        int i = streetService.deleteMoreStreet(ids);
        return"{\"result\":"+i+"}";
    }



}
