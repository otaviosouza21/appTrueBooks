<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.aplicacaomodelo.domain.EntidadeDominio"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.aplicacaomodelo.core.impl.persistencia.PessoaDAO" %>
<%@ page import="com.aplicacaomodelo.domain.Pessoa" %>



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
            href="./cadastroUsuario.jsp"
            type="button"
             style="margin-bottom: 16px; font-weight: bold" class="btn btn-success"
            >
            CADASTRAR NOVO
            </a>
    <table class="grid">
      <thead class="grid-header">
        <tr>
          <td>Codigo</td>
          <td>Nome</td>
          <td>Email</td>
          <td>Endereço</td>
          <td>Bairro</td>
          <td>Cidade</td>
          <td>Estado</td>
          <td>CEP</td>
          <td>Data de Nascimento</td>
           <td>Celular</td>
           <td>Complemento</td>

          <td></td>
        </tr>
      </thead>
      <tbody class="grid-body">
          
      <% 
         PessoaDAO pessoaDAO = new PessoaDAO();
     List<EntidadeDominio> pessoas = pessoaDAO.consultar(new Pessoa());
     
       System.out.println("Número de registros encontrados: " + pessoas.size());
     
     for(EntidadeDominio pessoa : pessoas){
     Pessoa p  = (Pessoa) pessoa;
     %>
     
     <tr>
         <td><%= p.getId() %></td>
         <td><%= p.getNome_comp()%></td>
         <td><%= p.getEmail() %></td>
         <td><%= p.getEndereco() %></td>
         <td><%= p.getBairro() %></td>
         <td><%= p.getCidade() %></td>
         <td><%= p.getEstado() %></td>
         <td><%= p.getCep() %></td>
         <td> <%= new SimpleDateFormat("yyyy-MM-dd").format(p.getDt_nascimento()) %></td>
         <td><%= p.getCelular() %></td>
         <td><%= p.getComplemento() %></td>
         <td class="alter-img">
             <img style="width:  30px" src="./img/trash.svg" alt="">
            <img style="width:  30px" src="./img/edit.svg" alt="">
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