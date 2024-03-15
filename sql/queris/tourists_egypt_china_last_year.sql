SELECT DISTINCT u.*
-- Присоединяем таблицу TravelPackages (tp) к таблице Users (u) по полю ID пользователя.
FROM Users u
-- Присоединяем таблицу Tours (t) к таблице TravelPackages (tp) по полю ID тура.
JOIN TravelPackages tp ON u.ID = tp.UserID
-- Присоединяем таблицу TourCountries (tc) к таблице Tours (t) по полю ID тура.
JOIN Tours t ON tp.TourID = t.ID
-- Присоединяем таблицу Countries (c) к таблице TourCountries (tc) по полю ID страны.
JOIN TourCountries tc ON t.ID = tc.TourID
-- Фильтруем записи, чтобы остались только те, где название страны равно 'Китай' или 'Тайланд'.
JOIN Countries c ON tc.CountryID = c.ID
-- Фильтруем записи, чтобы остались только те, где дата регистрации пакета путешествия больше
-- или равна '2023-01-01' и меньше '2024-01-01'.
WHERE c.Title IN ('Китай', 'Тайиланд')
AND tp.registrationdate >= '2023-01-01' AND tp.registrationdate < '2024-01-01'
-- Группируем записи по ID пользователя.
-- Фильтруем группы пользователей, оставляя только те, где количество уникальных стран равно 2.
GROUP BY u.ID
HAVING COUNT(DISTINCT c.Title) = 2;

