package com.example.lab7gtics.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "deporte")
@Getter
@Setter
public class Deporte {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "iddeporte", nullable = false)
    private Integer id;

    @Column(name = "nombreDeporte", nullable = false)
    private String nombredeporte;

    @Column(name = "pesoDeporte", nullable = false)
    private Integer pesodeporte;

}
