package com.example.lab7gtics.repository;

import com.example.lab7gtics.entity.Partido;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PartidoRepository extends JpaRepository<Partido,Integer> {
}
