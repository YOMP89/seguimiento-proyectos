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

-- Insertando empleados
INSERT INTO Empleados (nombre, puesto, fecha_contratacion) VALUES 
('Ana Rodríguez', 'Gerente de Proyectos', '2020-01-15'),
('Carlos López', 'Desarrollador Web', '2022-02-10'),
('María García', 'Diseñadora Gráfica', '2021-05-20');

-- Insertando proyectos
INSERT INTO Proyectos (nombre, descripcion, fecha_inicio, fecha_fin) VALUES 
('Rediseño Sitio Web', 'Rediseño completo del sitio web corporativo', '2024-09-01', '2024-12-01'),
('Campaña de Marketing', 'Desarrollo de la nueva campaña de marketing', '2024-09-15', '2024-11-15');

-- Insertando tareas
INSERT INTO Tareas (proyecto_id, nombre, descripcion, fecha_asignacion, fecha_entrega, estado) VALUES 
(1, 'Diseño de la interfaz', 'Crear la nueva interfaz de usuario', '2024-09-05', '2024-09-30', 'En progreso'),
(1, 'Programación del sitio', 'Desarrollar el código para el nuevo diseño', '2024-09-20', '2024-10-20', 'Pendiente'),
(2, 'Diseño de gráficos', 'Crear los gráficos para la campaña', '2024-09-15', '2024-10-10', 'Pendiente');

-- Insertando horas trabajadas
INSERT INTO HorasTrabajadas (tarea_id, empleado_id, fecha, horas) VALUES 
(1, 3, '2024-09-07', 4),  -- María trabajó 4 horas en el diseño de la interfaz
(2, 2, '2024-09-21', 3),  -- Carlos trabajó 3 horas en la programación del sitio
(3, 3, '2024-09-16', 5);  -- María trabajó 5 horas en el diseño de gráficos
