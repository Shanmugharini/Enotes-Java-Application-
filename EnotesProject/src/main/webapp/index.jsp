<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.Connection" %>
<%@ page import="com.Db.DBConnect" %>
    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img{
background: url("img/note.jpg");
width:100%;
height:100vh;
background-repeat:no-repeat;
background-size: cover;
}
</style>
<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>
<%
Connection conn=DBConnect.getConn();
System.out.print(conn);
%>
<div class="container-fluid back-img">
<div class="text-center">
<h1 class="text-white"><i class="fa fa-book" aria-hidden="true"></i> E Notes-Save Your Notes</h1>
<a href="login.jsp" class="btn btn-light"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a>
<a href="register.jsp" class="btn btn-light"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
</div>
</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>