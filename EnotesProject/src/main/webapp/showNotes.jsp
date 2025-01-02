<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DAO.PostDAO" %>
<%@ page import="com.Db.DBConnect" %>
<%@ page import="com.User.Post" %>

<%
    UserDetails user3 = (UserDetails) session.getAttribute("userD");

    if (user3 == null) {
        session.setAttribute("Login-error", "Please Login..");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Show Notes</title>
    <%@include file="all_component/allcss.jsp"%>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    <%
    String updateMsg=(String)session.getAttribute("updateMsg");
    if(updateMsg!=null)
    {%>
    <div class="alert alert-success" role="alert"><%=updateMsg%></div>
    <%
    session.removeAttribute("updateMsg");
    }
    %>
    
    <%
    String WrongMsg=(String)session.getAttribute("WrongMsg");
    if(WrongMsg!=null)
    {%>
    <div class="alert alert-danger" role="alert"><%=WrongMsg%></div>
    <%
    session.removeAttribute("WrongMsg");
    }
    %>
    <div class="container">
        <h2 class="text-center">All Notes:</h2>
        <div class="row">
            <div class="col-md-12">
                <%
                    PostDAO ob = new PostDAO(DBConnect.getConn());
                    List<Post> post = ob.getData(user3.getId());

                    if (post==null || post.isEmpty()) {
                        %>
                        <p class="text-center text-danger">No notes found.</p>
                        <%
                    }  else{
                        for (Post po : post) {
                            %>
                            <div class="card mt-3">
                                <img alt="Note Image" src="img/note1.png" class="card-img-top mt-2 mx-auto" style="max-width: 100px;">
                                <div class="card-body p-4">
                                    <h5 class="card-title"><%= po.getTitle() %></h5>
                                    <p><%= po.getContent() %></p>
                                    <p>
                                        <b class="text-success">Published By:</b><br>
                                        <b class="text-primary"><%= user3.getName() %></b>
                                    </p>
                                    <p>
                                        <b class="text-success">Published Date:</b><br>
                                        <b class="text-success"><%= po.getPdate() %></b>
                                    </p>
                                    <div class="container text-center mt-2">
                                        <a href="deleteServlet?note_id=<%= po.getId() %>" class="btn btn-danger">Delete</a>
                                        <a href="edit.jsp?note_id=<%= po.getId() %>" class="btn btn-primary">Edit</a>
                                    </div>
                                </div>
                            </div>
                            <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
