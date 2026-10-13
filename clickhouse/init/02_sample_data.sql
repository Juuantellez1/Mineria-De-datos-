-- ============================================================
-- 02_sample_data.sql
-- Base de datos: analytics
-- Motor: ClickHouse
-- Taller Data Warehouse y Dashboard
-- ============================================================

INSERT INTO analytics.eventos VALUES
('2025-01-01 10:00:00', 1, 's1', 'vista', 1001, 'electronica', 499.99),
('2025-01-01 10:01:00', 1, 's1', 'carrito', 1001, 'electronica', 499.99),
('2025-01-01 10:02:00', 1, 's1', 'compra', 1001, 'electronica', 499.99),
('2025-01-01 10:05:00', 2, 's2', 'vista', 2001, 'libros', 19.99);