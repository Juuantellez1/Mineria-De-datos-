FROM postgres:14

ENV POSTGRES_DB=retail_db
ENV POSTGRES_USER=lab_user
ENV POSTGRES_PASSWORD=lab_pass

COPY ./init/ /docker-entrypoint-initdb.d/