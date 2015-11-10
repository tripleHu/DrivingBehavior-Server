<%@ page language="java" contentType="text/html; charset=UTF-8"  
 pageEncoding="UTF-8" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<link rel="apple-touch-icon" sizes="114x114" href="/DrivingBehavior/resources/images/apple-touch-icon.png" />
<link rel="apple-touch-startup-image" href="/DrivingBehavior/resources/images/apple-touch-startup-image.png" />
<meta name="author" content="FamousThemes" />
<meta name="description" content="My Mobile Page Version 3 Template" />
<meta name="keywords" content="mobile templates, mobile wordpress themes, mobile themes, my mobile page, premium css templates, premium wordpress themes" />
<title>My Mobile Page V3</title>

<!-- Main CSS file -->
<link rel="stylesheet" href="/DrivingBehavior/resources/css/style.css"  type="text/css" media="screen" />
<!-- jQuery file -->
<script src="/DrivingBehavior/resources/js/jquery.min.js" ></script>
<!-- FlexSlider -->
<script src="/DrivingBehavior/resources/js/jquery.flexslider.js" ></script>
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
</script>
<!-- Hide Mobiles Browser Navigation Bar -->
<script type="text/javascript">
	window.addEventListener("load",function() {
	// Set a timeout...
	setTimeout(function(){
	// Hide the address bar!
	window.scrollTo(0, 1);
	}, 0);
	});
</script>
<!-- Hide on iphone top browser element | only on home page -->
<script type="text/javascript">
if((navigator.userAgent.match(/iPhone/i)) || (navigator.userAgent.match(/iPod/i))) {
    $(window).load(function() {
       $("body").removeClass("home");

       // Check to see if the window is running in app mode. 
       // If it is not, then it is running in full screen mode
        if ( ("standalone" in window.navigator) && !window.navigator.standalone    ){
            $("body").addClass("homeiphone_app");
        } else {
            $("body").addClass("homeiphone_full");
        }
    });
}
</script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=QQO985xOjQfV6NLcDtuMSPVN">
//v1.5版本的引用方式：src="http://api.map.baidu.com/api?v=1.5&ak=您的密钥"
//v1.4版本及以前版本的引用方式：src="http://api.map.baidu.com/api?v=1.4&key=您的密钥&callback=initialize"	
</script>
</head>
<body class="home">
<div id="container">

    <div id="main_panels">
        <div class="panels_slider" id="map1">
        </div>
    </div>
<div class="top_info" id="top_panel">
    <input type="text" name="speed" value="0" style="width: 100%; height: 50%; font-size: 30px;"id="speed">
    <input type="text" name="direction" value="0" style="width: 100%; height: 50%; font-size: 30px;"id="direction">
     </div>
     <div id="path_panels">
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
						getPath(dt1.getTime(),dt2.getTime());
					}
		</script>
     	</div>
     	<div id="map_path" style="position: absolute; left:0; top:10%; height:90%; width:100%">
     	</div>
     </div>
    <div id="bottom_nav">
        <div class="icons_nav">
                <div class="paginated"> <!--Remove this DIV if you want to remove the pagination-->
                        <ul class="slides">
                            <li>
                                <a href="javascript:;" onclick="HideDiv1()" class="icon"><img src="/DrivingBehavior/resources/images/icons/infomation1.png"  alt="" title="" border="0" /><span>实时</span></a>
                                <a href="javascript:;" onclick="HideDiv2()" class="icon"><img src="/DrivingBehavior/resources/images/icons/infomation1.png"  alt="" title="" border="0" /><span>统计</span></a>
                                <a href="javascript:;" onclick="HideDiv3()" class="icon"><img src="/DrivingBehavior/resources/images/icons/infomation1.png"  alt="" title="" border="0" /><span>路径</span></a>
                                <a href="javascript:;" onclick="" class="icon"><img src="/DrivingBehavior/resources/images/icons/infomation1.png"  alt="" title="" border="0" /><span>我的</span></a>
                            </li>
                        </ul>
                </div>  <!--Remove this DIV if you want to remove the pagination-->
        </div>
    </div>
    
</div>
</body>
<script type="text/javascript"> 
				var points=new Array();//创建数组记录坐标点
				
				var map = new BMap.Map("map1");          // 创建地图实例  
				var pathmap = new BMap.Map("map_path");          // 创建地图实例  
				var point = new BMap.Point(116.404, 39.915);  // 创建点坐标  
				var username=getUrlParam("username");
				var speed=1;
		        var orientations=1;
				map.centerAndZoom(point, 15);                 //初始化地图，设置中心点坐标和地图级别
				pathmap.centerAndZoom(point, 18);
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
				HideDiv1();
				
				 setInterval("myInterval()",5000);//1000为1秒钟  
	});

