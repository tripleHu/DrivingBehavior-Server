<%@ page language="java" contentType="text/html; charset=UTF-8"  
 pageEncoding="UTF-8" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

<title>My Mobile Page V3</title>

<!-- Main CSS file -->
<link rel="stylesheet" href="/DrivingBehavior/resources/css/style.css"  type="text/css" media="screen" />
<!-- jQuery file -->
<script src="/DrivingBehavior/resources/js/jquery-1.8.3.min.js" ></script>
<!-- FlexSlider -->
<script src="/DrivingBehavior/resources/js/jquery.flexslider.js" ></script>
<!-- jQuery Tabs -->
<script src="/DrivingBehavior/resources/js/jquery.tabify.js" tppabs="http://famousthemes.com/my-mobile-page-v3/main-theme/js/jquery.tabify.js" type="text/javascript" charset="utf-8"></script>
<!-- MobileBone CSS file-->
<link rel="stylesheet" href="/DrivingBehavior/resources/css/mobilebone.css">
<!-- MobileBone JS file-->
<script src="/DrivingBehavior/resources/js/mobilebone.js"></script>
<!-- PopupBox CSS file-->
<link rel="Stylesheet" type="text/css" href="/DrivingBehavior/resources/css/PopupBox.css" />
<!-- Star CSS file-->
<link rel="stylesheet" href="/DrivingBehavior/resources/css/Starstyle.css"  type="text/css" />
<script type="text/javascript">
var $ = jQuery.noConflict();
$(window).load(function() {
	$('.icons_nav').flexslider({
	animation: "slide",
	directionNav: false, //Set this to false if you want to remove the arrows navigation of the menu
	animationLoop: false,
	controlNav: false, 
	slideshow: false,
	animationDuration: 300
	});
	$('.panels_slider').flexslider({
	animation: "slide",
	directionNav: false,
	controlNav: true, 
	animationLoop: false,
	slideToStart: 1,
	animationDuration: 300, 
	slideshow: false
	});
});
$(function() {
	$('#tabsmenu').tabify();
	$(".toggle_container").hide(); 
	$(".trigger").click(function(){
		$(this).toggleClass("active").next().slideToggle("slow");
		return false;
	});
	});
</script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=QQO985xOjQfV6NLcDtuMSPVN">
//v1.5版本的引用方式：src="http://api.map.baidu.com/api?v=1.5&ak=您的密钥"
//v1.4版本及以前版本的引用方式：src="http://api.map.baidu.com/api?v=1.4&key=您的密钥&callback=initialize"	
</script>
</head>
<body class="home">
<div id="container">
<div id="page_realtime" class="page out"  >
    <div id="main_panels" >
        <div class="panels_slider" id="map1">
        </div>
    </div>
<div class="top_info" id="top_panel">
    <ul style="position:absolute; top:0%;width:100%;height:100%; background-color:RGB(255,255,255);">
 <li class="my_statistics" style="font-size:25px" ><span id="realtime_speed">0km/h</span><br/><span style="color:#000000; font-size:12px">速度</span></li>
 <li class="my_statistics" style="font-size:25px" ><span id="realtime_time">00:00:00</span><br/><span style="color:#000000; font-size:12px">行驶时间</span></li>
 <li class="my_statistics" style="font-size:25px" ><span id="realtime_illegal">0次</span><br/><span style="color:#000000; font-size:12px">不良驾驶</span></li>
 </ul>
     </div>
     </div>
     <div id="page_information" class="page out" >
     <a href="#" id="example">请选择查询时间</a>
	
    <div class="TimeSelectBox">
        <div class="row1">
            请选择驾驶区间<a href="javascript:void(0)" title="关闭窗口" class="close_btn" id="closeBtn">×</a>
        </div>
        <div class="row">
           日期: <span class="inputBox">
                <input type="date" id="InfoChooseDate" placeholder="" onchange="AddDrivingTime()"/>
            </span>
        </div>
        <div class="row">
            时间: <span class="inputBox">
               
				<select name="cars" id="InfoTimeInterval" >
				
				</select>
            </span>
        </div>
        <div class="row">
            <a href="javascript:void(0)" onclick="ShowInfo()" id="loginbtn">确定</a>
        </div>
    </div>
    
	<div id="score">
<div class="rating rating-5" id="driving_star"style="position:absolute; top:0% ;left:30%; margin: 0px 0 ;height:20%;">
      <i class="star-1">★</i>
      <i class="star-2">★</i>
      <i class="star-3">★</i>
      <i class="star-4">★</i>
      <i class="star-5">★</i>
    </div>
<div style="position:absolute; top:20%; left:33%; height:80%; width:auto">
<div style=" width:140px; height:140px; background-color:#4490f7; border-radius:50%;">
         <span id="info_score"style="height:100%; line-height:100%; display:block; color:#FFF; text-align:center; font-size:130px">99</span>
    </div>
