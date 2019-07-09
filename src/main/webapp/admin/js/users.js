        $(function () {
            //使用datagrid显示区域
            $('#dis').datagrid({
                title: "用户信息",
                url: 'getUser',  //服务器地址
                pagination: true,  //启用分页
                pageList: [3, 6, 9, 15, 20], //设置每页大小
                pageSize: 3, //每页三条
                sortName: 'id',
                remoteSort: false,
                sortOrder: 'desc',
                columns: [[
                    {field: "ck", checkbox: "true", width: 100, align: 'left'},
                    {field: 'id', title: '编号', width: 100, align: 'left'},
                    {field: 'name', title: '用户姓名', width: 100, align: 'left'},
                    {field: 'telephone', title: '电话', width: 100, align: 'left'},
                    {field: 'opt', title: '操作', width: 100, align: 'left',
                        formatter: function (value, row, index) {
                            //格式化单元格函数，有3个参数：
                            //     value：字段的值。
                            //     rowData：行数据。
                            //     rowIndex：行索引。
                            //发送同步请求
                            // return "<a href=\"delDistrict?id="+row.id+"\" class=\"easyui-linkbutton\" iconCls=\"icon-ok\">删除</a>";
                            //发送异步请求Ajax
                            return "<a href=\"javascript:DelUser(" + row.id + ")\" class=\"easyui-linkbutton\" iconCls=\"icon-ok\">删除</a>";

                        }
                    }
                ]]
            });
        });

          //条件查询
        function search() {
            var s_name=$("#s_name").val();
            var s_tele=$("#s_tele").val();
            var s_minage=$("#s_minage").val();
            var s_maxage=$("#s_maxage").val();
            $("#dis").datagrid("load",{"name":s_name,"telephone":s_tele});
        }


        //打开对话框
        function Add() {
            $("#AddDialog").dialog('open').dialog('setTitle', ">>>>添加用户");
        }

        //(对话框的取消按钮)(共用)
        function CloseDialog(id) {
            $("#" + id).dialog('close');
        }


        //(对话框的存储按钮)添加
        function SaveDialog() {
            //添加的表单提交
            //使用easyui提交表单
            $('#addDialogForm').form('submit', {
                url: "addUser",
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


        //打开修改对话框
        function ModifyBySelect() {
            //获取datagrid选中行  返回的数组
            var SelectRows = $("#dis").datagrid('getSelections');
            if (SelectRows.length != 1) {
                $.messager.alert('提示框', '你还没有选中行，或者选择了多行.', 'info');
                return;
            }
            //打开窗口
            $("#upDialog").dialog("open").dialog("setTitle", ">>>>修改区域");
            //发送异步请求获取对象进行回显
            var row = SelectRows[0];
            $.post("getSingleUser",
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
                url: "updateUser",
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




        //删除操作(批量删除)  删除区域的同时删除街道
        function DeleteUserList() {
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
                            ids.push({name: 'ids', value: SelectRows[i].id});
                        }
                        $.post("deleteUserList",
                            ids,
                            function (data) {
                                if (data.result > 0) {

                                    //实现datagrid的刷新
                                    $('#dis').datagrid('reload');
                                    $.messager.alert('提示框', '您已删除成功了！噢耶!!', 'info');
                                } else {
                                    $.messager.alert('提示框', '删除失败了,请重试！噢耶!!', 'info');
                                }
                            }, "json");
                    }
                });
        }

        //删除单条   删除区域的同时删除街道
        function DelUser(id) {
            //打开窗口
            $.messager.confirm('提示框', '确认删除吗?',
                function (r) {
                    if (r) {
                        $.post("deleteUser",
                            {"id": id},
                            function (data) {
                                if (data.result > 0) {

                                    //实现datagrid的刷新
                                    $('#dis').datagrid('reload');
                                    $.messager.alert('提示框', '您已删除' + data.result + '条记录！噢耶!!', 'info');
                                } else {
                                    $.messager.alert('提示框', '删除失败了,请重试！噢耶!!', 'info');
                                }
                            }, "json");
                    }
                });
        }






