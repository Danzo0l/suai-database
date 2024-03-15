-- Выбираем уникальные записи туристических агентств (TravelAgencies)
SELECT DISTINCT ta.*
-- из таблицы туристических агентств
FROM TravelAgencies ta
-- Присоединяем таблицу туров (Tours) к таблице туристических агентств (TravelAgencies) по идентификатору агентства
JOIN Tours t ON ta.ID = t.TravelAgencyID
-- Присоединяем таблицу стран, связанных с турами (TourCountries), к таблице туров (Tours) по идентификатору тура
JOIN TourCountries tc ON t.ID = tc.TourID
-- Присоединяем таблицу стран (Countries) к таблице стран, связанных с турами (TourCountries) по идентификатору страны
JOIN Countries c ON tc.CountryID = c.ID
-- Фильтруем только те записи, где название страны равно 'Египет' или 'Турция'
WHERE c.Title IN ('Египет', 'Турция');
