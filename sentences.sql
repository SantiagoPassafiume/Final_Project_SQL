-- Crear un usuario con el nombre "santiago" y la password "password" en localhost.
CREATE USER santiago@localhost IDENTIFIED BY "password";

/*
Asignar los siguientes permisos para el usuario "santiago":
1. SELECT (Lectura)
2. INSERT (Inserción)
3. UPDATE (Modificación)
*/
GRANT SELECT, INSERT, UPDATE ON *.* TO santiago@localhost;



-- Crear un usuario con el nombre "debora" y la password "password" en localhost.
CREATE USER debora@localhost IDENTIFIED BY "password";

/*
Asignar los siguientes permisos para el usuario "debora":
1. SELECT (Lectura)
*/
GRANT SELECT ON *.* TO debora@localhost;
