<%@page import="java.util.List"%>
<%@page import="com.aplicacaomodelo.domain.EntidadeDominio"%>
<%@page import="com.aplicacaomodelo.core.impl.persistencia.PessoaDAO"%>
<%@page import="com.aplicacaomodelo.domain.Pessoa"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% 
boolean isEdicao = "true".equals(request.getParameter("editar"));
%>
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
        <jsp:include page="header1.jsp"/>
        <main class="home container">

            <%
Pessoa pessoaParaEdicao = null;

if (isEdicao) {
   String pessoaId = request.getParameter("id");
    
   if (pessoaId != null) {
       PessoaDAO pessoaDAO = new PessoaDAO();
       List<EntidadeDominio> pessoas = pessoaDAO.consultar(new Pessoa());
        
       for (EntidadeDominio pessoa : pessoas) {
           Pessoa li = (Pessoa) pessoa;
           if (li.getId() == Integer.parseInt(pessoaId)) {
               pessoaParaEdicao = li;
               break; // Parar quando encontrar o livro
           }
       }
   }
}
            %>


            <form method="post" action="<%= isEdicao ? "AlterarPessoa" : "SalvarPessoa"%>" class="row g-3 formu">
                <a style="color:white !important;" 
                   href="./consultaPessoas.jsp"
                   type="button"
                   style="margin-bottom: 16px; font-weight: bold" class="btn btn-primary"
                   >
                    Consultar Usuarios
                </a>
                <h1 class="col-md-12" >Cadastro de Usuário</h1>

                <div class="form-input col-md-6">
                    <label for="id_pessoa">ID</label>
                    <input placeholder="ID da pessoa" value="<%= isEdicao ? pessoaParaEdicao.getId() : "" %>" class="form-control" type="text" name="id_pessoa" id="id_pessoa">
                </div>

                <div class="form-input col-md-6">
                    <label for="nome_comp">Nome Completo</label>
                    <input placeholder="Seu Nome Aqui" value="<%= isEdicao ? pessoaParaEdicao.getNome_comp() : "" %>"  class="form-control" type="text" name="nome_comp" id="nome_comp">
                </div>

                <div class="form-input col-md-6">
                    <label for="email">Email</label>
                    <input placeholder="seunome@email.com" value="<%= isEdicao ? pessoaParaEdicao.getEmail() : "" %>" class="form-control" type="email" name="email" id="email">
                </div>

                <div class="form-input col-md-12">
                    <label for="endereco">Endereço</label>
                    <input placeholder="Informe seu endereço" value="<%= isEdicao ? pessoaParaEdicao.getEndereco() : "" %>" class="form-control" type="text" name="endereco" id="endereco">
                </div>

                <div class="form-input col-md-3">
                    <label for="bairro">Bairro</label>
                    <input placeholder="Informe seu Bairro..." value="<%= isEdicao ? pessoaParaEdicao.getBairro() : "" %>" class="form-control" type="text" name="bairro" id="bairro">
                </div>

                <div class="form-input col-md-3">
                    <label for="cidade">Cidade</label>
                    <input placeholder="Informe sua cidade..." value="<%= isEdicao ? pessoaParaEdicao.getCidade() : "" %>" class="form-control" type="text" name="cidade" id="cidade">
                </div>

                <div class="form-input col-md-3">
                    <label for="cep">CEP</label>
                    <input placeholder="00000-00" value="<%= isEdicao ? pessoaParaEdicao.getCep() : "" %>" class="form-control" type="text" name="cep" id="cep">
                </div>

                <div class="form-input col-md-3">
                    <label for="dt_nascimento">Data de dt_nascimento</label>
                    <input placeholder="DD-MM-AAAA" value="<%= isEdicao ? pessoaParaEdicao.getDt_nascimento() : "" %>" class="form-control" type="date" name="dt_nascimento" id="dt_nascimento">
                </div>

                <div class="form-input col-md-2">
                    <label for="celular">Celular</label>
                    <input placeholder="(xx) XXXXX-XXXX" value="<%= isEdicao ? pessoaParaEdicao.getCelular() : "" %>" class="form-control" type="tel" name="celular" id="celular">
                </div>

                <div class="form-input col-md-4">
                    <label for="complemento">Complemento</label>
                    <input placeholder="Informe um complemento" value="<%= isEdicao ? pessoaParaEdicao.getComplemento() : "" %>" class="form-control" type="text" name="complemento" id="complemento">
                </div>

                <div class="form-input col-md-6">
                    <label for="estado">Estado</label>
                    <input placeholder="Informe o seu Estado..." value="<%= isEdicao ? pessoaParaEdicao.getEstado() : "" %>" class="form-control" type="text" name="estado" id="estado">
                </div>





                <div class="botao col-md-12">
                    <button class="btn btn-success" type="submit" value="<%= isEdicao ? "ALTERAR" : "SALVAR"%>" name="operacao" id="operacao">
                         <%= isEdicao ? "Atualizar" : "Cadastrar" %>
                    </button>
                </div>

            </form>


        </main>
        <jsp:include page="footer.jsp"/>
        <script src="./js/modalLogin.js"></script>
    </body>

</html>