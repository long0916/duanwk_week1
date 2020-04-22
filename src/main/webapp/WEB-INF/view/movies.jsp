<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 视窗 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<!-- <link href="/resource/bootstrap.min.css" rel="stylesheet"> -->
<link href="/resource/css.css" rel="stylesheet">
<script type="text/javascript" src="/resource/jquery-3.2.1.js"></script>
</head>

<body>
 <div>
  <form id="form1" action="/selects" method="post">
   影片名称: <input type="text" name="name" value="${movieVO.name}"> 上映时间：<input type="text" name="t1" value="${movieVO.t1}">--<input type="text" name="t2" value="${movieVO.t2}"><br>
   导演: <input type="text" name="actor" value="${movieVO.actor}"> 价格区间：<input type="text" name="p1" value="${movieVO.p1}">--<input type="text" name="p2" value="${movieVO.p2}"><br>
   年代: <input type="text" name="years" value="${movieVO.years}"> 电影 时间长：<input type="text" name="l1" value="${movieVO.l1}">--<input type="text" name="l2" value="${movieVO.l2}"><br>
  <button type="submit" class="btn btn-info">查询</button>
  <button type="button" onclick="deleteBatch()" class="btn btn-warning">批量删除</button>
  
  
  </form>
 
 </div>
	<table class="table">
		<tr> <td>
		<button type="button" class="btn btn-info" onclick="chk(1)">全选</button>
		<button type="button" class="btn btn-success" onclick="chk(2)">反选</button>
		<button type="button" class="btn btn-danger" onclick="chk(3)">全不选</button>
		    </td>
			<td>电影名称</td>
			<td>导演</td>
			<td><button type="button" class="btn btn-link" onclick="myOrder('price')">票价</button></td>
			<td>上映时间</td>
			<td><button type="button" class="btn btn-link" onclick="myOrder('longtime')">时长</button></td>
			<td>类型</td>
			<td><button type="button" class="btn btn-link" onclick="myOrder('years')">年代</button></td>
			<td>区域</td>
			<td>状态</td>

		</tr>
		<c:forEach items="${info.list}" var="movie">
			<tr>
			  <td><input type="checkbox" name="ids" value="${movie.id }"> </td>
				<td>${movie.name }</td>
				<td>${movie.actor }</td>
				<td>${movie.price}</td>
				<td>${movie.uptime }</td>
				<td>${movie.longtime }</td>
				<td>${movie.type }</td>
				<td>${movie.years }</td>
				<td>${movie.area }</td>
				<td>${movie.status }</td>
			</tr>

		</c:forEach>
       <tr> 
        <td colspan="10"> <jsp:include page="/WEB-INF/view/pages.jsp"></jsp:include>  </td>
       </tr>
	</table>
	

</body>      
<script type="text/javascript">

//全选，反选，全不选
function chk(flag){
	if(flag==1){//全选
		$("[name='ids']").prop("checked",true);
	}else if(flag==2){//反选
		$("[name='ids']").each(function(){
			  $(this).prop("checked",!$(this).prop("checked"))	;
		});
		
	}else{//全不选
		
		$("[name='ids']").prop("checked",false);
	}
}

//批量f删除
function deleteBatch(){
	var ids =new Array();//用来存放选中的电影ID
	$("[name='ids']:checked").each(function(i){
		ids[i] =$(this).val();//获取选中的ID 放入数组
	})
	if(ids.length==0){
		alert("请至少选中一个");
		return ;
		
	}
	$.post("/deleteBatch",{ids:ids},function(flag){
		if(flag){
			alert("删除成功");
			location.href="/selects";
		}else{
			alert("删除失败");
		}
	})
}


//排序
function myOrder(orderName){
	var orderMethod='${movieVO.orderMethod}';//获取排序的方式 
	orderMethod=orderMethod=='desc'?'asc':'desc';//如果是倒序则本次为正序如否则为倒序
	location.href="/selects?orderName="+orderName+"&orderMethod="+orderMethod;
	
}
//分页
function goPage(pageNum){
	var orderName='${movieVO.orderName}';
	var orderMethod='${movieVO.orderMethod}';//获取排序的方式 
	location.href="/selects?pageNum="+pageNum+"&"+$("#form1").serialize()+"&orderName="+orderName+"&orderMethod="+orderMethod;
}


</script>
</html>