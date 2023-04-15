package com.agenda.agendacontatos.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.agenda.agendacontatos.model.*;
import com.agenda.agendacontatos.repository.*;
import com.agenda.agendacontatos.service.*;

@RestController
@CrossOrigin(origins = "*")
public class Agenda {

    @Autowired
    DaoContato daoContato;

    @Autowired
    AgendaService agendaService;

    @RequestMapping(value = "getallcontatos", method = RequestMethod.GET)
    public List<Contato> getAllContatos() {
        return agendaService.getAllContatos();
    }

    @RequestMapping(value = "addcontato", method = RequestMethod.POST)
    public String addEmployee(@RequestBody Contato contato) {
        return agendaService.addContato(contato);
    }

    @RequestMapping(value = "updatecontato", method = RequestMethod.PUT)
    public String updateEmployee(@RequestBody Contato contato) {
        return agendaService.updateContato(contato);
    }

    @RequestMapping(value = "deletecontato", method = RequestMethod.DELETE)
    public String removeEmployee(@RequestBody Contato contato) {
        return agendaService.removeContato(contato);
    }
}