-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: Varela Candela.
-- Fecha: 24/09/2026
-- ══════════════════════════════════════════

-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos?
-- Mostrá todos los productos y sus ventas asociadas.
-- Los productos sin ventas aparecerán con NULL en las columnas de ventas.

SELECT P.nombre, V.venta_id
FROM Productos P LEFT JOIN Ventas V ON P.producto_id = V. producto_id

-- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos
-- que no figuran en nuestro catálogo? (posible error de carga de datos)
-- Los registros huérfanos aparecerán con NULL en las columnas de productos.

SELECT V.venta_id, P.producto_id
FROM Productos P RIGHT JOIN Ventas V ON P.producto_id = V. producto_id WHERE P.producto_id IS NULL

-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio: Vista completa de auditoría que muestre
-- todos los productos y todas las ventas sin perder ninguna fila,
-- identificando tanto productos sin ventas como ventas sin producto.

SELECT V.venta_id, P.nombre
FROM Productos P FULL OUTER JOIN Ventas V ON P.producto_id = V. producto_id