<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>驾驶信息</title>
<script src="/DrivingBehavior/resources/js/jquery-1.8.3.min.js" ></script>
<script type="text/javascript" src="/DrivingBehavior/resources/js/jquery.tablesorter.js"></script>
<link rel="stylesheet" href="/DrivingBehavior/resources/css/PagingTable.css" media="all">
<link rel="stylesheet" href="/DrivingBehavior/resources/css/lanrenzhijia.css" media="all">
</head>

<body>
<div style="margin: 0 auto; width:1024px">
日期<input type="date" id="ChooseDate">用户名<input type="text" id="UserName"><input type="button" value="查询" style="width:100px" onClick="Search()">&nbsp;&nbsp;
<input type="button" value="新增" style="width:100px" onClick="Add()"><br/><br/>
<table border="1" id="cs_table" class="datatable sort-table">

</table>
</div>
<div class="theme-popover">
     <div class="theme-poptit">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>修改/新增信息</h3>
     </div>
     <a id="btnDelete" class="btn btn-primary" href="javascript:;" style="background-color:#F7070B;" onClick="Delete()">删除</a>
     <div class="theme-popbod dform">
           <form class="theme-signin" name="loginform" action="" method="post">
                
				
				时间<input id="Timedate" type="date" ><input id="Time" type="time"><br/><br/>
				经度<input type="text" id="lng">
				纬度<input type="text" id="lat"><br/><br/>
				速度<input type="number" id="speed"><br/><br/>
				加速度<input type="number" id="acceleration"><br/><br/>
                方向<input type="number" id="orientation"><br/><br/>
 				<input class="btn btn-primary" type="button"  value="提交"  id="btnsub"  onClick="Submit()"/>
 				<input class="btn btn-primary" type="button"  value="新增"  id="btnadd"  onClick="AddNew()"/>
 				<span id="tip" style=" color:#E7080B; font-size:14px"></span>
           </form>
          
     </div>
</div>
<div class="theme-popover-mask"></div>
</body>
<script type="text/javascript">
/**
 * 抽象化表格
 */
function abstractTable(){
    // ---------内容属性
    this.id = null;         // 每个表格都有唯一的一个id
    this.tableobj = null;  //表格对象
    this.rowNum = 0;       //行数
    this.colNum = 0;      //列数
    this.header = [];     //表头数据
    this.content = [];   //body数据
    // ----------提供外部使用获得表格内部数据
    this.currentClickRowID = 0;   //当前点击的行数据
    // --- 通过表头来获得这张表的列数
    this.getColNum = function(){
        this.colNum = this.header.length;
        return   this.colNum;
    }
    // -----------  表格自我构建行为
    this.clearTable = function(){};
    this.showHeader = function(){};
    this.showContent = function(begin,end){};
    this.showFoot = function(){};
 
    // --------- 分页功能属性
    this.allDataNum = 0;  // 总数据条数
    this.displayNum = 10; // 每页显示条数
    this.maxPageNum = 0;  // 最大页码值
    this.currentPageNum =1;// 当前页码值
    //tfoot分页组
    this.groupDataNum = 10;  //每组显示10页
    this.groupNum = 1;       //当前组
 
    // -------- 分页功能行为
    this.paginationFromBeginToEnd = function(begin,end){}
    this.first =  function(){}//首页
    this.last = function(){}//最后一页
    this.prev = function(){}//上一页
    this.next = function(){}//下一页
    this.goto = function(){} //跳到某页
 
    // ----------- 表格初始化
    this.init = function(begin,end){}
 
}
 
/*
 表格对象模板
 */
function tableTemplet(table_id){
    abstractTable.call(this);
    this.id = table_id;
 
}
/**
 * 表格对象
 * @param options
 */
