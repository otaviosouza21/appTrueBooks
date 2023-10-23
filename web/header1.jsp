

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
