package com.yogabarra.api;

import com.yogabarra.domain.Pessoa;
import com.yogabarra.domain.PessoaService;
import com.yogabarra.dto.PessoaDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/pessoa")
public class PessoaController {
    @Autowired

    private PessoaService service;

    @GetMapping()
    public ResponseEntity<List<PessoaDTO>> get(){
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
        List<PessoaDTO> listPessoa =  service.getPessoaByNomepess(nomepess);

        return listPessoa.isEmpty() ?
                ResponseEntity.noContent().build() :
                ResponseEntity.ok(listPessoa);
    }

    @PostMapping()
    public ResponseEntity post(@RequestBody Pessoa pessoa){

        PessoaDTO pessoaSalva = service.insert(pessoa);

        URI location = getUri(pessoaSalva.getCodigopess());
        return ResponseEntity.created(location).build();
    }

    private URI getUri(Long id){
        return ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(id).toUri();
    }

    @PutMapping("/{codigopess}")
    public ResponseEntity post(@PathVariable("codigopess") Long codigopess, @RequestBody Pessoa pessoa){
        pessoa.setCodigopess(codigopess);

        PessoaDTO pessoaSalva = service.update(pessoa, codigopess);

        return pessoaSalva != null ?
                ResponseEntity.ok(pessoaSalva) :
                ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{codigopess}")
    public ResponseEntity delete(@PathVariable("codigopess") Long codigopess){
        service.delete(codigopess);
        return ResponseEntity.ok().build();
    }

}
