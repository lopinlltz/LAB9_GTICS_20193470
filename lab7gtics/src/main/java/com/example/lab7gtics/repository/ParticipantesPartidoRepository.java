package com.example.lab7gtics.repository;

import com.example.lab7gtics.entity.ParticipantesPartido;
import jakarta.persistence.criteria.CriteriaBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ParticipantesPartidoRepository extends JpaRepository<ParticipantesPartido, Integer> {
}
