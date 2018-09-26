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
	loadrole();
})

function loadrole(){
	$.get("searchrole.do",function(arr){
		console.log(arr);
		
		var html="";
	
		for(var i=0;i<arr.length;i++){
 			html+="<tr>"
				+"<td>"+arr[i].rid+"</td>"
				+"<td>"+arr[i].rolename+"</td>"
				+"<td>"+arr[i].remark+"</td>"
				+"<td><button style='width: 80px; background: blue; border: solid 1px black;' onclick='loadhadpower(this)'>查看权限</button>"
				+"<button style='width: 80px; background: red; border: solid 1px black;' onclick='loadnothavepower(this)'>添加权限</button></td>"
				+"</tr>"; 
		}	
		$("#mytable tbody").html(html);
	})
}

function loadhadpower(obj){
	var rid = $(obj).parent().parent().find("td").eq(0).text();
	var rolename = $(obj).parent().parent().find("td").eq(1).text();
	if(rolename=="系统管理员"){
		$("#window").show();
		$("#popOver").show();
	}else{
		$.get("searchhadpower.do?rid="+rid,function(arr){
			var html="";	
			for(var i=0;i<arr.length;i++){
	 			html+="<tr>"
					+"<td>"+arr[i]+"</td>"
					+"<td><button style='width: 80px; background: red; border: solid 1px black;' onclick='delpower(this)'>移除权限</button>"
					+"</tr>"; 
			}	
			$("#powertable tbody").html(html);
		})
		$("#mywindow").show();
		$("#popOver").show();
	}
}

function loadnothavepower(obj){
	var rid = $(obj).parent().parent().find("td").eq(0).text();
	var rolename = $(obj).parent().parent().find("td").eq(1).text();
	if(rolename=="系统管理员"){
		$("#window").show();
		$("#popOver").show();
	}else{
		$.get("searchnothavepower.do?rid="+rid,function(arr){
			var html="";	
			for(var i=0;i<arr.length;i++){
	 			html+="<tr>"
					+"<td>"+arr[i]+"</td>"
					+"<td><button style='width: 80px; background: red; border: solid 1px black;' onclick='addpower(this)'>添加权限</button>"
					+"</tr>"; 
			}	
			$("#powertable tbody").html(html);
		})
		$("#mywindow").show();
		dragFunc("mywindow");
		$("#popOver").show();
	}
}

function addpower(obj){
	var power = $(obj).parent().parent().find("td").eq(0).text();
	$.get("addpower.do?power="+power,function(data){
		if(data){
			alert("权限添加成功！");
		}else{
			alert("权限添加失败！");
		}
		closewindow();
		loadrole();
		
	})
}

function dragFunc(id) {
    var Drag = document.getElementById(id);
    Drag.onmousedown = function(event) {
        var ev = event || window.event;
        event.stopPropagation();
        var disX = ev.clientX - Drag.offsetLeft;
        var disY = ev.clientY - Drag.offsetTop;
        document.onmousemove = function(event) {
            var ev = event || window.event;
            Drag.style.left = ev.clientX - disX + "px";
            Drag.style.top = ev.clientY - disY + "px";
            Drag.style.cursor = "move";
        };
    };
    Drag.onmouseup = function() {
        document.onmousemove = null;
        this.style.cursor = "default";
    };
};

function closewindow(){
	$("#window").hide();
	$("#mywindow").hide();
	$("#popOver").hide();
}
</script>
<body>
	<table style="table-layout:fixed;" id="mytable">
		<thead>
			<th>角色编号</th>
			<th>角色名</th>
			<th>备注</th>
			<th>操作</th>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div class="popOver" id="popOver"></div>
	<div id="mywindow" class="myWindow">	
		<table style="table-layout:fixed;" id="powertable">
			<thead>
				<th>权限名称</th>
				<th>操作</th>
			</thead>
			<tbody>
			</tbody>
		</table>
		<button onclick="closewindow()">关闭</button>
	</div>
	<div id="window" class="myWindow">	
		<h1>最高管理员，已拥有所有权限！</h1>
		<button onclick="closewindow()">关闭</button>
	</div>
</body>
</html>