create database Universidad;
use universidad;

create table personas (
idpersona int primary key,
nombre varchar(15),
apellido varchar(15),
rut varchar(30));

create table alumnos (
idalumno int primary key,
idpersona int,
carrera varchar(35),
facultad varchar(35),
foreign key (idpersona) references personas(idpersona));

create table  docentes (
    iddocente int primary key,
    idpersona int,
    tipocontrato varchar(20) NOT NULL,
    foreign key (idpersona) references personas(idpersona)
);

create table  cursos (
    idcurso int primary key,
    iddocente int,
    nombre_curso varchar(50) UNIQUE NOT NULL,
    horas int,
    foreign key (iddocente) references docentes(iddocente)
);

create table  cursos_alumnos (
    idcurso int,
    idalumno int , 
    nota varchar(20),
    primary key  (idcurso, idalumno),
    foreign key (idcurso) references cursos(idcurso),
    foreign key (idalumno) references alumnos(idalumno)
);

create table matricula (
idmatricula int primary key,
idalumno int,
grado varchar(30),
fecha date,
foreign key (idalumno) references alumnos(idalumno) )






