<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />
  <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome-ie7.min.css" />
  <![endif]-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
<title>供应商管理</title>
</head>
<body>
<div class="page-content">
<div class="gys_style">
<form>
 <div class="Manager_style">

    <div class="title_name">添加供应商</div>
    <button type="button" onclick="addsupplier1();" class="btn btn-primary" id="Add_supplier_btn">添加供应商</button>
    <div id="Add_supplier_style" style="display:none">
    <div class="Add_Manager_style">
    <div class="add_user_style clearfix">
    
     <ul class="clearfix">
      
      <li><label class="label_name">供应商名称</label> <input msg="供应商名称" name="supname" type="text"  class="text_add"/><i style="color:#F60; ">*</i></li>
      <li><label class="label_name">联系人</label><input msg="联系人" name="personname" type="text"  class="text_add"/><i style="color:#F60; ">*</i></li>
      <li><label class="label_name">联系电话</label><input msg="联系电话" name="tel" type="text"  class="text_add"/><i style="color:#F60; ">*</i></li>
      <li><label class="label_name">联系邮箱</label><input msg="联系邮箱" name="email" type="text"  class="text_add"/></li>
     
       </ul> 
  
      <div class="Remark"><label class="label_name">备注</label><textarea name="remark" cols="" rows="" style=" width:433px; height:200px; padding:5px;"></textarea></div>
<!--      <div class="btn_operating"><button id="submit" type="button" class="btn btn-primary">保存</button><button  type="button" class="btn btn-warning">重置</button></div>-->
      </div>       
      </div>
      </div>
    </div>
</form>

    <div class="Manager_style">
     <span class="title_name">供应商信息</span>
     <table  id="tcontent" class="table table-striped table-bordered table-hover">
      <thead>
       <tr>
        <th>序号</th>
        <th>名称</th>
        <th>联系人</th>
        <th>联系电话</th>
        <th>联系邮箱</th>
        <th>备注</th>
        <th>操作</th>
       </tr>
      </thead>
      <tbody id="tbody">
      <!--  <tr>
        <td>1</td><td>供应商A</td><td>刘怀帮</td><td>13505140602</td><td>13505140602@qq.com</td><td>备注信息</td>
        <td><button type="button" class="btn btn-primary">修改</button> <button type="button" class="btn btn-warning">删除</button></td>
       </tr>
       <tr>
        <td>2</td><td>供应商A</td><td>刘怀帮</td><td>13505140602</td><td>13505140602@qq.com</td><td>备注信息</td>
        <td><button type="button" class="btn btn-primary">修改</button> <button type="button" class="btn btn-warning">删除</button></td>
       </tr>
       <tr>
        <td>3</td><td>供应商A</td><td>刘怀帮</td><td>13505140602</td><td>13505140602@qq.com</td><td>备注信息</td>
        <td><button type="button" class="btn btn-primary">修改</button> <button type="button" class="btn btn-warning">删除</button></td>
       </tr>
       <tr>
        <td>4</td><td>供应商A</td><td>刘怀帮</td><td>13505140602</td><td>13505140602@qq.com</td><td>备注信息</td>
        <td><button type="button" class="btn btn-primary">修改</button> <button type="button" class="btn btn-warning">删除</button></td>
       </tr> -->
      </tbody>
     </table>
    <div id="page1"></div> 
    </div> 
    </div>    
</div>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	
    <script src="${pageContext.request.contextPath}/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-paginator.js" type="text/javascript"></script>
<script type="text/javascript">
/***判断用户添加文本**/
function addsupplier1() {
				layer.open({
					type : 1,
					title : '添加供应商',
					maxmin : true,
					shadeClose : true, //点击遮罩关闭层
					area : [ '600px', '' ],
					content : $('#Add_supplier_style'),
					btn : [ '提交', '取消' ],
					yes : function(index, layero) {
						var num = 0;
						var str = "";
						$("input[type$='text']").each(
								function(n) {
									if ($(this).val() == "") {

										layer.alert(str += ""
												+ $(this).attr("msg")
												+ "不能为空！\r\n", {
											title : '提示框',
											icon : 0,

										});
										num++;
										return false;
									}
								});
						if (num > 0) {
							return false;
						} else { 
                            //提交数据
                            var senddata = $("form").serialize();
                            var addajaxpath = "${pageContext.request.contextPath}/supplier/addsupplier";
                            $.ajax({
                            	   type: "POST",
                            	   url: addajaxpath,
                            	   data: senddata,
                            	   success: function(msg){
                            		 if(msg=="Y"){
                            			 layer.alert('添加成功！', {
             								title : '提示框',
             								icon : 1,
             							});
             							layer.close(index); 
                            		 }else{
                            			 layer.alert('添加失败！', {
              								title : '提示框',
              								icon : 1,
              							});
                            		 }
                            	    
                            	   }
                            });
							
						}
					}
				})
				}
			
			
			
	
       //关于分页的实现代码
