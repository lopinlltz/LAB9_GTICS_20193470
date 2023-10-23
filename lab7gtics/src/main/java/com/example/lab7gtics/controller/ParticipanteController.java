package com.example.lab7gtics.controller;

import com.example.lab7gtics.entity.Equipo;
import com.example.lab7gtics.entity.Participante;
import com.example.lab7gtics.repository.EquipoRepository;
import com.example.lab7gtics.repository.ParticipanteRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/sdci")
public class ParticipanteController {

    final ParticipanteRepository participanteRepository;
    public ParticipanteController(ParticipanteRepository participanteRepository) {
        this.participanteRepository = participanteRepository;
    }

    @GetMapping(value = "/participante/lista")
    public List<Participante> listarParticipantes() {
        return participanteRepository.findAll();
    }

    @PostMapping(value = "/participante/registro")
    public ResponseEntity<HashMap<String, Object>> guardarParticipante(
            @RequestBody Participante participante,
            @RequestParam(value = "fetchId", required = false) boolean fetchId) {

        HashMap<String, Object> responseJson = new HashMap<>();

        participanteRepository.save(participante);
        if (fetchId) {
            responseJson.put("id", participante.getId());
        }
        responseJson.put("estado", "creado");
        return ResponseEntity.status(HttpStatus.CREATED).body(responseJson);
    }
}
