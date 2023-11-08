<%@page import="java.util.List"%>
<%@page import="com.aplicacaomodelo.domain.EntidadeDominio"%>
<%@page import="com.aplicacaomodelo.core.impl.persistencia.LivroDAO"%>
<%@page import="com.aplicacaomodelo.domain.Livro"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<% 
boolean isEdicao = "true".equals(request.getParameter("editar"));
%>

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
         <jsp:include page="header1.jsp"/>
        <main class="home container">
            
    <%
Livro livroParaEdicao = null;

if (isEdicao) {
    String livroId = request.getParameter("id");
    
    if (livroId != null) {
        LivroDAO livroDAO = new LivroDAO();
        List<EntidadeDominio> livros = livroDAO.consultar(new Livro());
        
        for (EntidadeDominio livro : livros) {
            Livro li = (Livro) livro;
            if (li.getId() == Integer.parseInt(livroId)) {
                livroParaEdicao = li;
                break; // Parar quando encontrar o livro
            }
        }
    }
}
%>
            
            <form method="post" action="<%= isEdicao ? "AlterarLivro" : "SalvarLivro"%>" class="row g-3 formu">
                    <a style="color:white !important;" 
                                href="./consultaLivros.jsp"
                                type="button"
                                 style="margin-bottom: 16px; font-weight: bold" class="btn btn-primary"
                      >
                           Consultar Livros
                    </a>
                <h1 class="col-md-12"><%= isEdicao ? "Editar Livro" : "Cadastro de Livro"%></h1>

                <div class="form-input col-md-6">
                    <label for="titulo">Titulo</label>
                   <input placeholder="Titulo do livro" value="<%= isEdicao ? livroParaEdicao.getTitulo() : "" %>" class="form-control" type="text" name="titulo" id="titulo">

         
                </div>

                <div class="form-input col-md-6">
                    <label for="autor">Autor</label>
                    <input placeholder="Autor do livro" value="<%= isEdicao ? livroParaEdicao.getAutor() : "" %>" class="form-control" type="text" name="autor" id="autor">
                </div>

                <div class="form-input col-md-12">
                    <label for="descricao">Descricao</label>
                    <textarea class="form-control"  placeholder="Uma breve descrição" style="resize: none;" name="descricao" id="descricao">
                        <%= isEdicao ? livroParaEdicao.getDescricao(): "" %>
                    </textarea>
                </div>

                <div class="form-input col-md-3">
                    <label for="tb_padrao">Tabela Padrão</label>
                    <input placeholder="R$" class="form-control" value="<%= isEdicao ? livroParaEdicao.getTb_padrao(): "" %>" type="text" name="tb_padrao" id="tb_padrao">
                </div>

                <div class="form-input col-md-3">
                    <input type="checkbox" name="" id="promocao">
                    <label for="tb_promocao">Tabela Promoção</label>
                    <input placeholder="R$" value="<%= isEdicao ? livroParaEdicao.getTb_promocao(): "" %>" class="form-control" type="text" name="tb_promocao" id="tb_promocao">
                </div>
                <div class="form-input col-md-4">
                    <label for="quantidade">Quantidade</label>
                    <input placeholder="Quantidade em estoque" value="<%= isEdicao ? livroParaEdicao.getQuantidade(): "" %>" class="form-control" type="text" name="quantidade" id="quantidade">
                </div>

                <div class="botao col-md-12">
                    <button class="btn btn-success" type="submit" value="<%= isEdicao ? "ALTERAR" : "SALVAR"%>" name="operacao" id="operacao">
                         <%= isEdicao ? "Atualizar" : "Cadastrar" %>
                    </button>
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