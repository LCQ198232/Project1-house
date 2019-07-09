package com.team.house.pagecontroller;


import com.team.house.entity.Type;
import com.team.house.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller("typecontroller2")
@RequestMapping("/page/")
public class TypeController {
    @Autowired
    private TypeService typeService;
  //加载房屋类型
  @RequestMapping("getType")
  @ResponseBody
  public List<Type>  getType(){
      return  typeService.getAllType();
  }


}
