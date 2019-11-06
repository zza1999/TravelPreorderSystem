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
<title>signUp</title>
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
    
<%
if("not_user".equals(session.getAttribute("sign_ret"))){
	out.print("<script type=\"text/javascript\"> alert(\"用户名已存在！\"); </script>");
	session.setAttribute("sign_ret","");
} else if("not_psd".equals(session.getAttribute("sign_ret"))){
	out.print("<script type=\"text/javascript\"> alert(\"两次密码不一致！\"); </script>");
	session.setAttribute("sign_ret","");
} 
%>
<div align="center">
<table>
	<tr>
		<form method="post" action="/Hotel/Control">
		<td>请输入用户名:</td>
		<td><input type="text" name="signUsr" style="width:60%"></td>
	</tr>
	<tr>
		<td>请输入密码:</td>
		<td><input type="password" name="signPd1" style="width:60%"></td>
	</tr>
	<tr>
		<td>请再次输入密码确认:</td>
		<td><input type="password" name="signPd2" style="width:60%"></td>
	</tr>
	<tr>
		<td><input type="submit" value="注册"></td>
		<td><input type="hidden" name="action" value="signUp"></td>
		</form>
	</tr>
</table>
</div>
</body>
</html>