package com.yogabarra.api;

import com.yogabarra.domain.Pessoa_pess;
import com.yogabarra.domain.Pessoa_pessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@RequestMapping("/pessoa_pess/get")
public class Pessoa_pessController {
    @Autowired

    private Pessoa_pessService service;

    @GetMapping()
    public Iterable<Pessoa_pess> get(){
        return service.getPessoa_pess();
    }

    @GetMapping("/{id}")
    public Optional<Pessoa_pess> get(@PathVariable("id") Long id){
        return service.getPessoa_pessById(id);
    }

}
