<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0030)http://localhost:8080/House-2/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD><TITLE>青鸟租房 - 首页</TITLE>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <LINK rel=stylesheet type=text/css href="../css/style.css">
    <META name=GENERATOR content="MSHTML 8.00.7601.17514">
    <script src="js/jquery-1.8.3.js"></script>
    <script language="JavaScript">
      $(function () {

          //异步请求加载房屋类型
          $.post("getType", null, function (data) {
              for (var i = 0; i < data.length; i++) {
                  //创建option
                  var node = $("<option value=" + data[i].id + ">" + data[i].name + "</option>");
                  $("#typeId").append(node);
              }
              //设置选中
              $("#typeId").val(${condition.tid});
          }, "json");


          //异步请求加载区域
          $.post("getAllDistrict", null, function (data) {
              for (var i = 0; i < data.length; i++) {
                  //创建option
                  var node = $("<option value=" + data[i].id + ">" + data[i].name + "</option>");
                  $("#district").append(node);
              }
              //设置选中
              $("#district").val(${condition.did});

          }, "json");



          //区域加改变事件 当选择区域就加载区域下的街道
          $("#district").change(function () {
              loadStreet($("#district").val());
          });

      });



      //加载街道  方法重用
      function loadStreet(did) {

          if ($("#district").val()!=""){

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
                  $("#street").val(${condition.sid});
              }, "json");
          }else {

                //清除原有数据 除了第一个gt(0)
              $("#street>option:gt(0)").remove();
          }


      };

function goPage(pageNum) {
    //设置页码
    $("#pageIndex").val(pageNum);
    //提交表单
    $("#searchForm").submit();
}


    </script>
</HEAD>
<BODY>

<DIV id=header class=wrap>
    <DIV id=logo><IMG src="../images/logo.gif">
        <LABEL class=ui-green><INPUT onclick='document.location="login.jsp"' value="退       出" type=button name=search></LABEL>
    </DIV>

</DIV>
<DIV id=navbar class=wrap>
    <FORM id=searchForm method=post action=getBroswerHouse>
        <!--保存页码-->
        <input name="page" id="pageIndex" type="hidden" value="1">
        <div>
            标题：<INPUT class=text type=text name=title value="${condition.title}">
            类型:<SELECT id="typeId" name=tid>
                    <OPTION selected value="">不限</OPTION>
                </SELECT>
            区域: <SELECT id="district" name=did>
                    <OPTION selected value="">不限</OPTION>
                 </SELECT>
            街道:<SELECT name=sid id="street">
                    <OPTION selected value="">不限</OPTION>
                 </SELECT>
            价格:<INPUT class=text type=text name=startPrice value="${condition.startPrice}">-
                <INPUT class=text value="${condition.endPrice}" type=text name=endPrice>元
                <LABEL class=ui-blue><INPUT value=搜索房屋 type=submit name=search></LABEL>
        </div>
    </FORM>
    </DL>
</DIV>


<DIV class="main wrap">
    <c:if test="${! empty pageInfo.list}">
        <TABLE class=house-list>
            <TBODY>
            <c:forEach items="${pageInfo.list}" var="h">
                <TR>
                    <TD class=house-thumb><span>
                        <a href="showHouse?id=${h.id}" target="_blank">
                        <img src="http://localhost:88/${h.path}" width="100" height="75" alt="">
                        </a></span></TD>
                    <TD>
                        <DL>
                            <DT><A href="showHouse?id=${h.id}" target="_blank">${h.title}</A></DT>
                            <DD>${h.dname}==${h.sname},${h.floorage}平米<BR>联系方式：${h.contact} </DD>
                        </DL>
                    </TD>
                    <TD class=house-type>${h.tname}</TD>
                    <TD class=house-price><SPAN>${h.price}</SPAN>元/月</TD>
                </TR>
            </c:forEach>
            </TBODY>
        </TABLE>

        <DIV class=pager>
            <UL>
                <LI class=current><A href="javascript:goPage(1)">首页</A></LI>
                <LI><A href="javascript:goPage(${pageInfo.prePage==0?1:pageInfo.prePage})">上一页</A></LI>
                <LI><A href="javascript:goPage(${pageInfo.nextPage==0?pageInfo.pages:pageInfo.nextPage})">下一页</A></LI>
                <LI><A href="javascript:goPage(${pageInfo.pages})">末页</A></LI>
            </UL>
            <SPAN
                    class=total>${pageInfo.pageNum}/${pageInfo.pages}页</SPAN></DIV>
            </c:if>

            <c:if test="${empty pageInfo.list}">
                <center style="color: red; font-size: 24px;">暂无出租房信息</center>
            </c:if>
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