function table(options){
    if(!options){return;}
    if(!$.isPlainObject(options)){return;}
 
    tableTemplet.call(this,options.tableId);
    //得到表格对象
    this.tableobj = $("#"+this.id);
    //清空表格内容
    this.clearTable = function(){
        this.tableobj.html(" ");
    }
    // 实现分页行为
    this.paginationFromBeginToEnd= function(x,y){
        this.maxPageNum = Math.ceil(this.allDataNum/this.displayNum);
        var arrPage = [];
        for(var i= x;i<y;i++){
            arrPage.push(this.content[i]);
        }
        return arrPage;
    }
 
    this.showHeader = function(){
        if(this.header != null){
           var  $thead = $("<thead>"),
                $tr = $("<tr>"),
                $th;
            for(var i=0;i<this.colNum;i++){
                $th = $("<th>").html(this.header[i]);
                $th.appendTo($tr);
            }
            $tr.appendTo($thead);
            $thead.appendTo(this.tableobj)
        }
    }
    //初始化tbody
    this.showContent = function(begin,end){
        if(this.content != null){
            var $tbody = $("<tbody>"),
                $tr,
                $td;
            var tempDaTa = this.paginationFromBeginToEnd(begin,end),
                len = tempDaTa.length;
            // 循环创建行
            for(var i=0;i<len;i++){
                $tr = $("<tr>").appendTo($tbody);
                if(i%2==1){
                    $tr.addClass("evenrow");
                }
                // 循环创建列  取得对象中的键
                for(var key in tempDaTa[i]){
                    $td = $("<td>").html(tempDaTa[i][key]).appendTo($tr);
                }
            }
            this.tableobj.append($tbody);
        }
 
    }
    //初始化tfoot
    this.showFoot = function(){
       var $tfoot = $("<tfoot>"),
           $tr = $("<tr>"),
           $td = $("<td>").attr("colspan",this.colNum).addClass("paging");
           $tr.append($td);
           $tfoot.append($tr);
           this.tableobj.append($tfoot);
           this.pagination($td);
    }
    //表格分页
    this.pagination = function(tdCell){
		flush();
        var $td= typeof(tdCell) == "object" ? tdCell : $("#" + tdCell);
        //首页
        var oA = $("<a/>");
        oA.attr("href","#1");
        oA.html("首页");
        $td.append(oA);
        //上一页
        if(this.currentPageNum>=2){
            var oA = $("<a/>");
            oA.attr("href","#"+(this.currentPageNum - 1));
            oA.html("上一页");
            $td.append(oA);
        }
        //普通显示格式
        if(this.maxPageNum <= this.groupDataNum){  // 10页以内 为一组
            for(var i = 1;i <= this.maxPageNum ;i++){
                var oA = $("<a/>");
                oA.attr("href","#"+i);
                if(this.currentPageNum == i){
                    oA.attr("class","current");
                }
                oA.html(i);
                $td.append(oA);
            }
        }else{//超过10页以后（也就是第一组后）
             if(this.groupNum<=1){//第一组显示
                 for(var j = 1;j <= this.groupDataNum ;j++){
                     var oA = $("<a/>");
                     oA.attr("href","#"+j);
                     if(this.currentPageNum == j){
                         oA.attr("class","current");
                     }
                     oA.html(j);
                     $td.append(oA);
 
                 }
             }else{//第二组后面的显示
                 var begin = (this.groupDataNum*(this.groupNum-1))+ 1,
                      end ,
                     maxGroupNum = Math.ceil(this.maxPageNum/this.groupDataNum);
                 if(this.maxPageNum%this.groupDataNum!=0&&this.groupNum==maxGroupNum){
                     end = this.groupDataNum*(this.groupNum-1)+this.maxPageNum%this.groupDataNum
                 }else{
                     end = this.groupDataNum*(this.groupNum);
                 }
 
                 for(var j = begin;j <= end ;j++){
                     var oA = $("<a/>");
                     oA.attr("href","#"+j);
                     if(this.currentPageNum == j){
                         oA.attr("class","current");
                     }
                     oA.html(j);
                     $td.append(oA);
                 }
             }
        }
        //下一页
        if( (this.maxPageNum - this.currentPageNum) >= 1 ){
            var oA = $("<a/>");
            oA.attr("href","#" + (this.currentPageNum + 1));
            oA.html("下一页");
            $td.append(oA);
        }
        //尾页
        var oA = $("<a/>");
        oA.attr("href","#" + this.maxPageNum);
        oA.html("尾页");
        $td.append(oA);
 
        var page_a = $td.find('a');
        var tempThis = this;
 
        page_a.unbind("click").bind("click",function(){
            var nowNum =  parseInt($(this).attr('href').substring(1));
 
            if(nowNum>tempThis.currentPageNum){//下一组
                if(tempThis.currentPageNum%tempThis.groupDataNum==0){
                    tempThis.groupNum += 1;
 
                    var maxGroupNum = Math.ceil(tempThis.maxPageNum/tempThis.groupDataNum);
                    if(tempThis.groupNum>=maxGroupNum){
                        tempThis.groupNum = maxGroupNum;
                    }
                }
            }
            if(nowNum<tempThis.currentPageNum){//上一组
                if((tempThis.currentPageNum-1)%tempThis.groupDataNum==0){
                    tempThis.groupNum -= 1;
                    if(tempThis.groupNum<=1){
                        tempThis.groupNum = 1;
                    }
                }
            }
            if(nowNum==tempThis.maxPageNum){//直接点击尾页
                var maxGroupNum = Math.ceil(tempThis.maxPageNum/tempThis.groupDataNum);
                tempThis.groupNum = maxGroupNum;
            }
            if(nowNum==1){
                var maxGroupNum = Math.ceil(tempThis.maxPageNum/tempThis.groupDataNum);
                tempThis.groupNum = 1;
            }
            tempThis.currentPageNum = nowNum;
 
 
            tempThis.init((tempThis.currentPageNum-1)*tempThis.displayNum,
                tempThis.currentPageNum*tempThis.displayNum);
            return false;
        });
    }
    //初始化
    this.init = function(begin,end){
        this.header = options.headers;
        this.colNum = this.header.length;
        this.content = options.data;
        this.allDataNum = this.content.length;
        if(options.displayNum){
            this.displayNum = options.displayNum;
        }
        if(options.groupDataNum){
            this.groupDataNum = options.groupDataNum;
        }
        this.clearTable();
        this.showHeader();
        this.showContent(begin,end);
        this.showFoot();
    }
 
    this.init(0,options.displayNum);
}
</script>
<script type="text/javascript">
    var data =[];
	var info=[];
	var CurID=0;
