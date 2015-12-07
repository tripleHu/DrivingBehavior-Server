<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style> 
            body{margin:0; padding:0;background-color:RGB(190,190,190);} 
 }     
 </style>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no"> 
<title>DrivingBehavior登录</title>
</head>

<body>
<img src="resources/page2.png" width="100%" height="100%" usemap="#Map"  id="main"/>
<map name="Map">
  <area shape="rect"  href="user/login" target="_parent" id="a">
  <area shape="rect"  href="user/reg" target="_parent" id="b">
</map>

</body>
<script type="text/javascript">
window.onload=change;
window.onresize = change;
//winHeight = document.documentElement.clientHeight;
//winWidth = document.documentElement.clientWidth;
//alert("Height "+winHeight);
//alert("Width "+winWidth);
function change(){
	
	 var a=document.body.clientWidth/480;
	 var b=document.body.clientHeight/800;
	 var c1="";
	 c1=135*a+","+490*b+","+330*a+","+542*b
     document.getElementById( "a" ).coords = c1;
	 var c2="";
	 c2=135*a+","+566*b+","+330*a+","+619*b;
	 document.getElementById( "b" ).coords = c2;
 	
}
 </script> 
</html>