-- Выбираем все столбцы из таблицы Tours
SELECT *
-- Фильтруем результаты, чтобы выбрать только туры, для которых ID совпадает с TourID в подзапросе
FROM Tours
WHERE ID IN (
    -- В подзапросе выбираем TourID из таблицы TravelPackages
    SELECT TourID
    -- Отфильтровываем только те пакеты, цена которых находится в диапазоне между :minprice и :maxprice
    FROM TravelPackages
    WHERE price BETWEEN :minprice AND :maxprice
);

