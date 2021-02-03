package com.yogabarra.domain;

import javax.persistence.*;

@Entity(name="pessoa")
public class Pessoa {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "genpessoa_codigopess")
    private long codigopess;

    @Column(name="nomepess")
    private String nomepess;

    public Pessoa(){

    }

    public Pessoa(long codigopess, String nomepess) {
        this.codigopess = codigopess;
        this.nomepess = nomepess;
    }

    public long getcodigopess() {
        return codigopess;
    }

    public void setcodigopess(long codigopess) {
        this.codigopess = codigopess;
    }

    public String getnomepess() {
        return nomepess;
    }

    public void setNome(String nomepess) {
        this.nomepess = nomepess;
    }
}
