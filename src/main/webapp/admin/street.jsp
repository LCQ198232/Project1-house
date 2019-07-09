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
     <%--//引入js--%>
    <script language="JavaScript" src="js/street.js"></script>
</head>
<body>


<!--操作区域工具栏-->
<div id="ToolBar">
    <div style="height: 25px;">
        <a href="javascript:Add()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
        <a href="javascript:ModifyBySelect()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
        <a href="javascript:DeleteList()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">批量删除</a>
    </div>
</div>
<%--显示区域--%>
<table id="dis" fitColumns="true" rownumbers="true" toolbar="#ToolBar"></table>


<%--添加对话框--%>
<div id="AddDialog" class="easyui-dialog" buttons="#AddDialogButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">
    <form id="addDialogForm" method="post">
        <table>
            &nbsp;所在区域:
                <select name="districtId" id="districtId">
                    <option value="-1">--请选择区域--</option>
                </select>&nbsp;&nbsp;

            <tr>
                <td>街道名称:</td>
                <td>
                    <input type="text" class="easyui-validatebox" required missingMessage="请填写!!!" name="name"
                           id="bname"/></td>
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
<div id="upDialog" class="easyui-dialog" buttons="#AddDialogButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">
    <form id="upDialogForm" method="post">
        <table>
            <tr>
                <td>区域编号:</td>
                <td>
                    <input type="text" readonly class="easyui-validatebox" required name="id" id="bname"/></td>
            </tr>
            <tr>
                <td>区域名称:</td>
                <td>
                    <input type="text" class="easyui-validatebox" required missingMessage="请填写!!!" name="name"
                           id="bname"/></td>
            </tr>
        </table>
    </form>
</div>
<!--定义保存对话框中的按钮-->
<div id="AddDialogButtons">
    <a href="javascript:UpDialog()" class="easyui-linkbutton" iconCls="icon-ok">更新</a>
    <a href="javascript:CloseDialog('upDialog')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>

</body>
</html>
