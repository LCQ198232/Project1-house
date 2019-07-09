$(function () {
    //使用datagrid显示区域
    $('#dis').datagrid({
        title: "审核出租房信息",
        url: 'getPassOrnoPassHouse?ispass=1',  //服务器地址
        pagination: true,  //启用分页
        pageList: [3, 6, 9, 15, 20], //设置每页大小
        pageSize: 3, //每页三条
        sortName: 'id',
        remoteSort: false,
        sortOrder: 'desc',
        columns: [[
            {field: "ck", checkbox: "true", width: 100, align: 'left'},
            {field: 'id', title: '编号', width: 100, align: 'left'},
            {field: 'title', title: '标题', width: 100, align: 'left'},
            {field: 'price', title: '价格', width: 100, align: 'left'},
            {field: 'pubdate', title: '发布日期', width: 100, align: 'left',
                formatter:function (date) {
                    var date=new Date(date);
                    var year=date.getFullYear();
                    var month=date.getMonth();
                    var day=date.getDate();
                    return year+"年"+month+"月"+day+"日";
                    }
               },
            {field: 'contact', title: '联系方式', width: 100, align: 'left'},
            {field: 'dname', title: '区域名称', width: 100, align: 'left'},
            {field: 'sname', title: '街道名称', width: 100, align: 'left'},
            {field: 'tname', title: '房子类型', width: 100, align: 'left'},
            {
                field: 'opt', title: '操作', width: 100, align: 'left',
                formatter: function (value, row, index) {
                    //格式化单元格函数，有3个参数：
                    //     value：字段的值。
                    //     rowData：行数据。
                    //     rowIndex：行索引。
                    //发送同步请求
                    // return "<a href=\"delDistrict?id="+row.id+"\" class=\"easyui-linkbutton\" iconCls=\"icon-ok\">删除</a>";
                    //发送异步请求Ajax
                    return "<a href=\"javascript:CheckHouse(" + row.id + ")\">不通过审核</a>";

                }
            }
        ]]
    });
   //加载房屋类型
    $.post("getAllType", null, function (data) {
        for (var i = 0; i < data.length; i++) {
            //创建节点
            var node = "<option value=" + data[i].id + ">" + data[i].name + "</option>";
            //加入到下拉列表中
            $("#type").append(node);

        }
    }, "json");
    //加载区域
    $.post("getAllDistrict", null, function (data) {
        for (var i = 0; i < data.length; i++) {
            //创建节点
            var node = "<option value=" + data[i].id + ">" + data[i].name + "</option>";
            //加入到下拉列表中
            $("#districtid").append(node);

        }
    }, "json");
    //区域加改变事件 当选择区域就加载区域下的街道
    $("#districtid").change(function () {
        var districtId = $(this).val();//获得当前
        if (districtId!=""){
            //当选择区域 发送异步请求获取当前区域下的和街道数据
            $.post("getAllStreet", {"id": districtId}, function (data) {
                //清除原有数据 除了第一个gt(0)
                $("#streetid>option:gt(0)").remove();
                for (var i = 0; i < data.length; i++) {
                    //创建节点
                    var node = "<option value=" + data[i].id + ">" + data[i].name + "</option>";
                    //加入到下拉列表中
                    $("#streetid").append(node);

                }
            }, "json");
        }else {
            //清除原有数据 除了第一个gt(0)
            $("#streetid>option:gt(0)").remove();
        }

    });
});

//条件查询
function Search() {
    var title = $("#title").val();//标题
    var contact = $("#contact").val();//电话
    var pubdate = $("#pubdate").val();//发布日期
    var districtid = $("#districtid").val();//区域名称
    var streetid = $("#streetid").val();//街道名称
    var typeid = $("#type").val();//房屋类型
    var startPrice=$("#startPrice").val();
    var endPrice=$("#endPrice").val();


    $("#dis").datagrid("load", {
        "title": title,
        "contact": contact,
        "pubdate": pubdate,
        "did": districtid,
        "sid": streetid,
        "tid": typeid,
        "startPrice":startPrice,
        "endPrice":endPrice,
    });
}


function CheckHouse(id) {
    //获取datagrid选中行  返回的数组
    var SelectRows = $("#dis").datagrid('getSelections');

    //发送异步请求获取对象进行回显
    var row = SelectRows[0];
    $.post("upPass?ispass=0",
        {"id": row.id},
        function (data) {
            if (data.result > 0) {
                $("#dis").datagrid("reload"); //刷新
            } else {
                $.messager().alert("审核失败");
            }
        }, "json");

}












