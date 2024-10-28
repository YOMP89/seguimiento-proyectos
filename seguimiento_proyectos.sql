CREATE DATABASE SeguimientoProyectos;
USE SeguimientoProyectos;

-- Tabla de Empleados
CREATE TABLE Empleados (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(50),
    fecha_contratacion DATE
);

-- Tabla de Proyectos
CREATE TABLE Proyectos (
    proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Tabla de Tareas
CREATE TABLE Tareas (
    tarea_id INT PRIMARY KEY AUTO_INCREMENT,
    proyecto_id INT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    fecha_asignacion DATE,
    fecha_entrega DATE,
    estado VARCHAR(20) DEFAULT 'Pendiente',  -- Pendiente, En progreso, Completada
    FOREIGN KEY (proyecto_id) REFERENCES Proyectos(proyecto_id)
);

-- Tabla de Horas Trabajadas
CREATE TABLE HorasTrabajadas (
    registro_id INT PRIMARY KEY AUTO_INCREMENT,
    tarea_id INT,
    empleado_id INT,
    fecha DATE,
    horas INT,
    FOREIGN KEY (tarea_id) REFERENCES Tareas(tarea_id),
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id)
);
