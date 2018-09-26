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
	loadapply(null);
})

function loadapply(url){
	if(url==null){
		var url="searchapply.do";
	}
	$.get(url,function(arr){
		console.log(arr);
		
		var html="";
	
		for(var i=0;i<arr.length;i++){
 			html+="<tr>"
				+"<td>"+arr[i].aid+"</td>"
				+"<td>"+arr[i].aname+"</td>"
				+"<td>"+arr[i].asex+"</td>"
				+"<td>"+arr[i].abirthday+"</td>"
				+"<td>"+arr[i].atel+"</td>"
				+"<td>"+arr[i].aemail+"</td>"
				+"<td>"+arr[i].aduty+"</td>"
				+"<td><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openwindow(this,0)'>编辑</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='delyprecord(this)'>删除</button></td>"
				+"</tr>"; 
		}	
		$("tbody").html(html);
	})
}

isupdate = false;
function openwindow(obj,num){
	$("#popOver").show();
	$("#mywindow").show();
	if(num==1){
		$("#aid").val("");
		$("#aname").val("");
		$("#asex").val("");
		$("#abirthday").val("");
		$("#atel").val("");
		$("#aemail").val("");
		$("#aduty").val("");
		isupdate = false;
	}else{
		$("#aid").val($(obj).parent().parent().find("td").eq(0).text());
		$("#aname").val($(obj).parent().parent().find("td").eq(1).text());
		$("#asex").val($(obj).parent().parent().find("td").eq(2).text());
		$("#abirthday").val($(obj).parent().parent().find("td").eq(3).text());
		$("#atel").val($(obj).parent().parent().find("td").eq(4).text());
		$("#aemail").val($(obj).parent().parent().find("td").eq(5).text());
		$("#aduty").val($(obj).parent().parent().find("td").eq(6).text());
		isupdate = true;
	}
}

function closewindow(){
	$("#popOver").hide();
	$("#mywindow").hide();
}

function saveInfo(){
	var aid = $("#aid").val();
	var aname = $("#aname").val();
	var asex = $("#asex").val();
	var abirthday = $("#abirthday").val();
	var atel = $("#atel").val();
	var aemail = $("#aemail").val();
	var aduty = $("#aduty").val();
	if(isupdate){
		$.get("updateapply.do?aid="+aid+"&aname="+aname+"&asex="+asex+"&abirthday="+abirthday+"&atel="+atel
				+"&aemail="+aemail+"&aduty="+aduty,function(data){
			if(data){
				alert("更新成功！");
			}else{
				alert("更新失败！");
			}
			loadapply(null);
			closewindow();
		})
	}else{
		$.get("addapply.do?aid="+aid+"&aname="+aname+"&asex="+asex+"&abirthday="+abirthday+"&atel="+atel
				+"&aemail="+aemail+"&aduty="+aduty,function(data){
			if(data){
				alert("新增成功！");
			}else{
				alert("新增失败！");
			}
			loadapply(null);
			closewindow();
		})
	}
}

function delyprecord(obj){
	var aid =$(obj).parent().parent().find("td").eq(0).text();
	var info = confirm("确定删除这条记录？");
	if(info){
		$.get("delapply.do?aid="+aid,function(data){
			if(data){
				alert("删除成功！");
			}else{
				alert("删除失败！");
			}
			loadapply(null);
			closewindow();
		})
	}
	
}
</script>
<body>
	<table style="table-layout:fixed;" id="mytable">
		<thead>
			<th style="width:5%;">应聘记录编号</th>
			<th style="width:10%;">姓名</th>
			<th style="width:5%;">性别</th>
			<th style="width:15%;">出生日期</th>
			<th style="width:15%;">联系电话</th>
			<th style="width:15%;">邮箱地址</th>
			<th style="width:15%;">应聘职务</th>
			<th style="width:20%;">操作</th>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div>
		<button onclick="openwindow(this,1)" style="margin-top:10px;">新增</button>
	</div>
	<div class="popOver" id="popOver"></div>
	<div id="mywindow" class="myWindow">	
				<input type="hidden" id="aid">	
		姓名：<input type="text" id="aname"><br>
		性别:<input type="text" id="asex"><br>
		出生日期：<input type="date" id="abirthday"><br>
		联系电话：<input type="text" id="atel"><br>
		邮箱地址：<input type="text" id="aemail"><br>
		应聘职务：<input type="text" id="aduty"><br>
		<button style="margin-top:10px;" onclick="saveInfo()">保存</button>
		<button onclick="closewindow()">关闭</button>
	</div>
</body>
</html>