</div>
</div>
<div id="drivingInfo">
<a href="#" class="Line"  >驾驶信息</a>
<ul style="position:absolute;left:10%;top:35%;width:auto;height:auto; font-size:20px">
<li id="Info_FromTo"></li>
<li id="Info_distance"></li>
<li id="Info_speed_avg"></li>
<li id="Info_speed_max"></li>
</ul>
</div>
<div id="IllegalInfo">
<a href="#page_information_child" class="Line" onclick="Show_BadBehaviorMap()" >不良驾驶信息</a>
<ul style="position:absolute;left:10%;top:35%;width:auto;height:auto; font-size:20px">
<li id="IllegalInfo_1"></li>
<li id="IllegalInfo_2"></li>
<li id="IllegalInfo_3"></li>
<li id="IllegalInfo_4"></li>
</ul>
</div>
	
     </div>
     <div id="page_path" class="page out">
     	<div class="top_info">
     	<nobr style="width: 100% ;height:100%;position:absolute; top:5% left:5%">
     	<input type="date" style="width:25% ;height:90%;" id="time_filed"/>
     	从<input type="time" placeholder="0：00" style="width:25%; height:90%;" id="path_starttime" />
     	到<input type="time" placeholder="24：00"  style="width:25% ;height:90%;"id="path_endtime"/>
     	<input  type="image"  name="search_path" id="btn_search_path" value="" src="/DrivingBehavior/resources/images/icons/search.png" onclick="search_for_path()"/>
     	</nobr>
     	<script type="text/javascript">
					var now = new Date(); 
					document.getElementById("time_filed").valueAsDate = new Date();
					function search_for_path()
					{
						var date=document.getElementById("time_filed").value;
						var starttime=document.getElementById("path_starttime").value;
						var endtime=document.getElementById("path_endtime").value;
						if(starttime==" "||endtime==" ")
							{
							alert("时间不能为空");
							return;
							}
						if(starttime>=endtime)
							{
							alert("开始时间必须小于结束时间");
							return;
							}
						//alert(date+","+starttime+","+endtime);
						var temper1=date+" "+starttime;
						var dt1 = new Date(temper1.replace(/-/,"/"));
						var temper2=date+" "+endtime;
						var dt2 = new Date(temper2.replace(/-/,"/"));
						//alert(dt1+"--"+dt2);
						getPath(dt1.getTime(),dt2.getTime(),pathmap);
					}
		</script>
     	</div>
     	<div id="map_path" style="position: absolute; left:0; top:10%; height:90%; width:100%">
     	</div>
     </div>
     <div id="page_my"  class="page out">
     <div id="my_top">
<div style=" margin-left:10px;margin-top:10px;">
<img src="/DrivingBehavior/resources/images/avatar.png"  style="width:50px;height:50px;border-radius:50px;" />
</div>
<div style="position:absolute; left:100px; top:40%">
<a style=" color:#FFFFFF">${username}</a>
</div>
<img src="/DrivingBehavior/resources/images/next.png"  style=" position:absolute; top:40%;right:10px" />
</div>
 <ul style="position:absolute; top:15%;width:100%;height:10%; ">
 <li class="my_statistics"><span id="my_distance">0.0公里</span><br/><span style="color:#000000; font-size:12px">总里程</span></li>
 <li class="my_statistics"><span id="my_speed">0.0km/h</span><br/><span style="color:#000000; font-size:12px">平均速度</span></li>
 <li class="my_statistics"><span id="my_BadDriving">0次</span><br/><span style="color:#000000; font-size:12px">不良驾驶</span></li>
 </ul>
 <div style="position:absolute; top:23%;width:100%;height:5%;">
 <select name="No"  style="width:100%; font-size:18px" id="bus_route" onchange="AddBusRouteOnMap()">
	<option>805路</option>	
    <option>806路</option>		
    <option>249路</option>			
 </select>
 </div>
 <div class="toogle_wrap">
 <div class="trigger"><a href="#">修改密码</a></div>

            <div class="toggle_container">
                <ul class="changepassword">
                <li><input type="password" placeholder="旧密码" style="border:none; width:100%; text-align:center" id="my_oldcode"></li>
                <li><input type="password" placeholder="新密码" style="border:none; width:100%; text-align:center" id="my_newcode"></li>
                <li><input type="password" placeholder="确认新密码" style="border:none; width:100%; text-align:center" id="my_comfirmnewcode"></li>
                <li style="color:#F40A0E; text-align:center; font-size:12px" id="my_code_info">密码长度必须大于6个字符</li>
                <li style="border:none;"><input type="button" value="确定"  onClick="my_ChangePassWord()" style="position:relative; left:20%; width:60%; height:30px; background:#4490f7;color:RGB(255,255,255); border:none "></li>
                </ul>
            </div>
 </div>
 <div id="my_exit" onClick="javascript:my_exit()">
 <span style="position:relative;top:20%; color:#F8F8F8; font-size:25px">退出</span>
 </div>
     </div>
     <div id="page_information_child" class="page out">
     </div>
    <div id="bottom_nav">
        <div class="icons_nav">
                <div class="paginated"> <!--Remove this DIV if you want to remove the pagination-->
                        <ul class="slides">
                            <li>
                                <a href="#page_realtime" onclick="HideDiv1()" class="icon"><img src="/DrivingBehavior/resources/images/icons/Real1.png"  alt="" title="" border="0" id="icon_Real"/><span>实时</span></a>
                                <a href="#page_information" onclick="HideDiv2()" class="icon"><img src="/DrivingBehavior/resources/images/icons/infomation1.png"  alt="" title="" border="0" id="icon_infomation"/><span>统计</span></a>
                                <a href="#page_path" onclick="HideDiv3()" class="icon"><img src="/DrivingBehavior/resources/images/icons/path1.png"  alt="" title="" border="0" id="icon_path"/><span>路径</span></a>
                                <a href="#page_my"  onclick="HideDiv4()" class="icon"><img src="/DrivingBehavior/resources/images/icons/my1.png"  alt="" title="" border="0" id="icon_my"/><span>我的</span></a>
                            </li>
                        </ul>
                </div>  <!--Remove this DIV if you want to remove the pagination-->
        </div>
    </div>
    