$(function () {
        var carId = 1;
        var spath = "${pageContext.request.contextPath}/supplier/getsuppliers";
        $.ajax({
            url: spath,
            datatype: 'json',
            type: "post",
            data: "pagesize=5",
            success: function (data) {
                   var listdata = eval("(" + data + ")").result;//得到集合数据
                   PackagData(listdata);
            	
                    var pageCount = eval("(" + data + ")").pagecount; //取到pageCount的值(把返回数据转成object类型)
                    var currentPage = eval("(" + data + ")").currenpage; //得到urrentPage
                    var options = {
                        bootstrapMajorVersion: 2, //版本
                        currentPage: currentPage, //当前页数
                        totalPages: pageCount, //总页数
                        itemTexts: function (type, page, current) {
                            switch (type) {
                                case "first":
                                    return "首页";
                                case "prev":
                                    return "上一页";
                                case "next":
                                    return "下一页";
                                case "last":
                                    return "末页";
                                case "page":
                                    return page;
                            }
                        },//点击事件，用于通过Ajax来刷新整个list列表
                        onPageClicked: function (event, originalEvent, type, page) {
                            var saddpath= "${pageContext.request.contextPath}/supplier/getsuppliers";
                        	$.ajax({
                                url: saddpath,
                                type: "Post",
                                data: "pageindex=" + page,
                                success: function (data1) {
                                
                                	 var listdata2 = eval("(" + data1 + ")").result;
                                     PackagData(listdata2);
                                   
                                }
                            });
                        }
                    };
                    $('#page1').bootstrapPaginator(options);
                }
            });
        });
       
 
       
function PackagData(res){
	
        var content="";  
        for(var i=0;i<res.length;i++){  
            content+="<tr><td>";  
            content+=res[i].id;  
            content+="</td><td>";  
            content+=res[i].supname;  
            content+="</td><td>";  
            content+=res[i].personname;  
            content+="</td><td>";  
            content+=res[i].tel;  
            content+="</td><td>"; 
            content+=res[i].email;  
            content+="</td><td>";  
            content+=res[i].remark;  
            content+="</td><td>";  
            content+="<button type=\"button\" class=\"btn btn-primary\" onclick=\"updateitem("+res[i].id+");\">修改</button> ";  
            content+="<button type=\"button\" class=\"btn btn-warning\" onclick=\"delitem("+res[i].id+");\">删除</button>";  
            content+="</td></tr>";  
               
        }  
        $("#tbody").html(content);  
}  
function updateitem(id){
	//需要从后台把数据提取之后填充到页面
	
	 var spath = "${pageContext.request.contextPath}/supplier/updatesupplier?id="+id;
	 
	 $.ajax({
            url: spath,
            datatype: 'json',
            type: "get",
            success:function(data){
            	  /* alert(data.supname);
            	  $("input[name='supname']").val(data.supname); */
            	  var data = eval("(" + data + ")")
            	     $("input[name='supname']").val(data.supname);
            	     //......
            	}
            });
	
	
	layer.open({
		type : 1,
		title : '修改供应商',
		maxmin : true,
		shadeClose : true, //点击遮罩关闭层
		area : [ '600px', '' ],
		content : $('#Add_supplier_style'),
		btn : [ '保存', '取消' ],
		yes : function(index, layero) {
			var num = 0;
			var str = "";
			$("input[type$='text']").each(
					function(n) {
						if ($(this).val() == "") {

							layer.alert(str += ""
									+ $(this).attr(
											"name")
									+ "不能为空！\r\n", {
								title : '提示框',
								icon : 0,

							});
							num++;
							return false;
						}
					});
			if (num > 0) {
				return false;
			} else {
				layer.alert('保存成功！', {
					title : '提示框',
					icon : 1,
				});
				layer.close(index);
			}
		}
	})
	};
</script>
</body>
</html>