package com.team.house.pagecontroller;

import com.github.pagehelper.PageInfo;
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

@Controller("streetcontroller2")
@RequestMapping("/page/")
public class StreetController {
    @Autowired
    private StreetService streetService;

    @RequestMapping("getStreet")
    @ResponseBody
    public List<Street> getStreet(Integer id) {
        List<Street> streetByDid = streetService.getStreetByDid(id);
        return streetByDid;
    }






}
