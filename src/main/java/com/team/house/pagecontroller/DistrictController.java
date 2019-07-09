package com.team.house.pagecontroller;

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

@Controller("districtcontroller2")
@RequestMapping("/page/")
public class DistrictController {

    @Autowired
    private DistrictService districtService;
    //异步加载区域
    @RequestMapping("getAllDistrict")
    @ResponseBody
    public  List<District> getAllDistrict(){
        List<District> districtList = districtService.getDistrictList();
        return districtList;
    }
}
