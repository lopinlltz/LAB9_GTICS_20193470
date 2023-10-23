package com.example.lab7gtics.controller;

import com.example.lab7gtics.entity.Deporte;
import com.example.lab7gtics.entity.Participante;
import com.example.lab7gtics.repository.DeporteRepository;
import com.example.lab7gtics.repository.ParticipanteRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/sdci")
public class DeporteController {

    final DeporteRepository deporteRepository;
    public DeporteController(DeporteRepository deporteRepository) {
        this.deporteRepository = deporteRepository;
    }

    @GetMapping(value = "/deporte/lista")
    public List<Deporte> listarDeportes() {
        return deporteRepository.findAll();
    }

    @PostMapping(value = "/deporte/registro")
    public ResponseEntity<HashMap<String, Object>> guardarDeporte(
            @RequestBody Deporte deporte,
            @RequestParam(value = "fetchId", required = false) boolean fetchId) {

        HashMap<String, Object> responseJson = new HashMap<>();

        deporteRepository.save(deporte);
        if (fetchId) {
            responseJson.put("id", deporte.getId());
        }
        responseJson.put("estado", "creado");
        return ResponseEntity.status(HttpStatus.CREATED).body(responseJson);
    }
}
