package com.agenda.agendacontatos.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.agenda.agendacontatos.model.Contato;

public interface DaoContato extends JpaRepository<Contato, String> {
}
