<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<link href="css/myStyle.css" type="text/css"  rel="stylesheet">
</head>
<body>
	    姓名：<input type="text" id="userNameSearch">
	    性别：<select id="sexSearch">
	    		<option selected="selected"></option>
	    		<option value="男">男</option>
	    		<option value="女">女</option>
	    	</select>
	    	
	   出生日期：  从<input type="date" id="birthDayStart">至<input type="date" id="birthDayEnd">
	  <button onclick="searchByCon()">查询</button>  
	  <br><br>
	<table>
		<thead>
			<th>员工编号</th>
			<th>姓名</th>
			<th>性别</th>
			<th>出生日期</th>
			<th>电话</th>
			<th>邮箱</th>
			<th>学历</th>
			<th>部门</th>
			<th>职务</th>
			<th>入职时间<button style="width: 20px; background: white; border: solid 1px black; text-align:center;" onclick="tablesortbystarttime(0) ">升</button>
			<button style="width: 20px; background: white; border: solid 1px black; text-align:center;" onclick="tablesortbystarttime(1) ">降</button></th>
			<th>状态</th>
			<th>备注</th>
			<th>操作</th>
		</thead>
			<tbody>
		</tbody>
	</table>
	<button id="xinzeng" onclick="openwindow(this,0)" style="margin-top:10px;">新增</button>
	<div class="popOver" id="popOver"></div>
	<div id="mywindow" class="myWindow">
			<input type="hidden" id="id">
		姓名:<input type="text" id="name"><br>
		性别:<input type="text" id="sex"><br>
		生日:<input type="date" id="birthday"><br>
		电话:<input type="text" id="tel"><br>
		邮箱:<input type="text" id="email"><br>
		学历:<input type="text" id="major"><br>
		部门:<input type="text" id="dep"><br>
		工作:<input type="text" id="jod"><br>
		入职时间:<input type="date" id="starttime"><br>
		是否在职:<input type="text" id="status"><br>
		备注:<input type="text" id="remark"><br>
		<button style="margin-top:10px;" onclick="saveInfo()">保存</button>
		<button onclick="closewindow()">关闭</button> 
	</div>
	
	<div id="transwindow" class="myWindow">
			<input type="hidden" id="id">
		员工编号：<label id="tranygid"></label><br>
		原部门：<label id="olddept"></label><br>
		新部门：<select id="newdeptselect">
				</select><br>
		调动时间：<input type="date" id="transtime"><br>
		调动原因：<textarea rows="10" cols="10" id="transtext"></textarea>
		<button style="margin-top:10px;" onclick="trans()">调动</button>
		<button onclick="closewindow()">关闭</button> 
	</div>

	
	

</body>
<script>
	function trans(){
		var deptname = $("#newdeptselect option:selected").val();
		var ygid = $("#tranygid").text();
		console.log(ygid);
		var olddept = $("#olddept").text();
		var transtime = $("#transtime").val();
		var transreason = $("#transtext").val();
		$.get("trans.do?deptname="+deptname+"&ygid="+ygid+"&olddept="+olddept+"&transtime="+transtime+"&transreason="+transreason,function(data){
			if(data){
				alert("调动成功！");
			}else{
				alert("调动失败！该部门已不缺员工");
			}
			loadEmploy(null,null,null,null);
			closewindow();
		})
	}
	function openwindow(obj,num){
		$("#popOver").show();
		
		if(num==0){
			$("#mywindow").show();
			$("#id").val("");
			$("#name").val("");
			$("#sex").val("");
			$("#birthday").val("");
			$("#tel").val("");
			$("#email").val("");
			$("#major").val("");
			$("#dep").val("");
			$("#job").val("");
			$("#starttime").val("");
			$("#status").val("");
		}else{
			$("#transwindow").show();
			$("#transtime").val("");
			$("#transtext").val("");
			$("#olddept").text($(obj).parent().parent().find("td").eq(7).text());
			$("#tranygid").text($(obj).parent().parent().find("td").eq(0).text());
			var olddept = $("#olddept").text();
			$.get("searchnewdept.do?olddept="+olddept,function(arr){
				var html="<option selected='selected'></option>";
				for(var i=0;i<arr.length;i++){
					html+="<option>"+arr[i]+"</option>"
				}
				$("#newdeptselect").html(html);
			})
		}
		
	}
	
	function closewindow(){
		$("#popOver").hide();
		$("#mywindow").hide();
		$("#transwindow").hide();
	}
	
