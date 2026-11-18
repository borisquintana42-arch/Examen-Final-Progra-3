USE veterinaria_examen;

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_listar_clientes$$
CREATE DEFINER = 'vet_definer'@'localhost'
PROCEDURE sp_listar_clientes()
SQL SECURITY DEFINER
BEGIN
    SELECT cedula, nombre, telefono
    FROM cliente
    ORDER BY nombre;
END$$

DROP PROCEDURE IF EXISTS sp_insertar_cliente$$
CREATE DEFINER = 'vet_definer'@'localhost'
PROCEDURE sp_insertar_cliente(
    IN p_cedula VARCHAR(20),
    IN p_nombre VARCHAR(80),
    IN p_telefono VARCHAR(20)
)
SQL SECURITY DEFINER
BEGIN
    INSERT INTO cliente (cedula, nombre, telefono)
    VALUES (p_cedula, p_nombre, p_telefono);
END$$

DROP PROCEDURE IF EXISTS sp_listar_mascotas$$
CREATE DEFINER = 'vet_definer'@'localhost'
PROCEDURE sp_listar_mascotas()
SQL SECURITY DEFINER
BEGIN
    SELECT codigo, nombre, especie, edad, cedula_cliente
    FROM mascota
    ORDER BY nombre;
END$$

DROP PROCEDURE IF EXISTS sp_insertar_mascota$$
CREATE DEFINER = 'vet_definer'@'localhost'
PROCEDURE sp_insertar_mascota(
    IN p_codigo VARCHAR(15),
    IN p_nombre VARCHAR(80),
    IN p_especie VARCHAR(10),
    IN p_edad INT,
    IN p_cedula_cliente VARCHAR(20)
)
SQL SECURITY DEFINER
BEGIN
    INSERT INTO mascota (codigo, nombre, especie, edad, cedula_cliente)
    VALUES (p_codigo, p_nombre, p_especie, p_edad, p_cedula_cliente);
END$$

DROP PROCEDURE IF EXISTS sp_actualizar_mascota$$
CREATE DEFINER = 'vet_definer'@'localhost'
PROCEDURE sp_actualizar_mascota(
    IN p_codigo VARCHAR(15),
    IN p_nombre VARCHAR(80),
    IN p_especie VARCHAR(10),
    IN p_edad INT,
    IN p_cedula_cliente VARCHAR(20)
)
SQL SECURITY DEFINER
BEGIN
    IF NOT EXISTS (SELECT 1 FROM mascota WHERE codigo = p_codigo) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No se encontro la existencia de una mascota con ese codigo.';
    END IF;

    UPDATE mascota
    SET nombre = p_nombre,
        especie = p_especie,
        edad = p_edad,
        cedula_cliente = p_cedula_cliente
    WHERE codigo = p_codigo;
END$$

DROP PROCEDURE IF EXISTS sp_eliminar_mascota$$
CREATE DEFINER = 'vet_definer'@'localhost'
PROCEDURE sp_eliminar_mascota(IN p_codigo VARCHAR(15))
SQL SECURITY DEFINER
BEGIN
    IF NOT EXISTS (SELECT 1 FROM mascota WHERE codigo = p_codigo) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No se encontro la existencia de una mascota con ese codigo.';
    END IF;

    DELETE FROM mascota
    WHERE codigo = p_codigo;
END$$

DROP PROCEDURE IF EXISTS sp_listar_mascotas_con_dueno$$
CREATE DEFINER = 'vet_definer'@'localhost'
PROCEDURE sp_listar_mascotas_con_dueno()
SQL SECURITY DEFINER
BEGIN
    SELECT mascota.codigo,
           mascota.nombre,
           mascota.especie,
           mascota.edad,
           mascota.cedula_cliente,
           cliente.nombre AS nombre_cliente
    FROM mascota
    INNER JOIN cliente
        ON mascota.cedula_cliente = cliente.cedula
    ORDER BY mascota.nombre;
END$$

DELIMITER ;
