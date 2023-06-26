<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.List, java.util.ArrayList, br.com.raphael3.projetoRafa3.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CRUD JSP</title>
</head>
<body>
    <h1>CRUD JSP</h1>
    
    <form action="create.jsp" method="post">
        <label for="name">Nome:</label>
        <input type="text" name="name" id="name" required>
        
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required>
        
        <input type="submit" value="Adicionar">
    </form>
    
    <hr>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Ação</th>
            </tr>
        </thead>
        <tbody>
            <%-- Loop para exibir os dados --%>
            <%List<User> userList = (List<User>) application.getAttribute("userList"); %>
            <% for (User user : userList) { %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getEmail() %></td>
                    <td>
                        <a href="update.jsp?id=<%= user.getId() %>">Editar</a>
                        <a href="delete.jsp?id=<%= user.getId() %>" onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
