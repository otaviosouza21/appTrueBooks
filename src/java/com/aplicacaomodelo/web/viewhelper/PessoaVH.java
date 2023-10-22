package com.aplicacaomodelo.web.viewhelper;

import com.aplicacaomodelo.core.aplicacao.Resultado;
import com.aplicacaomodelo.domain.EntidadeDominio;
import com.aplicacaomodelo.domain.Pessoa;
import com.aplicacaomodelo.web.interfaces.IViewHelper;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class PessoaVH implements IViewHelper {

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        //Obtêm a operação executada
        String operacao = request.getParameter("operacao");
        Pessoa pessoa = new Pessoa();
        if (operacao.equals("SALVAR")) {
            pessoa.setNome_comp(request.getParameter("nome_comp"));
            pessoa.setEmail(request.getParameter("email"));
            pessoa.setEndereco(request.getParameter("endereco"));
            pessoa.setBairro(request.getParameter("bairro"));
            pessoa.setCidade(request.getParameter("cidade"));

            String dt_nascimentoStr = request.getParameter("dt_nascimento");
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date dt_nascimento = formato.parse(dt_nascimentoStr);
                pessoa.setDt_nascimento(dt_nascimento);
            } catch (ParseException ex) {
                System.out.println("--Not converted in date. " + ex.getMessage());
            }
            pessoa.setCep(request.getParameter("cep"));
            pessoa.setCelular(request.getParameter("celular"));
            pessoa.setComplemento(request.getParameter("complemento"));
            pessoa.setEstado(request.getParameter("estado"));
        }

        return pessoa;

    }

    @Override
    public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setAttribute("listaPessoas", resultado.getEntidades());

        request.getRequestDispatcher("cadastroUsuario.jsp").forward(request, response);

    }

}
