<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<link href="css/myStyle.css" type="text/css"  rel="stylesheet">
</head>
<script>
$(function(){
	loadEmployfile();
})

function openWindow(obj,num){
	$("#mywindow").show();
	$("#popOver").show();
	if(num!=0){
		$("#fileid").val($(obj).parent().parent().find("td").eq(0).text());
		$("select").val($(obj).parent().parent().find("td").eq(1).text());
		$("#filename").val($(obj).parent().parent().find("td").eq(2).text());
		$("#content").val($(obj).parent().parent().find("td").eq(3).text());
		$("#remark").val($(obj).parent().parent().find("td").eq(4).text());
		$("#typeid").val($(obj).parent().parent().find("td").eq(5).text());
		isupdate = true;
	}else{
		$("#fileid").val("");
		$("#filename").val("");
		$("#content").val("");
		$("#remark").val("");
		$("#typeid").val("");
		$.get("searchinfo.do",function(arr){
			var html="<option selected:selected></option>";
			for(var i=0;i<arr.length;i++){
				html+="<option>"+arr[i].id+"</option>"
			}
			$("select").html(html);
		})
		isupdate = false;
	}
}

function saveInfo(){
	var ygid = $("select option:selected").val();
	var filename = $("#filename").val();
	var content = $("#content").val();
	var remark = $("#remark").val();
	var typeid = $("#typeid").val();
	if(isupdate){
		var fileid = $("#fileid").val();
		$.get("updatefile.do?fileid="+fileid+"&ygid="+ygid+"&filename="+filename+"&content="+content+"&remark="+remark+"&typeid="+typeid,function(data){
			if(data){
				alert("编辑成功！");
			}else{
				alert("编辑失败！");
			}
			closewindow();
			loadEmployfile();
		})
	}else{
		$.get("addfile.do?ygid="+ygid+"&filename="+filename+"&content="+content+"&remark="+remark+"&typeid="+typeid,function(data){
			if(data){
				alert("添加成功！");
			}else{
				alert("添加失败！");
			}
			closewindow();
			loadEmployfile();
		})
	}
	
}

function delInfo(obj){
	var fileid = $(obj).parent().parent().find("td").eq(0).text();
	$.get("delfile.do?fileid="+fileid,function(data){
		if(data){
			alert("删除成功！");
		}else{
			alert("删除失败！");
		}
		closewindow();
		loadEmployfile();
	})
}

function searchbytype(){
	var typeid = $('input[name="filetype"]:checked ').val();
	if(typeid == 4){
		loadEmployfile()
	}else{
		$.get("searchbytype.do?typeid="+typeid,function(arr){
			var html="";
			for(var i=0;i<arr.length;i++){
	 			html+="<tr>"
					+"<td>"+arr[i].fileid+"</td>"
					+"<td>"+arr[i].ygid+"</td>"
					+"<td>"+arr[i].filename+"</td>"
					+"<td>"+arr[i].content+"</td>"
					+"<td>"+arr[i].remark+"</td>"
					+"<td hidden>"+arr[i].typeid+"</td>"
					+"<td><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openWindow(this,1)'>编辑</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='delInfo(this)'>删除</button></td>"
					+"</tr>"; 
			}	
			$("tbody").html(html);
		})
	}
	
}

var isupdate = false;

function closewindow(){
	$("#mywindow").hide();
	$("#popOver").hide();
}
function loadEmployfile(){
	var url="saarchfile.do";
	
	$.get(url,function(arr){
		//把员工的信息打印到浏览器的控制台
		console.log(arr);
		//把json转换成数组
		
		//声明一个变量，装载后端的数据
		var html="";
	
		for(var i=0;i<arr.length;i++){
 			html+="<tr>"
				+"<td>"+arr[i].fileid+"</td>"
				+"<td>"+arr[i].ygid+"</td>"
				+"<td>"+arr[i].filename+"</td>"
				+"<td>"+arr[i].content+"</td>"
				+"<td>"+arr[i].remark+"</td>"
				+"<td hidden>"+arr[i].typeid+"</td>"
				+"<td><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openWindow(this,1)'>编辑</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='delInfo(this)'>删除</button></td>"
				+"</tr>"; 
		}	
		$("tbody").html(html);
	})
}
</script>
<body>
	<div>
		<input type="radio" name="filetype" value=1> 员工档案
		<input type="radio" name="filetype" value=2> 管理层档案
		<input type="radio" name="filetype" value=3> 股东档案
		<input type="radio" name="filetype" value=4 checked> 所有档案
		<button id="searchfile" onclick="searchbytype()">查询</button>
		<button id="xinzeng" onclick="openWindow(this,0)" style="margin-bottom:10px;">新增</button>
	</div>

	<table style="table-layout:fixed;">
		<thead>
			<th style="width:8%;">档案编号</th>
			<th style="width:8%;">员工编号</th>
			<th style="width:15%;">档案名称</th>
			<th style="width:27%;">内容摘要</th>
			<th style="width:20%;">备注</th>
			<th style="width:22%;">操作</th>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div class="popOver" id="popOver"></div>
	<div id="mywindow" class="myWindow">
			<input type="hidden" id="fileid">
		员工编号：<select>
					
				</select><br><input type="hidden" id="ygid">		
		档案名称:<input type="text" id="filename"><br>
		档案内容:<input type="text" id="content"><br>
		备注:<input type="text" id="remark"><br>
		档案类别号:<input type="text" id="typeid"><br>
		<span>注意：</span>
		<span>员工档案号：1</span><br>
		<span>管理层档案号：2</span><br>
		<span>股东档案号：3</span><br>
		
		<button style="margin-top:10px;" onclick="saveInfo()">保存</button>
		<button onclick="closewindow()">关闭</button>
	</div>
</body>
</html>