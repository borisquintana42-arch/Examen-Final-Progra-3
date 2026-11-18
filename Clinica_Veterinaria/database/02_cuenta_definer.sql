CREATE USER IF NOT EXISTS 'vet_definer'@'localhost'
IDENTIFIED BY 'CLAVE_LOCAL_DE_VET_DEFINER';

CREATE USER IF NOT EXISTS 'vet_app'@'localhost'
IDENTIFIED BY 'CLAVE_LOCAL_DE_VET_DEFINER';

GRANT SELECT, INSERT
ON veterinaria_examen.cliente
TO 'vet_definer'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE
ON veterinaria_examen.mascota
TO 'vet_definer'@'localhost';

FLUSH PRIVILEGES;
