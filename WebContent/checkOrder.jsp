<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkOrder</title>
        <base href="<%=basePath%>">
        <link href="css/model.css" rel="stylesheet" type="text/css" />
</head>
<body>
<style type="text/css">    
     body{
        font-size:24px;    
        background-image: url(images/bg.jpg);    
        background-size:cover;  
     }    
</style> 
 
    <!-- header -->
    <div align="center">
        <img src="images/top.jpg" />
    </div>
    </br>
    
<div align="center">
	<table>
<%
if((int)session.getAttribute("order_check") == 1){
%>
		<tr>
			<td>订票成功，订单如下：</td>
		</tr>
		<tr>
			<td>用户名</td>
			<td>车次/航班</td>
			<td>日期</td>
		</tr>
		<tr>
			<td><%= ((User)session.getAttribute("User")).usrname %></td>
			<td><%= ((Order)session.getAttribute("Order")).line %></td>
			<td><%= ((Order)session.getAttribute("Order")).date %></td>
		</tr>
<%}else{ %>
		<tr>
			<td>订票失败，请返回。</td>
		</tr>
<%}%>
		<tr><form action="order.jsp">
			<td><input type="submit" value="返回订票"></td>
			</form>
		</tr>
	</table>
</div>
</body>
</html>