package com.yogabarra.domain;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface Pessoa_pessRepository extends CrudRepository<Pessoa_pess, Long> {

  @Query(value="select * from pessoa_pess pess where position(uPPER(:nome_pess) in uPPER(nome_pess)) > 0",nativeQuery=true)
  List<Pessoa_pess> findBynome_pess(@RequestParam("nome_pess")String nome_pess);
}
