<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./bootstrap-4.0.0/css/bootstrap.css">
        <script src="./bootstrap-4.0.0/js/bootstrap.js"></script>
        <link rel="stylesheet" href="./css/global.css">
        <link rel="stylesheet" href="./css/cadastroLivro.css">

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
        <main class="home container">
            <a href="./consultaLivros.jsp">Cadastros =></a>
            <form method="post" action="SalvarLivro" class="row g-3 formu" enctype="multipart/form-data">
                <h1 class="col-md-12">Cadastro de Livro</h1>

                <div class="form-input col-md-6">
                    <label for="titulo">Titulo</label>
                    <input placeholder="Titulo do livro" class="form-control" type="text" name="titulo" id="titulo">
                </div>

                <div class="form-input col-md-6">
                    <label for="autor">Autor</label>
                    <input placeholder="Autor do livro" class="form-control" type="text" name="autor" id="autor">
                </div>

                <div class="form-input col-md-12">
                    <label for="descricao">Descricao</label>
                    <textarea class="form-control" placeholder="Uma breve descrição" style="resize: none;" name="descricao" id="descricao"></textarea>
                </div>

                <div class="form-input col-md-3">
                    <label for="tb_padrao">Tabela Padrão</label>
                    <input placeholder="R$" class="form-control" type="text" name="tb_padrao" id="tb_padrao">
                </div>

                <div class="form-input col-md-3">
                    <input type="checkbox" name="" id="promocao">
                    <label for="tb_promocao">Tabela Promoção</label>
                    <input placeholder="R$" class="form-control" type="text" name="tb_promocao" id="tb_promocao">
                </div>
                <div class="form-input col-md-4">
                    <label for="quantidade">Quantidade</label>
                    <input placeholder="Quantidade em estoque" class="form-control" type="text" name="quantidade" id="quantidade">
                </div>

                <div class="botao col-md-12">
                    <button class="btn btn-success" type="submit" value="SALVAR" name="operacao" id="operacao">Cadastrar</button>
                </div>

                <script>
                    var tb_padraoInput = document.getElementById("tb_padrao");
                    var tb_promocionalInput = document.getElementById("tb_promocao");
                    var promocaoCheckbox = document.getElementById("promocao");



                    promocaoCheckbox.addEventListener("change", function () {
                        if (promocaoCheckbox.checked) {
                            tb_padraoInput.disabled = true;
                            tb_promocionalInput.disabled = false;
                        } else {
                            tb_padraoInput.disabled = false;
                            tb_promocionalInput.disabled = true;
                        }
                    });


                </script>

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