function flush()
{
	$("#cs_table").find('tbody').addClass('data');
	 $(".sort-table").tablesorter(); 
    $("table td").mouseover(function() {
        var row = $(this).parent().index() + 1; // 行位置
        var col = $(this).index() + 1; // 列位置
		$(this).parent().css("background-color","#000000"); 
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
       var val=$(this).parent().find("td:first").text();
       val=parseInt(val);
       CurID=val;
       PutDataIntoPopover(val);
    });
	
	$('.data').click(function(){
		$('.theme-popover-mask').fadeIn(100);
		$('.theme-popover').slideDown(200);
	});
	
	$('.theme-poptit .close').click(function(){
		$('.theme-popover-mask').fadeOut(100);
		$('.theme-popover').slideUp(200);
	});
	
}
//对Date的扩展，将 Date 转化为指定格式的String   
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
//例子：   
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423   
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18   
Date.prototype.Format = function(fmt)   
{ //author: meizz   
var o = {   
 "M+" : this.getMonth()+1,                 //月份   
 "d+" : this.getDate(),                    //日   
 "h+" : this.getHours(),                   //小时   
 "m+" : this.getMinutes(),                 //分   
 "s+" : this.getSeconds(),                 //秒   
 "q+" : Math.floor((this.getMonth()+3)/3), //季度   
 "S"  : this.getMilliseconds()             //毫秒   
};   
if(/(y+)/.test(fmt))   
 fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
for(var k in o)   
 if(new RegExp("("+ k +")").test(fmt))   
fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
return fmt;   
}  


