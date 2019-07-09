package com.team.house.controller;

import com.github.pagehelper.PageInfo;
import com.team.house.entity.Users;
import com.team.house.service.UserService;
import com.team.house.util.MD5Utils;
import com.team.house.util.UserCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller("usercontroller1")
@RequestMapping("/admin/")

public class UserControlller {


    @Autowired
    private UserService userService;

    @RequestMapping("getUser")
    @ResponseBody
    public  Map<String,Object> getUser(UserCondition condition){
        PageInfo<Users> userByPage = userService.getUserByPage(condition);
        Map<String,Object> map=new HashMap<>();
        map.put("total",userByPage.getTotal());
        map.put("rows",userByPage.getList());
        return map;
    }




    //添加
    @RequestMapping("addUser")
    @ResponseBody
    public String addUser(Users users){
        //掉业务
        int i = userService.insertUser(users);
        return "{\"result\":"+i+"}";
    }



    //修改前获取单行记录
    @RequestMapping("getSingleUser")
    @ResponseBody
    public Users getSingleUser(Integer id){
        //掉业务
        Users singleUser = userService.getSingleUser(id);
        return singleUser;
    }

    //修改记录
    @RequestMapping("updateUser")
    @ResponseBody
    public String updateUser(Users users){
        //掉业务
        int i = userService.updateUser(users);
        return "{\"result\":"+i+"}";
    }

    //删除
    @RequestMapping("deleteUser")
    @ResponseBody
    public String deleteUser(Integer id) {
        int i = userService.deleteUser(id);
        return"{\"result\":"+i+"}";
    }


    //批量删除
    @RequestMapping("deleteUserList")
    @ResponseBody
    public String deleteMoreUser(Integer[] ids) {
        int i = userService.deleteMoreUser(ids);
        return"{\"result\":"+i+"}";
    }


//*******************************************************************
    //验证注册名
    @RequestMapping("checkUser")
    @ResponseBody
    public String checkUser(String name) {
        Integer isadmin=1;//后台管理员注册
        int i = userService.checkName(name,isadmin);
        return "{\"result\":" + i + "}";
    }

    //注册(添加)
    @RequestMapping("reg")
    public String insertUser(Users users) {
        //区分后台管理员和普通用户 标记
        users.setIsadmin(1);//后台管理员
        //调业务
        int i = userService.insertUser(users);
        if (i > 0) {
            return "admin/login";//注册成功跳转到登录页面
        } else {
            return "admin/regs";//注册失败跳转到注册页面
        }
    }


    //登录验证(登录)
    @RequestMapping("checklogin")
    public String checklogin(String name, String password, Model model, HttpSession session) {
        if (!name.equals("")) {
            //调业务
            Users user = userService.getUser(name);
            if (user == null) {
                model.addAttribute("info", "用户名错误");
                return "admin/login";//登录失败
            } else {
                if (MD5Utils.md5Encrypt(password).equals(user.getPassword())) {
                    //只要登入，使用session作用域保存登入的人
                    session.setAttribute("logininfo", user);
                    //设置保存的有效时间
                    session.setMaxInactiveInterval(600);  //单位:秒
                    return "admin/admin";   //用户登入后的管理页
                } else {
                    model.addAttribute("info", "密码错误");
                    return "admin/login";//登录失败
                }
            }

        } else {
            model.addAttribute("info", "请输入用户名");
            return "admin/login";//登录失败
        }
    }
}
