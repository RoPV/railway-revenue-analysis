-- 1. Считаем общую выручку (билеты + доп. доход)
SELECT 
    SUM(price) + 4050 AS total_revenue, 
    COUNT(ticket_id) AS total_sold_tickets
FROM sales_data

-- 2. Находим ТОП-3 перегона с самой низкой загрузкой
-- В MS SQL Server используем SELECT TOP 3 вместо LIMIT
SELECT TOP 3
    segment_name, 
    COUNT(seat_id) as passengers
FROM segments
GROUP BY segment_name
ORDER BY passengers ASC

-- 3. Проверка свободных мест
SELECT seat_number 
FROM seats
WHERE seat_id NOT IN (SELECT DISTINCT seat_id FROM sales_data)

