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
    public Optional<Pessoa_pess> get(@PathVariable("id") Long id){
        return service.getPessoa_pessById(id);
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
