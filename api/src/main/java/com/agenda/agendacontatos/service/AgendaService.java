package com.agenda.agendacontatos.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.agenda.agendacontatos.model.*;
import com.agenda.agendacontatos.repository.*;

@Service
public class AgendaService {

    @Autowired
    DaoContato daoContato;

    public List<Contato> getAllContatos() {

        try {
            List<Contato> contatos = daoContato.findAll();
            List<Contato> contatos2 = new ArrayList<>();
            contatos.stream().forEach(e -> {
                Contato employee = new Contato();
                BeanUtils.copyProperties(e, employee);
                contatos2.add(employee);
            });
            return contatos2;
        } catch (Exception e) {
            throw e;
        }
    }

    public String addContato(Contato contato) {
        try {
            if (!daoContato.existsById(contato.getEmail())) {
                daoContato.save(contato);
                return "Contato cadastrado com sucesso!";
            } else {
                return "Esse contato já existe.";
            }
        } catch (Exception e) {
            throw e;
        }
    }

    public String removeContato(Contato contato) {
        try {
            if (!daoContato.existsById(contato.getEmail())) {
                daoContato.delete(contato);
                return "Contato deletado com sucesso!";
            } else {
                return "Esse contato não existe.";
            }
        } catch (Exception e) {
            throw e;
        }
    }

    public String updateContato(Contato contato) {
        try {
            if (daoContato.existsById(contato.getEmail())) {
                daoContato.save(contato);
                return "Contato atualizado com sucesso!";
            } else {
                return "Esse contato não existe.";
            }
        } catch (Exception e) {
            throw e;
        }
    }
}