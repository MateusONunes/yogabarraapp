package com.yogabarra.dto;

import com.yogabarra.domain.Pessoa;
import lombok.Data;

@Data
public class PessoaDTO {

  private long codigopess;
  private String nomepess;

  public PessoaDTO(Pessoa pessoa){
    this.codigopess = pessoa.getCodigopess();
    this.nomepess = pessoa.getNomepess();
  }

}


