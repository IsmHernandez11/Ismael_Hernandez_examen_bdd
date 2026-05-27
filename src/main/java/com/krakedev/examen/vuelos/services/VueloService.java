package com.krakedev.examen.vuelos.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.krakedev.examen.vuelos.entities.Vuelo;
import com.krakedev.examen.vuelos.repositories.VueloRepository;

@Service
public class VueloService {

    @Autowired
    private VueloRepository repo;

    public Vuelo guardar(Vuelo vuelo) {
        return repo.save(vuelo);
    }

    public List<Vuelo> listar() {
        return repo.findAll();
    }

    public Optional<Vuelo> buscar(Integer id) {
        return repo.findById(id);
    }

    public Vuelo actualizar(Integer id, Vuelo vuelo) {

        Vuelo vueloActual = repo.findById(id).orElse(null);

        if(vueloActual != null) {

            vueloActual.setCodigo(vuelo.getCodigo());
            vueloActual.setPrecioBoleto(vuelo.getPrecioBoleto());
            vueloActual.setAsientosDisponibles(vuelo.getAsientosDisponibles());

            return repo.save(vueloActual);
        }

        return null;
    }

    public boolean eliminar(Integer id) {

        if(repo.existsById(id)) {

            repo.deleteById(id);
            return true;
        }

        return false;
    }
}