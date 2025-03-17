use universidad;
insert into personas (idpersona, nombre, apellido, rut) VALUES
(1,'Angel','mena',123),
(2, 'Marío', 'Gomez', '234'),
(3, 'Yan', 'Ramos', '345'),
(4, 'Elis', 'jimenez', '456'),
(5, 'Carlos', 'ochoa', '567'),
(6, 'Sorle', 'Orosco', '678'),
(7, 'Juan', 'yan', '789'),
(8, 'Mara', 'Fernández', '890'),
(9, 'Debora', 'Miranda', '901'),
(10, 'Carolina', 'Arteaga', '012'),
(11, 'Angelica', 'peña', '112'),
(12, 'Elena', 'Vanz', '212'),
(13, 'Luisa', 'Angel', '312'),
(14, 'Jesus', 'Sanchez', '412'),
(15, 'Yeico', 'Paternina', '512'),
(16, 'Valeria', 'Sierra', '612'),
(17, 'Fernando', 'Varilla', '712'),
(18, 'Patricia', 'Iglesias', '812'),
(19, 'Manuel', 'Espinoza', '912'),
(20, 'Daniela', 'Ríos', '013'),
(21, 'César', 'Pineda', '113'),
(22, 'Gabriela', 'Díaz', '213'),
(23, 'Roberto', 'Ruiz', '313'),
(24, 'Isabel', 'Torres', '413'),
(25, 'Álvaro', 'Rojas', '513'),
(26, 'Victoria', 'Muñoz', '613'),
(27, 'Sebas', 'Portacio', '713'),
(28, 'Claudia', 'Yanes', '813'),
(29, 'Marlon', 'Lindo', '913'),
(30, 'Leticia', 'Montes', '014'),
(31, 'Ana', 'Ramírez', '3145678921'),
(32, 'Luis', 'Fernández', '3145678932'),
(33, 'Pedro', 'García', '3145678943'),
(34, 'Sofía', 'Hernández', '3145678954'),
(35, 'Miguel', 'Jiménez', '3145678965'),
(36, 'Carmen', 'López', '3145678976'),
(37, 'Javier', 'Martínez', '3145678987'),
(38, 'Laura', 'Muñoz', '3145678998'),
(39, 'David', 'Pérez', '3145679009'),
(40, 'María', 'Rodríguez', '3145679010'),
(41, 'Alberto', 'Sánchez', '3145679021'),
(42, 'Elena', 'Torres', '3145679032'),
(43, 'Ricardo', 'Vázquez', '3145679043'),
(44, 'Patricia', 'Gómez', '3145679054'),
(45, 'Óscar', 'Ruiz', '3145679065'),
(46, 'Mónica', 'Morales', '3145679076'),
(47, 'Antonio', 'Díaz', '3145679087'),
(48, 'Cristina', 'Gil', '3145679098'),
(49, 'Francisco', 'Álvarez', '3145679109'),
(50, 'Raquel', 'Ramírez', '3145679110'),
(51, 'José', 'Jiménez', '3145679121'),
(52, 'Beatriz', 'Serrano', '3145679132'),
(53, 'Tomás', 'López', '3145679143'),
(54, 'Sandra', 'Rodríguez', '3145679154'),
(55, 'Juan', 'Vega', '3145679165'),
(56, 'Valeria', 'Gutiérrez', '3145679176'),
(57, 'Ricardo', 'Martínez', '3145679187'),
(58, 'Violeta', 'Sánchez', '3145679198'),
(59, 'Héctor', 'Ortiz', '3145679209'),
(60, 'Isabel', 'Torres', '3145679210');




