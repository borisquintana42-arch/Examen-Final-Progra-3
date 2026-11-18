CREATE DATABASE IF NOT EXISTS veterinaria_examen
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE veterinaria_examen;

CREATE TABLE IF NOT EXISTS cliente (
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (cedula),
    CONSTRAINT chk_cliente_cedula CHECK (CHAR_LENGTH(TRIM(cedula)) > 0),
    CONSTRAINT chk_cliente_nombre CHECK (CHAR_LENGTH(TRIM(nombre)) > 0),
    CONSTRAINT chk_cliente_telefono CHECK (CHAR_LENGTH(TRIM(telefono)) > 0)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS mascota (
    codigo VARCHAR(15) NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    especie ENUM('PERRO', 'GATO', 'OTRO') NOT NULL,
    edad INT NOT NULL,
    cedula_cliente VARCHAR(20) NOT NULL,
    CONSTRAINT pk_mascota PRIMARY KEY (codigo),
    CONSTRAINT chk_mascota_codigo CHECK (CHAR_LENGTH(TRIM(codigo)) > 0),
    CONSTRAINT chk_mascota_nombre CHECK (CHAR_LENGTH(TRIM(nombre)) > 0),
    CONSTRAINT chk_mascota_edad CHECK (edad BETWEEN 0 AND 60),
    CONSTRAINT fk_mascota_cliente FOREIGN KEY (cedula_cliente)
        REFERENCES cliente (cedula)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;
