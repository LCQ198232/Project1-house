<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD><TITLE>青鸟租房 - 用户登录</TITLE>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <LINK
            rel=stylesheet type=text/css href="../css/style.css">
    <META name=GENERATOR content="MSHTML 8.00.7601.17514">
    <script language="JavaScript" src="js/jquery-1.8.3.js"></script>
    <script language="JavaScript">
        var objTime;
       $(function (){//加载事件
              //点击发送短信验证码到手机
           $("#sendButton").click(function () {
               //$.post("getCored",{"sendPhone":$("#sendPhone").val()},function (data) {

                  // if (data.result>0){
                         //设置失效时间

                       //倒计时
                       objTime=setInterval("backTime()",1000);//每隔一秒时间减少一
                   //}else {
                      // alert("发送失败")
                   //}

               //},"json");
           });

       });
        //获取失效时间
         var time=10;
       function backTime() {//time 为设置失效时间
           if (time!=0){
               time--;
               $("#sendButton")[0].disabled=true;
               $("#sendButton").css("padding","5px 10px");
               $("#sendButton").val(time+"秒");
           }else{
               clearInterval(objTime);  //清除定时
               $("#sendButton")[0].disabled=false;
               $("#sendButton").val("获取验证码");
           }
       }


    </script>
</HEAD>
<BODY>
<DIV id=header class=wrap>
    <DIV id=logo><IMG src="../images/logo.gif"></DIV>
</DIV>
<DIV id=regLogin class=wrap>
    <DIV class=dialog>
        <DIV class=box>
            <H4>用户登录</H4>
            <FORM method=post action="checklogin">
                <DIV class=infos>
                    <TABLE class=field>
                        <TBODY>

                        <TR>
                            <TD  style="text-align: center;color: red" id="show">${info}</TD>
                        </TR>
                        <TR>
                            <TD class=field>用 户 名：</TD>
                            <TD><!-- <input type="text" class="text" name="name" /> -->
                                <INPUT id=user_name class=text type=text name=name></TD>
                        </TR>
                        <TR>
                            <TD class=field>密　 　码:</TD>
                            <TD><!-- <input type="password" class="text" name="password" /> --><INPUT
                                    id=user_password class=text type=password name=password></TD>
                        </TR>
                        <TR>
                            <TD class=field>手 机 号:</TD>
                            <TD>
                                <INPUT type="text" id="sendPhone"  style="float:left;height:25px" name="sendPhone">

                                <INPUT type="button" id="sendButton"  value="获取验证码" style="float:left;height:25px">
                            </TD>
                        </TR>
                        <TR>
                            <TD class=field>验 证 码:</TD>
                            <TD>
                                <INPUT type="text" id="inputCode"  style="float:left;height:25px" name="cored">
                                <INPUT type="hidden" id="endTime"  style="float:left;height:25px">
                            </TD>
                        </TR>
                    </TABLE>
                    <DIV class=buttons>
                        <INPUT value=登陆 type=submit>
                        <INPUT onclick='document.location="regs.jsp"' value=注册 type=button>
                    </DIV>
                </DIV>
            </FORM>
        </DIV>
    </DIV>
</DIV>
<DIV id=footer class=wrap>
    <DL>
        <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
        <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD>
    </DL>
</DIV>
</BODY>
</HTML>
