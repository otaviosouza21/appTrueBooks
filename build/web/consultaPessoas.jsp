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
         <header class="header">
                            <div class="header-rigth">
                                <h1 class="logo">True Books</h1>
                                <div class="header-search">
                                    <img src="./img/search.svg" alt="">
                                    <input type="text" name="" id="" placeholder="busque por qualquer livro">
                                </div>
                            </div>
                            <nav class="nav">
                                <ul class="nav-links">
                                    <li><a href="./index.jsp">Home</a></li>
                                    <li><a href="./cadastroLivro.jsp">Livros</a></li>
                                    <li><a href="">Sobre</a></li>
                                    <li>
                                        <a>
                                            <img src="./img/cart.svg" alt="Carrinho de Compras" srcset="">
                                        </a>
                                    </li>
                                    <li class="login">
                                        <a>
                                            <img src="./img//user.svg" alt="Usuario" srcset="">
                                        </a>
                                    </li>
                                </ul>
                            </nav>
           <div class="modal-login">
               <h4>Acesse sua Conta</h4>
               <form class="modal-form" >
                   <div class="">
                       <label for="user">Usuario ou email</label>
                       <input class="form-control" type="text" id="user" name="use"/>
                   </div>
                      <div class="">
                       <label for="passw">Senha</label>
                       <input class="form-control" type="password" id="passw" name="passw"/>
                   </div>
                   <span>Esqueci minha senha</span>
                   <div class="modal-buttons">
                       <button class="btn btn-sucess">Entrar</button>
                       <button class="btn btn-sucess">
                         <a id="criar_conta" style="color: white !important" ref="./cadastroUsuario.jsp">                                       
                               Criar Conta
                         </a>
                       </button>                       
                   </div>
               </form>
           </div>
           
       </header>
        
        <section class="consulta">
    <h1 class="title container">Consulta de Cadastros</h1>
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
        
        

        
        <footer class="footer">
            <div class="footer-redes">
                <h1 class="title" style="color: white;">True Books</h1>
                <div>
                    <img src="./img/face.svg" alt="logo-facebook" srcset="">
                    <img src="./img/instagram.svg" alt="logo-instagram" srcset="">
                    <img src="./img/twitt.svg" alt="logo-twitter" srcset="">
                </div>
            </div>
            <nav class="footer-nav">
                <ul class="footer-nav-list">
                    <li>Menu</li>
                    <li>Home</li>
                    <li>Sobre</li>
                    <li>Livros</li>
                </ul>
                <ul class="footer-nav-list">
                    <li>Cadastro</li>
                    <li>Criar</li>
                    <li>Meus Livros</li>
                    <li>Acesso</li>
                </ul>
                <ul class="footer-nav-list">
                    <li>FAQ</li>
                    <li>Contato</li>
                    <li>Duvidas</li>
                    <li>SAC</li>
                </ul>
            </nav>
        </footer>
                <script src="./js/modalLogin.js"></script>
    </body>

    </html>