<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<link href="css/myStyle.css" type="text/css"  rel="stylesheet">
</head>
<script>
$(function(){
	loaddept();
})

function loaddept(){
	$.get("searchdeptinfo.do",function(arr){
		console.log(arr);
		
		var html="";
	
		for(var i=0;i<arr.length;i++){
 			html+="<tr>"
				+"<td>"+arr[i].deptid+"</td>"
				+"<td>"+arr[i].deptname+"</td>"
				+"<td>"+arr[i].deptnumber+"</td>"
				+"<td>"+arr[i].qynumber+"</td>"
				+"<td><button style='width: 100px; background: #2894FF; border: solid 1px black;' onclick='openWindow(this)'>修改定员数</button><button style='width: 80px; background: red; border: solid 1px black;' onclick='deltype(this)'>删除部门</button></td>"
				+"</tr>"; 
		}	
		$("tbody").html(html);
	})
}

</script>
<body>
	<table style="table-layout:fixed;" id="mytable">
		<thead>
			<th>部门编号</th>
			<th>部门名</th>
			<th>部门定员数</th>
			<th>部门缺员数</th>
			<th>操作</th>
		</thead>
		<tbody>
		</tbody>
	</table>
</body>
</html>