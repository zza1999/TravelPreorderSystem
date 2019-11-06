<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="bean.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
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
if("not_user".equals(session.getAttribute("login_ret"))){
	out.print("<script type=\"text/javascript\"> alert(\"用户名不存在！\"); </script>");
	session.setAttribute("login_ret","");
} else if("not_psd".equals(session.getAttribute("login_ret"))){
	out.print("<script type=\"text/javascript\"> alert(\"用户名密码不匹配！\"); </script>");
	session.setAttribute("login_ret","");
} else if("ok_user".equals(session.getAttribute("sign_ret"))){
	out.print("<script type=\"text/javascript\"> alert(\"注册成功！\"); </script>");
	session.setAttribute("sign_ret","");
} else{
	session.setAttribute("User", new User(null,null));
}
%>
<div align="center">
<table>
	<tr>
		<form method="post" action="/Hotel/Control">
		<td>用户名:</td>
		<td></td>
		<td><input type="text" name="usrname" style="width:60%" value="<%= ((User)session.getAttribute("User")).usrname %>"></td>
	</tr>
	<tr>
		<td>密码:</td>
		<td></td>
		<td><input type="password" name="passwd" style="width:60%" value="<%= ((User)session.getAttribute("User")).passwd %>"></td>
	</tr>
	<tr>
		<td><input type="submit" value="登录"></td>
		<td><input type="hidden" name="action" value="login"></td>
		</form>
		<form method="post" action="signUp.jsp">
		<td><input type="submit" value="注册"></td>
		</form>
	</tr>
</table>
</div>
</body>
</html>