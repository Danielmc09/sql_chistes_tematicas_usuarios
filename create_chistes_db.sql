-- Crear tablas
CREATE TABLE Usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL
);

CREATE TABLE Tematicas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Chistes (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    cuerpo TEXT NOT NULL,
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES Usuarios(id)
);

CREATE TABLE Chistes_Tematicas (
    chiste_id INT,
    tematica_id INT,
    PRIMARY KEY (chiste_id, tematica_id),
    FOREIGN KEY (chiste_id) REFERENCES Chistes(id),
    FOREIGN KEY (tematica_id) REFERENCES Tematicas(id)
);

-- Insertar datos
-- Usuarios
INSERT INTO Usuarios (nombre, contrasena) VALUES
('Manolito', 'password1'),
('Pepe', 'password2'),
('Isabel', 'password3'),
('Pedro', 'password4');

-- Temáticas
INSERT INTO Tematicas (nombre) VALUES
('Humor negro'),
('Humor amarillo'),
('Chistes verdes');

-- Chistes
INSERT INTO Chistes (titulo, cuerpo, autor_id) VALUES
('Chiste 1 de Manolito', '¿Cuál es el animal más antiguo? La cebra, porque está en blanco y negro.', 1),
('Chiste 2 de Manolito', '¿Por qué los pájaros no usan Facebook? Porque ya tienen Twitter.', 1),
('Chiste 3 de Manolito', '¿Qué hace una abeja en el gimnasio? ¡Zum-ba!', 1),
('Chiste 1 de Pepe', '¿Cuál es el café más peligroso del mundo? El ex-preso.', 2),
('Chiste 2 de Pepe', '¿Por qué los pájaros no usan teléfonos? Porque tienen picos.', 2),
('Chiste 3 de Pepe', '¿Qué hace una abeja en el gimnasio? ¡Zum-ba!', 2),
('Chiste 1 de Isabel', '¿Qué hace una abeja en el gimnasio? ¡Zum-ba!', 3),
('Chiste 2 de Isabel', '¿Por qué las focas miran siempre hacia arriba? ¡Porque ahí están los focos!', 3),
('Chiste 3 de Isabel', '¿Qué le dice una iguana a su hermana gemela? Somos iguanitas.', 3),
('Chiste 1 de Pedro', '¿Cuál es el café más peligroso del mundo? El ex-preso.', 4),
('Chiste 2 de Pedro', '¿Qué le dice un gusano a otro gusano? Voy a dar una vuelta a la manzana.', 4),
('Chiste 3 de Pedro', '¿Por qué las focas miran siempre hacia arriba? ¡Porque ahí están los focos!', 4);

-- Asignar temáticas a los chistes
INSERT INTO Chistes_Tematicas (chiste_id, tematica_id) VALUES
(1, 1), (1, 2), (1, 3),
(2, 1), (2, 2), (2, 3),
(3, 1), (3, 2), (3, 3),
(4, 1), (4, 2), (4, 3),
(5, 1), (5, 2), (5, 3),
(6, 1), (6, 2), (6, 3),
(7, 1), (7, 2), (7, 3),
(8, 1), (8, 2), (8, 3),
(9, 1), (9, 2), (9, 3),
(10, 1), (10, 2), (10, 3),
(11, 1), (11, 2), (11, 3),
(12, 1), (12, 2), (12, 3);

-- Consultas
-- Consulta 1: Chistes creados por Manolito
SELECT Chistes.titulo, Chistes.cuerpo
FROM Chistes
JOIN Usuarios ON Chistes.autor_id = Usuarios.id
WHERE Usuarios.nombre = 'Manolito';

-- Consulta 2: Chistes de la temática "Humor negro"
SELECT Chistes.titulo, Chistes.cuerpo
FROM Chistes
JOIN Chistes_Tematicas ON Chistes.id = Chistes_Tematicas.chiste_id
JOIN Tematicas ON Chistes_Tematicas.tematica_id = Tematicas.id
WHERE Tematicas.nombre = 'Humor negro';

-- Consulta 3: Chistes de "Humor negro" creados por Manolito
SELECT Chistes.titulo, Chistes.cuerpo
FROM Chistes
JOIN Usuarios ON Chistes.autor_id = Usuarios.id
JOIN Chistes_Tematicas ON Chistes.id = Chistes_Tematicas.chiste_id
JOIN Tematicas ON Chistes_Tematicas.tematica_id = Tematicas.id
WHERE Usuarios.nombre = 'Manolito' AND Tematicas.nombre = 'Humor negro';
