-- 01- Crear Usuario
CREATE USER univ_admin WITH PASSWORD '*';

--02 Crear Base
CREATE DATABASE universitydb WITH 
    ENCODING='UTF8' 
    LC_COLLATE='es_CO.UTF-8' 
    LC_CTYPE='es_CO.UTF-8' 
    TEMPLATE=template0 
    OWNER = univ_admin;


--03- Privilegios
GRANT ALL PRIVILEGES ON DATABASE universitydb TO univ_admin;    