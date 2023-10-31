package com.aplicacaomodelo.web.viewhelper;

import com.aplicacaomodelo.core.aplicacao.Resultado;
import com.aplicacaomodelo.domain.EntidadeDominio;
import com.aplicacaomodelo.domain.Livro;
import com.aplicacaomodelo.web.interfaces.IViewHelper;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class LivroVH implements IViewHelper {

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        String operacao = request.getParameter("operacao");
        Livro livro = new Livro();
        if (operacao.equals("SALVAR")) {
            livro.setTitulo(request.getParameter("titulo"));
            livro.setAutor(request.getParameter("autor"));
            livro.setDescricao(request.getParameter("descricao"));

            String tb_padraoStr = request.getParameter("tb_padrao");
            String tb_promocaoStr = request.getParameter("tb_promocao");
            String quantidadeStr = request.getParameter("quantidade");

            double tb_padrao = 0.0;
            double tb_promocao = 0.0;

            if (tb_padraoStr != null && !tb_padraoStr.isEmpty()) {
                try {
                    tb_padrao = Double.parseDouble(tb_padraoStr);
                } catch (NumberFormatException e) {

                }
            }

            if (tb_promocaoStr != null && !tb_promocaoStr.isEmpty()) {
                try {
                    tb_promocao = Double.parseDouble(tb_promocaoStr);
                } catch (NumberFormatException e) {

                }
            }

            try {
                int quantidade = Integer.parseInt(quantidadeStr);
                livro.setQuantidade(quantidade);
            } catch (NumberFormatException e) {

            }
            livro.setTb_padrao(tb_padrao);
            livro.setTb_promocao(tb_promocao);
        }

        return livro;

    }

    @Override
    public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setAttribute("listaLivros", resultado.getEntidades());

        request.getRequestDispatcher("cadastroLivro.jsp").forward(request, response);

    }

}
