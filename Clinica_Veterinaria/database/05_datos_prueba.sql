USE veterinaria_examen;

CALL sp_insertar_cliente('TEST-CLIENTE-01', 'Ana Ejemplo', '8888-0001');
CALL sp_insertar_cliente('TEST-CLIENTE-02', 'Luis Ejemplo', '8888-0002');

CALL sp_insertar_mascota('MASC-0001', 'Luna', 'PERRO', 3, 'TEST-CLIENTE-01');
CALL sp_insertar_mascota('MASC-0002', 'Milo', 'GATO', 2, 'TEST-CLIENTE-01');
CALL sp_insertar_mascota('MASC-0003', 'Toby', 'OTRO', 1, 'TEST-CLIENTE-02');
