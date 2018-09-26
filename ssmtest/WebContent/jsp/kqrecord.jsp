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
	loadkqrecord(null);
	loadtype();
})

function loadkqrecord(url){
	if(url==null){
		var url="searchkq.do";
	}
	$.get(url,function(arr){
		console.log(arr);
		
		var html="";
	
		for(var i=0;i<arr.length;i++){
 			html+="<tr>"
				+"<td>"+arr[i].recordid+"</td>"
				+"<td>"+arr[i].ygid+"</td>"
				+"<td>"+arr[i].type+"</td>"
				+"<td>"+arr[i].jcmoney+"</td>"
				+"<td>"+arr[i].recordtime+"</td>"
				+"<td><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openWindow(this)'>编辑</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='deltype(this)'>删除</button></td>"
				+"</tr>"; 
		}	
		$("tbody").html(html);
	})
}

function loadtype(){
	$.get("searchkqtype.do",function(arr){
		console.log(arr);
		
		var html="";
	
		for(var i=0;i<arr.length;i++){
 			html+="<option>"+arr[i].typename+"</option>"
		}	
		$("#typeselect").append(html);
	})
}

function searchByCon(){
	var ygid = $("#ygid").val();
	var type = $("#typeselect option:selected").val();
	console.log(type);

	if(ygid!=""&&type==""){
		$.get("searchkqbyygid.do?ygid="+ygid,function(arr){		
			var html="";
			for(var i=0;i<arr.length;i++){
	 			html+="<tr>"
					+"<td>"+arr[i].recordid+"</td>"
					+"<td>"+arr[i].ygid+"</td>"
					+"<td>"+arr[i].type+"</td>"
					+"<td>"+arr[i].jcmoney+"</td>"
					+"<td>"+arr[i].recordtime+"</td>"
					+"<td><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openWindow(this)'>编辑</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='deltype(this)'>删除</button></td>"
					+"</tr>"; 
			}	
			$("tbody").html(html);
		})
	}else if(ygid==""&&type==""){
		loadkqrecord(null);
	}else if(ygid==""&&type!=""){
		$.get("searchkqbytype.do?type="+type,function(arr){	
			var html="";
			for(var i=0;i<arr.length;i++){
	 			html+="<tr>"
					+"<td>"+arr[i].recordid+"</td>"
					+"<td>"+arr[i].ygid+"</td>"
					+"<td>"+arr[i].type+"</td>"
					+"<td>"+arr[i].jcmoney+"</td>"
					+"<td>"+arr[i].recordtime+"</td>"
					+"<td><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openWindow(this)'>编辑</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='deltype(this)'>删除</button></td>"
					+"</tr>"; 
			}	
			$("tbody").html(html);
		})			
	}else{
		alert("不许同时选择员工编号和考勤类型！");
	}
}

function openWindow(obj){
	$("#updatemoney").val($(obj).parent().parent().find("td").eq(3).text());
	$("#updaterecordid").val($(obj).parent().parent().find("td").eq(0).text());
	$("#updateygid").val($(obj).parent().parent().find("td").eq(1).text());
	$("#mywindow").show();
	$("#popOver").show();
}

function closewindow(){
	$("#mywindow").hide();
	$("#popOver").hide();
	$("#addwindow").hide();
}

function saveInfo(){
	var jcmoney = $("#updatemoney").val();
	var recordid = $("#updaterecordid").val();
	var ygid = $("#updateygid").val();
	$.get("updatekq.do?jcmoney="+jcmoney+"&recordid="+recordid+"&ygid="+ygid,function(data){
		if(data){
			alert("修改成功！");
		}else{
			alert("修改失败！");
		}
		loadkqrecord(null);
		closewindow();
	})
}

function openaddwindow(){
	$.get("searchkqtype.do",function(arr){
		console.log(arr);
			
		var html="<option selected = 'selected'></option>";
	
		for(var i=0;i<arr.length;i++){
 			html+="<option>"+arr[i].typename+"</option>"
		}	
		$("#addtypeselect").html(html);
	})
	$("#addwindow").show();
	$("#popOver").show();
	$.get("searchinfo.do",function(arr){	
		var html = "<option selected='selected'></option>";
		for(var i=0;i<arr.length;i++){
			html+="<option>"+arr[i].id+"</option>"
		}
		$("#ygidselect").html(html);
	})
	$("#addrecordtype").val("");
	$("#addjcmoney").val("");
	$("#addrecordtime").val("");
}

function addrecord(){
	var ygid = $("#ygidselect option:selected").val();
	var recordtype = $("#addtypeselect option:selected").val();
	var jcmoney = $("#addjcmoney").val();
	var recordtime = $("#addrecordtime").val();
	$.get("addkq.do?ygid="+ygid+"&recordtype="+recordtype+"&jcmoney="+jcmoney+"&recordtime="+recordtime,function(data){
		if(data){
			alert("新增成功！");
		}else{
			alert("新增失败！");
		}
		loadkqrecord(null);
		closewindow();
	})
}
</script>
<body>
	<div>
		员工编号：<input type="text" id="ygid">
	    考勤类型：<select id="typeselect">
	    			<option selected = "selected"></option>
	    	</select>  	
	  <button onclick="searchByCon()">查询</button>  
	</div>
	<table style="table-layout:fixed;" id="mytable">
		<thead>
			<th style="width:10%;">考勤记录编号</th>
			<th style="width:10%;">员工编号</th>
			<th style="width:15%;">类型</th>
			<th style="width:20%;">奖惩金额</th>
			<th style="width:20%;">考勤记录时间</th>
			<th style="width:25%;">操作</th>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div>
		<button onclick="openaddwindow()" style="margin-top:10px;">新增</button>
	</div>
	<div class="popOver" id="popOver"></div>
	<div id="mywindow" class="myWindow">	
				<input type="hidden" id="updaterecordid">	
				<input type="hidden" id="updateygid">
		奖惩金额:<input type="text" id="updatemoney"><br>
		<button style="margin-top:10px;" onclick="saveInfo()">保存</button>
		<button onclick="closewindow()">关闭</button>
	</div>
	<div id="addwindow" class="myWindow">	
		员工编号：<select id="ygidselect">
					
				</select><br>
		考勤类型：<select id="addtypeselect">
	    			
	    	</select><br>
		奖惩金额:<input type="text" id="addjcmoney"><br>
		考勤记录时间：<input type="date" id="addrecordtime"><br>
		<button style="margin-top:10px;" onclick="addrecord()">保存</button>
		<button onclick="closewindow()">关闭</button>
	</div>
</body>
</html>