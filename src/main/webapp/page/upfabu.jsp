<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0044)http://localhost:8080/HouseRent/page/add.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD><TITLE>青鸟租房 -发布房屋信息</TITLE>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <LINK
            rel=stylesheet type=text/css href="../css/style.css">
    <META name=GENERATOR content="MSHTML 8.00.7601.17514">
    <script language="JavaScript" src="js/jquery-1.8.3.js"></script>
    <script language="JavaScript">
        $(function () {//加载事件

            //异步请求加载房屋类型
            $.post("getType", null, function (data) {
                for (var i = 0; i < data.length; i++) {
                    //创建option
                    var node = $("<option value=" + data[i].id + ">" + data[i].name + "</option>");
                    $("#typeId").append(node);
                }
                //设置选中
                $("#typeId").val(${house.typeId});
            }, "json");


            //异步请求加载区域
            $.post("getAllDistrict", null, function (data) {
                for (var i = 0; i < data.length; i++) {
                    //创建option
                    var node = $("<option value=" + data[i].id + ">" + data[i].name + "</option>");
                    $("#district").append(node);
                }
                //设置选中
                $("#district").val(${house.did});
                 //加载   //选中后就加载区域下街道
                loadStreet(${house.did});

            }, "json");



             //区域加改变事件 当选择区域就加载区域下的街道
            $("#district").change(function () {
                loadStreet($("#district").val());
            });

 });



         //加载街道  方法重用
        function loadStreet(did) {
            //当选择区域 发送异步请求获取当前区域下的和街道数据
            $.post("getStreet", {"id": did}, function (data) {
                //清除原有数据 除了第一个gt(0)
                $("#street>option:gt(0)").remove();
                for (var i = 0; i < data.length; i++) {
                    //创建节点
                    var node = "<option value=" + data[i].id + ">" + data[i].name + "</option>";
                    //加入到下拉列表中
                    $("#street").append(node);
                }
                //设置选中
                $("#street").val(${house.streetId});
            }, "json");
        }

    </script>
</HEAD>
<BODY>
<DIV id=header class=wrap>
    <DIV id=logo><IMG src="../images/logo.gif"></DIV>
</DIV>
<DIV id=regLogin class=wrap>

    <DIV class=dialog>
        <DL class=clearfix>
            <DT>新房屋信息发布</DT>
            <DD class=past>填写房屋信息</DD>
        </DL>
        <DIV class=box>
            <FORM id=add_action method=post action="updateHouse" enctype="multipart/form-data">
                <DIV class=infos>
                    <TABLE class=field>
                        <TBODY>
                        <TR>
                            <TD class=field>标　　题：</TD>
                            <TD><INPUT id=add_action_title class=text type=text name=title value="${house.title}">
                                <INPUT id=id class=hide type=text name=id value="${house.id}">
                            </TD>
                        </TR>
                        <TR>
                            <TD class=field>户　　型：</TD>
                            <TD>
                                <SELECT class=text name=typeId id="typeId">
                                    <OPTION selected value="">--请选择--</OPTION>
                                </SELECT>
                            </TD>
                        </TR>
                        <TR>
                            <TD class=field>面　　积：</TD>
                            <TD><INPUT id=add_action_floorage class=text type=number name=floorage
                                       value="${house.floorage}"></TD>
                        </TR>
                        <TR>
                            <TD class=field>价　　格：</TD>
                            <TD><INPUT id=add_action_price class=text type=number name=price value="${house.price}"></TD>
                        </TR>
                        <TR>
                            <TD class=field>发布日期：</TD>

                            <TD><INPUT class=text type=date name=pubdate
                                       value="<fmt:formatDate value="${house.pubdate}" pattern="yyyy-MM-dd"></fmt:formatDate>">
                            </TD>
                        </TR>
                        <TR>
                            <TD class=field>位　　置：</TD>
                            <TD>
                                区：<SELECT class=text name=district_id id="district">
                                <OPTION selected value="-1">--请选择--</OPTION>
                            </SELECT>
                                街：<SELECT class=text name=streetId id="street">
                                <OPTION selected value="-1">--请选择--</OPTION>
                            </SELECT>
                            </TD>
                        </TR>

                        <TR>
                            <TD class=field>联系方式：</TD>
                            <TD><INPUT id=add_action_contact class=text type=text name=contact value="${house.contact}">
                            </TD>
                        </TR>
                        <TR>

                        <TR>
                            <TD class=field>房屋图片：</TD>
                            <TD><INPUT id=view class=text type=file name=pfile>
                                <INPUT  class=text type=hidden name=oldpath value="${house.path}">
                            </TD>

                        </TR>
                        <tr>
                            <TD></TD>
                            <td>
                                <img style="width: 100px;height: 100px" src="http://localhost:88/${house.path}">
                            </td>
                        </tr>
                        <TR>
                            <TD class=field>详细信息：</TD>
                            <TD><TEXTAREA name=description>${house.description}</TEXTAREA></TD>
                        </TR>
                        </TBODY>
                    </TABLE>
                    <DIV>
                        <DIV class=buttons>
                            <INPUT value=立即更新 type=submit>
                            <INPUT value=取消更新 type=button onclick='document.location="getHouse"'>
                        </DIV>
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
