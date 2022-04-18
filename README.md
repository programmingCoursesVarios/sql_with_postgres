# Postgres and Docker that will make your life easier

## Run container

```bash
$ docker-compose up -d --build
Building blog_db
Sending build context to Docker daemon  17.92kB
Step 1/5 : FROM postgres:11
 ---> b30497d60a81
Step 2/5 : COPY ./create_db.sh /docker-entrypoint-initdb.d/20-create_db.sh
 ---> 9481b72803bd

. . .
```

## Executing psql postgres terminal

You can execute sql commands into container

```bash
$ docker-compose exec blog_db psql -U postgres --port 5432 -h localhost
psql (11.15 (Debian 11.15-1.pgdg90+1))
Type "help" for help.

postgres=# \c
You are now connected to database "postgres" as user "postgres".
postgres=# \l
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
-----------+----------+----------+------------+------------+-----------------------
 banco     | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
(4 rows)

postgres=#

. . .

postgres=# exit
```

Or maybe, you can execute sql command from outsite container

```bash
$ docker-compose exec banco_db psql -U postgres -a banco -c "\dt"
dt
            List of relations
 Schema |    Name     | Type  |  Owner
--------+-------------+-------+----------
 public | cliente     | table | postgres
 public | ctacliente  | table | postgres
 public | cuenta      | table | postgres
 public | pagos       | table | postgres
 public | prestamo    | table | postgres
 public | prestatario | table | postgres
 public | sucursal    | table | postgres
(7 rows)
```

## Tricks

Check this [click here] (https://towardsdatascience.com/tricks-for-postgres-and-docker-that-will-make-your-life-easier-fc7bfcba5082)

## Load data no auto (import data)

* Si el contenedor está corriendo copiamos el archivo dump generado por postgres en el contenedor
```bash
$ docker cp database/mibanquito.backup db:/code/mibanquito.backup
```

* Revisamos que el archivo está efectivamente dentro del contenedor
```bash
$ docker-compose exec banco_db /bin/bash
root@bfe907454571:/code# ls -1
mibanquito
mibanquito.backup
root@bfe907454571:/code# exit
exit
```

* Restauramos los datos usando el comando pg_restore
```bash
$ docker-compose exec banco_db pg_restore -d banco /code/mibanquito.backup -c -U postgres
pg_restore: [archiver (db)] Error while PROCESSING TOC:

. . .
```

* Verificamos que los datos ya están cargados
```bash
$ docker-compose exec banco_db psql -U postgres
psql (11.15 (Debian 11.15-1.pgdg90+1))
Type "help" for help.

postgres=# \c banco
You are now connected to database "banco" as user "postgres".
banco=# \dt
            List of relations
 Schema |    Name     | Type  |  Owner
--------+-------------+-------+----------
 public | cliente     | table | postgres
 public | ctacliente  | table | postgres
 public | cuenta      | table | postgres
 public | pagos       | table | postgres
 public | prestamo    | table | postgres
 public | prestatario | table | postgres
 public | sucursal    | table | postgres
(7 rows)

banco=# exit
```

## Executing sql scripts

* Importante compartir un volumen donde compartirá la carpeta de los scripts
```yml
    volumes:
      - data:/var/lib/postgresql/data
      - ../scripts/:/code/scripts/
```

* Configurando esto ya podremos ejecutar los scripts desde el contenedor sin necesitar de copiarlos y ejecutarlos

```bash
$ docker-compose exec banco_db psql -U postgres -W -h localhost --port 5432 -a banco -f /code/scripts/test.sql
Password:
-- test1
-- \dt muestra todas las tablas de la base de datos
-- es similar a SHOW TABLES en MySQL
\dt
            List of relations
 Schema |    Name     | Type  |  Owner
--------+-------------+-------+----------
 public | cliente     | table | postgres
 public | ctacliente  | table | postgres
 public | cuenta      | table | postgres
 public | pagos       | table | postgres
 public | prestamo    | table | postgres
 public | prestatario | table | postgres
 public | sucursal    | table | postgres
(7 rows)
```