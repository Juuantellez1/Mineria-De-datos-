# Proyecto de Analítica de Datos

Este proyecto implementa un flujo de analítica de datos utilizando PostgreSQL, ClickHouse, Jupyter Notebook y Apache Superset.

El objetivo principal es extraer información de un sistema transaccional, transformarla y cargarla en un esquema analítico para posteriormente construir consultas, métricas y visualizaciones.

## Tecnologías utilizadas

- PostgreSQL
- ClickHouse
- Python
- Pandas
- PyArrow
- SQLAlchemy
- Jupyter Notebook
- Apache Superset
- Podman

## Arquitectura

El proyecto utiliza PostgreSQL como fuente de datos transaccional y ClickHouse como motor analítico.

El flujo general es:

PostgreSQL → Python / PyArrow → ClickHouse → Superset

## Tablas principales

### `fact_sales`
Tabla de hechos que contiene información de ventas.

Campos principales:

- `dim_tiempo_id`
- `dim_orden_id`
- `dim_producto_id`
- `subtotal_por_producto`

### `dim_tiempo`
Dimensión utilizada para analizar las ventas en el tiempo.

Incluye:

- fecha
- año
- semestre
- trimestre
- mes
- día
- día de la semana

### `dim_producto`
Dimensión de productos.

Incluye:

- `product_id`
- `product_name`
- `category_id`
- `category_name`

## Análisis realizados

Durante el proyecto se desarrollaron consultas para:

- Ventas totales por día.
- Ventas por día de la semana.
- Ventas por producto.
- Ventas por categoría.
- Ventas acumuladas por categoría.
- Porcentaje acumulado de ventas por categoría.
- Identificación de las categorías que concentran aproximadamente el 50% de las ventas mensuales.

## Ejemplo: ventas por categoría

```sql
SELECT
    p.category_name AS categoria,
    SUM(f.subtotal_por_producto) AS total_ventas
FROM analytics.fact_sales f
JOIN analytics.dim_producto p
    ON f.dim_producto_id = p.product_id
GROUP BY p.category_name
ORDER BY total_ventas DESC;
