package com.yogabarra.api;

import com.yogabarra.domain.Pessoa_pess;
import com.yogabarra.domain.Pessoa_pessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/pessoa_pess")
public class Pessoa_pessController {
    @Autowired

    private Pessoa_pessService service;

    @GetMapping()
    public ResponseEntity<Iterable<Pessoa_pess>> get(){
        return ResponseEntity.ok(service.getPessoa_pess());
//        return new ResponseEntity<>(service.getPessoa_pess(), HttpStatus.OK); //Mesmo que a olinha anterior
    }

    @GetMapping("/{id}")
    public ResponseEntity get(@PathVariable("id") Long id){
        Optional<Pessoa_pess> pessoa_pess = service.getPessoa_pessById(id);

        return pessoa_pess.map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build()); // Mesmo que a linha de baixof

//        return pessoa_pess.map(c -> ResponseEntity.ok(c)).orElse(ResponseEntity.notFound().build());

//        Maneira 2 - if ternário
//        return pessoa_pess.isPresent() ?
//                ResponseEntity.ok(pessoa_pess.get()) :
//                ResponseEntity.notFound().build();

//        Maneira 1: O Código abaixo faz o mesmo que a linha anterior(Maneira 2).
//        if (pessoa_pess.isPresent()){
//            return ResponseEntity.ok(pessoa_pess.get());
//        } else {
//            return ResponseEntity.notFound().build();
//        }

    }

    @GetMapping("/nome_pess/{nome_pess}")
    public Iterable<Pessoa_pess> getPessoaByNome_pess(@PathVariable("nome_pess") String nome_pess){
        return service.getPessoa_pessByNome_pess(nome_pess);
    }

    @PostMapping()
    public String post(@RequestBody Pessoa_pess pessoa_pess){
        Pessoa_pess pessoa_pessSalva = service.insert(pessoa_pess);

        return "Pessoa salva com código " + pessoa_pessSalva.getcodigo_pess();
    }

    @PutMapping("/{codigo_pess}")
    public String post(@PathVariable("codigo_pess") Long codigo_pess, @RequestBody Pessoa_pess pessoa_pess){
        Pessoa_pess pessoa_pessSalva = service.update(pessoa_pess, codigo_pess);

        return "Pessoa atualizada com sucesso: " + pessoa_pessSalva.getcodigo_pess();
    }

    @DeleteMapping("/{codigo_pess}")
    public String delete(@PathVariable("codigo_pess") Long codigo_pess){
        service.delete(codigo_pess);

        return "Pessoa deletada com sucesso: ";
    }

}