</div>
</body>
<script type="text/javascript"> 
                /*全局变量声明放在最前*/
				var points=new Array();//创建数组记录坐标点
				
				var map = new BMap.Map("map1");          // 创建地图实例  
				var pathmap = new BMap.Map("map_path");          // 创建地图实例  
				var informationmap = new BMap.Map("page_information_child");          // 创建地图实例  
				var point = new BMap.Point(106.47001350344,  29.573751219596);  // 创建点坐标  
				var username=getUrlParam("username");
				var speed=0;
		        var orientations=1;
		        var acceleration=0;
		        var cur_distance=0;
		        var driving_time=0;
		        var not_driving_time=0;
		        var bad_driving_time=0;
		        var section=new Array();//Info_page使用
		        var BadBehaviorInfo;
		        var CriticalSectionInfo=new Array();//关键区域信息
		        var Bus_Route;
		        var BMobile;//判断是否是移动端访问
				map.centerAndZoom(point, 15);                 //初始化地图，设置中心点坐标和地图级别
				pathmap.centerAndZoom(point, 18);
				informationmap.centerAndZoom(point, 18);
				// 用经纬度设置地图中心点
				var vectorFCArrow = new BMap.Marker(point, {
  				// 初始化方向向上的闭合箭头
 				 icon: new BMap.Symbol(BMap_Symbol_SHAPE_FORWARD_CLOSED_ARROW, {
    			scale: 2,
    			strokeWeight: 1,
   				 rotation:0,//顺时针旋转
   				 fillColor: 'red',
    			fillOpacity: 0.8
    			})
});
				var vectorFCArrowGPS = new BMap.Marker(point, {
	  				// 初始化方向向上的闭合箭头
	 				 icon: new BMap.Symbol(BMap_Symbol_SHAPE_FORWARD_CLOSED_ARROW, {
	    			scale: 2,
	    			strokeWeight: 1,
	   				 rotation:0,//顺时针旋转
	   				 fillColor: 'red',
	    			fillOpacity: 0.8
	    			})
	});
				
				var myIconStart = new BMap.Icon("/DrivingBehavior/resources/images/icons/start.png", new BMap.Size(37,62));
				var myIconEnd  = new BMap.Icon("/DrivingBehavior/resources/images/icons/end.png", new BMap.Size(37,62));
				
	$(document).ready(function(){
				BMobileVisit();
				HideDiv1();
				getCriticalSectionInfo();
				setInterval("counting_time()",1000);//1000为1秒钟  
				if(BMobile)
				{
				setInterval("whether_in_CriticalSection()",1000);//1000为1秒钟  
				}
				setInterval("myInterval()",5000);//1000为1秒钟  
	});
function BMobileVisit()
	{
		var browser = {
		        versions: function() {
		            var u = navigator.userAgent,
		            app = navigator.appVersion;
		            return {
		                mobile: !!u.match(/AppleWebKit.*Mobile.*/),
		                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),
		                android: u.indexOf("Android") > -1 || u.indexOf("Linux") > -1,
		                iPhone: u.indexOf("iPhone") > -1,
		                iPad: u.indexOf("iPad") > -1
		            };
		        } (),
		        language: (navigator.browserLanguage || navigator.language).toLowerCase()
		    };
		if(browser.versions.mobile)
			BMobile=true;
		else
			BMobile=false;
		   // $("#aa2").append("userAgent 内容: <BR/>" + navigator.userAgent + "<BR/><BR/>");
		    //$("#aa2").append("是否为移动终端: " + browser.versions.mobile + "<BR/>");
		   // $("#aa2").append("是否 ios: " + browser.versions.ios + "<BR/>");
		   // $("#aa2").append("是否 android: " + browser.versions.android + "<BR/>");

	}
