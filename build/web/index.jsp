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
        <jsp:include page="header1.jsp"/>
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
        
    </body>
            <script src="./js/modalLogin.js"></script>
            <jsp:include page="footer.jsp"/>
    </html>