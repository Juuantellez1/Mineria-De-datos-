FROM apache/superset:3.1.2

USER root

COPY requirements.txt /app/requirements.txt

RUN apt-get update \
    && apt-get install -y build-essential \
    && pip install -r /app/requirements.txt

COPY superset_init.sh /app/superset_init.sh

RUN chmod +x /app/superset_init.sh

USER superset