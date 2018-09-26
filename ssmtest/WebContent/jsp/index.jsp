<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link href="lib/css/default/easyui.css" type="text/css"  rel="stylesheet">
    <link href="lib/css/icon.css" type="text/css"  rel="stylesheet">
    <link href="css/index.css" type="text/css"  rel="stylesheet">
    <link href="css/myStyle.css" type="text/css"  rel="stylesheet">
    <script src="lib/js/jquery.min.js"></script>
    <script src="lib/js/jquery.easyui.min.js"></script>
     <script  src="lib/js/easyui-lang-zh_CN.js" ></script>
	
</head>
<!--easyui布局样式-->
<body class="easyui-layout">

<!--log头部开始-->
<div data-options="region:'north',border:false" style="height: 40px;background-color: #e3eefe">
	
	<div style="position:absolute;left:1%;top:10% ">
		<span style="font-size: 24px;">人力资源管理系统</span>
	</div>
		

 	<div style="position:absolute;left: 86%;top:20%">
 	 	<img src="img/sys_user.png" width="20" height="20" style="position: relative;top:5px;">
 		<span id="myName">${sessionScope.admin.username}</span>
 		<input type="hidden" id="myPwd" value="${sessionScope.admin.password}">
 		<img src="img/info.png" width="20" height="20" style="position: relative;top:5px;">
 		<span style="cursor: pointer;" onclick="openPwdWin()">修改密码</span>
 		<img src="img/set.png" width="20" height="20" style="position: relative;top:5px;">
 		<span style="cursor: pointer;" onclick="exit()">退出系统</span>	
 	</div>
       

</div>
<!--log头部结束-->

<!--左边导航栏开始-->
<div data-options="region:'west',split:true,title:'导航'" class="left_menu">

<!--树形导航菜单开始-->
	<ul id="mytree" class="easyui-tree">

			<li>
				<span>导航</span>
				<ul>
					<li>
						<span>员工信息</span>
						<ul>
							<li>员工档案管理</li>
							<li>员工合同管理</li>
						</ul>
					</li>
					<li>
						<span>人事管理</span>
						<ul>
							<li>人事调动管理</li>
							<li>人事调动记录</li>
							<li>部门人事信息</li>
						</ul>
					</li>
					<li>
						<span>教育培訓</span>
						<ul>
							<li>培训管理</li>
							<li>培训记录</li>
						</ul>
					</li>
					<li>
						<span>考勤管理</span>
						<ul>
							<li>考勤记录</li>
							<li>薪酬记录</li>
						</ul>
					</li>
					<li>
						<span>招聘管理</span>
						<ul>
							<li>应聘记录</li>
							<li>招聘记录</li>
						</ul>
					</li>
					<li>
						<span>系统管理</span>
						<ul>
							<li>用户管理</li>
							<li>权限分配</li>
						</ul>
					</li>
				</ul>
			</li>
		</ul>
<!--树形导航菜单结束-->

</div>
<!--左边导航栏结束-->

<!--底部开始-->
<div data-options="region:'south',border:false"  style=" height:50px;background:#e3eefe;">


</div>

 
<!--底部结束->

<!--中间内容开始-->
<div data-options="region:'center',title:'内容'" >
    <div  id="contentInfo" class="easyui-tabs" style="height:640px;">
        <div title="首页"   >
			
			欢迎进入我的系统

        </div>
		

    </div>
</div>
<!--中间内容结束-->

<!--密码弹出框开始  -->
 <div class="popOver" id="popOver"></div>
 <div class="myWindow" id="myWindow">
 	<span>旧密码</span><input type="text" id="oldPwd"><br>
 	<span>新密码</span><input type="text" id="newPwd"><br>
 	<span>确认新密码</span><input type="text" id="surePwd"><br>
 	<button onclick="savePwd()">保存</button>	
 	<button onclick="closePwd()">关闭</button>	
 </div>
 <!--密码弹出框结束  -->
