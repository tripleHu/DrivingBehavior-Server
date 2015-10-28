<%@ page language="java" contentType="text/html; charset=UTF-8"  
 pageEncoding="UTF-8" %>  
<!DOCTYPE html >  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />  
<title>Hello, BaiduMap</title>  
<style type="text/css">  
html{height:100%}  
body{height:100%;margin:0px;padding:0px}  
#container{height:100%}  
</style>  
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=QQO985xOjQfV6NLcDtuMSPVN">
//v1.5版本的引用方式：src="http://api.map.baidu.com/api?v=1.5&ak=您的密钥"
//v1.4版本及以前版本的引用方式：src="http://api.map.baidu.com/api?v=1.4&key=您的密钥&callback=initialize"
</script>
</head>  
 
<body>  
<div id="container"></div> 
<script type="text/javascript"> 
var map = new BMap.Map("container");          // 创建地图实例  
var point = new BMap.Point(116.404, 39.915);  // 创建点坐标  
map.centerAndZoom(point, 10);                 // 初始化地图，设置中心点坐标和地图级别  
window.setTimeout(function(){  
    map.panTo(new BMap.Point(106.409, 29.918));    
}, 2000);
</script>  
</body>  
</html>