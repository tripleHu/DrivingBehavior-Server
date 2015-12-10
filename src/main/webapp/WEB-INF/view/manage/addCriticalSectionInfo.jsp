<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加关键区域信息</title>
 <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=QQO985xOjQfV6NLcDtuMSPVN"></script>
 <!-- jQuery file -->
<script src="/DrivingBehavior/resources/js/jquery-1.8.3.min.js" ></script>
</head>
<body>
<div style="margin: 0 auto; width:640px">
<form>
GPS坐标系<br/>
硬件/谷歌地球卫星
<input type="radio" checked="checked" name="GPS" value="1" onClick="checkGPStype()"/>
百度
<input type="radio" name="GPS" value="2" onClick="checkGPStype()"/>
</form><br/>
往返标记(返程请勾选)<input type="checkbox" id="flag"><br/><br/>
高峰时段标记(高峰时期请勾选)<input type="checkbox" id="rushhour"><br/><br/>
公交车线路
<select id="bus_route">
<option>805路</option>
<option>802路</option>
<option>806路</option>
</select><br/><br/>
公交车站<input type="text"  id="station">
车站标号<input type="number" id="station_No"><br/><br/>
经度<input type="text" id="lng">
纬度<input type="text" id="lat"><br/><br/>
最高速度<input type="number" id="maxspeed"><br/>
最低速度<input type="number" id="minspeed"><br/><br/>
最大加速度<input type="number" id="max_acceleration"><br/>
最小加速度<input type="number" id="min_acceleration"><br/><br/><br/>

<input type="button" value="提交" style="width:200px" onClick="sub()"><span id="tip" style=" color:#E7080B; font-size:14px"></span>
</div>
</body>
<script>
var lng=0;
var lat=0;
var text;
var GPStype;
var flag;
var rushhour;
var station;
var station_No;
var maxspeed;
var minspeed;
var max_acceleration;
var min_acceleration;
function checkGPStype()
{
	var radios = document.getElementsByName("GPS");
  for ( var i = 0; i < radios.length; i++) {
  if (radios[i].checked==true) {
      return radios[i].value;
   }
  }
}
function sub()
{
	var obj = document.getElementById("bus_route"); //定位id
	var index = obj.selectedIndex; // 选中索引
	text = obj.options[index].text; // 选中文本
	GPStype=checkGPStype();
	flag=document.getElementById("flag").checked;
    rushhour=document.getElementById("rushhour").checked;
	station=document.getElementById("station").value;
	station_No=document.getElementById("station_No").value;
	 lng=document.getElementById("lng").value;
	 lat=document.getElementById("lat").value;
	 maxspeed=document.getElementById("maxspeed").value;
	 minspeed=document.getElementById("minspeed").value;
	 max_acceleration=document.getElementById("max_acceleration").value;
	 min_acceleration=document.getElementById("min_acceleration").value;
	 if(station==""||station_No==""||lng==""||lat==""||maxspeed==""||minspeed==""||max_acceleration==""||min_acceleration=="")
		 {
		 document.getElementById("tip").innerHTML="请将信息填写完整！";
		  setTimeout(function(){
			  document.getElementById("tip").innerHTML="";
		    }, 2000);
		  return;
		 }
	 if(GPStype==1)
	 {
	 Convertcoordinate();
	 }
	 else
		 {
		 if(lat>60)
			 {
			 document.getElementById("tip").innerHTML="请确认经纬度填写信息！";
			  setTimeout(function(){
				  document.getElementById("tip").innerHTML="";
			    }, 2000);
			 return;
			 }
		 else
		 postToServer();
		 }
}
function Convertcoordinate()
{
	var pointArr = new Array();
     pointArr.push(new BMap.Point(lng,lat));
	//坐标转换完之后的回调函数
	 
    translateCallback = function (data){
      if(data.status === 0) 
      {
    	  lng=data.points[0].lng;
    	  lat=data.points[0].lat;
    	  postToServer();
      }
      else
    	 {
    	  document.getElementById("tip").innerHTML="请确认经纬度填写信息！";
		  setTimeout(function(){
			  document.getElementById("tip").innerHTML="";
		    }, 2000);
    	 }
    	  
    }
    var convertor = new BMap.Convertor();
    convertor.translate(pointArr, 1, 5, translateCallback);
    
}
function postToServer()
{
	$.ajax
    ({
	type:"POST",
	  //dataType:"json",
	  cache:false,
	  url:"addCriticalSectionInfo.json",
	  data:{no:text,busstation:station,busstationno:station_No,longitude:lng,latitude:lat,flag:flag,rushhour:rushhour,
		  maxspeed:maxspeed,minspeed:minspeed,max_acceleration:max_acceleration,min_acceleration:min_acceleration},
	  //contentType:"application/json",
	  error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
           alert(textStatus);
	  },
	  success:function(res){
		  document.getElementById("tip").innerHTML="提交成功！";
		  setTimeout(function(){
			  document.getElementById("tip").innerHTML="";
		    }, 2000);
	  }
	 

});
}
</script>
</html>