INSERT INTO alumnos (idalumno, idpersona, carrera, facultad) VALUES
(1, 1, 'Ingeniería Mecratonica', 'Facultad de Ingeniería'),
(2, 2, 'Enfermeria', 'Facultad de Medicina'),
(3, 3, 'Derecho', 'Facultad de Derecho'),
(4, 4, 'Arquitectura', 'Facultad de Arquitectura'),
(5, 5, 'Econometria', 'Facultad de Ciencias Económicas'),
(6, 6, 'Sociales', 'Facultad de Ciencias Sociales'),
(7, 7, 'Fisica', 'Facultad de Ciencias Basicas'),
(8, 8, 'Química', 'Facultad de Ciencias Basicas'),
(9, 9, 'Etica', 'Facultad de Humanidades'),
(10, 10, 'Ingeniería electronica', 'Facultad de Ingeniería'),
(11, 11, 'Historia', 'Facultad de Humanidades'),
(12, 12, 'Sociología', 'Facultad de Ciencias Sociales'),
(13, 13, 'Ingeniería De Sistemas', 'Facultad de Ingeniería'),
(14, 14, 'Odontología', 'Facultad de Medicina'),
(15, 15, 'Ingeniería Mecánica', 'Facultad de Ingeniería'),
(16, 16, 'Licenciatura En Educación', 'Facultad de Ciencias de la Educación'),
(17, 17, 'Derecho', 'Facultad de Derecho'),
(18, 18, 'Periodismo', 'Facultad de Comunicación'),
(19, 19, 'Enfermeria', 'Facultad de Medicina'),
(20, 20, 'Matemáticas', 'Facultad de Ciencias Basicas'),
(21, 21, 'Física', 'Facultad de Ciencias Basicas'),
(22, 22, 'Ingeniería Ambiental', 'Facultad de Ingeniería'),
(23, 23, 'Antropología', 'Facultad de Ciencias Sociales'),
(24, 24, 'Literatura', 'Facultad de Humanidades'),
(25, 25, 'Ciencias Políticas', 'Facultad de Ciencias Sociales'),
(26, 26, 'Administración De Empresas', 'Facultad de Ciencias Económicas'),
(27, 27, 'Ingeniería nuclear', 'Facultad de Ingeniería'),
(28, 28, 'Dibujo', 'Facultad de Artes'),
(29, 29, 'Estadistica', 'Facultad de Ciencias Basicas'),
(30, 30, 'Matemáticas', 'Facultad de Ciencias Basicas'),
(31,26,'Ingeniería Ambiental', 'Facultad de Ingeniería'),
(32,1,'Ingeniería industrial', 'Facultad de Ingeniería'),
(33, 13, 'Matemáticas', 'Facultad de Ciencias Basicas'),
(34, 12, 'Fisica', 'Facultad de Ciencias Basicas'),
(35, 18, 'Derecho', 'Facultad de Derecho');



INSERT INTO docentes (iddocente, idpersona, tipocontrato) VALUES
(1, 31, 'Tiempo Completo'),
(2, 32, 'Medio Tiempo'),
(3, 33, 'Tiempo Parcial'),
(4, 34, 'Contratado'),
(5, 35, 'Tiempo Completo'),
(6, 36, 'Tiempo Parcial'),
(7, 37, 'Medio Tiempo'),
(8, 38, 'Tiempo Completo'),
(9, 39, 'Contratado'),
(10, 40, 'Tiempo Completo'),
(11, 41, 'Medio Tiempo'),
(12, 42, 'Tiempo Parcial'),
(13, 43, 'Tiempo Completo'),
(14, 44, 'Medio Tiempo'),
(15, 45, 'Contratado'),
(16, 46, 'Tiempo Completo'),
(17, 47, 'Tiempo Parcial'),
(18, 48, 'Contratado'),
(19, 49, 'Tiempo Completo'),
(20, 50, 'Medio Tiempo'),
(21, 51, 'Contratado'),
(22, 52, 'Tiempo Completo'),
(23, 53, 'Tiempo Parcial'),
(24, 54, 'Medio Tiempo'),
(25, 55, 'Tiempo Completo'),
(26, 56, 'Tiempo Parcial'),
(27, 57, 'Contratado'),
(28, 58, 'Tiempo Completo'),
(29, 59, 'Tiempo Parcial'),
(30, 60, 'Contratado');



