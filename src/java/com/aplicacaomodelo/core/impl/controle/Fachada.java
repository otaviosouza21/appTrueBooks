/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.aplicacaomodelo.core.impl.controle;

import com.aplicacaomodelo.core.aplicacao.Resultado;
import com.aplicacaomodelo.core.impl.negocio.ValidarNomePessoa;
import com.aplicacaomodelo.core.impl.persistencia.LivroDAO;
import com.aplicacaomodelo.core.impl.persistencia.PessoaDAO;
import com.aplicacaomodelo.core.interfaces.IDAO;
import com.aplicacaomodelo.core.interfaces.IFachada;
import com.aplicacaomodelo.core.interfaces.IStrategy;
import com.aplicacaomodelo.domain.EntidadeDominio;
import com.aplicacaomodelo.domain.Livro;
import com.aplicacaomodelo.domain.Pessoa;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Caio Gustavo
 */
public class Fachada implements IFachada {

    /**
     * Mapa de DAOS, será indexado pelo nome da entidade O valor é uma instância
     * do DAO para uma dada entidade;
     */
    private Map<String, IDAO> daos;

    /**
     * Mapa para conter as regras de negócio de todas operações por entidade; O
     * valor é um mapa que de regras de negócio indexado pela operação
     */
    private Map<String, Map<String, List<IStrategy>>> rns;

    private Resultado resultado;

    public Fachada() {
        /* Intânciando o Map de DAOS */
        daos = new HashMap<String, IDAO>();
        /* Intânciando o Map de Regras de Negócio */
        rns = new HashMap<String, Map<String, List<IStrategy>>>();

        /* Criando instâncias dos DAOs a serem utilizados*/
        PessoaDAO pessoaDAO = new PessoaDAO();
        LivroDAO livroDAO = new LivroDAO();

        daos.put(Pessoa.class.getName(), pessoaDAO);
        daos.put(Livro.class.getName(), livroDAO);
        
        //instancia o map de validacoes da entidade pessoa
        Map<String, List<IStrategy>> rnsPessoa = new HashMap<>();
        
        // instancia a lista de validacoes especificas da operacoes de salvar
        List <IStrategy> rnsSalvarPessoa =  new ArrayList<>();
        
             // instancia a validacao de nome da pessoa
        ValidarNomePessoa validarNomePessoa = new ValidarNomePessoa();
        
          //Adiciona a validação de nome pessoa na lista de validacoes de salvar
        rnsSalvarPessoa.add(validarNomePessoa);
        
   
        //Mapeio a lista de validadacoes da operacoes de salvar
        rnsPessoa.put("Salvar",rnsSalvarPessoa);
        
      //adiciona o mapa de validacoes da pessoa nos mapas de regra do negocio
        rns.put(Pessoa.class.getName(), rnsPessoa);
    }

    @Override
    public Resultado salvar(EntidadeDominio entidade) {
        resultado = new Resultado();
        String nmClasse = entidade.getClass().getName();

        String msg = executarRegras(entidade, "SALVAR");

        if (msg == null) {
            //IDAO dao = daos.get(nmClasse);
            IDAO dao = daos.get(nmClasse);
            try {
                dao.salvar(entidade);
                List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
                entidades.add(entidade);
                resultado.setEntidades(entidades);

            } catch (SQLException e) {

                e.printStackTrace();
                resultado.setMsg("Não foi possível realizar o registro!");

            }
        } else {
            resultado.setMsg(msg);
        }

        return resultado;
    }

    @Override
    public Resultado alterar(EntidadeDominio entidade) {
        resultado = new Resultado();
        String nmClasse = entidade.getClass().getName();

        String msg = executarRegras(entidade, "ALTERAR");

        if (msg == null) {
            IDAO dao = daos.get(nmClasse);

            try {
                dao.alterar(entidade);
                List<EntidadeDominio> entidades = new ArrayList<>();
                entidades.add(entidade);
                resultado.setEntidades(entidades);

            } catch (SQLException e) {
                e.printStackTrace();
                resultado.setMsg("Não foi possível realizar a alteração!");
            }
        } else {
            resultado.setMsg(msg);
        }

        return resultado;
    }

    @Override
    public Resultado excluir(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Resultado consultar(EntidadeDominio entidade) {
        resultado = new Resultado();
        String nmClasse = entidade.getClass().getName();

        String msg = executarRegras(entidade, "CONSULTAR");

        if (msg == null) {

            IDAO dao = daos.get(nmClasse);

            try {

                resultado.setEntidades(dao.consultar(entidade));

            } catch (SQLException e) {
                e.printStackTrace();
                resultado.setMsg("Não foi possível realizar a consulta!");

            }
        } else {
            resultado.setMsg(msg);
        }
        return resultado;
    }

    @Override
    public Resultado visualizar(EntidadeDominio entidade) {
        resultado = new Resultado();
        String nmClasse = entidade.getClass().getName();

        String msg = executarRegras(entidade, "VISUALIZAR");

        if (msg == null) {
            IDAO dao = daos.get(nmClasse);

            try {
                List<EntidadeDominio> es = new ArrayList<>();
                es.add(dao.visualizar(entidade));
                resultado.setEntidades(es);
            } catch (SQLException e) {
                e.printStackTrace();
                resultado.setMsg("Não foi possível realizar a consulta!");

            }
        } else {
            resultado.setMsg(msg);
        }
        return resultado;
    }

    private String executarRegras(EntidadeDominio entidade, String operacao) {
        String nmClasse = entidade.getClass().getName();
        StringBuilder msg = new StringBuilder();

        Map<String, List<IStrategy>> regrasOperacao = rns.get(nmClasse);

        if (regrasOperacao != null) {
            List<IStrategy> regras = regrasOperacao.get(operacao);
            if (regras != null) {
                for (IStrategy s : regras) {
                    String m = s.processar(entidade);

                    if (m != null) {
                        msg.append(m);
                        msg.append("\n");
                    }
                }
            }
        }
        if (msg.length() > 0) {
            return msg.toString();
        } else {
            return null;
        }
    }

}
