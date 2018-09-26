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
	loadrecruit();
})

function loadrecruit(){
	$.get("searchapply.do",function(arr){
		
		var html="<option selected='selected'></option>";
	
		for(var i=0;i<arr.length;i++){
 			html+="<option>应聘编号:"+arr[i].aid+' 应聘者姓名:'+arr[i].aname+"</option>"
		}	
		$("#yprecordselect").html(html);
	})
	$.get("searchstatus.do",function(arr){
		
		var html="<option selected='selected'></option>";
	
		for(var i=0;i<arr.length;i++){
 			html+="<option>"+arr[i].statustype+"</option>"
		}	
		$("#statusselect").html(html);
	})
	$.get("searchzp.do",function(arr){
		console.log(arr);
		
		var html="";
	
		for(var i=0;i<arr.length;i++){
			console.log(arr);
 			html+="<tr>"
				+"<td>"+arr[i].applyid+"</td>"
				+"<td>"+arr[i].status+"</td>"
				+"<td>"+arr[i].ygid+"</td>"
				+"<td>"+arr[i].major+"</td>"
				+"<td>"+arr[i].dept+"</td>"
				+"<td>"+arr[i].job+"</td>"
				+"<td>"+arr[i].starttime+"</td>"
				+"<td><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='yprecord(this)'>应聘记录</button><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openwindow()'>编辑</button>"
				+"<button style='width: 80px; background: red; border: solid 1px black;' onclick='delzprecord(this)'>删除</button></td>"
				+"</tr>"; 
		}	
		$("tbody").html(html);
	})
}

function openwindow(){
	$("#popOver").show();
	$("#mywindow").show();
	$("#statusid").val("");
	$("#ygid").val("");
	$("#major").val("");
	$("#dept").val("");
	$("#job").val("");
	$("#starttime").val("");
}

function closewindow(){
	$("#popOver").hide();
	$("#mywindow").hide();
}

function saveInfo(){
	var applyid = $("#yprecordselect option:selected").val().replace(/[^0-9]/ig,"");
	var status = $("#statusselect option:selected").val();
	var ygid = $("#ygid").val();
	var major = $("#major").val();
	var dept = $("#dept").val();
	var job = $("#job").val();
	var starttime = $("#starttime").val();
	$.get("addzp.do?applyid="+applyid+"&status="+status+"&ygid="+ygid+"&major="+major+"&dept="+dept+"&job="+job+"&starttime="+starttime,function(data){
		if(data){
			alert("添加成功!");
		}else{
			alert("添加失败!");
		}
		loadrecruit();
		closewindow();
	})
}

function yprecord(obj){
	var applyid = $(obj).parent().parent().find("td").eq(0).text();
	console.log(applyid);
	$.get("searchbyapplyid.do?applyid="+applyid,function(aobj){
		var html="";
		html+="<tr>"
			+"<td>"+aobj.aid+"</td>"
			+"<td>"+aobj.aname+"</td>"
			+"<td>"+aobj.asex+"</td>"
			+"<td>"+aobj.abirthday+"</td>"
			+"<td>"+aobj.atel+"</td>"
			+"<td>"+aobj.aemail+"</td>"
			+"<td>"+aobj.aduty+"</td>"
			+"</tr>";
		$("#yptable tbody").html(html);
	})
	$("#yptable").toggle();
}

function delzprecord(obj){
	var applyid = $(obj).parent().parent().find("td").eq(0).text();
	$.get("delzp.do?applyid="+applyid,function(data){
		if(data){
			alert("删除成功!");
		}else{
			alert("删除失败!");
		}
		loadrecruit();
		closewindow();
	})
}
</script>
<body>
	<div>
		<button onclick="openwindow()" style="margin-bottom:10px;">新增</button>
	</div>
	<table style="table-layout:fixed; display:none;"  id="yptable">
		<thead>
			<th style="width:10%;">应聘记录编号</th>
			<th style="width:10%;">姓名</th>
			<th style="width:10%;">性别</th>
			<th style="width:15%;">出生日期</th>
			<th style="width:15%;">联系电话</th>
			<th style="width:20%;">邮箱地址</th>
			<th style="width:20%;">应聘职务</th>
		</thead>
		<tbody>
		</tbody>
	</table>
	<table style="table-layout:fixed;" id="zptable">
		<thead>
			<th style="width:5%;">应聘记录编号</th>
			<th style="width:10%;">招聘状态</th>
			<th style="width:5%;">员工编号</th>
			<th style="width:10%;">学历</th>
			<th style="width:10%;">部门</th>
			<th style="width:10%;">职务</th>
			<th style="width:15%;">入职时间</th>
			<th style="width:35%;">操作</th> 
		</thead>
		<tbody>
		</tbody>
	</table>
	<div class="popOver" id="popOver"></div>
	<div id="mywindow" class="myWindow">	
		应聘记录：<select id="yprecordselect">
					
				</select><br>
		招聘状态:<select id="statusselect">
					
				</select><br>
		员工编号：<input type="text" id="ygid"><br>
		学历：<input type="text" id="major"><br>
		部门：<input type="text" id="dept"><br>
		职务：<input type="text" id="job"><br>
		入职时间：<input type="date" id="starttime"><br>
		<button style="margin-top:10px;" onclick="saveInfo()">保存</button>
		<button onclick="closewindow()">关闭</button>
	</div>
</body>
</html>