function counting_time()
{
	//alert("aaa");
	var hour=0;
	var min=0;
	var sec=0;
	var s_hour;
	var s_min;
	var s_sec;
	if(speed>0)
	{
	driving_time++;
	//alert(driving_time);
	 hour=parseInt(driving_time/3600);
	 //alert(hour);
	 var temp=driving_time-hour*3600;
	 min=parseInt(temp/60);
	 temp=driving_time-3600*hour-60*min;
	 
	sec=temp;
	if(hour<10)
	{
		s_hour="0"+hour;
	}
	else
	s_hour=hour;
	if(min<10)
	{
		s_min="0"+min;
	}
	else
	s_min=min;
	if(sec<10)
	{
		s_sec="0"+sec;
	}
	else
	s_sec=sec;
	document.getElementById( "realtime_time" ).innerHTML=s_hour+":"+s_min+":"+s_sec;
	not_driving_time=0;
	if(driving_time==3600*4)
		{
		alert("您已经连续驾驶超过4小时，请停车休息！");
		
		Add_bad_driving("连续驾驶超过4小时");
		}
	}
	if(speed<1)
	{
		not_driving_time++;
		if(not_driving_time>1000*60*5)
			{
			driving_time=0;
			}
	}
}
function myInterval()
{
	//orientations=a;
	//alert(a);
	//alert(orientations);
	if(speed>0)
		{
		//alert(speed+","+orientation);
		
					$.ajax
						    ({
			            	type:"POST",
			            	  //dataType:"json",
			            	  cache:false,
			            	  url:"recordLocation.json",
			            	  data:{longitude:point.lng,latitude:point.lat,velocity: speed,orientation:orientations,acceleration:acceleration,username:username},
			            	  //contentType:"application/json",
			            	  error: function(XMLHttpRequest, textStatus, errorThrown) {
			                        //alert(XMLHttpRequest.status);
			                        //alert(XMLHttpRequest.readyState);
			                       // alert(textStatus);
			            	  },
			            	  success:function(res){
			            	      //alert(res)
			            	  }
			            	 

			            });
		}
					//alert("sddd");
}
function whether_in_CriticalSection()
{
	if(speed>0)
		{
		for(var i=0;i<CriticalSectionInfo.length;i++)
		{
		if(GetDistance( point.lng,  point.lat,  CriticalSectionInfo[i].longitude,  CriticalSectionInfo[i].latitude)<50)//进入关键区域半径50米内
			{
			var now = new Date();
			
			var rushhour_morning_start=new Date();
			rushhour_morning_start.setHours(7, 30, 0, 0);
			var rushhour_morning_end=new Date();
			rushhour_morning_end.setHours(8, 30, 0, 0);
			var rushhour_evening_start=new Date();
			rushhour_evening_start.setHours(17, 00, 0, 0);
			var rushhour_evening_end=new Date();
			rushhour_evening_end.setHours(19, 0, 0, 0);
			if((rushhour_morning_start<now&&now<rushhour_morning_end)||(rushhour_evening_start<now&&now<rushhour_evening_end)&&CriticalSectionInfo[i].rushhour==true)
			{
				
				CheckSpeedAndAcceleration(CriticalSectionInfo[i]);
			}
			if((rushhour_morning_start>now||now>rushhour_morning_end)&&(rushhour_evening_start>now||now>rushhour_evening_end)&&CriticalSectionInfo[i].rushhour==false)
			{
				
				CheckSpeedAndAcceleration(CriticalSectionInfo[i]);
			}
			}
		}
		}
}
function CheckSpeedAndAcceleration(Info)
{
	if(speed>Info.maxspeed)
		Add_bad_driving("大于良好驾驶最大速度");
	if(speed<Info.minspeed)
		Add_bad_driving("小于良好驾驶最小速度");
	if(acceleration>Info.max_acceleration)
		Add_bad_driving("大于良好驾驶最大加速度");
	if(acceleration<Info.min_acceleration)
		Add_bad_driving("小于良好驾驶最小加速度");
}
function theLocation(longitude,latitude,orienta)
{
	orientations=orienta;
	//alert(orientation);
	//a=orienta;
					if(longitude!= "" &&latitude != "")
					{
						//BMap.getDistance
						//map.removeOverlay(vectorFCArrowGPS); 
						//map.removeOverlay(vectorFCArrow); 
						map.removeOverlay(vectorFCArrow);
						//alert("asdas");
						point = new BMap.Point(longitude,latitude);
						vectorFCArrow = new BMap.Marker(point, {
							  // 初始化方向向上的闭合箭头
							  icon: new BMap.Symbol(BMap_Symbol_SHAPE_FORWARD_CLOSED_ARROW, {
							    scale: 2,
							    strokeWeight: 1,
							    rotation: orientations,//顺时针旋转
							    fillColor: 'red',
							    fillOpacity: 0.8
							  })
							});
						//RecordPonints(point);                                  //记录并绘制路径
						
						map.addOverlay(vectorFCArrow);              //将标注添加到地图中
						//map.addOverlay(vectorFCArrowGPS);              //将标注添加到地图中
						map.panTo(point);      
						
					}
					
}

function SetSpeedAndDirection(speed1,direction1,acceleration1)
{
	
	acceleration=parseFloat(acceleration1);
	speed=parseFloat(speed1);
	//orientation=direction1;
	document.getElementById( "realtime_speed" ).innerHTML=speed.toFixed(0)+"km/h";
	//document.getElementById( "direction" ).value=direction1;
	
	
	//alert(speed1+","+direction1);
}
function RecordPonints(point)
{
	
	if(points.length==0)
	{
		points.push(point);
	}
	else
	{
		var index=points.length-1;
		if(points[index].equals(point))
			{
			return;
			}
		else
			{
			
			points.push(point);
			//var pointss=[points[index],point];
			//alert(points[index]);
			var line=new BMap.Polyline(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); 
			//alert("OK");
			map.addOverlay(line);
			}
		
	}
}

