package com.team.house.pagecontroller;

import com.team.house.entity.Users;
import com.team.house.service.UserService;
import com.team.house.util.DrawYzm;
import com.team.house.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller("usercontroller2")
@RequestMapping("/page/")
public class UserController {

    @Autowired
    private UserService userService;

    //验证注册名
    @RequestMapping("checkUser")
    @ResponseBody
    public String checkUser(String name) {
        Integer isadmin = 0;//前台普通用户
        int i = userService.checkName(name, isadmin);
        return "{\"result\":" + i + "}";
    }

    //注册(添加)
    @RequestMapping("reg")
    public String addUser(Users users) {
        //区分后台管理员和普通用户 标记
        users.setIsadmin(0);//普通用户
        int i = userService.insertUser(users);
        if (i > 0) {
            return "page/login";//注册成功跳转到登录页面
        } else {
            return "page/regs";//注册失败跳转到注册页面
        }
    }

    //登录验证
    @RequestMapping("checklogin")
    public String checklogin(String name, String password, Model model, HttpSession session) {
        if (!name.equals("")) {
            //调业务
            Users user = userService.getUser(name);
            if (user == null) {
                model.addAttribute("info", "用户名错误");
                return "page/login";//登录失败
            } else {
                if (MD5Utils.md5Encrypt(password).equals(user.getPassword())) {
                    //只要登入，使用session作用域保存登入的人
                    session.setAttribute("logininfo", user);
                    //设置保存的有效时间
                    session.setMaxInactiveInterval(600);  //单位:秒
                    return "redirect:getHouse";   //用户登入后的管理页
                } else {
                    model.addAttribute("info", "密码错误");
                    return "page/login";//登录失败
                }
            }

        } else {
            model.addAttribute("info", "请输入用户名");
            return "page/login";//登录失败
        }
    }

    //验证码
    @RequestMapping(value = "getCored", produces = "text/html;charset=utf-8")
    public String getCored(HttpServletRequest request, HttpServletResponse response) throws Exception {
        DrawYzm drawYzm = new DrawYzm();
        drawYzm.getCode(request, response);
//
        HttpSession session = request.getSession();
        Object codeValidate = session.getAttribute("codeValidate");
        System.out.println(codeValidate);
        session.setAttribute("yzm", codeValidate);

        return "page/login";
    }


    //验证码
    @RequestMapping("checkCored")
    @ResponseBody
    public String checkCored(String cored, HttpSession session) throws Exception {
        Object yzm = session.getAttribute("codeValidate");
        System.out.println(yzm);
        return "{\"info\":" + yzm + "}";

        //https://blog.csdn.net/Knove/article/details/77686504
    }
}
