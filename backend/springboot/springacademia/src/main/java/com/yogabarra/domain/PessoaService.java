package com.yogabarra.domain;

import com.yogabarra.dto.PessoaDTO;
import org.hibernate.ObjectNotFoundException;
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

    public PessoaDTO getPessoaById(Long id) {
        Optional<Pessoa> pessoa = rep.findById(id);

        return pessoa.map(PessoaDTO::create).orElseThrow(() -> new ObjectNotFoundException("Pessoa não encontrada"));
    }

    public PessoaDTO insert(Pessoa pessoa) {
        Assert.isTrue(pessoa.getCodigopess() == 0, "Falha ao inserir registro.");
        return PessoaDTO.create(rep.save(pessoa));
    }

    public PessoaDTO update(Pessoa pessoa, Long codigopess) {
        Assert.notNull(codigopess, "É necessário informar codigopess");

        Optional<Pessoa> optional = getPessoaById(codigopess);

        if(optional.isPresent()){
            Pessoa db = optional.get();
            //Copiar as propriedades
            db.setNomepess(pessoa.getNomepess());
            System.out.println("Codigopess:" + db.getCodigopess()); // exemplo de print

            rep.save(db);

            return PessoaDTO.create(db);
        }else{
            return null;
        }
    }

    public void delete(Long codigopess) {
        rep.deleteById(codigopess);
    }

    public List<PessoaDTO> getPessoaByNomepess(String nomepess) {
        return rep.findBynomepess(nomepess).stream().map(PessoaDTO::create).collect(Collectors.toList());
    }
}
