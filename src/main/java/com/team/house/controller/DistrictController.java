package com.team.house.controller;

import com.github.pagehelper.PageInfo;
import com.team.house.entity.District;
import com.team.house.service.DistrictService;
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
public class DistrictController {

    @Autowired
    private DistrictService districtService;
    //查询
    @RequestMapping("getDistrict")
    @ResponseBody
    public Map<String,Object> getDistrict(Page page){
        PageInfo<District> districtBypage = districtService.getDistrictBypage(page);
        Map<String, Object> map = new HashMap<>();
        map.put("total", districtBypage.getTotal());
        map.put("rows",districtBypage.getList());
        return map;
    }

    //添加
    @RequestMapping("addDistrict")
    @ResponseBody
    public String addDistrict(District district){
        //掉业务
        int i = districtService.addDistrict(district);
        return "{\"result\":"+i+"}";
    }


    //修改前获取单行记录
    @RequestMapping("getSingleDistrict")
    @ResponseBody
        public District getSingleDistrict(Integer id){
        //掉业务
        District district = districtService.getDistrict(id);
        return district;
    }

    //修改记录
    @RequestMapping("updateDistrict")
    @ResponseBody
    public String updateDistrict(District district){
        //掉业务
        int i = districtService.updateDistrict(district);
        return "{\"result\":"+i+"}";
    }


    //批量删除
    @RequestMapping("deleteDistrictList")
    @ResponseBody
    public String deleteDistrictList(Integer [] ids){
        try{
             //掉业务
            int i = districtService.deleteDistrict(ids);
            return "{\"result\":"+i+"}";
        }catch (Exception e){
            return "{\"result\":"+0+"}";
        }

    }

    //删除单条
    @RequestMapping("deleDistrict")
    @ResponseBody
    public String deleDistrict(Integer id){
        try {
            //掉业务
            int i = districtService.deleteDistrictById(id);
            return "{\"result\":"+i+"}";
        }catch (Exception e){
            return "{\"result\":"+0+"}";
        }
    }

    //异步加载区域
    @RequestMapping("getAllDistrict")
    @ResponseBody
    public List<District> getAllDistrict(){
        List<District> districtList = districtService.getDistrictList();
        return districtList;
    }

}
