<%@page import="com.aplicacaomodelo.core.impl.persistencia.PessoaDAO"%>
<%@page import="com.aplicacaomodelo.domain.Pessoa"%>
<%
    String idPessoaStr = request.getParameter("id");
    if (idPessoaStr != null) {
        int idPessoa = Integer.parseInt(idPessoaStr);
        PessoaDAO pessoaDAO = new PessoaDAO();
        pessoaDAO.excluir(idPessoa);
    }
    // Redirecione de volta para a página de consulta após a exclusão.
    response.sendRedirect("consultaPessoas.jsp");
%>
