<%@page import="java.util.List"%>
<%@page import="com.aplicacaomodelo.domain.EntidadeDominio"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.aplicacaomodelo.core.impl.persistencia.LivroDAO" %>
<%@ page import="com.aplicacaomodelo.domain.Livro" %>


    <!DOCTYPE html>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="./bootstrap-4.0.0/css/bootstrap.css">
        <script src="./bootstrap-4.0.0/js/bootstrap.js"></script>
        <link rel="stylesheet" href="./css/global.css">
        <link rel="stylesheet" href="./css/grid.css">
      
        <title>True Books</title>
    </head>

    <body>
           <jsp:include page="header1.jsp"/>
        
        <section class="consulta container">
             <div class="header-title">
             <h1 class="title">Consulta de Cadastros</h1> 
             <a class="voltar" href="./admPage.jsp">Voltar</a>
             </div>
             <a style="color:white !important;" 
            href="./cadastroLivro.jsp"
            type="button"
             style="margin-bottom: 16px; font-weight: bold" class="btn btn-success"
            >
           Cadastrar Novo
            </a>
    <table class="grid">
      <thead class="grid-header">
        <tr>
          <td>Codigo</td>
          <td>Titulo</td>
          <td>Autor</td>
          <td>Descrição</td>
          <td>Tabela Padrão</td>
          <td>Tabela Promoção</td>
          <td>Estoque</td>

          <td></td>
        </tr>
      </thead>
      <tbody class="grid-body">
          
      <% 
         LivroDAO livroDAO = new LivroDAO();
     List<EntidadeDominio> livros = livroDAO.consultar(new Livro());
     
     for(EntidadeDominio livro : livros){
     Livro li = (Livro) livro;
     %>
     
     <tr>
         <td><%= li.getId() %></td>
         <td><%= li.getTitulo() %></td>
         <td><%= li.getAutor() %></td>
         <td><%= li.getDescricao() %></td>
         <td>R$ <%= li.getTb_padrao() %></td>
         <td>R$ <%= li.getTb_promocao() %></td>
         <td><%= li.getQuantidade() %></td>
         <td class="alter-img">
             <a href="excluirLivro.jsp?id=<%= li.getId() %>" class="excluir-btn">
                <img style="width:  30px" src="./img/trash.svg" alt="">
             </a>
              <a href="cadastroLivro.jsp?id=<%= li.getId() %>&editar=true" class="editar-btn">
                  <img style="width:  30px" src="./img/edit.svg" alt="">
              </a>
          </td>
     </tr>
      <% 
          }
      %>
      </tbody>
    </table>
  </section>
        
        

        
          <jsp:include page="footer.jsp"/>
                <script src="./js/modalLogin.js"></script>
    </body>

    </html>