function HideDiv1()
{
	document.title ="实时信息";
	//alert("HideDiv1");
	map.centerAndZoom(point, 15); 
	document.getElementById("icon_Real").src="/DrivingBehavior/resources/images/icons/Real2.png";
	document.getElementById("icon_infomation").src="/DrivingBehavior/resources/images/icons/infomation1.png";
	document.getElementById("icon_path").src="/DrivingBehavior/resources/images/icons/path1.png";
	document.getElementById("icon_my").src="/DrivingBehavior/resources/images/icons/my1.png";
	//document.getElementById("main_panels").style.display ="block";
	//document.getElementById("top_panel").style.display ="block";
	//document.getElementById("path_panels").style.display ="none";
}
function HideDiv2()
{
	document.title ="统计信息";
	//alert("HideDiv2");
	document.getElementById("icon_Real").src="/DrivingBehavior/resources/images/icons/Real1.png";
	document.getElementById("icon_infomation").src="/DrivingBehavior/resources/images/icons/infomation2.png";
	document.getElementById("icon_path").src="/DrivingBehavior/resources/images/icons/path1.png";
	document.getElementById("icon_my").src="/DrivingBehavior/resources/images/icons/my1.png";
	//document.getElementById("main_panels").style.display ="none";
	//document.getElementById("top_panel").style.display ="none";
	//document.getElementById("path_panels").style.display ="none";
}
function HideDiv3()
{
	document.title ="查询路径";
	//alert("HideDiv3");
	document.getElementById("icon_Real").src="/DrivingBehavior/resources/images/icons/Real1.png";
	document.getElementById("icon_infomation").src="/DrivingBehavior/resources/images/icons/infomation1.png";
	document.getElementById("icon_path").src="/DrivingBehavior/resources/images/icons/path2.png";
	document.getElementById("icon_my").src="/DrivingBehavior/resources/images/icons/my1.png";
	//document.getElementById("path_panels").style.display ="block";
	//document.getElementById("main_panels").style.display ="none";
	//document.getElementById("top_panel").style.display ="none";
}
function HideDiv4()
{
	document.title ="我的信息";
	//alert("HideDiv4");
	document.getElementById("icon_Real").src="/DrivingBehavior/resources/images/icons/Real1.png";
	document.getElementById("icon_infomation").src="/DrivingBehavior/resources/images/icons/infomation1.png";
	document.getElementById("icon_path").src="/DrivingBehavior/resources/images/icons/path1.png";
	document.getElementById("icon_my").src="/DrivingBehavior/resources/images/icons/my2.png";
	//document.getElementById("main_panels").style.display ="none";
	//document.getElementById("top_panel").style.display ="none";
	//document.getElementById("path_panels").style.display ="none";
	getMyInfo();
}
function getUrlParam(name)
{
var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
var r = window.location.search.substr(1).match(reg);  //匹配目标参数
if (r!=null) return unescape(r[2]); return null; //返回参数值
} 
function getPath(start,end,MapForShow)
{
	//starttime=Date.UTC(2015,11-1,6,20,0,0)-8*3600*1000; 
	//endtime=Date.UTC(2015,11-1,6,20,30,0)-8*3600*1000; 
	var starttime=start;
	var endtime=end;
	var pathpoints=new Array();//创建数组记录坐标点
	$.ajax
    ({
	//type:"POST",
	  //dataType:"json",
	  cache:true,
	  url:"getDrivingInfoByTime.json",
	  data:{starttime:starttime,endtime:endtime,username:username},
	  //contentType:"application/json",
	  error: function(XMLHttpRequest, textStatus, errorThrown) {
		  alert("查询失败");
            //alert(XMLHttpRequest.status);
           // alert(XMLHttpRequest.readyState);
         //  alert(textStatus);
	  },
	  success:function(res){
	      if(res.length<=1)
	    	  {
	    	  alert("无相关信息");
	    	  return;
	    	  }
	      //alert("查询成功");
	        for(var i=0;i<res.length;i++)
	    	{
	        		var temp_point=new BMap.Point(res[i].longitude, res[i].latitude);
	      			pathpoints.push(temp_point);
	    	}
	        var path_distance=0;
	        for(var b=0;b<pathpoints.length-1;b++)
	    	{
	        	path_distance+=MapForShow.getDistance(pathpoints[b],pathpoints[b+1]);
	    	}
	       // alert("查询成功,距离为："+path_distance.toFixed(2)+"米");
	        var line=new BMap.Polyline(pathpoints, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); 
	        var Startmarker = new BMap.Marker(pathpoints[0],{icon:myIconStart}); //创建标注
	        var Endmarker = new BMap.Marker(pathpoints[pathpoints.length-1],{icon:myIconEnd});
	        MapForShow.clearOverlays();
	        MapForShow.addOverlay(Startmarker);
	        MapForShow.addOverlay(Endmarker);
	        MapForShow.addOverlay(line);
	        MapForShow.centerAndZoom(pathpoints[pathpoints.length-1],15); 
	        MapForShow.panTo(pathpoints[pathpoints.length-1]);      
	  }
	 
});

}
</script >
<script type="text/javascript">
function AddDrivingTime()
{
	for(var i=0;i<document.getElementById("InfoTimeInterval").options.length;) 
	{ 
	document.getElementById("InfoTimeInterval").removeChild(document.getElementById("InfoTimeInterval").options[i]); 
	}
	var date=document.getElementById("InfoChooseDate").value;
	var starttime="0:00";
	var endtime="23:59:59";
	var temper1=date+" "+starttime;
	var temper2=date+" "+endtime;
	var dt1 = new Date(temper1.replace(/-/,"/"));
	var dt2= new Date(temper2.replace(/-/,"/"));
	$.ajax
    ({
	//type:"POST",
	  //dataType:"json",
	  cache:false,
	  url:"getDrivingInfoByTime.json",
	  data:{starttime:dt1.getTime(),endtime:dt2.getTime(),username:username},
	  //contentType:"application/json",
	  error: function(XMLHttpRequest, textStatus, errorThrown) {
            //alert(XMLHttpRequest.status);
            //alert(XMLHttpRequest.readyState);
            //alert(textStatus);
	  },
	  success:function(res){
		  if(res.length==0)
	      alert("无相关数据");
		  else
			  alert("查询到"+res.length+"条数据");
	     
	      
	      section.length=0;
	      section[0]=0;
	      for(var i=0;i<res.length-1;i++)
	    	{
	    	 		if( res[i+1].time-res[i].time>1000*300)
	    	 			{
	    	 			section.push(i);
	    	 			section.push(i+1);
	    	 		//var s = new Date();
	    	 		//var e = new Date();
	    	 		//s.setTime(res[i].time);
	    	 		//e.setTime(res[i+1].time);
	    	 		//document.getElementById("InfoTimeInterval").options.add(new Option(s.getHours()+":"+s.getMinutes()+":"+s.getSeconds()+"---"+
	    	 			//	e.getHours()+":"+e.getMinutes()+":"+e.getSeconds(), j));
	    	 	//	j++;
	    	 			}
	        		//var temp_point=new BMap.Point(res[i].longitude, res[i].latitude);
	      			//pathpoints.push(temp_point);
	    	}
	      section.push(res.length-1);
	      var a=section.length/2;
	      for(var i=0;i<a;i++)
	    	  {
	    	  section[i]=res.slice(section[i*2],section[i*2+1]+1);
	    	  //alert(section[i]);
	    	  }
	      for(var i=0;i<section.length;i++)
	    	  {
	    	var len=section[i].length;
	    	var s = new Date();
  	 		var e = new Date();
  	 		s.setTime(section[i][0].time);
  	 		e.setTime(section[i][len-1].time);
  	 		document.getElementById("InfoTimeInterval").options.add(new Option(s.getHours()+":"+s.getMinutes()+":"+s.getSeconds()+"---"+
  	 				e.getHours()+":"+e.getMinutes()+":"+e.getSeconds(), i));
	    	  }
	  }
	 

});
}
function ShowInfo()
{
	if(document.getElementById("InfoChooseDate").value==""||document.getElementById("InfoTimeInterval").value=="")
	{
	alert("请选择日期和时间");
	}
	else
	{
		var index=document.getElementById("InfoTimeInterval").value;
		var len=section[index].length-1;
		var StartPoint="asdsad";
		var EndPoint;
	document.getElementById("example").innerHTML=document.getElementById("InfoChooseDate").value+" "+
	document.getElementById("InfoTimeInterval").options[document.getElementById("InfoTimeInterval").value].text;
	var geoc = new BMap.Geocoder();
	var temp_point=new BMap.Point(section[index][0].longitude, section[index][0].latitude);
	geoc.getLocation(temp_point, function(rs){
			var addComp = rs.addressComponents;
			StartPoint=addComp.street+" "+addComp.streetNumber;
			
			document.getElementById("Info_FromTo").innerHTML=StartPoint;
		});   
	temp_point=new BMap.Point(section[index][len].longitude, section[index][len].latitude);
	geoc.getLocation(temp_point, function(rs){
		var addComp = rs.addressComponents;
		EndPoint="→"+addComp.street+" "+addComp.streetNumber;
		//alert(EndPoint);
		document.getElementById("Info_FromTo").innerHTML+=EndPoint;
	});   
	var temp_Array=new Array();
	for(var i=0;i<len+1;i++)
	{
    		var temp_point=new BMap.Point(section[index][i].longitude, section[index][i].latitude);
    		temp_Array[i]=temp_point;
	}
	 var path_distance=0;
     for(var b=0;b<len;b++)
 	{
     	path_distance+=informationmap.getDistance(temp_Array[b],temp_Array[b+1]);
 	}
    
     document.getElementById("Info_distance").innerHTML= path_distance.toFixed(2)+"米";
     var avgspeed=0;
     var maxspeed=0;
     var sppedArray=new Array();
     for(var i=0;i<len+1;i++)
    {
    	 avgspeed+=section[index][i].velocity;
    	 sppedArray[i]=section[index][i].velocity;
    }
     avgspeed=avgspeed/len+1;
     document.getElementById("Info_speed_avg").innerHTML="平均速度："+avgspeed.toFixed(2)+"km/h";
     maxspeed=Math.max.apply(null, sppedArray);
     document.getElementById("Info_speed_max").innerHTML="最高速度："+maxspeed.toFixed(2)+"km/h";
     getPath(section[index][0].time,section[index][len].time,informationmap);
     $.ajax
	    ({
 	  //type:"POST",
 	  //dataType:"json",
 	  cache:false,
 	  url:"getBadBehaviorByTime.json",
 	  data:{starttime:section[index][0].time,endtime:section[index][len].time,username:username},
 	  //contentType:"application/json",
 	  error: function(XMLHttpRequest, textStatus, errorThrown) {
             //alert(XMLHttpRequest.status);
            // alert(XMLHttpRequest.readyState);
           // alert(textStatus);
 		 
 	  },
 	  success:function(res){
 		  BadBehaviorInfo=res;
 		  if(res.length==0)
 		 {
 		 document.getElementById("driving_star").className="rating rating-5";
 		 document.getElementById("info_score").innerHTML="99";
 		document.getElementById("IllegalInfo_1").innerHTML ="恭喜！没有不良驾驶信息。";
 		 }
 		 if(res.length==1)
 		 {
 		 document.getElementById("driving_star").className="rating rating-4";
 		 document.getElementById("info_score").innerHTML="85";
 		 }
 		if(res.length==2)
		 {
		 document.getElementById("driving_star").className="rating rating-3";
		 document.getElementById("info_score").innerHTML="60";
		 }
 		if(res.length==3)
		 {
		 document.getElementById("driving_star").className="rating rating-2";
		 document.getElementById("info_score").innerHTML="60";
		 }
 		if(res.length>3)
		 {
		 document.getElementById("driving_star").className="rating rating-1";
		 document.getElementById("info_score").innerHTML="40";
		 }
 		if(res.length<=4)
 		{
 			for(var i=0;i<res.length;i++)
 			{
 			var reason=res[i].reason;
 			var j=i+1;
 			temp_point=new BMap.Point(res[i].longitude, res[i].latitude);
 			geoc.getLocation(temp_point, function(rs){
 			var addComp = rs.addressComponents;
 			var address=addComp.street+" "+addComp.streetNumber;
 			//alert(address);
 			document.getElementById("IllegalInfo_"+j).innerHTML =address+"——"+reason;
 		}); 
 			}
 		}
 		if(res.length>4)
 		{
 			for(var i=0;i<3;i++)
 			{
 				var reason=res[i].reason;
 	 			var j=i+1;
 			temp_point=new BMap.Point(res[i].longitude, res[i].latitude);
 			geoc.getLocation(temp_point, function(rs){
 			var addComp = rs.addressComponents;
 			var address=addComp.street+" "+addComp.streetNumber;
 			//alert(EndPoint);
 			document.getElementById("IllegalInfo_"+j).innerHTML =address+"——"+reason;
 		}); 
 			}
 			document.getElementById("IllegalInfo_4").innerHTML ="... ...";
 		}
 		
 	  }
 });
	$(".TimeSelectBox").fadeOut("fast");
	$("#mask").css({ display: 'none' });
	}
}
function AddMarkerOnMap(res)
{
	
	var data_info=new Array();
	//informationmap.clearOverlays();
	for(var i=0;i<res.length;i++)
		{
		    var s= new Date();
	 		s.setTime(res[i].time);
	 		var ctime=s.getHours()+":"+s.getMinutes()+":"+s.getSeconds();
			data_info[i]=[res[i].longitude,res[i].latitude,ctime+"<br/>"+res[i].reason+"<br/>"+"速度："+res[i].velocity+"km/h"+"<br/>"+"加速度："+res[i].acceleration+"m/s^2"];
		}
	
   for(var i=0;i<data_info.length;i++){
	var marker = new BMap.Marker(new BMap.Point(data_info[i][0],data_info[i][1]));  // 创建标注
	 var tpoint=new BMap.Point(data_info[i][0],data_info[i][1]);
	   informationmap.centerAndZoom(tpoint,15);
	  // informationmap.panTo(tpoint);
	var content = data_info[i][2];
	informationmap.addOverlay(marker);               // 将标注添加到地图中
	addClickHandler(content,marker);
}
   informationmap.panBy(160,200);
}

