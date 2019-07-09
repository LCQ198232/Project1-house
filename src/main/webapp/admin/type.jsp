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

    <script language="JavaScript">
        $(function (){
            //使用datagrid显示区域
            $('#dis').datagrid({
                title: "房屋类型",
                url: 'getType',  //服务器地址
                pagination: true,  //启用分页
                pageList: [3, 6, 9, 15, 20], //设置每页大小
                pageSize: 3, //每页三条
                sortName:'id',
                remoteSort:false,
                sortOrder: 'desc',
                columns: [[
                    {field: "ck", checkbox: "true", width: 100, align: 'left'},
                    {field: 'id', title: '编号', width: 100, align: 'left'},
                    {field: 'name', title: '类型', width: 100, align: 'left'},
                    {field: 'opt', title: '操作', width: 100, align: 'left',
                        formatter:function(value,row,index){
                        //格式化单元格函数，有3个参数：
                        //     value：字段的值。
                        //     rowData：行数据。
                        //     rowIndex：行索引。
                            //发送同步请求
                            // return "<a href=\"delDistrict?id="+row.id+"\" class=\"easyui-linkbutton\" iconCls=\"icon-ok\">删除</a>";
                            //发送异步请求Ajax
                            return "<a href=\"javascript:DelDistrict("+row.id+")\" class=\"easyui-linkbutton\" iconCls=\"icon-ok\">删除</a>";

                        }}
                ]]
            });
        });


        //(对话框的存储按钮)添加
        function SaveDialog() {
            //添加的表单提交
            //使用easyui提交表单
            $('#addDialogForm').form('submit', {
                url: "addType",
                success: function (data) {  //注意:返回的是json字符串
                    //将json字符串转化为json对象
                    data = $.parseJSON(data);
                    if (data.result == 1) {
                        //清空form
                        $('#addDialogForm').form("clear")
                        //添加成功关闭对话框
                        $("#AddDialog").dialog("close");
                        //实现datagrid的刷新
                        $('#dis').datagrid('reload');
                        $.messager.alert('提示框', '添加成功！噢耶!!', 'info');
                    } else {
                        $.messager.alert('提示框', '添加失败！^_^', 'info');
                    }
                }
            });

        }

        //打开对话框
        function Add() {
            $("#AddDialog").dialog('open').dialog('setTitle', ">>>>添加房屋类型");
        }

        //(对话框的取消按钮)(共用)
        function CloseDialog(id) {
            $("#" + id).dialog('close');
        }

        //打开修改对话框
        function ModifyBySelect() {
            //获取datagrid选中行  返回的数组
            var SelectRows = $("#dis").datagrid('getSelections');
            if (SelectRows.length != 1) {
                $.messager.alert('提示框', '你还没有选中行，或者选择了多行.', 'info');
                return;
            }
            //打开窗口
            $("#upDialog").dialog("open").dialog("setTitle", ">>>>修改房屋类型");
            //发送异步请求获取对象进行回显
            var row = SelectRows[0];
            $.post("getSingleType",
                {"id": row.id},
                function (data) {
                    //回显
                    $('#upDialogForm').form('load', data);
                }, "json");
        }

        //修改的(对话框的更新按钮)
        function UpDialog() {
            //添加的表单提交
            //使用easyui提交表单
            $('#upDialogForm').form('submit', {
                url: "updateType",
                success: function (data) {  //注意:返回的是json字符串
                    //将json字符串转化为json对象
                    data = $.parseJSON(data);
                    if (data.result == 1) {
                        //关闭对话框
                        $("#upDialog").dialog("close");
                        //实现datagrid的刷新
                        $('#dis').datagrid('reload');
                        $.messager.alert('提示框', '修改成功！噢耶!!', 'info');
                    } else {
                        $.messager.alert('提示框', '修改成功！噢耶!!', 'info');
                    }
                }
            });

        }

        //删除操作(批量删除)  删除房屋类型
        function DeleteList() {
            //获取datagrid选中行  返回的数组
            var SelectRows = $("#dis").datagrid('getSelections');
            if (SelectRows.length == 0) {
                $.messager.alert('提示框', '你还没有选中行，请选择要删除的行.', 'info');
                return;
            }
            //打开窗口
            $.messager.confirm('提示框', '确认删除吗?',
                function (r) {
                    if (r) {
                        var ids = [];
                        for (var i = 0; i < SelectRows.length; i++) {
                            ids.push({name:'ids',value:SelectRows[i].id});
                        }
                        $.post("deleteMoreType",
                            ids,
                            function (data) {
                                if (data.result>0){

                                    //实现datagrid的刷新
                                    $('#dis').datagrid('reload');
                                    $.messager.alert('提示框', '您已删除成功了！噢耶!!', 'info');
                                }else{
                                    $.messager.alert('提示框', '删除失败了,请重试！噢耶!!', 'info');
                                }
                            }, "json");
                    }
                });
        }

        //删除单条    删除房屋类型
        function DelDistrict(id) {
            //打开窗口
            $.messager.confirm('提示框', '确认删除吗?',
                function (r) {
                    if (r) {
                        $.post("deleteType",
                            {"id":id},
                            function (data) {
                            if (data.result>0){

                                //实现datagrid的刷新
                                $('#dis').datagrid('reload');
                                $.messager.alert('提示框', '您已删除'+data.result+'条记录！噢耶!!', 'info');
                                }else{
                                $.messager.alert('提示框', '删除失败了,请重试！噢耶!!', 'info');
                            }
                         }, "json");
                    }
                });
        }
    </script>
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
            <tr>
                <td>房屋类型:</td>
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
                <td>编号:</td>
                <td>
                    <input type="text" readonly class="easyui-validatebox" required name="id" id="bname"/></td>
            </tr>
            <tr>
                <td>房屋类型:</td>
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
