CREATE TABLE proyectos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dias_estimados INTEGER NOT NULL CHECK (dias_estimados > 0)
);

CREATE TABLE tecnologias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL
);

CREATE TABLE proyectos_tecnologias (
    id_proyecto INTEGER,
    id_tecnologia INTEGER,
    version VARCHAR(20),

    PRIMARY KEY(id_proyecto, id_tecnologia),

    FOREIGN KEY(id_proyecto)
        REFERENCES proyectos(id),

    FOREIGN KEY(id_tecnologia)
        REFERENCES tecnologias(id)
);

-- CONSULTA 1
-- Tecnologías utilizadas en un proyecto

SELECT t.nombre, t.categoria
FROM proyectos p
JOIN proyectos_tecnologias pt
ON p.id = pt.id_proyecto
JOIN tecnologias t
ON t.id = pt.id_tecnologia
WHERE p.nombre = 'Sistema Ventas';

-- CONSULTA 2
-- Proyectos por tecnología

SELECT p.nombre, p.dias_estimados, pt.version
FROM proyectos p
JOIN proyectos_tecnologias pt
ON p.id = pt.id_proyecto
WHERE pt.id_tecnologia = 1;

-- CONSULTA 3
-- Reporte de uso tecnológico

SELECT t.nombre, COUNT(pt.id_proyecto) AS total_proyectos
FROM tecnologias t
JOIN proyectos_tecnologias pt
ON t.id = pt.id_tecnologia
GROUP BY t.nombre
ORDER BY total_proyectos DESC;