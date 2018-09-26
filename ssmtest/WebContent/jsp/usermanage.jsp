<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<link href="css/myStyle.css" type="text/css"  rel="stylesheet">
</head>
<script>
$(function(){
	loadurrel();
	loadrole();
})

function loadurrel(){
	$.get("searchurrel.do",function(arr){
		console.log(arr);
		
		var html="";
	
		for(var i=0;i<arr.length;i++){
 			html+="<tr>"
				+"<td>"+arr[i].username+"</td>"
				+"<td>"+arr[i].rid+"</td>"
				+"<td><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openwindow(this,0)'>变更角色</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='deluser(this)'>删除用户</button></td>"
				+"</tr>"; 
		}	
		$("#mytable tbody").html(html);
	})
}

function loadrole(){
	$.get("searchrole.do",function(arr){
		console.log(arr);
		
		var html="";
	
		for(var i=0;i<arr.length;i++){
 			html+="<tr>"
				+"<td>"+arr[i].rid+"</td>"
				+"<td>"+arr[i].rolename+"</td>"
				+"<td>"+arr[i].remark+"</td>"
				+"<td><button style='width: 80px; background: red; border: solid 1px black;' onclick='delrole(this)'>删除角色</button></td>"
				+"</tr>"; 
		}	
		$("#roletable tbody").html(html);
	})
}

function showrole(){
	$("#rolediv").toggle(1000);
}

function openwindow(obj,num){
	$("#popOver").show();
	if(num==1){
		$("#mywindow").show();
		$("#rolename").val("");
		$("#remark").val("");
	}else{
		$("#updatewindow").show();
		$("#username").val($(obj).parent().parent().find("td").eq(0).text());
		$("#rid").val($(obj).parent().parent().find("td").eq(1).text());
	}
}

function addrole(){
	var rolename = $("#rolename").val();
	var remark = $("#remark").val();
	$.get("addrole.do?rolename="+rolename+"&remark="+remark,function(data){
		if(data){
			alert("添加成功！");
		}else{
			alert("添加失败！");
		}
		loadrole();
		closewindow();
	})
}

function closewindow(){
	$("#popOver").hide();
	$("#mywindow").hide();
	$("#updatewindow").hide();
}

function updateurrel(){
	var username = $("#username").val();
	var rid = $("#rid").val();
	$.get("updateurrel.do?rid="+rid+"&username="+username,function(data){
		if(data){
			alert("变更成功！");
		}else{
			alert("变更失败！");
		}
		loadurrel();
		closewindow();
	})
}

function delrole(obj){
	var rid = $(obj).parent().parent().find("td").eq(0).text();
	var rolename = $(obj).parent().parent().find("td").eq(1).text();
	if(rolename=="系统管理员"){
		alert("最高管理员，没人可以删除！");
	}else{
		$.get("delrole.do?rid="+rid,function(data){
			if(data){
				alert("删除成功！");
			}else{
				alert("删除失败！");
			}
			loadrole();
			closewindow();
		})
	}
	
}

function deluser(obj){
	var username = $(obj).parent().parent().find("td").eq(0).text();
	$.get("deluser.do?username="+username,function(data){
		if(data){
			alert("删除成功！");
		}else{
			alert("删除失败！");
		}
		loadurrel();
		closewindow();
	})
}
</script>
<body>
	<table style="table-layout:fixed;" id="mytable">
		<thead>
			<th>用户名</th>
			<th>角色编号</th>
			<th>操作</th>
		</thead>
		<tbody>
		</tbody>
	</table>
	<button onclick="showrole()" style="margin-top:5px;">查看系统角色</button>
	<div id="rolediv" style="display:none">
		<table style="table-layout:fixed;" id="roletable">
			<thead>
				<th>角色编号</th>
				<th>角色名</th>
				<th>备注</th>
				<th>操作</th>
			</thead>
			<tbody>
			</tbody>
		</table>
		<button onclick="openwindow(this,1)">添加角色</button>
	</div>
	<div class="popOver" id="popOver"></div>
	<div id="mywindow" class="myWindow">	
		角色名：<input type="text" id="rolename"><br>
		备注:<input type="text" id="remark"><br>
		<button style="margin-top:10px;" onclick="addrole()">保存</button>
		<button onclick="closewindow()">关闭</button>
	</div>
	<div id="updatewindow" class="myWindow">	
		用户名：<input type="text" id="username" readonly="readonly"><br>
		角色id:<input type="text" id="rid"><br>
		<button style="margin-top:10px;" onclick="updaterole()">保存</button>
		<button onclick="closewindow()">关闭</button>
	</div>
</body>
</html>