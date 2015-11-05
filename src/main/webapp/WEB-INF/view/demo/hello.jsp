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
<div id="top_info">
    
    <input type="text" name="speed" value="0" style="width: 100%; height: 100%; font-size: 30px;"id="speed";>
    <input type="text" name="direction" value="0" style="width: 100%; height: 100%; font-size: 30px;"id="direction";>
    
     </div>
    <div id="bottom_nav">
        <div class="icons_nav">
                <div class="paginated"> <!--Remove this DIV if you want to remove the pagination-->
                        <ul class="slides">
                            <li>
                                <a href="about.html"  class="icon"><img src="/DrivingBehavior/resources/images/icons/icon_about.png"  alt="" title="" border="0" /><span>About</span></a>
                                <a href="services.html"  class="icon"><img src="/DrivingBehavior/resources/images/icons/icon_services.png"  alt="" title="" border="0" /><span>Services</span></a>
                                <a href="blog.html"  class="icon"><img src="/DrivingBehavior/resources/images/icons/icon_blog.png"  alt="" title="" border="0" /><span>Blog</span></a>
                                <a href="portfolio.html"  class="icon"><img src="/DrivingBehavior/resources/images/icons/icon_portfolio.png"  alt="" title="" border="0" /><span>Portfolio</span></a>
                            </li>
                            <li>
                                <a href="photos.html"  class="icon"><img src="/DrivingBehavior/resources/images/icons/icon_photos.png"  alt="" title="" border="0" /><span>Photos</span></a>
                                <a href="videos.html"  class="icon"><img src="/DrivingBehavior/resources/images/icons/icon_video.png"  alt="" title="" border="0" /><span>Videos</span></a>
                                <a href="clients.html"  class="icon"><img src="/DrivingBehavior/resources/images/icons/icon_clients.png"  alt="" title="" border="0" /><span>Clients</span></a>
                                <a href="contact.html"  class="icon"><img src="/DrivingBehavior/resources/images/icons/icon_contact.png"  alt="" title="" border="0" /><span>Contact</span></a>
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
				var point = new BMap.Point(116.404, 39.915);  // 创建点坐标  
				var username=getUrlParam("username");
				var speed=1;
		        var orientation=1;
				map.centerAndZoom(point, 15);                 // 初始化地图，设置中心点坐标和地图级别
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
	$(document).ready(function(){
				 setInterval("myInterval()",5000);//1000为1秒钟  
	});

function myInterval()
{
	orientation=a;
	//alert(a);
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
			                        alert(XMLHttpRequest.status);
			                        alert(XMLHttpRequest.readyState);
			                        alert(textStatus);
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
	orientation=orienta;
	a=orienta;
					if(longitude!= "" &&latitude != "")
					{

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
	document.getElementById( "direction" ).value=direction1;
	
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
			points.push(point);
			var pointss=[points[index],point];
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
function getUrlParam(name)
{
var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
var r = window.location.search.substr(1).match(reg);  //匹配目标参数
if (r!=null) return unescape(r[2]); return null; //返回参数值
} 
</script >
</html>