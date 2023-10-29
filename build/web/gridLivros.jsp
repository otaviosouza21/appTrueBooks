<%-- 
    Document   : gridLivros
    Created on : 25 de out. de 2023, 23:12:57
    Author     : otavi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.aplicacaomodelo.domain.EntidadeDominio"%>
<%@ page import="com.aplicacaomodelo.core.impl.persistencia.LivroDAO" %>
<%@ page import="com.aplicacaomodelo.domain.Livro" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="./css/global.css">
         <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./bootstrap-4.0.0/css/bootstrap.css">
        <script src="./bootstrap-4.0.0/js/bootstrap.js"></script>
    
        <title>JSP Page</title>
    </head>
     <jsp:include page="./header1.jsp"/>
    <body>
        <ul class="home-list animeLeft">
            
            <% 
         LivroDAO livroDAO = new LivroDAO();
     List<EntidadeDominio> livros = livroDAO.consultar(new Livro());
     
     for(EntidadeDominio livro : livros){
     Livro li = (Livro) livro;
     %>

     
     <li class="home-livro">
         <span class="preco">
            R$ <%= li.getTb_padrao() %>
         </span>
        <div class="livro-img">
          <img src="./img/livro.jpg" alt="" srcset="">
         </div>
         <button class="btn btn-sucess livro-comprar">COMPRAR</button>
         <div class="livro-descricao">
          <h3><%= li.getTitulo() %></h3>
          <span><%= li.getAutor() %></span>
         </div>

         
      </li>
      <% 
          }
      %>
        
        </ul>
        
            
    </body>
     <jsp:include page="./footer.jsp"/>
     <script src="./js/modalLogin.js"></script>
</html>
