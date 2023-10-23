package com.example.lab7gtics.entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "historialpartidos")
@Getter
@Setter
public class HistorialPartidos {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idhistorialPartidos", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "partido_idpartido", nullable = false)
    private Partido partido;

    @ManyToOne
    @JoinColumn(name = "deporte_iddeporte", nullable = true)
    private Deporte deporte;

    @Column(name = "horaFecha", nullable = true)
    private LocalDateTime horaFecha;
}
