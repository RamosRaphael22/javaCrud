<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="jakarta.servlet.http.HttpServlet" import="java.util.List, java.util.ArrayList, br.com.raphael3.projetoRafa3.User" %>
<%@ page import="java.util.List, java.util.ArrayList, br.com.raphael3.projetoRafa3.User" %>
<%

    List<User> userList = (List<User>) application.getAttribute("userList");
    if (userList == null) {
        userList = new ArrayList<>();
        application.setAttribute("userList", userList);
    }
    
    int id = Integer.parseInt(request.getParameter("id"));
    
    User userToUpdate = null;
    for (User user : userList) {
        if (user.getId() == id) {
            userToUpdate = user;
            break;
        }
    }
    
    if (userToUpdate != null) {

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Usuário</title>
</head>
<body>
    <h1>Editar Usuário</h1>
    
    <form action="update.jsp" method="post">
        <input type="hidden" name="id" value="<%= userToUpdate.getId() %>">
        
        <label for="name">Nome:</label>
        <input type="text" name="name" id="name" value="<%= userToUpdate.getName() %>" required>
        
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="<%= userToUpdate.getEmail() %>" required>
        
        <input type="submit" value="Atualizar">
    </form>
</body>
</html>
<%
    } else {
        response.sendRedirect("index.jsp");
    }
     
%>