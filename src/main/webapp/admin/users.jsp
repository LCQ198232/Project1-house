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
    <%--引入district的js--%>
    <script language="JavaScript" src="js/users.js"></script>

</head>
<body>


<!--操作区域工具栏-->
<div id="ToolBar">
    <div style="height: 25px;">
        <a href="javascript:Add()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
        <a href="javascript:ModifyBySelect()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
        <a href="javascript:DeleteUserList()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">批量删除</a>&nbsp;&nbsp;
        名称:<input type="text" name="name" id="s_name">&nbsp;&nbsp;
        电话:<input type="text" name="telephone" id="s_tele">&nbsp;&nbsp;
        <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
    </div>
</div>
<%--显示区域--%>
<table id="dis" fitColumns="true" rownumbers="true" toolbar="#ToolBar"></table>


<%--添加对话框--%>
<div id="AddDialog" class="easyui-dialog" buttons="#AddDialogButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">
    <form id="addDialogForm" method="post">
        <table>
            <tr>
                <td>用户名:</td>
                <td>
                    <input type="text" class="easyui-validatebox" required missingMessage="请填写!!!" name="name"
                           id="bname"/></td>
            </tr>
            <tr>
                <td>电话号码:</td>
                <td>
                    <input type="text" class="easyui-validatebox" required missingMessage="请填写!!!" name="telephone"
                           id="telephone"/></td>
            </tr>
        </table>
    </form>
</div>
<!--定义保存对话框中的按钮-->
<div id="AddDialogButtons">
    <a href="javascript:SaveDialog()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:CloseDialog('AddDialog')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>


<%--修改对话框--%>
<div id="upDialog" class="easyui-dialog" buttons="#upDialogButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">
    <form id="upDialogForm" method="post">
        <table>
            <tr>
                <td>用户编号:</td>
                <td>
                    <input type="text" readonly class="easyui-validatebox" required name="id" id="bname"/></td>
            </tr>
            <tr>
                <td>用户名:</td>
                <td>
                    <input type="text" class="easyui-validatebox" required missingMessage="请填写!!!" name="name"
                           id="name"/></td>
            </tr>
            <tr>
                <td>电话号码:</td>
                <td>
                    <input type="text" class="easyui-validatebox" required missingMessage="请填写!!!" name="telephone"
                           id="telephone"/></td>
            </tr>
        </table>
    </form>
</div>
<!--定义保存对话框中的按钮-->
<div id="upDialogButtons">
    <a href="javascript:UpDialog()" class="easyui-linkbutton" iconCls="icon-ok">更新</a>
    <a href="javascript:CloseDialog('upDialog')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>



<!--显示区域下的街道-->
<%--添加对话框--%>
<div id="ShowStreet" class="easyui-dialog" buttons="#showDialogButtons"
     style="width:600px; height: 300px; " closed="true">
    <table id="Streetdis" fitColumns="true" rownumbers="true" toolbar="#ToolBar"></table><hr>
    用户名:<input type="text" class="easyui-validatebox" required name="name" id="name"/>&nbsp;&nbsp;
    电话号码:<input type="text" class="easyui-validatebox" required name="telephone" id="telephone"/>&nbsp;&nbsp;
    <a href="javascript:addStreet()" class="easyui-linkbutton" iconCls="icon-ok">添加</a>
</div>

<!--定义保存对话框中的按钮-->
<div id="showDialogButtons">
    <a href="javascript:addStreet()" class="easyui-linkbutton" iconCls="icon-ok">下一步</a>
    <a href="javascript:CloseStreetDialog('ShowStreet')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>

</body>
</html>
