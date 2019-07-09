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
    <script language="JavaScript" src="js/district.js"></script>

    <%--&lt;%&ndash;引入street的js&ndash;%&gt;--%>
    <%--<script language="JavaScript" src="js/street.js"></script>--%>
</head>
<body>


<!--操作区域工具栏-->
<div id="ToolBar">
    <div style="height: 25px;">
        <a href="javascript:Add()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
        <a href="javascript:ModifyBySelect()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
        <a href="javascript:DeleteDistrictList()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">批量删除</a>&nbsp;&nbsp;
    </div>
</div>
<%--显示区域--%>
<table id="dis" fitColumns="true" rownumbers="true" toolbar="#ToolBar"></table>


<%--添加对话框--%>
<div id="AddDialog" class="easyui-dialog" buttons="#AddDialogButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true" modal="true">
    <form id="addDialogForm" method="post">
        <table>
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
    <a href="javascript:SaveDialog()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:CloseDialog('AddDialog')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>


<%--修改对话框--%>
<div id="upDialog" class="easyui-dialog" buttons="#upDialogButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true" modal="true">
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
<div id="upDialogButtons">
    <a href="javascript:UpDialog()" class="easyui-linkbutton" iconCls="icon-ok">更新</a>
    <a href="javascript:CloseDialog('upDialog')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>



<!--显示区域下的街道-->
<%--添加对话框--%>
<div id="ShowStreet" class="easyui-dialog" buttons="#AddDialogButtons" style="width:600px; height: 300px; "
     closed="true" modal="true">
    <!--操作街道工具栏-->
    <div id="StreetToolBar">
        <div style="height: 25px;">
            <a href="javascript:UpdateStreet()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
            <a href="javascript:DeleteStreetList()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">批量删除</a>&nbsp;&nbsp;
        </div>
    </div>
  <%--显示街道的区域--%>
    <table id="streetdis" fitColumns="true" rownumbers="true" toolbar="#StreetToolBar"></table><hr/>
    <div  style="height:25px;border: 0px" position="fixed">
        <input type="hidden" class="easyui-validatebox" required name="districtId" id="districtId"/>
        街道名称:<input type="text" class="easyui-validatebox" required name="name" id="name"/>&nbsp;&nbsp;
        <a href="javascript:addStreet()" class="easyui-linkbutton" iconCls="icon-ok">添加</a>
    </div>

</div>


<!--定义保存对话框中的按钮-->
<div id="AddDialogButtons">
    <a href="javascript:addStreet()" class="easyui-linkbutton" iconCls="icon-ok">下一步</a>
    <a href="javascript:CloseDialog('ShowStreet')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>


<%--修改对话框--%>
<div id="upStreetDialog" class="easyui-dialog" buttons="#AddDialogButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true" modal="true">
    <form id="upStreetDialogForm" method="post">
        <table>
            <tr>
                <td>街道编号:</td>
                <td>
                    <input type="text" readonly class="easyui-validatebox" required name="id" id="bname"/></td>
            </tr>
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
    <a href="javascript:UpStreetDialog()" class="easyui-linkbutton" iconCls="icon-ok">更新</a>
    <a href="javascript:CloseDialog('upStreetDialog')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>
</body>
</html>
