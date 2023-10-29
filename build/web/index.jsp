<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.List"%>
<%@page import="com.aplicacaomodelo.domain.EntidadeDominio"%>
<%@ page import="com.aplicacaomodelo.core.impl.persistencia.LivroDAO" %>
<%@ page import="com.aplicacaomodelo.domain.Livro" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./bootstrap-4.0.0/css/bootstrap.css">
        <script src="./bootstrap-4.0.0/js/bootstrap.js"></script>
        <link rel="stylesheet" href="./css/global.css">
        <link rel="stylesheet" href="./css/main.css">
        <title>True Books</title>
    </head>

    <body>
        <jsp:include page="header1.jsp"/>
              
            <% 
         LivroDAO livroDAO = new LivroDAO();
     List<EntidadeDominio> livros = livroDAO.consultar(new Livro());
   

 
    int desiredIndex = 1; // Change this to the desired index
    
     if (desiredIndex >= 0 && desiredIndex < livros.size()) {
        Livro promo1 = (Livro) livros.get(2);
        Livro promo2 = (Livro) livros.get(1);
        Livro promo3 = (Livro) livros.get(5);
        Livro promo4 = (Livro) livros.get(7);
                
     %>

        
        
        <section class="container">
            <h2 class="title">Em Destaque Hoje</h2>
            <div class="home-container">
                <ul class="home-list">
                    <li class="home-livro">
                            <span class="preco">
                                R$ <%=promo1.getTb_padrao() %>
                             </span>
                        <div class="livro-img">
                            <img src="./img/livro.jpg" alt="" srcset="">
                        </div>
                            <button class="btn btn-sucess livro-comprar">COMPRAR</button>
                        <div class="livro-descricao">
                            <h3><%= promo1.getTitulo() %></h3>
                            <span><%= promo1.getAutor() %></span>
                        </div>

                    </li>
                     <li class="home-livro">
                            <span class="preco">
                                R$ <%=promo2.getTb_padrao() %>
                             </span>
                        <div class="livro-img">
                            <img src="./img/livro.jpg" alt="" srcset="">
                        </div>
                            <button class="btn btn-sucess livro-comprar">COMPRAR</button>
                        <div class="livro-descricao">
                            <h3><%= promo2.getTitulo() %></h3>
                            <span><%= promo2.getAutor() %></span>
                        </div>

                    </li>
                    <li class="home-livro">
                            <span class="preco">
                                R$ <%=promo3.getTb_padrao() %>
                             </span>
                        <div class="livro-img">
                            <img src="./img/livro.jpg" alt="" srcset="">
                        </div>
                            <button class="btn btn-sucess livro-comprar">COMPRAR</button>
                        <div class="livro-descricao">
                            <h3><%= promo3.getTitulo() %></h3>
                            <span><%= promo3.getAutor() %></span>
                        </div>

                    </li>
                    <li class="home-livro">
                            <span class="preco">
                                R$ <%=promo4.getTb_padrao() %>
                             </span>
                        <div class="livro-img">
                            <img src="./img/livro.jpg" alt="" srcset="">
                        </div>
                            <button class="btn btn-sucess livro-comprar">COMPRAR</button>
                        <div class="livro-descricao">
                            <h3><%= promo4.getTitulo() %></h3>
                            <span><%= promo4.getAutor() %></span>
                        </div>

                    </li>
                    
                    
                </ul>
            </div>
            <div class="promocao">
   
                <div class="promocao-diaria">
                    <h4>Promoção Diaria</h4>
                    <img src="./img/livro.jpg" alt="" srcset="">
                </div>
                <div class="promocao-livro">
                    <h4>O Menino do Dedo Verde</h4>
                    <span class="promocao-desconto">R$ 110,90</span>
                    <span class="promocao-preco">R$ 99,90</span>
                    <button class="livro-comprar">COMPRAR AGORA</button>
                </div>
            </div>
        </section>
        
                        
                        <%
    } else {
        // Handle the case when the desired index is out of bounds
        out.println("Desired index is out of bounds.");
    }
%>
    </body>
            <script src="./js/modalLogin.js"></script>
            <jsp:include page="footer.jsp"/>
    </html>