function addClickHandler(content,marker){
	marker.addEventListener("click",function(e){
		openInfo(content,e)}
	);
}
function openInfo(content,e){
	var opts = {
			width : 250,     // 信息窗口宽度
			height: 90,     // 信息窗口高度
			title : "不良驾驶信息" , // 信息窗口标题
			enableMessage:true//设置允许信息窗发送短息
		   };
	var p = e.target;
	var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
	var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
	informationmap.openInfoWindow(infoWindow,point); //开启信息窗口
}
function Add_bad_driving(reason)
{
	bad_driving_time++;
	document.getElementById("realtime_illegal").innerHTML=bad_driving_time+"次";
	$.ajax
    ({
	type:"POST",
	  //dataType:"json",
	  cache:false,
	  url:"savebadbehaviorinfo.json",
	  data:{longitude:point.lng,latitude:point.lat,velocity: speed,acceleration:acceleration,reason:reason,username:username},
	  //contentType:"application/json",
	  error: function(XMLHttpRequest, textStatus, errorThrown) {
            //alert(XMLHttpRequest.status);
            //alert(XMLHttpRequest.readyState);
           // alert(textStatus);
	  },
	  success:function(res){
	      //alert(res)
	  }
});
	
}
function getMyInfo()
{
	$.ajax
    ({
	 //type:"POST",
	  //dataType:"json",
	  cache:false,
	  url:"getMyInfo.json",
	  data:{name:username},
	  //contentType:"application/json",
	  error: function(XMLHttpRequest, textStatus, errorThrown) {
            //alert(XMLHttpRequest.status);
            //alert(XMLHttpRequest.readyState);
            //alert(textStatus);
	  },
	  success:function(res){
	      //alert(res)
	      if(res!="")
	       {
	      var dis=parseFloat(res.distance)/1000;
	      document.getElementById("my_distance").innerHTML =dis.toFixed(2)+"公里";
	      var spe=parseFloat(res.avgspeed);
	      document.getElementById("my_speed").innerHTML =spe.toFixed(2)+"km/h";
	       }
	  }
    });
	$.ajax
    ({
	 //type:"POST",
	  //dataType:"json",
	  cache:false,
	  url:"getAllBadBehaviorTimes.json",
	  data:{username:username},
	  //contentType:"application/json",
	  error: function(XMLHttpRequest, textStatus, errorThrown) {
            //alert(XMLHttpRequest.status);
            //alert(XMLHttpRequest.readyState);
           // alert(textStatus);
	  },
	  success:function(res){
	      document.getElementById("my_BadDriving").innerHTML =res+"次";
	  }
    });
}

