package com.example.lab7gtics.entity;

import jakarta.persistence.*;
import jakarta.servlet.http.Part;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "participantespartido")
@Getter
@Setter
public class ParticipantesPartido {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idparticipantesPartido", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "partido_idpartido", nullable = false)
    private Partido partido;

    @ManyToOne
    @JoinColumn(name = "participante_idparticipante", nullable = false)
    private Participante participante;

    @Column(name = "horaFecha", nullable = false)
    private LocalDateTime horafecha;
}
