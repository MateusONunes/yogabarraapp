package com.yogabarra.domain;

import javax.persistence.*;

@Entity(name="pessoa_pess")
public class Pessoa_pess {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo_pess;

    @Column(name="nome_pess")
    private String nome_pess;

    public Pessoa_pess(){

    }

    public Pessoa_pess(long codigo_pess, String nome_pess) {
        this.codigo_pess = codigo_pess;
        this.nome_pess = nome_pess;
    }

    public long getcodigo_pess() {
        return codigo_pess;
    }

    public void setcodigo_pess(long codigo_pess) {
        this.codigo_pess = codigo_pess;
    }

    public String getnome_pess() {
        return nome_pess;
    }

    public void setNome(String nome_pess) {
        this.nome_pess = nome_pess;
    }
}
