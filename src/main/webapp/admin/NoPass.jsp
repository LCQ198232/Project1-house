<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyUI/css/demo.css">
    <script src="js/jquery-1.8.3.js"></script>
    <!--jquery.easyui.min.js包含了easyUI中的所有插件-->
    <script src="js/jquery.easyui.min.js"></script>
    <%--引入IsPass的js--%>
    <script language="JavaScript" src="js/NoPass.js"></script>

</head>
<body>


<!--操作审核工具栏-->
<div id="ToolBar">
    <div style="height: 25px;">
        <a href="javascript:Add()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
        <a href="javascript:ModifyBySelect()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
        <a href="javascript:DeleteDistrictList()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">批量删除</a>&nbsp;&nbsp;
    </div>
    <form id="searchForm" action="getPassOrnoPassHouse" method="post">
        标题:<input type="text" name="title" id="title">&nbsp;&nbsp;
        电话:<input type="text" name="contact" id="contact">&nbsp;&nbsp;
        发布日期(<):<input type="date" name="pubdate" id="pubdate">&nbsp;&nbsp;
        区域：<SELECT class=text name=did id="districtid">
               <OPTION selected value="">--请选择--</OPTION>
             </SELECT>&nbsp;&nbsp;
        街道：<SELECT class=text name=sid id="streetid">
               <OPTION selected value="">--请选择--</OPTION>
              </SELECT>&nbsp;&nbsp;
        房屋类型：<SELECT class=text name=tid id="type">
                  <OPTION selected value="">--请选择--</OPTION>
               </SELECT>&nbsp;&nbsp;
        价格:<input type="text" name="startPrice" id="startPrice">-<input type="text" name="endPrice" id="endPrice">
        <a href="javascript:Search()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
    </form>
</div>
<%--显示区域--%>
<table id="dis" fitColumns="true" rownumbers="true" toolbar="#ToolBar"></table>

<!--房屋信息显示-->
<div id="ShowHouse" class="easyui-dialog" buttons="#upDialogButtons"
     style="width: 500px; height: 500px; padding: 10px 20px;" closed="true" modal="true">
    <form id="showDialogForm" method="post">
        <table>
            <tr>
                <td>标　　题:</td>
                <td>
                    <input type="text" readonly class="easyui-validatebox" required name="title" id="title"/>
                </td>
            </tr>
            <tr>
                <td>户　　型：</td>
                <td>
                    <input type="text" class="easyui-validatebox" required  name="typeId" id="typeId"/>
                </td>
            </tr>
            <tr>
                <td>面　　积：</td>
                <td>
                    <input type="text" class="easyui-validatebox" required  name="floorage" id="floorage"/>
                </td>
            </tr>
            <tr>
                <td>价　　格：</td>
                <td>
                    <input type="text" class="easyui-validatebox" required  name="price" id="price"/>
                </td>
            </tr>
            <tr>
                <td>发布日期：</td>
                <td>
                    <input type="text" class="easyui-validatebox" required  name="pubdate" id="pubdate"/>
                </td>
            </tr>
            <tr>
                <td class=field>位　　置：</td>
                <td>
                    区：<select class=text name=districtId id="district">
                    <OPTION selected value="-1">--请选择--</OPTION>
                </select>
                    街：<select class=text name=streetId id="street">
                    <OPTION selected value="-1">--请选择--</OPTION>
                </select>
                </td>
            </tr>

            <tr>
                <td>联系方式：</td>
                <td>
                    <input type="text" class="easyui-validatebox" required  name="contact" id="contact"/>
                </td>
            </tr>
            <tr>
                <td>房屋图片：</td>
                <td>
                    <%--<img style="width: 100px;height: 100px" src="http://localhost:88/path">--%>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
