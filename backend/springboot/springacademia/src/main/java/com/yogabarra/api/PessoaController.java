package com.yogabarra.api;

import com.yogabarra.domain.Pessoa;
import com.yogabarra.domain.PessoaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/pessoa")
public class PessoaController {
    @Autowired

    private PessoaService service;

    @GetMapping()
    public ResponseEntity<Iterable<Pessoa>> get(){
        return ResponseEntity.ok(service.getPessoa());
//        return new ResponseEntity<>(service.getPessoa(), HttpStatus.OK); //Mesmo que a olinha anterior
    }

    @GetMapping("/{id}")
    public ResponseEntity get(@PathVariable("id") Long id){
        Optional<Pessoa> pessoa = service.getPessoaById(id);

        return pessoa.map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build()); // Mesmo que a linha de baixof

//        return pessoa.map(c -> ResponseEntity.ok(c)).orElse(ResponseEntity.notFound().build());

//        Maneira 2 - if ternário
//        return pessoa.isPresent() ?
//                ResponseEntity.ok(pessoa.get()) :
//                ResponseEntity.notFound().build();

//        Maneira 1: O Código abaixo faz o mesmo que a linha anterior(Maneira 2).
//        if (pessoa.isPresent()){
//            return ResponseEntity.ok(pessoa.get());
//        } else {
//            return ResponseEntity.notFound().build();
//        }

    }

    @GetMapping("/nomepess/{nomepess}")
    public ResponseEntity getPessoaByNomepess(@PathVariable("nomepess") String nomepess){
        List<Pessoa> listPessoa =  service.getPessoaByNomepess(nomepess);

        return listPessoa.isEmpty() ?
                ResponseEntity.noContent().build() :
                ResponseEntity.ok(listPessoa);
    }

    @PostMapping()
    public String post(@RequestBody Pessoa pessoa){
        Pessoa pessoaSalva = service.insert(pessoa);

        return "Pessoa salva com código " + pessoaSalva.getcodigopess();
    }

    @PutMapping("/{codigopess}")
    public String post(@PathVariable("codigopess") Long codigopess, @RequestBody Pessoa pessoa){
        Pessoa pessoaSalva = service.update(pessoa, codigopess);

        return "Pessoa atualizada com sucesso: " + pessoaSalva.getcodigopess();
    }

    @DeleteMapping("/{codigopess}")
    public String delete(@PathVariable("codigopess") Long codigopess){
        service.delete(codigopess);

        return "Pessoa deletada com sucesso: ";
    }

}
