 -- Que solo vet_app  con EXECUTE, los demás privilegios fueron limpiados
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'vet_app'@'localhost';

GRANT EXECUTE ON PROCEDURE veterinaria_examen.sp_listar_clientes
TO 'vet_app'@'localhost';

GRANT EXECUTE ON PROCEDURE veterinaria_examen.sp_insertar_cliente
TO 'vet_app'@'localhost';

GRANT EXECUTE ON PROCEDURE veterinaria_examen.sp_listar_mascotas
TO 'vet_app'@'localhost';

GRANT EXECUTE ON PROCEDURE veterinaria_examen.sp_insertar_mascota
TO 'vet_app'@'localhost';

GRANT EXECUTE ON PROCEDURE veterinaria_examen.sp_actualizar_mascota
TO 'vet_app'@'localhost';

GRANT EXECUTE ON PROCEDURE veterinaria_examen.sp_eliminar_mascota
TO 'vet_app'@'localhost';

GRANT EXECUTE ON PROCEDURE veterinaria_examen.sp_listar_mascotas_con_dueno
TO 'vet_app'@'localhost';

FLUSH PRIVILEGES;
