<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <section class="container">
            <h2 class="title">Em Destaque Hoje</h2>
            <div class="home-container">
                <ul class="home-list">
                    <li class="home-livro">
                        <div class="livro-img">
                            <img src="./img/livro.jpg" alt="" srcset="">
                        </div>

                        <div class="livro-descricao">
                            <h3>O Menino do dedo Verde</h3>
                            <span>Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                        </div>

                        <button class="livro-comprar">COMPRAR</button>
                    </li>
                    <li class="home-livro">
                        <div class="livro-img">
                            <img src="./img/livro.jpg" alt="" srcset="">
                        </div>

                        <div class="livro-descricao">
                            <h3>O Menino do dedo Verde</h3>
                            <span>Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                        </div>

                        <button class="livro-comprar">COMPRAR</button>
                    </li>
                    <li class="home-livro">
                        <div class="livro-img">
                            <img src="./img/livro.jpg" alt="" srcset="">
                        </div>

                        <div class="livro-descricao">
                            <h3>O Menino do dedo Verde</h3>
                            <span>Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                        </div>

                        <button class="livro-comprar">COMPRAR</button>
                    </li>

                    <li class="home-livro">
                        <div class="livro-img">
                            <img src="./img/livro.jpg" alt="" srcset="">
                        </div>

                        <div class="livro-descricao">
                            <h3>O Menino do dedo Verde</h3>
                            <span>Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                        </div>

                        <button class="livro-comprar">COMPRAR</button>
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