INSERT INTO cursos (idcurso, iddocente, nombre_curso, horas) VALUES
(1, 1, 'Sofware', 40),
(2, 2, 'Derecho Constitucional', 50),
(3, 3, 'Microeconomía', 60),
(4, 4, 'Historia de la Arquitectura', 20),
(5, 5, 'Biología Molecular', 42),
(6, 6, 'Psicología Social', 20),
(7, 7, 'Inferencia estadistica', 60),
(8, 8, 'Química General', 25),
(9, 9, 'Filosofía Antigua', 35),
(10,10, 'Matemáticas Discretas', 60),
(11, 11, 'Teoría de la Música', 50),
(12, 12, 'Educación Física y Salud', 55),
(13, 13, 'Literatura Inglesa', 60),
(14, 14, 'Física Cuántica', 50),
(15, 15, 'Derecho Penal Internacional', 55),
(16, 16, 'Arte Contemporáneo', 30),
(17, 17, 'Ciencias Políticas Comparadas', 65),
(18, 18, 'Antropología Cultural', 35),
(19, 19, 'Ingeniería de Software', 25),
(20, 20, 'Medicina Veterinaria General', 70),
(21, 21, 'Farmacología', 40),
(22, 22, 'Historiografía', 35),
(23, 23, 'Mecánica de Fluidos', 50),
(24, 24, 'Derecho Internacional', 30),
(25, 25, 'Neurociencia', 45),
(26, 26, 'Filosofía de la Ciencia', 40),
(27, 27, 'Tecnología y Sociedad', 25),
(28, 28, 'Biología de Campo', 65),
(29, 29, 'Arte Latinoamericano', 45),
(30, 30, 'Ingeniería Eléctrica Avanz',50),
(31, 14, 'Muestreo',50),
(32, 1, 'Programacion',50),
(33, 23, 'calculo 1 ',30),
(34, 14, 'fisica atmosferica',40),
(35, 3, 'economia basica',50);


INSERT INTO matricula (idmatricula, idalumno, grado, fecha) VALUES
(401, 1, '3er Año', '2024-01-10'),
(402, 2, '4do Año', '2024-01-15'),
(403, 3, '2er Año', '2024-02-05'),
(404, 4, '1er Año', '2024-02-20'),
(405, 5, '1to Año', '2024-03-10'),
(406, 6, '1do Año', '2024-03-25'),
(407, 7, '2er Año', '2024-04-15'),
(408, 8, '3er Año', '2024-05-01'),
(409, 9, '5to Año', '2024-05-15'),
(410, 10, '1do Año', '2024-06-01'),
(411, 11, '1er Año', '2024-06-15'),
(412, 12, '1er Año', '2024-07-01'),
(413, 13, '4to Año', '2024-07-15'),
(414, 14, '2do Año', '2024-08-01'),
(415, 15, '3er Año', '2024-08-15'),
(416, 16, '1er Año', '2024-09-01'),
(417, 17, '2do Año', '2024-09-15'),
(418, 18, '3er Año', '2024-10-01'),
(419, 19, '4to Año', '2024-10-15'),
(420, 20, '1er Año', '2024-11-01'),
(421, 21, '2do Año', '2024-11-15'),
(422, 22, '3er Año', '2024-12-01'),
(423, 23, '4to Año', '2024-12-15'),
(424, 24, '1er Año', '2025-01-01'),
(425, 25, '2do Año', '2025-01-15'),
(426, 26, '3er Año', '2025-02-01'),
(427, 27, '4to Año', '2025-02-15'),
(428, 28, '5er Año', '2025-03-01'),
(429, 29, '1do Año', '2025-03-15'),
(430, 30, '2er Año', '2025-04-01'),
(431, 31, '5er Año', '2025-07-01'),
(432, 32, '5er Año', '2025-07-01'),
(433, 33, '5er Año', '2025-07-01'),
(434, 34, '5er Año', '2025-07-01'),
(435, 35, '5er Año', '2025-07-01');


