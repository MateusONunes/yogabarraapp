package com.yogabarra.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity(name="pessoa")
@Data
public class Pessoa {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "genpessoa_codigopess")
    private long codigopess;

    @Column(name="nomepess")
    private String nomepess;
    private String apelidopess;

    private Date nascimentopess;
    private String enderecopess;
    private String cpfpess;
    private String rgpess;
    private String cidadepess;
    private String fonewpess;
    private String fone2pess;
    private String fone3pess;
    private String emailpess;
    private String observacoespess;

    public Pessoa() {}

    public Pessoa(long codigopess, String nomepess) {
        this.codigopess = codigopess;
        this.nomepess = nomepess;
    }
}
