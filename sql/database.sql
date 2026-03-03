-- Database and user creation
CREATE DATABASE IF NOT EXISTS `clash_royale` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER IF NOT EXISTS 'usuarioGCalvo'@'%' IDENTIFIED BY 'GabrielCalvo@2006';
GRANT ALL PRIVILEGES ON `clash_royale`.* TO 'usuarioGCalvo'@'%';
FLUSH PRIVILEGES;

USE `clash_royale`;

-- Usuarios table
CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` INT AUTO_INCREMENT PRIMARY KEY,
  `nombre_usuario` VARCHAR(100) NOT NULL,
  `contrasena` VARCHAR(255) NOT NULL,
  `correo` VARCHAR(150) NOT NULL,
  `creacion` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_usuario` (`nombre_usuario`),
  UNIQUE KEY `unique_correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Main table: cartas_clash_royale
CREATE TABLE IF NOT EXISTS `cartas_clash_royale` (
  `cartas_clash_royale_id` INT AUTO_INCREMENT PRIMARY KEY,
  `nombre_carta` VARCHAR(150) NOT NULL,
  `rareza` VARCHAR(50) NOT NULL,
  `nivel` INT NOT NULL,
  `tipo` VARCHAR(100) NOT NULL,
  `descripcion` TEXT,
  `coste_elixir` INT NOT NULL,
  `creacion` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_nombre` (`nombre_carta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed usuarios (2 sample users, hashes are examples for 'nueva123' and 'adminpass')
INSERT INTO `usuarios` (nombre_usuario, contrasena, correo) VALUES
('gabriel', '$2y$10$yOq0C3m33ZdVQ3mAgzQj/.lakoTKHNrmGx9sVzDoxOVf2QipwHVe2', 'gabriel@example.com'),
('admin', '$2y$10$5vY8rSbtzAq4jP9QcwInFOGhhqfHPw1aE/6P3da81QlvZVtO97K/6', 'admin@example.com');

-- Seed cartas_clash_royale (10 records)
INSERT INTO `cartas_clash_royale` (nombre_carta, rareza, nivel, tipo, descripcion, coste_elixir) VALUES
('Arqueras', 'Comun', 9, 'Tropa', 'Disparan desde distancia', 3),
('Bebé Dragon', 'Épica', 6, 'Tropa Voladora', 'Ataque en área', 4),
('Montapuercos', 'Rara', 7, 'Tropa', 'Corre hacia la torre', 4),
('Mago', 'Rara', 9, 'Tropa', 'Ataque mágico a distancia', 5),
('Pekka', 'Legendaria', 5, 'Tropa', 'Alto daño', 7),
('Esqueleto Gigante', 'Épica', 4, 'Tropa', 'Explota al morir', 6),
('Globo Bombástico', 'Legendaria', 3, 'Tropa Voladora', 'Ataque directo a estructuras', 5),
('Princesa', 'Legendaria', 2, 'Tropa', 'Larga distancia', 3),
('Caballero', 'Comun', 11, 'Tropa', 'Tanque cuerpo a cuerpo', 3),
('Curación', 'Comun', 1, 'Hechizo', 'Recupera vida', 3);
