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
       $(function () {//加载事件
             //点击事件
           $("#yzm_img").click(function () {
               var url = document.getElementById("yzm_img").getAttribute("src");
               var randomnum = Math.random();
               //刷新浏览器缓存用
               document.getElementById("yzm_img").setAttribute("src",url+"?"+randomnum);

           });

       });
          //验证码验证
       function validateCode(){
             var inputCored=$("#inputCode").val();
             alert(inputCored)

             $.post("checkCored",{"cored":inputCored},function (data) {
                var result=data.info;
                alert(result)
             },"json");
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
                            <TD class=field>验 证 码:</TD>
                            <TD>
                                <INPUT type="text" id="inputCode"  style="float:left;height:25px" name="cored">
                            </TD>
                        </TR>

                        <TR>
                            <TD></TD>
                            <TD>
                                <img src="/page/getCored" style="height: 50px;width: 150px" id="yzm_img">      点击图片刷新
                            </TD>
                        </TR>

                    </TABLE>
                    <DIV class=buttons>
                        <INPUT value=登陆 type=submit>
                        <INPUT value=验证码验证 type=button onclick="validateCode()">
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
