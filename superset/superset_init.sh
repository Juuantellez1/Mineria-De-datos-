#!/bin/bash

superset db upgrade

superset fab create-admin \
  --username admin \
  --firstname Admin \
  --lastname User \
  --email admin@superset.com \
  --password admin

superset init

superset shell <<EOF
from superset import db
from superset.models.core import Database

db.session.add(Database(
    database_name="ClickHouse",
    sqlalchemy_uri="clickhouse+http://admin:admin123@clickhouse_server:8123/analytics"
))

db.session.commit()
EOF

superset run -h 0.0.0.0 -p 8088