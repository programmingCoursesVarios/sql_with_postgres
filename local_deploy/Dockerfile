FROM postgres:11

WORKDIR /code

# Custom initialization scripts
COPY ./create_db.sh /docker-entrypoint-initdb.d/20-create_db.sh
COPY ./database/mibanquito.backup /code/mibanquito

RUN chmod +x /docker-entrypoint-initdb.d/20-create_db.sh
