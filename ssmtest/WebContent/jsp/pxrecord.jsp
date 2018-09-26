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
	loadpxrecord(null);
})

function loadpxrecord(url){
	if(url==null){
		var url="searchrecord.do";
	}
	$.get(url,function(arr){
		console.log(arr);
		
		var html="";
	
		for(var i=0;i<arr.length;i++){
 			html+="<tr>"
				+"<td>"+arr[i].recordid+"</td>"
				+"<td>"+arr[i].pxtype+"</td>"
				+"<td>"+arr[i].ygid+"</td>"
				+"<td>"+arr[i].content+"</td>"
				+"<td>"+arr[i].starttime+"</td>"
				+"<td>"+arr[i].endtime+"</td>"
				+"<td><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openWindow(this)'>结束</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='delrecord(this)'>删除</button></td>"
				+"</tr>"; 
		}	
		$("tbody").html(html);
	})
}

function closewindow(){
	$("#popOver").hide();
	$("#mywindow").hide();
}

function saveInfo(){
	var result = $("#pxresult option:selected").val();
	var remark = $("#remark").val();
	console.log(result);
	console.log(ygid);
	$.get("recordend.do?ygid="+ygid+"&result="+result+"&remark="+remark,function(data){
		if(data){
			alert("成功！");
		}else{
			alert("失败！");
		}
	});
	closewindow();
}

function delrecord(obj){
	var recordid = $(obj).parent().parent().find("td").eq(0).text();
	var info = confirm("你确定要删除");
	if(info){
		$.get("delrecord.do?recordid="+recordid,function(data){
			if(data){
				alert("删除成功！");
			}else{
				alert("删除失败！");
			}
			loadpxrecord(null);
		})
	}
	
}
var ygid = null
function openWindow(obj){
	$("#popOver").show();
	$("#mywindow").show();
	$("#remark").val("");
	ygid = $(obj).parent().parent().find("td").eq(2).text();
}
</script>
<body>
	<table style="table-layout:fixed;" id="mytable">
		<thead>
			<th style="width:5%;">记录编号</th>
			<th style="width:10%;">培训类别</th>
			<th style="width:5%;">员工编号</th>
			<th style="width:30%;">培训内容</th>
			<th style="width:15%;">培训开始时间</th>
			<th style="width:15%;">培训结束时间</th>
			<th style="width:20%;">操作</th>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div class="popOver" id="popOver"></div>
	<div id="mywindow" class="myWindow">
		培训结果：<select id="pxresult">
					<option value="优秀">优秀</option>
					<option value="良好">良好</option>
					<option value="一般">一般</option>
					<option value="差">差</option>
					<option value="很">很差</option>
				 </select>
				<br>		
		备注:<input type="text" id="remark"><br>
		<button style="margin-top:10px;" onclick="saveInfo()">保存</button>
		<button onclick="closewindow()">关闭</button>
	</div>
</body>
</html>