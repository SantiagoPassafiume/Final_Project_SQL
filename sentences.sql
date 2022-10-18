CREATE USER santiago@localhost IDENTIFIED BY "password";
GRANT SELECT, INSERT, UPDATE ON *.* TO santiago@localhost;

CREATE USER debora@localhost IDENTIFIED BY "password";
GRANT SELECT ON *.* TO debora@localhost;
