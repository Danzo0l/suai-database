SELECT SUM(Price) / COUNT(*) AS AveragePrice
-- Считаем сумму цен и делим на количество записей, чтобы получить среднюю цену
FROM TravelPackages TP
-- Выбираем данные из таблицы TravelPackages
JOIN Tours T ON TP.TourID = T.ID
-- Присоединяем таблицу Tours по идентификатору тура в таблице TravelPackages
JOIN TourCountries TC ON T.ID = TC.TourID
-- Присоединяем таблицу TourCountries по идентификатору тура из таблицы Tours
JOIN Countries C ON TC.CountryID = C.ID
-- Присоединяем таблицу Countries по идентификатору страны из таблицы TourCountries
WHERE C.Title = 'Тунис'
-- Фильтруем только записи, связанные с Тунисом
HAVING COUNT(DISTINCT c.Title) = 1;
-- Группируем результаты и выбираем только те, где уникальные названия стран равны 1