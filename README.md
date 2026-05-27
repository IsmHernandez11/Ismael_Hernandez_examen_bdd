# Ismael\_Hernandez\_examen\_bdd

parte 3

En la Parte 3 se realizó una modificación al sistema para añadir el destino de los vuelos. Primero se alteró la tabla vuelos en PostgreSQL agregando la columna destino. Después se actualizó la entidad Vuelo.java incorporando el nuevo atributo con su respectivo mapeo JPA y sus métodos getter y setter. Finalmente se modificaron las peticiones en Postman para enviar el destino dentro del JSON y comprobar que la información se guarda correctamente en la base de datos.

parte 4

En la Parte 4 se creó una relación muchos a muchos entre proyectos y tecnologías usando la tabla intermedia proyectos\_tecnologias. Esta tabla contiene llaves foráneas y una llave primaria compuesta para evitar registros repetidos. También se realizaron consultas usando JOIN para obtener tecnologías por proyecto, proyectos por tecnología y un reporte del uso de tecnologías

