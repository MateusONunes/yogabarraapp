package com.yogabarra.domain;

import org.springframework.data.repository.CrudRepository;

public interface Pessoa_pessRepository extends CrudRepository<Pessoa_pess, Long> {

//  @Query(value="select * from pessoa_pess pess where upper(nome_pess)  = :nome_pess",nativeQuery=true)
//  @Query(value="select * from pessoa_pess pess where codigo_pess = :nome_pess",nativeQuery=true)
  Iterable<Pessoa_pess> findBynome_pess(String nome_pess);
}
