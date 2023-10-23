package com.example.lab7gtics.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "equipo")
@Getter
@Setter
public class Equipo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idequipo", nullable = false)
    private Integer id;

    @Column(name = "nombreEquipo", nullable = false)
    private String nombreequipo;

    @Column(name = "colorEquipo", nullable = false)
    private String colorEquipo;

    @Column(name = "mascota", nullable = false)
    private String mascota;
}
