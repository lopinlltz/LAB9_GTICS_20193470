package com.example.lab7gtics.entity;

import jakarta.persistence.*;
import jakarta.persistence.criteria.CriteriaBuilder;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "partido")
@Getter
@Setter
public class Partido {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idpartido", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "equipoA", nullable = false)
    private Equipo equipoA;

    @ManyToOne
    @JoinColumn(name = "equipoB", nullable = false)
    private Equipo equipoB;

    @Column(name = "scoreA", nullable = false)
    private Integer scoreA;

    @Column(name = "scoreB", nullable = false)
    private Integer scoreB;
}