function Search()
{
	var date=document.getElementById("ChooseDate").value;
	var username=document.getElementById("UserName").value;

	if(username=="")
	{
		alert("用户名不能为空");
		return;
	}
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
	  cache:true,
	  url:"getDrivingInfoByTime.json",
	  data:{starttime:dt1.getTime(),endtime:dt2.getTime(),username:username},
	  //contentType:"application/json",
	  error: function(XMLHttpRequest, textStatus, errorThrown) {
		  alert("查询失败");
            //alert(XMLHttpRequest.status);
           // alert(XMLHttpRequest.readyState);
         //  alert(textStatus);
	  },
	  success:function(res)
	  {
	      if(res.length<=1)
	    	  {
	    	  alert("无相关信息");
	    	  return;
	    	  }
	      //alert("查询成功");
	      	data.length=0;
	      	info.length=0;
	        for(var i=0;i<res.length;i++)
	    	{
	        		var e = new Date();
	  	 			e.setTime(res[i].time);
	  	 			var str=e.Format("yyyy-MM-dd hh:mm:ss");
	  	 		  info[i]=res[i];
	        	  data[i] = {id:res[i].id,time:str,lng:res[i].longitude,lat:res[i].latitude,speed:res[i].velocity,acc:res[i].acceleration,ore:res[i].orientation}; 
	    	}
	        var cs = new table({
	            "tableId":"cs_table",    //必须
	            "headers":["序号","时间","经度","纬度","速度","加速度","方向"],   //必须
	            "data":data,        //必须
	            "displayNum": 20,    //必须   默认 10
	           "groupDataNum":10  //可选    默认 10
	    	});
	  }
	 
});
}
function PutDataIntoPopover(id)
{
	document.getElementById("btnadd").style.display ="none";
	document.getElementById("btnsub").style.display ="block";
	document.getElementById("btnDelete").style.display ="block";
	for(var i=0;i<data.length;i++)
		{
			if(data[i].id==id)
				{
					var e = new Date();
  	 				e.setTime(info[i].time);
  	 				var str=e.Format("yyyy-MM-dd");
  	 				var str1=e.Format("hh:mm:ss");
  	 				document.getElementById("Timedate").value=str;
					document.getElementById("Time").value=str1;
					document.getElementById("lng").value=info[i].longitude;
					document.getElementById("lat").value=info[i].latitude;
					document.getElementById("speed").value=info[i].velocity;
					document.getElementById("acceleration").value=info[i].acceleration;
					document.getElementById("orientation").value=info[i].orientation;
				}
		}
}
function Add()
{
	
	document.getElementById("btnadd").style.display ="block";
	document.getElementById("btnsub").style.display ="none";
	document.getElementById("btnDelete").style.display ="none";
	$('.theme-popover-mask').fadeIn(100);
	$('.theme-popover').slideDown(200);
	
	$('.theme-poptit .close').click(function(){
		$('.theme-popover-mask').fadeOut(100);
		$('.theme-popover').slideUp(200);
	});
}
function Submit()
{
	var date=document.getElementById("Timedate").value;
	var time=document.getElementById("Time").value;
	var lng=document.getElementById("lng").value;
	var lat=document.getElementById("lat").value;
	var speed=document.getElementById("speed").value;
	var acceleration=document.getElementById("acceleration").value;
	var orientation=document.getElementById("orientation").value;
	
	var temper1=date+" "+time;
	var dt1 = new Date(temper1.replace(/-/,"/"));
	var fulltime=dt1.getTime();
	$.ajax
    ({
	type:"POST",
	  //dataType:"json",
	  cache:false,
	  url:"UpdateDrivingInfo.json",
	  data:{time:fulltime,longitude:lng,latitude:lat,velocity: speed,orientation:orientation,acceleration:acceleration,id:CurID},
	  //contentType:"application/json",
	  error: function(XMLHttpRequest, textStatus, errorThrown) {
            //alert(XMLHttpRequest.status);
            //alert(XMLHttpRequest.readyState);
           // alert(textStatus);
	  },
	  success:function(res){
		  document.getElementById("tip").innerHTML="提交成功！";
		  setTimeout(function(){
			  document.getElementById("tip").innerHTML="";
			  $('.theme-popover-mask').fadeOut(100);
				$('.theme-popover').slideUp(200);
				Search();
		    }, 1000);
		  Search();
	  }
	});
}
function AddNew()
{
	var username=document.getElementById("UserName").value;
	var date=document.getElementById("Timedate").value;
	var time=document.getElementById("Time").value;
	var lng=document.getElementById("lng").value;
	var lat=document.getElementById("lat").value;
	var speed=document.getElementById("speed").value;
	var acceleration=document.getElementById("acceleration").value;
	var orientation=document.getElementById("orientation").value;
	
	var temper1=date+" "+time;
	var dt1 = new Date(temper1.replace(/-/,"/"));
	var fulltime=dt1.getTime();
	$.ajax
    ({
	type:"POST",
	  //dataType:"json",
	  cache:false,
	  url:"AddDrivingInfo.json",
	  data:{time:fulltime,longitude:lng,latitude:lat,velocity: speed,orientation:orientation,acceleration:acceleration,username:username},
	  //contentType:"application/json",
	  error: function(XMLHttpRequest, textStatus, errorThrown) {
            //alert(XMLHttpRequest.status);
            //alert(XMLHttpRequest.readyState);
           // alert(textStatus);
	  },
	  success:function(res){
		  document.getElementById("tip").innerHTML="提交成功！";
		  setTimeout(function(){
			  document.getElementById("tip").innerHTML="";
			  $('.theme-popover-mask').fadeOut(100);
				$('.theme-popover').slideUp(200);
				Search();
		    }, 1000);
		  Search();
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
	  	url:"DeleteSelectedDrivingInfo.json",
	 	 data:{id:CurID},
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
			  Search();
	 	 }
	 

		});
	}
	else
	{
		return;
	}
}

</script>

</html>
