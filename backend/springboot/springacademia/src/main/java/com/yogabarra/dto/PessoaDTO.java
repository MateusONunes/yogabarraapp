package com.yogabarra.dto;

import com.yogabarra.domain.Pessoa;
import lombok.Data;
import org.modelmapper.ModelMapper;

@Data
public class PessoaDTO {

  private long codigopess;
  private String nomepess;

  public static PessoaDTO create(Pessoa pessoa){
    ModelMapper modelMapper = new ModelMapper();
    return modelMapper.map(pessoa, PessoaDTO.class);
  }
}

