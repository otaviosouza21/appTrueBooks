/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.aplicacaomodelo.domain;

import java.util.Date;

/**
 *
 * @author Caio Gustavo
 */
public class Pessoa extends EntidadeDominio{
    
    private String nome_comp;
    private String email;
    private String endereco;
    private String bairro;
    private String cidade;
    private Date dt_nascimento;
    private String cep;
    private String celular;
    private String complemento;
    private String estado;

    public Pessoa() {
   
    }

    public Pessoa(String nome_comp, String email, String endereco, String bairro, String cidade, Date dt_nascimento, String cep, String celular, String complemento, String estado) {
        this.nome_comp = nome_comp;
        this.email = email;
        this.endereco = endereco;
        this.bairro = bairro;
        this.cidade = cidade;
        this.dt_nascimento = dt_nascimento;
        this.cep = cep;
        this.celular = celular;
        this.complemento = complemento;
        this.estado = estado;
    }

    public String getNome_comp() {
        return nome_comp;
    }

    public void setNome_comp(String nome_comp) {
        this.nome_comp = nome_comp;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public Date getDt_nascimento() {
        return dt_nascimento;
    }

    public void setDt_nascimento(Date dt_nascimento) {
        this.dt_nascimento = dt_nascimento;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    
        
}
