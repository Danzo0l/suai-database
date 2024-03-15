-- Выбираем все столбцы из таблицы Users
SELECT u.*
FROM Users u
-- Фильтруем пользователей на основе условия
WHERE (
    -- Подзапрос для подсчета числа путевок пользователя в Турцию
    SELECT COUNT(tp.ID)
    FROM TravelPackages tp
    INNER JOIN TourCountries tc ON tp.TourID = tc.TourID
    -- Условие для выбора путевок пользователя в Турцию
    WHERE tp.UserID = u.ID
    AND tc.CountryID = (
        -- Получаем ID страны Турция
        SELECT ID FROM Countries WHERE Title = 'Турция'
    )
) > 5;

