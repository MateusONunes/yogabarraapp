package com.yogabarra.domain;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class Pessoa_pessService {

    public List<Pessoa_pess> getPessoa_pess(){
        List<Pessoa_pess> listpessoa_pess = new ArrayList<>();

        listpessoa_pess.add(new Pessoa_pess(1L, "Ana Paula"));
        listpessoa_pess.add(new Pessoa_pess(2L, "Mateus Nunes"));

        return listpessoa_pess;
    }
}
