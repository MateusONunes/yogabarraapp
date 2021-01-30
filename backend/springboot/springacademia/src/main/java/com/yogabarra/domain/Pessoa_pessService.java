package com.yogabarra.domain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class Pessoa_pessService {

    @Autowired
    private Pessoa_pessRepository rep;

    public Iterable<Pessoa_pess> getPessoa_pess(){
        Iterable r = rep.findAll();
        return r;
    }

    public List<Pessoa_pess> getPessoa_pessFake(){
        List<Pessoa_pess> listpessoa_pess = new ArrayList<>();

        listpessoa_pess.add(new Pessoa_pess(1L, "Ana Paula"));
        listpessoa_pess.add(new Pessoa_pess(2L, "Mateus Nunes"));

        return listpessoa_pess;
    }

    public Optional<Pessoa_pess> getPessoa_pessById(Long id) {
        return rep.findById(id);
    }

    public Pessoa_pess insert(Pessoa_pess pessoa_pess) {
        return rep.save(pessoa_pess);
    }
}
