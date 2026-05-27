package com.krakedev.examen.vuelos.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.krakedev.examen.vuelos.entities.Vuelo;
import com.krakedev.examen.vuelos.services.VueloService;

@RestController
@RequestMapping("/api/vuelos")
public class VueloController {

    @Autowired
    private VueloService service;

    @PostMapping
    public ResponseEntity<?> insertar(@RequestBody Vuelo vuelo) {

        try {

            Vuelo nuevo = service.guardar(vuelo);

            return new ResponseEntity<>(nuevo, HttpStatus.CREATED);

        } catch (Exception e) {

            return new ResponseEntity<>(
                    e.getMessage(),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping
    public ResponseEntity<?> listar() {

        try {

            List<Vuelo> vuelos = service.listar();

            return new ResponseEntity<>(vuelos, HttpStatus.OK);

        } catch (Exception e) {

            return new ResponseEntity<>(
                    e.getMessage(),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> buscar(@PathVariable Integer id) {

        try {

            Optional<Vuelo> vuelo = service.buscar(id);

            if(vuelo.isPresent()) {
                return new ResponseEntity<>(vuelo.get(), HttpStatus.OK);
            }

            return new ResponseEntity<>(
                    "Vuelo no encontrado",
                    HttpStatus.NOT_FOUND);

        } catch (Exception e) {

            return new ResponseEntity<>(
                    e.getMessage(),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> actualizar(
            @PathVariable Integer id,
            @RequestBody Vuelo vuelo) {

        try {

            Vuelo actualizado = service.actualizar(id, vuelo);

            if(actualizado != null) {
                return new ResponseEntity<>(actualizado, HttpStatus.OK);
            }

            return new ResponseEntity<>(
                    "Vuelo no encontrado",
                    HttpStatus.NOT_FOUND);

        } catch (Exception e) {

            return new ResponseEntity<>(
                    e.getMessage(),
                    HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminar(@PathVariable Integer id) {

        try {

            boolean eliminado = service.eliminar(id);

            if(eliminado) {
                return new ResponseEntity<>(
                        "Vuelo eliminado",
                        HttpStatus.OK);
            }

            return new ResponseEntity<>(
                    "Vuelo no encontrado",
                    HttpStatus.NOT_FOUND);

        } catch (Exception e) {

            return new ResponseEntity<>(
                    e.getMessage(),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}