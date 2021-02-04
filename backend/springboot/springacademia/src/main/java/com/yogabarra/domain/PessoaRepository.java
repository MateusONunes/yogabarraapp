package com.yogabarra.domain;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface PessoaRepository extends JpaRepository<Pessoa, Long> {

  @Query(value="select * from pessoa pess where position(uPPER(:nomepess) in uPPER(nomepess)) > 0",nativeQuery=true)
  List<Pessoa> findBynomepess(@RequestParam("nomepess")String nomepess);
}