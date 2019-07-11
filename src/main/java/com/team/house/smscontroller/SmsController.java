package com.team.house.smscontroller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/page/")
public class SmsController {

    @RequestMapping("getCored")
    public String getCored(String sendPhone, HttpSession session){
        //产生验证码
        String cored = (int) (Math.random() * 100000) + "";
        //发送内容
        String sendMassage = "验证码:" + cored + ",请在2分钟内输入验证码";
        //获取手机号发送验证码
        int i = SmsUtil.sendMassage(sendPhone, sendMassage);
        //3.使用session保存生成的验证码
        session.setAttribute("saveCode",cored);
        //设置失效时间
        Integer time=120;
        session.setMaxInactiveInterval(time);  //120秒 失效时间
        return "{\"result\":"+i+",\"time\":"+time+"}";
    }
}