// 	function saveInfo(){
// 		var name = $("#name").val();
// 		var id = $("#id").val();
// 		var id = $("#id").val();
// 		var id = $("#id").val();
// 		var id = $("#id").val();
// 		var id = $("#id").val();
// 		var id = $("#id").val();
// 		var id = $("#id").val();
// 		var id = $("#id").val();
// 		var id = $("#id").val();
// 	}
	function delInfo(obj){
		var id = $(obj).parent().parent().find("td").eq(0).text();
		var info = confirm("你确定要删除");
		console.log(id);
		if(info){
			$.get("del.do?id="+id,function(data){
				if(data){
					alert("删除成功！");
				}else{
					alert("删除失败！");
				}
				loadEmploy(null,null,null,null);
			})
		}
		
	}

	//查询
	function searchByCon(){
		var userNameSearch=$("#userNameSearch").val();
		var sexSearch=$("#sexSearch").val();
		var birthDayStart=$("#birthDayStart").val();
		var birthDayEnd=$("#birthDayEnd").val();
		loadEmploy(userNameSearch,sexSearch,birthDayStart,birthDayEnd)	
	}
	//文档加载事件来加载员工档案的数据
	$(function(){
		loadEmploy(null,null,null,null);
	})

	function loadEmploy(userName,sex,birthDayStart,birthDayEnd){
		var url="searchinfo.do";
		if(userName!=null){
			var url="searchinfo.do?name="+userName+"&sex="+sex+"&birthDayStart="+birthDayStart+"&birthDayEnd="+birthDayEnd;
		}
	
		$.get(url,function(arr){
			//把员工的信息打印到浏览器的控制台
			console.log(arr);
			//把json转换成数组
			
			//声明一个变量，装载后端的数据
			var html="";
		
			for(var i=0;i<arr.length;i++){
	 			html+="<tr>"
					+"<td>"+arr[i].id+"</td>"
					+"<td>"+arr[i].name+"</td>"
					+"<td>"+arr[i].sex+"</td>"
					+"<td>"+arr[i].birthday+"</td>"
					+"<td>"+arr[i].tel+"</td>"
					+"<td>"+arr[i].email+"</td>"
					+"<td>"+arr[i].major+"</td>"
					+"<td>"+arr[i].dep+"</td>"
					+"<td>"+arr[i].job+"</td>"
					+"<td>"+arr[i].starttime+"</td>"
					+"<td>"+arr[i].status+"</td>"
					+"<td>"+arr[i].remark+"</td>"
					+"<td><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openwindow(this,1)'>职务调动</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='delInfo(this)'>删除</button></td>"
					+"</tr>"; 
			}
			
			$("tbody").html(html);
		})
	}
	function tablesortbystarttime(num){
		var url = "";
		if(num==0){
			url = "searchinfodesc.do"
		}else{
			url = "searchinfoasc.do"
		}
		$.get(url,function(arr){
			//把员工的信息打印到浏览器的控制台
			console.log(arr);
			//把json转换成数组
			
			//声明一个变量，装载后端的数据
			var html="";
		
			for(var i=0;i<arr.length;i++){
	 			html+="<tr>"
					+"<td>"+arr[i].id+"</td>"
					+"<td>"+arr[i].name+"</td>"
					+"<td>"+arr[i].sex+"</td>"
					+"<td>"+arr[i].birthday+"</td>"
					+"<td>"+arr[i].tel+"</td>"
					+"<td>"+arr[i].email+"</td>"
					+"<td>"+arr[i].major+"</td>"
					+"<td>"+arr[i].dep+"</td>"
					+"<td>"+arr[i].job+"</td>"
					+"<td>"+arr[i].starttime+"</td>"
					+"<td>"+arr[i].status+"</td>"
					+"<td>"+arr[i].remark+"</td>"
					+"<td><button style='width: 80px; background: #2894FF; border: solid 1px black;' onclick='openwindow()'>职务调动</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='delInfo(this)'>删除</button></td>"
					+"</tr>"; 
			}
			
			$("tbody").html(html);
		})
	}
</script>
</html>