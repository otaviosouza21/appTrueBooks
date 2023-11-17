package com.aplicacaomodelo.domain;

public class Livro extends EntidadeDominio{
    
    private String titulo;
    private String autor;
    private String descricao;
    private double tb_padrao;
    private double tb_promocao;
    private int quantidade;

    public Livro() {
        
    }

    public Livro(String titulo, String autor, String descricao, double tb_padrao, double tb_promocao, int quantidade) {
        this.titulo = titulo;
        this.autor = autor;
        this.descricao = descricao;
        this.tb_padrao = tb_padrao;
        this.tb_promocao = tb_promocao;
        this.quantidade = quantidade;
       
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getTb_padrao() {
        return tb_padrao;
    }

    public void setTb_padrao(double tb_padrao) {
        this.tb_padrao = tb_padrao;
    }

    public double getTb_promocao() {
        return tb_promocao;
    }

    public void setTb_promocao(double tb_promocao) {
        this.tb_promocao = tb_promocao;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
 
}
