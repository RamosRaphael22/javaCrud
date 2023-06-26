<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.List, java.util.ArrayList, br.com.raphael3.projetoRafa3.User" %>
<%
    List<User> userList = (List<User>) application.getAttribute("userList");
    if (userList == null) {
        userList = new ArrayList<>();
        application.setAttribute("userList", userList);
    }
    
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    
    int id = userList.size() + 1;
    
    User newUser = new User(id, name, email);
    userList.add(newUser);
    
    response.sendRedirect("index.jsp");
%>
