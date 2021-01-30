package com.yogabarra.domain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

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

    public Pessoa_pess update(Pessoa_pess pessoa_pess, Long codigo_pess) {
        Assert.notNull(codigo_pess, "É necessário informar codigo_pess");

        Optional<Pessoa_pess> optional = getPessoa_pessById(codigo_pess);

        if(optional.isPresent()){
            Pessoa_pess db = optional.get();
            //Copiar as propriedades
            db.setNome(pessoa_pess.getnome_pess());
            System.out.println("Codigo_pess:" + db.getcodigo_pess());

            rep.save(db);

            return db;
        }else{
            throw new RuntimeException("Não foi possível atualizar o registro");
        }
    }

    public void delete(Long codigo_pess) {
        Optional<Pessoa_pess> pessoa_pess = getPessoa_pessById(codigo_pess);

        if(pessoa_pess.isPresent()){
            rep.deleteById(codigo_pess);
        } else {
            throw new RuntimeException("Pessoa não encontrada");
        }
    }
}
