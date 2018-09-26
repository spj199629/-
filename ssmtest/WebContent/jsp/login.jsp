<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<link href="lib/css/default/easyui.css" type="text/css" rel="stylesheet"/>
		<link href="lib/css/icon.css" type="text/css" rel="stylesheet"/>
		
		
		<link href="css/myStyle.css" type="text/css"  rel="stylesheet">
		
		<script src="lib/js/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="lib/js/jquery.easyui.min.js" ></script>
		<script type="text/javascript" src="lib/js/easyui-lang-zh_CN.js" ></script>

	<style>
			.imgbody{
				background: url(img/bj.jpg);/*设置背景图片*/
		
				background-size:100% 100%; /*设置图片尺寸大小*/
				background-attachment: fixed;/*设置图片定位*/
			}
			.myTitle{
				position: fixed;
				top:20%;
				left:37%;
				letter-spacing: 20px;/*字体的间距*/
				font-family:STCaiyun;/*字体样式*/
			}
	</style>	
		
	</head>
	<body class="imgbody">
		<h1 class="myTitle">人力资源管理系统</h1>
		<div id="login" class="easyui-window" title="登录" style="padding:10px;width: 400px; height: 230px;">
			
				<div style="text-align: center;padding: 5px;">
					<form action="loginForm.do" method="post">
						<div>
							<img src="img/sys_user.png" width="20" height="20" style="position: relative;top:5px"/>
							<label for="username">用户名：</label><input type="text" name="username"  id="username"/>
						</div>
						<div>
							<img src="img/xt.png" width="20" height="20" style="position: relative;top:5px"/>
							<label for="password">密&nbsp;&nbsp;&nbsp;码：</label><input type="password" name="password"  id="password"/>					            			
						</div>
						<div>
							<img src="img/info.png" width="20" height="20" style="  position: relative;top:5px;">		
							<label>验证码  :&nbsp;&nbsp;</label>
	             			<input  type="text" id="valCode"  name="valCode" >
	             			<br><br>

	             			<img src="valCode.do" alt="验证码" id="vimg" onclick="resh()" width="70" height="30">
						</div>
						<br>
						<br>
						<span style="color:red">${requestScope.info}</span>
						<br>
						<button type="submit">登录</button>
						<button onclick="cacelInfo()">取消</button>
					</form>
				</div>		
		</div> 
<!-- 		<!-- ajax登录 --> -->
<!-- 				<div id="login" class="easyui-window" title="登录" style="padding:10px;width: 400px; height: 230px;"> -->
			
<!-- 				<div style="text-align: center;padding: 5px;"> -->
				
<!-- 						<div> -->
<!-- 							<img src="img/sys_user.png" width="20" height="20" style="position: relative;top:5px"/> -->
<!-- 							<label for="userName">用户名：</label><input type="text" name="username"  id="userName"/> -->
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<img src="img/xt.png" width="20" height="20" style="position: relative;top:5px"/> -->
<!-- 							<label for="userPwd">密&nbsp;&nbsp;&nbsp;码：</label><input type="password" name="userpwd"  id="userPwd"/> -->
							
<!-- 						</div> -->
<!-- 						<br> -->
<!-- 						<br> -->
				
<!-- 						<br> -->
<!-- 						<button onclick="login()">登录</button> -->
<!-- 						<button onclick="cacelInfo()">取消</button> -->
					
<!-- 				</div> -->
			
<!-- 		</div> -->
	
	</body>
	<script type="text/javascript">
	/*文档加载事件*/
	$(function(){
				/*设置登录窗体*/
			$("#login").window({
					collapsible:false,
					minimizable:false,
					maximizable:false,
					closable:false
					
				});
	})
	
	//取消
	function cacelInfo(){
		//清空用户名
		$("#userName").val("");
		//清空密码框
		$("#userPwd").val("");
	}
	
	//登录
	 function login(){
		var username=$("#userName").val();
		var userpwd=$("#userPwd").val();
		
		$.post("loginAjax.do?username="+username+"&password="+userpwd,function(data){
			if(data){
				//js跳转写法
				window.location.href="index.do"
			}else{
				alert("用户名或密码错误！登录失败！")
			}
		})
	}
	
	 function resh() {
			//获取现在时间的原始值
	    	var timestamp = (new Date()).valueOf();
			console.log(timestamp)
			//取出原src
	    	var url = $("#vimg").attr("src");
			//在原src后面拼接时间戳
	    	url = url + "?timestamp=" + timestamp;
			//将改变的后的url赋值给src
	    	$("#vimg").attr("src", url);
	}

	</script>
</html>
