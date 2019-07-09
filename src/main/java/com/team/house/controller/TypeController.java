package com.team.house.controller;

import com.github.pagehelper.PageInfo;
import com.team.house.entity.Type;
import com.team.house.service.TypeService;
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
public class TypeController {

@Autowired
    private TypeService typeService;

    @RequestMapping("getType")
    @ResponseBody
    public Map<String,Object> getType(Page page){
    PageInfo<Type> typeByPage = typeService.getTypeByPage(page);
    Map<String,Object> map=new HashMap<>();
    map.put("total",typeByPage.getTotal());
    map.put("rows",typeByPage.getList());
    return map;
    }
     //添加
    @RequestMapping("addType")
    @ResponseBody
    public String addType(Type type){
        int i = typeService.addType(type);
        return "{\"result\":"+i+"}";
    }

    //查询单条
    @RequestMapping("getSingleType")
    @ResponseBody
    public Type getSingleType(Integer id){
        Type type = typeService.getSingleType(id);
        return type;
    }


    //修改
    @RequestMapping("updateType")
    @ResponseBody
    public String updateType(Type type){
        int i = typeService.updateType(type);
        return "{\"result\":"+i+"}";
    }



    //删除
    @RequestMapping("deleteType")
    @ResponseBody
    public String deleteType(Integer id){
        int i = typeService.deleteType(id);
        return "{\"result\":"+i+"}";
    }

    //批量删除
    @RequestMapping("deleteMoreType")
    @ResponseBody
    public String deleteType(Integer[] ids){
        int i = typeService.deleteMoreType(ids);
        return "{\"result\":"+i+"}";
    }

    //异步加载区域
    @RequestMapping("getAllType")
    @ResponseBody
    public List<Type> getAllDistrict(){
        List<Type> types = typeService.getAllType();
        return types;
    }

}
