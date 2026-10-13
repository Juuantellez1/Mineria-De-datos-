-- ============================================================
-- 01_schema.sql
-- Base de datos: analytics
-- Motor: ClickHouse
-- Taller Data Warehouse y Dashboard
-- ============================================================

CREATE DATABASE IF NOT EXISTS analytics;

USE analytics;

CREATE TABLE IF NOT EXISTS eventos
(
    evento_ts DateTime,
    user_id UInt64,
    session_id String,
    evento_tipo LowCardinality(String),
    producto_id UInt32,
    categoria String,
    precio Float32
)
ENGINE = MergeTree
ORDER BY (evento_ts, user_id)
PARTITION BY toDate(evento_ts);