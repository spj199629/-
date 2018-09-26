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
	loadscrecord(null);
})


function loadscrecord(url){
	if(url==null){
		var url="searchscrecord.do";
	}
	$.get(url,function(arr){
		console.log(arr);
		
		var html="";
	
		for(var i=0;i<arr.length;i++){
 			html+="<tr>"
				+"<td>"+arr[i].ygid+"</td>"
				+"<td>"+arr[i].basepay+"</td>"
				+"<td>"+arr[i].meritpay+"</td>"
				+"<td>"+arr[i].reward+"</td>"
				+"<td>"+arr[i].fkpay+"</td>"
				+"<td>"+arr[i].scnumber+"</td>"
				+"<td>"+arr[i].sendtime+"</td>"
				+"<td><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openWindow(this,0)'>编辑</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='delscrecord(this)'>删除</button></td>"
				+"</tr>"; 
		}	
		$("tbody").html(html);
	})
	$.get("searchinfo.do",function(arr){	
			var html = "";
			for(var i=0;i<arr.length;i++){
				html+="<option>"+arr[i].id+"</option>"
			}
			$("#ygidselect").append(html);
	})
}

function closewindow(){
	$("#popOver").hide();
	$("#mywindow").hide();
	$("#changewindow").hide();
}

function openWindow(obj,num){
	$("#popOver").show();
	
	if(num==0){
		$("#changewindow").show();
		$("#updateygid").val($(obj).parent().parent().find("td").eq(0).text());
		$("#updatebasepay").val($(obj).parent().parent().find("td").eq(1).text());
		$("#updatemeritpay").val($(obj).parent().parent().find("td").eq(2).text());
		$("#updatesendtime").val($(obj).parent().parent().find("td").eq(6).text());		
	}else{
		$("#mywindow").show();
		
	}
	
}

function addrecord(){
	var ygid = $("#ygidselect option:selected").val();
	var basepay = $("#basepay").val();
	var meritpay = $("#meritpay").val();
	var sendtime = $("#sendtime").val();
	$.get("addscrecord.do?ygid="+ygid+"&basepay="+basepay+"&meritpay="+meritpay+"&sendtime="+sendtime,function(data){
		if(data){
			alert("新增成功！");
		}else{
			alert("新增失败！");
		}
		loadscrecord(null);
		closewindow();
	})
}

function delscrecord(obj){
	var ygid = $(obj).parent().parent().find("td").eq(0).text();
	$.get("delscrecord.do?ygid="+ygid,function(data){
		if(data){
			alert("删除成功！");
		}else{
			alert("删除失败！");
		}
		loadscrecord(null);
		closewindow();
	})
}

function updaterecord(){
	var ygid = $("#updateygid").val();
	var basepay = $("#updatebasepay").val();
	var meritpay = $("#updatemeritpay").val();
	var sendtime = $("#updatesendtime").val();
	$.get("updatescrecord.do?ygid="+ygid+"&basepay="+basepay+"&meritpay="+meritpay+"&sendtime="+sendtime,function(data){
		if(data){
			alert("编辑成功！");
		}else{
			alert("编辑失败！");
		}
		loadscrecord(null);
		closewindow();
	})
}
</script>
<body>
	<div>
	  <button onclick="openWindow(this,1)" style="margin-bottom:10px;">新增</button>  
	</div>
	<table style="table-layout:fixed;" id="mytable">
		<thead>
			<th style="width:5%;">员工编号</th>
			<th style="width:10%;">基础工资</th>
			<th style="width:10%;">绩效奖金</th>
			<th style="width:10%;">奖金</th>
			<th style="width:10%;">罚金</th>
			<th style="width:10%;">薪酬数目</th>
			<th style="width:20%;">发薪时间</th>
			<th style="width:25%;">操作</th>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div class="popOver" id="popOver"></div>
	<div id="mywindow" class="myWindow">
		员工编号:<select id="ygidselect">
					<option selected="selected"></option>
				</select><br>
		基本工资：<input type="text" id="basepay"/><br>
		绩效奖金：<input type="text" id="meritpay"/><br>
		发薪时间：<input type="date" id="sendtime"/><br>
		<button style="margin-top:10px;" onclick="addrecord()">保存</button>
		<button onclick="closewindow()">关闭</button>
	</div>
	<div id="changewindow" class="myWindow">
				<input type="hidden" id="updateygid"><br>
		基本工资：<input type="text" id="updatebasepay"/><br>
		绩效奖金：<input type="text" id="updatemeritpay"/><br>
		发薪时间：<input type="date" id="updatesendtime"/><br>
		<button style="margin-top:10px;" onclick="updaterecord()">保存</button>
		<button onclick="closewindow()">关闭</button>
	</div>
</body>
</html>