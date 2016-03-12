<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>修改关键区域数据</title>
<!-- jQuery file -->
<script src="/DrivingBehavior/resources/js/jquery-1.8.3.min.js" ></script>
<!--jquery.tablesorter  -->
<script type="text/javascript" src="/DrivingBehavior/resources/js/jquery.tablesorter.js"></script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=QQO985xOjQfV6NLcDtuMSPVN"></script>
<link rel="stylesheet" href="/DrivingBehavior/resources/css/lanrenzhijia.css" media="all">
</head>
<body>
<div style="margin: 0 auto; width:1024px">
公交车线路
<select id="Bus_Route">
<option>805路</option>
<option>802路</option>
<option>806路</option>
</select>&nbsp;&nbsp;&nbsp;<input type="button" value="查询" style="width:100px" onClick="Search()"><br/><br/>
<table border="1" id="table1" class="sort-table">
<thead>
<tr >
  <th >公交车站编号</th><th>公交车站</th><th>高峰标记</th><th>往返标记</th><th>经度</th><th>纬度</th><th>最大速度</th><th>最小速度</th><th>最大加速度</th><th>最小加速度</th><th>数据编号</th>
</tr>
</thead>
<tbody id="InfoData" class="data">

</tbody>
</table>
</div>

<div class="theme-popover">
     <div class="theme-poptit">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>修改信息</h3>
     </div>
     <a class="btn btn-primary" href="javascript:;" style="background-color:#F7070B;" onClick="Delete()">删除</a>
     <div class="theme-popbod dform">
           <form class="theme-signin" name="loginform" action="" method="post">
                高峰时段标记(高峰时期请勾选)<input type="checkbox"  id="rushhour">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;往返标记(返程请勾选)<input type="checkbox"  id="flag"><br/>
				
					GPS坐标系<br/>
					硬件/谷歌地球卫星
				<input type="radio"  name="GPS" value="1" onClick="checkGPStype()"/>
					百度
				<input type="radio" checked="checked" name="GPS" value="2" onClick="checkGPStype()"/><br/>
				
				站点编号<input type="number"  id="station_No"><br/>
				公交车站<input type="text"  id="station"><br/>
				经度<input type="text" id="lng">
				纬度<input type="text" id="lat"><br/>
				最高速度<input type="number" id="maxspeed"><br/>
				最低速度<input type="number" id="minspeed"><br/>
				最大加速度<input type="number" id="max_acceleration"><br/>
				最小加速度<input type="number" id="min_acceleration"><br/>
 				<input class="btn btn-primary" type="button"  value="提交" onClick="Submit()"/><span id="tip" style=" color:#E7080B; font-size:14px"></span>
           </form>
          
     </div>
