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
<title>main</title>
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
	<tr>
		欢迎，<%= ((User)session.getAttribute("User")).usrname %>
	</tr>
	<tr><form method="post" action="book.jsp">
		<td align="center"><input type="submit" value="预订"></td>
		</form>
	</tr>
	<tr><form method="post" action="order.jsp">
		<td align="center"><input type="submit" value="订票"></td>
		</form>
	</tr>
	<tr><form method="post" action="/Hotel/Control">
		<td align="center"><input type="submit" value="我的信息"></td>
		<td align="center"><input type="hidden" name="action" value="info"></td>
		</form>
	</tr>
	<tr><form method="post" action="/Hotel/Control">
		<td align="center"><input type="submit" value="退出登录"></td>
		<td align="center"><input type="hidden" name="action" value="exit"></td>
		</form>
	</tr>
	<tr><form method="post" action="/Hotel/Control">
		<td align="center"><input type="submit" value="删除账号"></td>
		<td align="center"><input type="hidden" name="action" value="delUser"></td>
		</form>
	</tr>
</table>
</div>
</body>
</html>