function Show_BadBehaviorMap()
{
	
	//informationmap.addEventListener("tilesloaded",function(){  
		if(BadBehaviorInfo.length>0)
		{
		AddMarkerOnMap(BadBehaviorInfo);
		//ShowBadBehaviorPath();
		}
		
	   // });  
	
}
function my_ChangePassWord()
{
	var vaild=true;;
	var oldcode=document.getElementById("my_oldcode").value;
	var newcode=document.getElementById("my_newcode").value;
	var comfirmnewcode=document.getElementById("my_comfirmnewcode").value;
	var code_info=document.getElementById("my_code_info").innerHTML;
	if(oldcode==""||newcode==""||comfirmnewcode==""||oldcode==null||newcode==null||comfirmnewcode==null)
	{
		document.getElementById("my_code_info").innerHTML="密码不能为空";
		vaild=false;
	}
	else 
	{
		if(newcode!=comfirmnewcode)
		{
		document.getElementById("my_code_info").innerHTML="两次输入的新密码不同";
		vaild=false;
		}
		else if(newcode.length<6)
		{
			document.getElementById("my_code_info").innerHTML="密码长度必须大于6个字符，请重新输入";
			vaild=false;
		}
	}
	if(vaild)
	{
		$.ajax
	    ({
		 //type:"POST",
		  //dataType:"json",
		  cache:false,
		  url:"changepassword.json",
		  data:{oldcode:oldcode,newcode:newcode,name:username},
		  //contentType:"application/json",
		  error: function(XMLHttpRequest, textStatus, errorThrown) {
	            //alert(XMLHttpRequest.status);
	            //alert(XMLHttpRequest.readyState);
	            //alert(textStatus);
		  },
		  success:function(res){
		      //alert(res)
		      document.getElementById("my_code_info").innerHTML=res.result; 
		      if(res.result=="修改成功")
		    	  {
		    	    document.getElementById("my_oldcode").value="";
		    		document.getElementById("my_newcode").value="";
		    		document.getElementById("my_comfirmnewcode").value="";
		    	  }
		  }
	    });
	}
}
function my_exit()
{
	window.location.href="/DrivingBehavior/";
}
function AddBusRouteOnMap()
{
	getCriticalSectionInfo();
}
function getCriticalSectionInfo()
{
	var obj = document.getElementById("bus_route"); //定位id
	var index = obj.selectedIndex; // 选中索引
	Bus_Route = obj.options[index].text; // 选中文本
	$.ajax
    ({
	 //type:"POST",
	  //dataType:"json",
	  cache:false,
	  url:"getcriticalsectionInfoByNo.json",
	  data:{no:Bus_Route},
	  //contentType:"application/json",
	  error: function(XMLHttpRequest, textStatus, errorThrown) {
           // alert(XMLHttpRequest.status);
            //alert(XMLHttpRequest.readyState);
            //alert(textStatus);
	  },
	  success:function(res){
	      for(var i=0;i<res.length;i++)
	    	  {
	    	  CriticalSectionInfo[i]=res[i];
	    	  }
	      var busline = new BMap.BusLineSearch("重庆",{
	  		renderOptions:{map:map},
	  			onGetBusListComplete: function(result){
	  			   if(result) {
	  				 var fstLine = result.getBusListItem(0);//获取第一个公交列表显示到map上
	  				 busline.getBusLine(fstLine);
	  			   }
	  			}
	  	});
	        var busName = Bus_Route;
			busline.getBusList(busName);
			//map.clearOverlays();
	  		
	  }
    });
}