</div>
<div class="theme-popover-mask"></div>
</body>
<script>
//变量声明
var CriticalSectionInfo=new Array();
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
var id;
function showData(CriticalSectionInfo)
{
	$(".sort-table").trigger("update"); 
	document.getElementById("InfoData").innerHTML=null;
	for(var i=0;i<CriticalSectionInfo.length;i++)
	{
	document.getElementById("InfoData").innerHTML+="<tr><td >"+CriticalSectionInfo[i].busstationno+"</td><td>"+
	CriticalSectionInfo[i].busstation+"</td><td>"+CriticalSectionInfo[i].rushhour+"</td><td>"+CriticalSectionInfo[i].flag+
	"</td><td>"+CriticalSectionInfo[i].longitude+"</td><td>"+CriticalSectionInfo[i].latitude+"</td><td>"+CriticalSectionInfo[i].maxspeed+
	"</td><td>"+CriticalSectionInfo[i].minspeed+"</td><td>"+CriticalSectionInfo[i].max_acceleration+"</td><td>"+CriticalSectionInfo[i].min_acceleration+
	"</td><td>"+CriticalSectionInfo[i].id+"</td></tr>";
	}
	 $(".sort-table").tablesorter(); 
	 CallTableEffection();
}
function Search()
{
	var sel_obj=document.getElementById("Bus_Route")
	var index = sel_obj.selectedIndex;          
	var Bus_Route=sel_obj.options[index].text;
	$.ajax
    ({
	 //type:"POST",
	  //dataType:"json",
	  cache:false,
	  url:"getcriticalsectionInfoByBus_Route.json",
	  data:{no:Bus_Route},
	  //contentType:"application/json",
	  error: function(XMLHttpRequest, textStatus, errorThrown) {
            //alert(XMLHttpRequest.status);
            //alert(XMLHttpRequest.readyState);
            //alert(textStatus);
	  },
	  success:function(res){
		  if(res.length==0)
		  {
			  alert("没有相关数据");
			  document.getElementById("InfoData").innerHTML=null;
			  return;
		  }
		  CriticalSectionInfo=[];
	      for(var i=0;i<res.length;i++)
	    	  {
	    	  CriticalSectionInfo[i]=res[i];
	    	  }	
	      showData(CriticalSectionInfo);
	  }
    });
}
function CallTableEffection()
{
	
	    $("table td").mouseover(function() {
	        var row = $(this).parent().index() + 1; // 行位置
	        var col = $(this).index() + 1; // 列位置
			$(this).parent().css("background-color","#eeeeee"); 
			//var len = $(this).parent().length; // 获取最后一个值
			var val=$(this).parent().find("td:last").text();
	        //alert("value :"+val);
	    });
	
	
	    $("table td").mouseleave(function() {
	        var row = $(this).parent().index() + 1; // 行位置
	        var col = $(this).index() + 1; // 列位置
			$(this).parent().css("background-color","#ffffff"); 
	        //alert("当前位置：第"+row+"行，第"+col+"列")
	    });
	
	
	    $("table td").click(function() {
	       var val=$(this).parent().find("td:last").text();
	       val=parseInt(val);
	       id=val;
	       PutDataIntoPopover(val);
		   //alert("value :"+val);
	    });
	
}
function PutDataIntoPopover(id)
{
	for(var i=0;i<CriticalSectionInfo.length;i++)
		{
			if(CriticalSectionInfo[i].id==id)
				{
					if(CriticalSectionInfo[i].rushhour)
						document.getElementById("rushhour").checked=true;
					else
						document.getElementById("rushhour").checked=false;
					if(CriticalSectionInfo[i].flag)
						document.getElementById("flag").checked=true;
					else
						document.getElementById("flag").checked=false;
					document.getElementById("station_No").value=CriticalSectionInfo[i].busstationno;
					document.getElementById("station").value=CriticalSectionInfo[i].busstation;
					document.getElementById("lng").value=CriticalSectionInfo[i].longitude;
					document.getElementById("lat").value=CriticalSectionInfo[i].latitude;
					document.getElementById("maxspeed").value=CriticalSectionInfo[i].maxspeed;
					document.getElementById("minspeed").value=CriticalSectionInfo[i].minspeed;
					document.getElementById("max_acceleration").value=CriticalSectionInfo[i].max_acceleration;
					document.getElementById("min_acceleration").value=CriticalSectionInfo[i].min_acceleration;
				}
		}
}
function checkGPStype()
{
	var radios = document.getElementsByName("GPS");
  for ( var i = 0; i < radios.length; i++) {
  if (radios[i].checked==true) {
      return radios[i].value;
   }
  }
}
function Submit()
{
	var obj = document.getElementById("Bus_Route"); //定位id
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
	  url:"UpdateCriticalSectionInfo.json",
	  data:{no:text,busstation:station,busstationno:station_No,longitude:lng,latitude:lat,flag:flag,rushhour:rushhour,
		  maxspeed:maxspeed,minspeed:minspeed,max_acceleration:max_acceleration,min_acceleration:min_acceleration,id:id},
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
			  $('.theme-popover-mask').fadeOut(100);
				$('.theme-popover').slideUp(200);
				Search();
		    }, 1000);
	  }
	 

});
}
function Delete()
{
	var r=confirm("您确定要删除吗？");
	if (r==true)
	{
		$.ajax
    	({
		type:"POST",
	 	 //dataType:"json",
	  	cache:false,
	  	url:"DeleteSelectedCriticalSectionInfo.json",
	 	 data:{id:id},
	 	 //contentType:"application/json",
		  error: function(XMLHttpRequest, textStatus, errorThrown) {
   	         alert(XMLHttpRequest.status);
    	        alert(XMLHttpRequest.readyState);
    	       alert(textStatus);
		  },
		  success:function(res){
			  document.getElementById("tip").innerHTML="删除成功！";
			  setTimeout(function(){
				  document.getElementById("tip").innerHTML="";
				  $('.theme-popover-mask').fadeOut(100);
					$('.theme-popover').slideUp(200);
					Search();
		 	   }, 1000);
	 	 }
	 

		});
	}
	else
	{
		return;
	}
}
</script>
<script>

 $(document).ready(function() { 
		
	$('.data').click(function(){
		$('.theme-popover-mask').fadeIn(100);
		$('.theme-popover').slideDown(200);
		
	})
	
	$('.theme-poptit .close').click(function(){
		$('.theme-popover-mask').fadeOut(100);
		$('.theme-popover').slideUp(200);
	})
	
    });
</script>
</html>