</body>
<script>
function exit(){
	$.get("loginout.do",function(data){
		if(data){
			alert("注销成功！");
			window.location.href="login.do";
		}else{
			alert("注销失败！");
		}
	})
}
//打开弹窗
function openPwdWin(){
	$("#popOver").show();
	$("#myWindow").show();
}
//关闭弹窗
function closePwd(){
	$("#popOver").hide();
	$("#myWindow").hide();
}
//密码修改
function savePwd(){
	//获取用户输入的旧密码
	var oldPwd = $("#oldPwd").val();
	//获取用户输入的新密码
	var newPwd = $("#newPwd").val();
	//获取用户输入的确认新密码
	var surePwd = $("#surePwd").val();
	//拿到用户登录的密码
	var myPwd = $("#myPwd").val();
	//拿到用户名
	var myName = $("#myName").text();
	//验证密码输入不能为空
	if(oldPwd.trim()==""){
		alert("旧密码不能为空")
	}else if(newPwd.trim()==""){
		alert("新密码不能为空")
	}else if(surePwd.trim()==""){
		alert("确认新密码不能为空")
	}else if(oldPwd.trim().length>10){
		alert("旧密码长度不能超过六位")
	}else if(newPwd.trim().length>10){
		alert("新密码长度不能超过六位")
	}else if(surePwd.trim().length>10){
		alert("确认新密码长度不能超过六位")
	}else if(newPwd!=surePwd){
		alert("新密码和确认新密码输入不一致")
	}else if(myPwd!=oldPwd){
		alert("旧密码输入错误")	
	}else{
		
		$.post("updatePwd.do?username="+myName+"&password="+newPwd,function(data){
			if(data){
				alert("修改成功")
				
				closePwd();
				//重新登录，跳转到登录页面
				window.location.href="login.do";
			}else{
				alert("修改失败")
			}
			
		})
	}
	
	
}

    //动态添加tab选项卡
    function addTab(title, url){
    	//如果选项卡已经被打开，就选中它，否则，重新打开
        if ($('#contentInfo').tabs('exists', title)){
            $('#contentInfo').tabs('select', title);
        } else {
            var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
            $('#contentInfo').tabs('add',{
                title:title,
                content:content,
                closable:true
            });
        }
    }


$(function(){
	//左边导航栏的树
   $('#mytree').tree({
       //当节点被选中时触发的事件
       onSelect:function(node){
    	   if(node.text=="员工档案管理"){
    		   addTab('员工档案管理','employerPage.do')
    	   }
    	   if(node.text=="员工合同管理"){
    		   addTab('员工合同管理','employerHtPage.do')
    	   }
    	   if(node.text=="人事调动管理"){
    		   addTab('人事调动管理','employerInfo.do')
    	   }
    	   if(node.text=="人事调动记录"){
    		   addTab('人事调动记录','employertransrecord.do')
    	   }
    	   if(node.text=="部门人事信息"){
    		   addTab('部门人事信息','deptinfo.do')
    	   }
    	   if(node.text=="培训管理"){
    		   addTab('培训管理','pxtype.do')
    	   }
    	   if(node.text=="培训记录"){
    		   addTab('培训记录','pxrecord.do')
    	   }
    	   if(node.text=="考勤记录"){
    		   addTab('考勤记录','kqrecord.do')
    	   }
    	   if(node.text=="薪酬记录"){
    		   addTab('薪酬记录','xsrecord.do')
    	   }
    	   if(node.text=="应聘记录"){
    		   addTab('应聘记录','yprecord.do')
    	   }
    	   if(node.text=="招聘记录"){
    		   addTab('招聘记录','zprecord.do')
    	   }
    	   if(node.text=="用户管理"){
    		   addTab('用户管理','usermanage.do')
    	   }
    	   if(node.text=="权限分配"){
    		   addTab('权限分配','qxfenpei.do')
    	   }
    	  
    	   
       }
      
   });
   
	
})
</script>
</body>
</html>