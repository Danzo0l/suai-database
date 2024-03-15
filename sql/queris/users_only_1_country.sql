-- Выбираем уникальные записи из таблицы Users
SELECT DISTINCT u.*
-- Объединяем таблицы Users, TravelPackages и TourCountries
FROM Users u
INNER JOIN TravelPackages tp ON u.ID = tp.UserID
INNER JOIN TourCountries tc ON tp.TourID = tc.TourID
-- Группируем результаты по ID пользователей
GROUP BY u.ID
-- Фильтруем результаты таким образом, чтобы у пользователя была связь только с одной страной
HAVING COUNT(DISTINCT tc.CountryID) = 1;

