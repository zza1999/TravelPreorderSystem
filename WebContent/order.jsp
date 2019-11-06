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
<title>order</title>
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
	<tr><form method="post" action="/Hotel/Control">
		<td>车次/航班号:</td>
		<td><input type="text" name="line" vlaue="K105"></td>
	</tr>
	<tr>
		<td>日期:</td>
		<td><input type="date" name="date" value="2019-01-01"></td>
	</tr>
	<tr>
		<td><input type="submit" value="确认"></td>
		<td><input type="hidden" name="action" value="confirm_order"></td>
		</form>
	</tr>
	<tr><form action="main.jsp">
		<td><input type="submit" value="返回主菜单"></td>
		</form>
	</tr>
</table>
</div>
</body>
</html>