package com.yogabarra.dto;

import com.yogabarra.domain.Pessoa;

import org.modelmapper.ModelMapper;

import java.util.Date;

import lombok.Data;

@Data
public class PessoaDTO {

  private long codigopess;
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

  public static PessoaDTO create(Pessoa pessoa){
    ModelMapper modelMapper = new ModelMapper();
    return modelMapper.map(pessoa, PessoaDTO.class);
  }
}

