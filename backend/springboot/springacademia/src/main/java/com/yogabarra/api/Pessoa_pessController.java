package com.yogabarra.api;

import com.yogabarra.domain.Pessoa_pess;
import com.yogabarra.domain.Pessoa_pessService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/pessoa_pess/get")
public class Pessoa_pessController {

    private Pessoa_pessService service = new Pessoa_pessService();

    @GetMapping()
    public List<Pessoa_pess> get(){
        return service.getPessoa_pess();
    }

}