INSERT INTO cursos_alumnos (idcurso, idalumno, nota)
VALUES
(1, 1, 'Aprobado'),
(1, 2, 'No Aprobado'),
(2, 3, 'Aprobado'),
(2, 4, 'No Aprobado'),
(3, 5, 'Aprobado'),
(3, 6, 'No Aprobado'),
(4, 7, 'Aprobado'),
(4, 8, 'No Aprobado'),
(5, 9, 'Aprobado'),
(5, 10, 'No Aprobado'),
(6, 11, 'Aprobado'),
(6, 12, 'No Aprobado'),
(7, 13, 'Aprobado'),
(7, 14, 'No Aprobado'),
(8, 15, 'Aprobado'),
(8, 16, 'No Aprobado'),
(9, 17, 'Aprobado'),
(9, 18, 'No Aprobado'),
(10, 19, 'Aprobado'),
(10, 20, 'No Aprobado'),
(11, 21, 'Aprobado'),
(11, 22, 'No Aprobado'),
(12, 23, 'Aprobado'),
(12, 24, 'No Aprobado'),
(13, 25, 'Aprobado'),
(13, 26, 'No Aprobado'),
(14, 27, 'Aprobado'),
(14, 28, 'No Aprobado'),
(15, 29, 'Aprobado'),
(15, 30, 'No Aprobado'),
(16, 31, 'Aprobado'),
(16, 32, 'No Aprobado'),
(17, 33, 'Aprobado'),
(17, 34, 'No Aprobado'),
(18, 35, 'Aprobado'),
(18, 1, 'No Aprobado'),
(19, 2, 'Aprobado'),
(19, 3, 'No Aprobado'),
(20, 4, 'Aprobado'),
(20, 5, 'No Aprobado'),
(21, 6, 'Aprobado'),
(21, 7, 'No Aprobado'),
(22, 8, 'Aprobado'),
(22, 9, 'No Aprobado'),
(23, 10, 'Aprobado'),
(23, 11, 'No Aprobado'),
(24, 12, 'Aprobado'),
(24, 13, 'No Aprobado'),
(25, 14, 'Aprobado'),
(25, 15, 'No Aprobado'),
(26, 16, 'Aprobado'),
(26, 17, 'No Aprobado'),
(27, 18, 'Aprobado'),
(27, 19, 'No Aprobado'),
(28, 20, 'Aprobado'),
(28, 21, 'No Aprobado'),
(29, 22, 'Aprobado'),
(29, 23, 'No Aprobado'),
(30, 24, 'Aprobado'),
(30, 25, 'No Aprobado'),
(31, 26, 'Aprobado'),
(31, 27, 'No Aprobado'),
(32, 28, 'Aprobado'),
(32, 29, 'No Aprobado'),
(33, 30, 'Aprobado'),
(33, 31, 'No Aprobado'),
(34, 32, 'Aprobado'),
(34, 33, 'No Aprobado'),
(35, 34, 'Aprobado'),
(35, 35, 'No Aprobado');

-- CONSULTA PARA PERSONAS
SELECT * FROM personas; -- Mirar la tabla personas

SELECT nombre, apellido FROM personas; -- Mirar nombre y apellido de las personas

SELECT COUNT(*) AS total_personas FROM personas; -- Contar el numero de personas en la tabla


SELECT * FROM personas ORDER BY apellido ASC;  -- ordenar por orden alfabetico de acuerdo al apellido

SELECT * FROM personas WHERE nombre LIKE 'A%';  -- buscar personas por letra inicial con el filtro where 

SELECT * FROM personas WHERE idpersona = 30;    -- ver persona por id con el filtro where

-- CONSULTA PARA ALUMNOS ---
-- -- Consultar datos de alumno, usamos abreviatura a para alumnos para no escribir la palabra completa
-- -- obtener los nombres de los estudiantes y las carreras junto con sus apellidos de la tabla personas,usando JOIN así
SELECT a.idalumno, a.carrera, a.facultad, p.nombre, p.apellido FROM alumnos a 
JOIN personas p ON a.idpersona = p.idpersona;


