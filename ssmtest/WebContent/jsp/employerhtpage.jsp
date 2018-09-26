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
	loadEmployht(null);
})

function loadEmployht(url){
	if(url==null){
		var url="searchht.do";
	}
	$.get(url,function(arr){
		//把员工的信息打印到浏览器的控制台
		console.log(arr);
		//把json转换成数组
		
		//声明一个变量，装载后端的数据
		var html="";
	
		for(var i=0;i<arr.length;i++){
 			html+="<tr>"
				+"<td>"+arr[i].htid+"</td>"
				+"<td>"+arr[i].ygid+"</td>"
				+"<td>"+arr[i].starttime+"</td>"
				+"<td>"+arr[i].endtime+"</td>"
				+"<td>"+arr[i].job+"</td>"
				+"<td>"+arr[i].content+"</td>"
				+"<td>"+arr[i].remark+"</td>"
				+"<td><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openWindow(this,1)'>编辑</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='delInfo(this)'>删除</button></td>"
				+"</tr>"; 
		}	
		$("tbody").html(html);
	})
}
function openWindow(obj,num){
	$("#mywindow").show();
	$("#popOver").show();
	if(num!=0){
		$("#htid").val($(obj).parent().parent().find("td").eq(0).text());
		$("select").val($(obj).parent().parent().find("td").eq(1).text());
		$("#starttime").val($(obj).parent().parent().find("td").eq(2).text());
		$("#endtime").val($(obj).parent().parent().find("td").eq(3).text());
		$("#job").val($(obj).parent().parent().find("td").eq(4).text());
		$("#content").val($(obj).parent().parent().find("td").eq(5).text());
		$("#remark").val($(obj).parent().parent().find("td").eq(6).text());
		isupdate = true;
	}else{
		$("#htid").val("");
		$("#starttime").val("");
		$("#endtime").val("");
		$("#job").val("");
		$("#content").val("");
		$("#remark").val("");
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
	var htid = $("#htid").val();
	var ygid = $("select option:selected").val();
	var starttime = $("#starttime").val();
	var endtime = $("#endtime").val();
	var job = $("#job").val();
	var content = $("#content" ).val();
	var remark = $("#remark").val();
	if(isupdate){
		var htid = $("#htid").val();
		$.get("updateht.do?htid="+htid+"&ygid="+ygid+"&starttime="+starttime+"&endtime="+endtime+"&job="+job+"&content="+content+"&remark="+remark,function(data){
			if(data){
				alert("编辑成功！");
			}else{
				alert("编辑失败！");
			}
			closewindow();
			loadEmployht();
		})
	}else{
		console.log(starttime);
		$.get("addht.do?htid="+htid+"&ygid="+ygid+"&starttime="+starttime+"&endtime="+endtime+"&job="+job+"&content="+content+"&remark="+remark,function(data){
			if(data){
				alert("添加成功！");
			}else{
				alert("添加失败！");
			}
			closewindow();
			loadEmployht();
		})
	}
	
}

function delInfo(obj){
	var htid = $(obj).parent().parent().find("td").eq(0).text();
	$.get("delht.do?htid="+htid,function(data){
		if(data=="pmt"){
			alert("你没有此权限！");
		}else{
			alert("删除成功！");
		}
		closewindow();
		loadEmployht();
	})
}

function closewindow(){
	$("#mywindow").hide();
	$("#popOver").hide();
}

var url = null;
function tablesortbyendtime(num){
	if(num==0){
		url = "searchhtdesc.do"
	}else{
		url = "searchhtasc.do"
	}
	loadEmployht(url);
}
function searchbyname(){
	var name = $("#ygname").val();
	console.log(name);
	if(name==""){
		loadEmployht(url);
	}else{
		$.get("searchbyname.do?name="+name,function(arr){
			//把员工的信息打印到浏览器的控制台

			//把json转换成数组
			
			//声明一个变量，装载后端的数据
			var html="";
	 			html+="<tr>"
					+"<td>"+arr.htid+"</td>"
					+"<td>"+arr.ygid+"</td>"
					+"<td>"+arr.starttime+"</td>"
					+"<td>"+arr.endtime+"</td>"
					+"<td>"+arr.job+"</td>"
					+"<td>"+arr.content+"</td>"
					+"<td>"+arr.remark+"</td>"
					+"<td><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openWindow(this,1)'>编辑</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='delInfo(this)'>删除</button></td>"
					+"</tr>"; 
			$("tbody").html(html);
		})
	}
	
}
</script>
<body>
<div>
	   	 员工姓名：<input type="text" id="ygname">
	 	 <button onclick="searchbyname()">查询</button>  
		<button id="xinzeng" onclick="openWindow(this,0)" style="margin-bottom:10px;">新增</button>
</div>	
<table style="table-layout:fixed;" id="mytable">
		<thead>
			<th style="width:8%;">合同编号</th>
			<th style="width:8%;">员工编号</th>
			<th style="width:15%;">合同开始时间</th>
			<th style="width:27%;">合同到期时间<button style="width: 20px; background: white; border: solid 1px black; text-align:center;" onclick="tablesortbyendtime(0) ">升</button>
			<button style="width: 20px; background: white; border: solid 1px black; text-align:center;" onclick="tablesortbyendtime(1) ">降</button>
			</th>
			<th style="width:20%;">职务</th>
			<th style="width:22%;">合同内容</th>
			<th style="width:22%;">备注</th>
			<th style="width:22%;">操作</th>
		</thead>
		<tbody>
		</tbody>
	</table>
	
	
	<div class="popOver" id="popOver"></div>
	<div id="mywindow" class="myWindow">
			<input type="hidden" id="htid">
		员工编号：<select></select><br>		
		合同开始时间:<input type="date" id="starttime"><br>
		合同到期时间:<input type="date" id="endtime"><br>
		职务:<input type="text" id="job"><br>
		合同内容:<input type="text" id="content"><br>
		备注:<input type="text" id="remark"><br>
		
		<button style="margin-top:10px;" onclick="saveInfo()">保存</button>
		<button onclick="closewindow()">关闭</button>
	</div>
</body>
</html>