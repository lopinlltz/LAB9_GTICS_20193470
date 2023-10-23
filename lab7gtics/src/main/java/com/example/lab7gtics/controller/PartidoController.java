package com.example.lab7gtics.controller;

import com.example.lab7gtics.entity.Equipo;
import com.example.lab7gtics.entity.HistorialPartidos;
import com.example.lab7gtics.entity.ParticipantesPartido;
import com.example.lab7gtics.entity.Partido;
import com.example.lab7gtics.repository.EquipoRepository;
import com.example.lab7gtics.repository.HistorialPartidosRepository;
import com.example.lab7gtics.repository.ParticipantesPartidoRepository;
import com.example.lab7gtics.repository.PartidoRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/sdci/partido")
public class PartidoController {
    final PartidoRepository partidoRepository;
    final EquipoRepository equipoRepository;
    final ParticipantesPartidoRepository participantesPartidoRepository;
    final HistorialPartidosRepository historialPartidosRepository;
    public PartidoController(PartidoRepository partidoRepository, EquipoRepository equipoRepository, HistorialPartidosRepository historialPartidosRepository, ParticipantesPartidoRepository participantesPartidoRepository) {
        this.partidoRepository = partidoRepository;
        this.equipoRepository = equipoRepository;
        this.historialPartidosRepository = historialPartidosRepository;
        this.participantesPartidoRepository = participantesPartidoRepository;
    }

    @GetMapping("/lista")
    public List<Partido> listarPartidos() {
        List<Partido> partidos = partidoRepository.findAll();
        return partidos;
    }
    @PostMapping("/registro")
    public ResponseEntity<HashMap<String, Object>> registrarPartido(@RequestBody Partido partido) {
        HashMap<String, Object> responseJson = new HashMap<>();
        Partido nuevoPartido = partidoRepository.save(partido);

        HistorialPartidos historialPartidos = new HistorialPartidos();
        historialPartidos.setPartido(nuevoPartido);
        historialPartidos.setDeporte(null); 
        historialPartidos.setHoraFecha(null);
        historialPartidosRepository.save(historialPartidos);

        responseJson.put("estado", "creado");
        return ResponseEntity.status(HttpStatus.CREATED).body(responseJson);
    }

    @GetMapping("/getparticipantes")
    public List<ParticipantesPartido> listarParticipantes() {
        List<ParticipantesPartido> participantesPartidos = participantesPartidoRepository.findAll();
        return participantesPartidos;
    }

    @GetMapping("/gethistorialpartidos")
    public List<HistorialPartidos> listarHistorialPartidos() {
        List<HistorialPartidos> historialPartidos = historialPartidosRepository.findAll();
        return historialPartidos;
    }
}
