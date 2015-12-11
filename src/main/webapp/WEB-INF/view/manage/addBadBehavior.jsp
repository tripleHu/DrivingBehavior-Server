<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加不良驾驶记录</title>
<!-- jQuery file -->
<script src="/DrivingBehavior/resources/js/jquery-1.8.3.min.js" ></script>
</head>
<div style="margin: 0 auto; width:640px">
<h2>添加不良驾驶信息</h2>
用户名<input type="text" id="name"><br/><br/>
时间<input type="date" id="user_date" /><input type="time" id="user_time" /><br/><br/>
经度<input type="text" id="lng">
纬度<input type="text" id="lat"><br/><br/>
速度<input type="number" id="velocity"><br/><br/>
加速度<input type="number" id="acceleration"><br/><br/>
原因<input type="text" id="Reason"><br/><br/>
<input type="button" value="提交" style="width:200px" onClick="sub()"><span id="tip" style=" color:#E7080B; font-size:14px"></span>
</div>
<body>
</body>
<script>
var username;
var date;
var time;
var longitude;
var latitude;
var velocity;
var acceleration;
var reason;
function sub()
{
	username=document.getElementById("name").value;
	longitude=document.getElementById("lng").value; 
	latitude=document.getElementById("lat").value; 
	velocity=document.getElementById("velocity").value; 
	acceleration=document.getElementById("acceleration").value; 
	reason=document.getElementById("Reason").value; 
	date=document.getElementById("user_date").value; 
	
	var stime=document.getElementById("user_time").value; 
	var temper1=date+" "+stime;
	var dt1 = new Date(temper1.replace(/-/,"/"));
	time=dt1.getTime();
	if(username==""||longitude==""||latitude==""||velocity==""||acceleration==""||reason==""||date==""||time=="")
	{
		document.getElementById("tip").innerHTML="请将信息填写完整！";
		  setTimeout(function(){
			  document.getElementById("tip").innerHTML="";
		    }, 2000);
		  return;
	}
	 if(latitude>60)
			 {
			 document.getElementById("tip").innerHTML="请确认经纬度填写信息！";
			  setTimeout(function(){
				  document.getElementById("tip").innerHTML="";
			    }, 2000);
			 return;
			 }
	postToServer();
	
}
function postToServer()
{
	$.ajax
    ({
	type:"POST",
	  //dataType:"json",
	  cache:false,
	  url:"addbadbehavior.json",
	  data:{time:time,longitude:longitude,latitude:latitude,velocity:velocity,acceleration:acceleration,reason:reason,username:username},
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