function myInterval()
{
	orientations=a;
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
			            	  data:{longitude:point.lng,latitude:point.lat,velocity: speed,orientation: a,username:username},
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


function theLocation(longitude,latitude,orienta)
{
	orientations=orienta;
	//alert(orientation);
	a=orienta;
					if(longitude!= "" &&latitude != "")
					{
						BMap.getDistance
						//map.removeOverlay(vectorFCArrowGPS); 
						//map.removeOverlay(vectorFCArrow); 
						map.clearOverlays();
						//alert("asdas");
						point = new BMap.Point(longitude,latitude);
						vectorFCArrow = new BMap.Marker(point, {
							  // 初始化方向向上的闭合箭头
							  icon: new BMap.Symbol(BMap_Symbol_SHAPE_FORWARD_CLOSED_ARROW, {
							    scale: 2,
							    strokeWeight: 1,
							    rotation: orienta,//顺时针旋转
							    fillColor: 'red',
							    fillOpacity: 0.8
							  })
							});
						RecordPonints(point);                                  //记录并绘制路径
						
						map.addOverlay(vectorFCArrow);              //将标注添加到地图中
						//map.addOverlay(vectorFCArrowGPS);              //将标注添加到地图中
						map.panTo(point);      
						
					}
					
}

function SetSpeedAndDirection(speed1,direction1)
{
	speed=speed1;
	//orientation=direction1;
	document.getElementById( "speed" ).value=speed1;
	//document.getElementById( "direction" ).value=direction1;
	
	vectorFCArrowGPS = new BMap.Marker(new BMap.Point(point.lng-0.001,point.lat), {
		  // 初始化方向向上的闭合箭头
		  icon: new BMap.Symbol(BMap_Symbol_SHAPE_FORWARD_CLOSED_ARROW, {
		    scale: 2,
		    strokeWeight: 1,
		    rotation:direction1,//顺时针旋转
		    fillColor: 'red',
		    fillOpacity: 0.8
		  })
		});
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
			
			}
		else
			{
			var a=map.getDistance(points[index],point)+document.getElementById( "direction" ).value;
			document.getElementById( "direction" ).value=parseFloat(a);
			points.push(point);
			//var pointss=[points[index],point];
			//alert(points[index]);
			var line=new BMap.Polyline(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); 
			//alert("OK");
			map.addOverlay(line);
			}
		
	}
}
function test()
{
	
	for(i=0;i<500;i++)
		{
			theLocation(106.300322+i*0.0001,29.604529,0);
		}
	//alert(map.getOverlays().length);
}
function HideDiv1()
{
	alert("HideDiv1");
	document.getElementById("main_panels").style.display ="block";
	document.getElementById("top_panel").style.display ="block";
	document.getElementById("path_panels").style.display ="none";
}
function HideDiv2()
{
	alert("HideDiv2");
	document.getElementById("main_panels").style.display ="none";
	document.getElementById("top_panel").style.display ="none";
	document.getElementById("path_panels").style.display ="none";
}
function HideDiv3()
{
	document.title ="查询路径";
	alert("HideDiv3");
	document.getElementById("path_panels").style.display ="block";
	document.getElementById("main_panels").style.display ="none";
	document.getElementById("top_panel").style.display ="none";
}
function getUrlParam(name)
{
var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
var r = window.location.search.substr(1).match(reg);  //匹配目标参数
if (r!=null) return unescape(r[2]); return null; //返回参数值
} 
function getPath(start,end)
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
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
           alert(textStatus);
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
	        	path_distance+=pathmap.getDistance(pathpoints[b],pathpoints[b+1]);
	    	}
	        alert("查询成功,距离为："+path_distance.toFixed(2)+"米");
	        var line=new BMap.Polyline(pathpoints, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); 
	        var Startmarker = new BMap.Marker(pathpoints[0],{icon:myIconStart}); //创建标注
	        var Endmarker = new BMap.Marker(pathpoints[pathpoints.length-1],{icon:myIconEnd});
	          pathmap.clearOverlays();
	          pathmap.addOverlay(Startmarker);
	          pathmap.addOverlay(Endmarker);
    		  pathmap.addOverlay(line);
    		  pathmap.centerAndZoom(pathpoints[pathpoints.length-1],15); 
    		  pathmap.panTo(pathpoints[pathpoints.length-1]);      
	  }
	 
});
	//alert(pathpoints.length);
	if(pathpoints.length>0)
		{
	 
		}
}
</script >
</html>