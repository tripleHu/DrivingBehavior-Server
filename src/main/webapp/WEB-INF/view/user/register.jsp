<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no"> 
<title>注册</title>
<style> 
            body{margin:0; padding:0;background-color:RGB(190,190,190);} 
 }     
 </style>
</head>
<body>
<form action="http://3040278.nat123.net:20306/DrivingBehavior/user/reg.do" method="POST">
<div id="a" style="position:absolute; width:100%; z-index:-1">    
<img src="/DrivingBehavior/resources/register.png" height="100%" width="100%"/>    
<div style="position:absolute; top:50%;left:30%;width:40%;">
<input type="text" name="username" placeholder="用户名" value="${username }" style="width: 100%; height: 100%; font-size: 24px;">${nameError}
</div>
<div style="position:absolute; top:58%;left:30%;width:40%;">
<input type="password" name="code" placeholder="密码" value="${code}" style="width: 100%; height: 100%; font-size: 24px;">${codeError}
</div>
<div style="position:absolute; top:70%;left:30%;width:40%;height: 5%">
<input type="submit" value="注册" style="width: 100%; height: 50px; font: 幼圆;">
</div>
</div>
</form>

</body>
</html>