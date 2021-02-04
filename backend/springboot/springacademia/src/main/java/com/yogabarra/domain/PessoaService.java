package com.yogabarra.domain;

import com.yogabarra.dto.PessoaDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class PessoaService {

    @Autowired
    private PessoaRepository rep;

    public List<PessoaDTO> getPessoa(){
        return rep.findAll().stream().map(PessoaDTO::create).collect(Collectors.toList());

//        //**Maneira 1
//        List <PessoaDTO> listpessoasDTO = new ArrayList<>();
//
//        for (Pessoa p:pessoas){
//            listpessoasDTO.add(new PessoaDTO(p));
//        }
//        return listpessoasDTO;
    }

    public List<Pessoa> getPessoaFake(){
        List<Pessoa> listpessoa = new ArrayList<>();

        listpessoa.add(new Pessoa(1L, "Ana Paula"));
        listpessoa.add(new Pessoa(2L, "Mateus Nunes"));

        return listpessoa;
    }

    public Optional<Pessoa> getPessoaById(Long id) {
        return rep.findById(id);
    }

    public PessoaDTO insert(Pessoa pessoa) {
        Assert.isTrue(pessoa.getCodigopess() == 0, "Falha ao inserir registro.");
        return PessoaDTO.create(rep.save(pessoa));
    }

    public Pessoa update(Pessoa pessoa, Long codigopess) {
        Assert.notNull(codigopess, "É necessário informar codigopess");

        Optional<Pessoa> optional = getPessoaById(codigopess);

        if(optional.isPresent()){
            Pessoa db = optional.get();
            //Copiar as propriedades
            db.setNomepess(pessoa.getNomepess());
            System.out.println("Codigopess:" + db.getCodigopess()); // exemplo de print

            rep.save(db);

            return db;
        }else{
            throw new RuntimeException("Não foi possível atualizar o registro");
        }
    }

    public void delete(Long codigopess) {
        Optional<Pessoa> pessoa = getPessoaById(codigopess);

        if(pessoa.isPresent()){
            rep.deleteById(codigopess);
        } else {
            throw new RuntimeException("Pessoa não encontrada");
        }
    }

    public List<PessoaDTO> getPessoaByNomepess(String nomepess) {
        return rep.findBynomepess(nomepess).stream().map(PessoaDTO::create).collect(Collectors.toList());
    }
}
