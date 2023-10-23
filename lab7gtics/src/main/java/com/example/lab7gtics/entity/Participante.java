package com.example.lab7gtics.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "participante")
@Getter
@Setter
public class Participante {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idparticipante", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "equipo", nullable = false)
    private Equipo equipo;

    @Column(name = "carrera", nullable = false)
    private String carrera;

    @Column(name = "codigo", nullable = false)
    private BigDecimal codigo;

    @Column(name = "tipoParticipante", nullable = false)
    private String tipoParticipante;
}
