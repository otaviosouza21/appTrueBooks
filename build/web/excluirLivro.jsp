<%@page import="com.aplicacaomodelo.core.impl.persistencia.LivroDAO"%>
<%@page import="com.aplicacaomodelo.domain.Livro"%>
<%
    String idLivroStr = request.getParameter("id");
    if (idLivroStr != null) {
        int idLivro = Integer.parseInt(idLivroStr);
        LivroDAO livroDAO = new LivroDAO();
        livroDAO.excluir(idLivro);
    }
    // Redirecione de volta para a p�gina de consulta ap�s a exclus�o.
    response.sendRedirect("consultaLivros.jsp");
%>
