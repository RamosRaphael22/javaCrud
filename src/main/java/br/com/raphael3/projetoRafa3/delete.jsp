<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.List, java.util.ArrayList, br.com.raphael3.projetoRafa3.User"%>
<%
    // Simulação de um banco de dados em memória
    List<User> userList = (List<User>) application.getAttribute("userList");
    if (userList == null) {
        userList = new ArrayList<>();
        application.setAttribute("userList", userList);
    }
    
    // Obtém o ID do usuário a ser excluído
    int id = Integer.parseInt(request.getParameter("id"));
    
    // Busca o usuário na lista pelo ID
    User userToDelete = null;
    for (User user : userList) {
        if (user.getId() == id) {
            userToDelete = user;
            break;
        }
    }
    
    if (userToDelete != null) {
        // Remove o usuário da lista
        userList.remove(userToDelete);
    }
    
    // Redireciona para a página inicial
    response.sendRedirect("index.jsp");
%>
