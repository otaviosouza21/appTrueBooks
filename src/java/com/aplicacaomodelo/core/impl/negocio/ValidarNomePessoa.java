/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.aplicacaomodelo.core.impl.negocio;

import com.aplicacaomodelo.core.interfaces.IStrategy;
import com.aplicacaomodelo.domain.EntidadeDominio;
import com.aplicacaomodelo.domain.Pessoa;

/**
 *
 * author autologon
 */
public class ValidarNomePessoa implements IStrategy {

    @Override
    public String processar(EntidadeDominio entidade) {

        StringBuilder sb = new StringBuilder();

        Pessoa pessoa = (Pessoa) entidade;

        if (pessoa.getNome_comp().isEmpty()) {
            sb.append("O campo Nome não foi preenchido");
        } else if (pessoa.getNome_comp().length() < 3) {
            sb.append("O campo não é válido");
        }

        if (!sb.toString().isEmpty()) {
            return sb.toString();
        } else {
            return null;
        }
    }
}
