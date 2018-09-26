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
	loadpxtype(null);
})

function loadpxtype(url){
	if(url==null){
		var url="searchtype.do";
	}
	$.get(url,function(arr){
		console.log(arr);
		
		var html="";
	
		for(var i=0;i<arr.length;i++){
 			html+="<tr>"
				+"<td>"+arr[i].typeid+"</td>"
				+"<td>"+arr[i].pxtype+"</td>"
				+"<td>"+arr[i].remark+"</td>"
				+"<td><button style='width: 80px; background: #00DB00; border: solid 1px black;' onclick='openWindow(this,0)'>培训"
				+"<button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openWindow(this,1)'>编辑</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='deltype(this)'>删除</button></td>"
				+"</tr>"; 
		}	
		$("tbody").html(html);
	})
}


var isupdate = false
function openWindow(obj,num){
	$("#popOver").show();
	if(num==0){
		$("#pxwindow").show();
		$("#pxstarttime").val("");
		$("#pxendtime").val("");
		$("#pxcontent").val("");	
		var pxtype = $(obj).parent().parent().find("td").eq(1).text();
		
		$("label").html(pxtype);
		$.get("searchinfo.do",function(arr){	
			var html = "";
			for(var i=0;i<arr.length;i++){
				html+="<option>"+arr[i].name+"</option>"
			}
			$("#ygselect").append(html);
		})
	}else if(num==1){
		$("#mywindow").show();
		$("#typeid").val($(obj).parent().parent().find("td").eq(0).text());
		$("#pxtype").val($(obj).parent().parent().find("td").eq(1).text());
		$("#remark").val($(obj).parent().parent().find("td").eq(2).text());
		isupdate = true;
	}else{
		$("#mywindow").show();
		$("#typeid").val("");
		$("#pxtype").val("");
		$("#remark").val("");
		isupdate = false;
	}
}

function closewindow(){
	$("#popOver").hide();
	$("#mywindow").hide();
	$("#pxwindow").hide();
}

function saveInfo(){
	var pxtype = $("#pxtype").val();
	var remark = $("#remark").val();
	if(isupdate){
		var typeid = $("#typeid").val();
		$.get("updatetype.do?typeid="+typeid+"&pxtype="+pxtype+"&remark="+remark,function(data){
			if(data){
				alert("编辑成功！");
			}else{
				alert("编辑失败！");
			}
			loadpxtype(null);
			closewindow();
		})
	}else{
		$.get("addtype.do?pxtype="+pxtype+"&remark="+remark,function(data){
			if(data){
				alert("添加成功！");
			}else{
				alert("添加失败！");
			}
			loadpxtype(null);
			closewindow();
		})
	}
}

function deltype(obj){
	var typeid = $(obj).parent().parent().find("td").eq(0).text();
	var info = confirm("你确定要删除");
	if(info){
		$.get("deltype.do?typeid="+typeid,function(data){
			console.log(data);
			if(data){
				alert("删除成功！");
			}else{
				alert("删除失败！");
			}
			loadpxtype(null);
			closewindow();
		})
	}
	
}

function saverecord(obj){
	var pxtype = $(obj).parent().find("label").text();
	var ygname = $("#ygselect option:selected").val();
	var pxstarttime = $("#pxstarttime").val();
	var pxendtime = $("#pxendtime").val();
	var content = $("#pxcontent").val();
	$.get("recordadd.do?name="+ygname+"&pxtype="+pxtype+"&starttime="+pxstarttime+"&endtime="+pxendtime+"&content="+content,function(data){
		if(data){
			alert("成功！");
		}else{
			alert("失败！");
		}
		loadpxtype(null);
		closewindow();
	})
}
</script>
<body>
	<div>
		<button style="margin-bottom:10px;" onclick="openWindow(this,2)">新增</button>
	</div>
	<table style="table-layout:fixed;" id="mytable">
		<thead>
			<th style="width:10%;">培训类别编号</th>
			<th style="width:20%;">培训类别</th>
			<th style="width:30%;">备注</th>
			<th style="width:40%;">操作</th>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div class="popOver" id="popOver"></div>
	<div id="mywindow" class="myWindow">
			<input type="hidden" id="typeid">
		培训类别：<input type="text" id="pxtype"><br>		
		备注:<input type="text" id="remark"><br>
		<button style="margin-top:10px;" onclick="saveInfo()">保存</button>
		<button onclick="closewindow()">关闭</button>
	</div>
	<div id="pxwindow" class="myWindow">
		当前培训类别：<label></label><br>
		选择员工：<select id="ygselect">
					<option selected = "selected"></option>
				 </select><br>		
		确定培训开始时间:<input type="date" id="pxstarttime"><br>
		确定培训结束时间:<input type="date" id="pxendtime"><br>
		培训主要内容：<textarea rows="10" cols="30" id="pxcontent"></textarea><br>
		<button style="margin-top:10px;" onclick="saverecord(this)">保存</button>
		<button onclick="closewindow()">关闭</button>
	</div>
</body>
</html>