-- contar alumnos por facultad--
SELECT a.facultad, COUNT(*) AS num_alumnos
FROM alumnos a
GROUP BY a.facultad;
  

# filtrar por facultad
SELECT * FROM alumnos WHERE facultad="Facultad de Ciencias Basicas";

# filtrar por facultad y que me muestre los nombres de los almunos que pertenecen a ella
SELECT  a.idalumno,a.carrera,a.facultad,p.nombre,p.apellido FROM alumnos a
JOIN personas p on a.idpersona=p.idpersona
WHERE facultad="Facultad de Ingeniería";

select* from alumnos;

-- actualizar la facultad de alumno
UPDATE alumnos
SET facultad = 'Facultad de robotica'
WHERE idalumno = 101;

--- eliminar un alumno
DELETE FROM alumnos
WHERE idalumno = 101;


SELECT p.idpersona,p.nombre,p.apellido,GROUP_CONCAT(a.carrera SEPARATOR ', ') carreras
FROM alumnos a
JOIN personas p ON a.idpersona = p.idpersona
GROUP BY p.idpersona, p.nombre, p.apellido
HAVING COUNT(a.carrera) > 1;



-- CONSULTAS DOCENTES--
SELECT * FROM docentes;

SELECT  d.iddocente,d.tipocontrato,p.nombre,p.apellido FROM docentes d
JOIN personas p on d.idpersona=p.idpersona;

SELECT * FROM docentes WHERE tipocontrato = 'contratado';

-- Listar todos los cursos impartidos por un docente específico
SELECT c.nombre_curso, c.horas
FROM cursos c
WHERE c.iddocente =14 ;

-- Buscar docentes y los cursos que imparten
SELECT p.nombre, p.apellido, c.nombre_curso
FROM docentes d
JOIN personas p ON d.idpersona = p.idpersona
JOIN cursos c ON d.iddocente = c.iddocente;

select tipocontrato, count(*) as sum from docentes
group by tipocontrato;


-- consulta por cursos 
select * from cursos;

SELECT * FROM cursos
WHERE nombre_curso LIKE '%Matemáticas%'; 

SELECT * FROM cursos
WHERE horas >= 50;


UPDATE cursos
SET nombre_curso = 'Nuevo Nombre del Curso'
WHERE idcurso = 1;  


SELECT * FROM cursos
WHERE idcurso = 23;

-- Consulta por matricula 
select*from matricula;
SELECT 
    p.nombre AS nombre_estudiante,
    p.apellido AS apellido_estudiante,
    m.grado AS grado,
    m.fecha AS fecha_matricula
FROM matricula m
JOIN alumnos a ON m.idalumno = a.idalumno
JOIN personas p ON a.idpersona = p.idpersona
ORDER BY 
m.fecha DESC;


SELECT 
    m.grado AS grado,
    m.fecha AS fecha_matricula
FROM 
    matricula m;
    
    
    SELECT 
    m.grado AS grado,
    m.fecha AS fecha_matricula
FROM 
    matricula m
WHERE 
    m.idalumno = 1;
    
    
    
-- CONSULTA CURSOS_ALUMNOS
-- Consultar todas las calificaciones de los estudiantes en cada curso

SELECT ca.idcurso, c.nombre_curso, ca.idalumno, p.nombre, p.apellido, ca.nota
FROM cursos_alumnos ca
JOIN alumnos a ON ca.idalumno = a.idalumno
JOIN personas p ON a.idpersona = p.idpersona
JOIN cursos c ON ca.idcurso = c.idcurso;




-- Consultar los cursos en los que un estudiante específico está inscrito (por ejemplo, con idalumno = 1)
SELECT c.idcurso, c.nombre_curso, ca.nota
FROM cursos_alumnos ca
JOIN cursos c ON ca.idcurso = c.idcurso
WHERE ca.idalumno = 1;

show profiles;