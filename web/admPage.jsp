<%-- 
    Document   : admPage
    Created on : 29 de out. de 2023, 17:57:23
    Author     : otavi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./bootstrap-4.0.0/css/bootstrap.css">
        <script src="./bootstrap-4.0.0/js/bootstrap.js"></script>
        <link rel="stylesheet" href="./css/global.css">
        <link rel="stylesheet" href="./css/admPage.css">
        <title>True Books</title>
    </head>

    <jsp:include page="header1.jsp"/>
    <body>
        <section class="container">
            <h2 class="title">Gerenciamento de Cadastros</h2>
            
            <ul class="menu-adm">
                <li>
                    <a href="./cadastroUsuario.jsp">
                         <img src="./img/userCadastrar.svg" alt="cadastrar"/>
                          <h3>Cadastrar Clientes</h3>
                   </a>
                </li>
                 <li>
                     <a href="./consultaPessoas.jsp">
                        <img src="./img/user2.svg" alt="alt"/>
                        <h3>Consultar Clientes</h3>
                    </a>
                </li>
                 <li>
                     <a href="./cadastroLivro.jsp">
                         <img src="./img/bookCadastrar.svg" alt="alt"/>
                          <h3>Cadastrar Livros</h3>
                     </a>
                </li>
                 <li>
                     <a href="./consultaLivros.jsp">
                         <img src="./img/book.svg" alt="alt"/>
                         <h3>Consultar Livros</h3>
                     </a>
                </li>
            </ul>
            
            
         </section>
        
        
        
        
        
        
    </body>
    <jsp:include page="footer.jsp"/>
</html>