//计算两点间距离
var EARTH_RADIUS = 6378137;
function rad( d)
{
   return d * Math.PI / 180.0;
}
function GetDistance( lng1,  lat1,  lng2,  lat2)
 {
        var radLat1 = rad(lat1);
        var radLat2 = rad(lat2);
        var a = radLat1 - radLat2;
        var b = rad(lng1) - rad(lng2);
        var s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a/2),2) + 
         Math.cos(radLat1)*Math.cos(radLat2)*Math.pow(Math.sin(b/2),2)));
        s = s * EARTH_RADIUS;
        s = Math.round(s * 10000) / 10000;
        return s;
}
	$(function ($) {
		//弹出登录
		$("#example").hover(function () {
			$(this).stop().animate({
				opacity: '1'
			}, 600);
		}, function () {
			$(this).stop().animate({
				opacity: '0.6'
			}, 1000);
		}).on('click', function () {
			$("body").append("<div id='mask'></div>");
			$("#mask").addClass("mask").fadeIn("slow");
			$(".TimeSelectBox").fadeIn("slow");
		});
		//
		//按钮的透明度
		$("#loginbtn").hover(function () {
			$(this).stop().animate({
				opacity: '1'
			}, 600);
		}, function () {
			$(this).stop().animate({
				opacity: '0.8'
			}, 1000);
		});
		
		//关闭
		$(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
			$(".TimeSelectBox").fadeOut("fast");
			$("#mask").css({ display: 'none' });
		});
	});
	</script>	
</html>