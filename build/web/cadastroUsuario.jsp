<%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                         <link rel="stylesheet" href="./bootstrap-4.0.0/css/bootstrap.css">
                         <script src="./bootstrap-4.0.0/js/bootstrap.js"></script>
                        <link rel="stylesheet" href="./css/global.css">
                        <link rel="stylesheet" href="./css/cadastroPessoa.css">
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
                            <a href="./cadastroUsuario.jsp">Criar Conta</a>
                        </button>
                   </div>
               </form>
           </div>
           
                        </header>
                        <main class="home container">
                            <a href="./consultaPessoas.jsp">Consultar Cadastros =></a>

                            <form method="post" action="SalvarPessoa" class="row g-3 formu">
                                <h1 class="col-md-12" >Cadastro de Usuário</h1>

                                <div class="form-input col-md-6">
                                    <label for="nome_comp">Nome Completo</label>
                                    <input placeholder="Seu Nome Aqui" class="form-control" type="text" name="nome_comp" id="nome_comp">
                                </div>

                                <div class="form-input col-md-6">
                                    <label for="email">Email</label>
                                    <input placeholder="seunome@email.com" class="form-control" type="email" name="email" id="email">
                                </div>

                                <div class="form-input col-md-12">
                                    <label for="endereco">Endereço</label>
                                    <input placeholder="Informe seu endereço" class="form-control" type="text" name="endereco" id="endereco">
                                </div>

                                <div class="form-input col-md-3">
                                    <label for="bairro">Bairro</label>
                                    <input placeholder="Informe seu Bairro..." class="form-control" type="text" name="bairro" id="bairro">
                                </div>

                                <div class="form-input col-md-3">
                                    <label for="cidade">Cidade</label>
                                    <input placeholder="Informe sua cidade..." class="form-control" type="text" name="cidade" id="cidade">
                                </div>

                                <div class="form-input col-md-3">
                                    <label for="cep">CEP</label>
                                    <input placeholder="00000-00" class="form-control" type="text" name="cep" id="cep">
                                </div>

                                <div class="form-input col-md-3">
                                    <label for="dt_nascimento">Data de dt_nascimento</label>
                                    <input placeholder="DD-MM-AAAA" class="form-control" type="date" name="dt_nascimento" id="dt_nascimento">
                                </div>

                                <div class="form-input col-md-2">
                                    <label for="celular">Celular</label>
                                    <input placeholder="(xx) XXXXX-XXXX" class="form-control" type="tel" name="celular" id="celular">
                                </div>

                                <div class="form-input col-md-4">
                                    <label for="complemento">Complemento</label>
                                    <input placeholder="Informe um complemento" class="form-control" type="text" name="complemento" id="complemento">
                                </div>

                                <div class="form-input col-md-6">
                                    <label for="estado">Estado</label>
                                    <input placeholder="Informe o seu Estado..." class="form-control" type="text" name="estado" id="estado">
                                </div>





                                <div class="botao col-md-12">
                                    <button class="btn btn-success" type="submit" value="SALVAR" name="operacao" id="operacao">Cadastrar</button>
                                </div>

                            </form>


                        </main>
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