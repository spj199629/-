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
	loaddrecord();
})

function loaddrecord(){
	$.get("searchtrans.do",function(arr){
		console.log(arr);
		
		var html="";
	
		for(var i=0;i<arr.length;i++){
 			html+="<tr>"
				+"<td>"+arr[i].trid+"</td>"
				+"<td>"+arr[i].ygid+"</td>"
				+"<td>"+arr[i].oldjob+"</td>"
				+"<td>"+arr[i].newjob+"</td>"
				+"<td>"+arr[i].transtime+"</td>"
				+"<td>"+arr[i].transreason+"</td>"
				+"</tr>"; 
		}	
		$("tbody").html(html);
	})
}
</script>
<body>
	<table style="table-layout:fixed;" id="mytable">
		<thead>
			<th>记录编号</th>
			<th>员工编号</th>
			<th>原部门</th>
			<th>新部门</th>
			<th>调动时间</th>
			<th>调动原因</th>
		</thead>
		<tbody>
		</tbody>
	</table>
</body>
</html>