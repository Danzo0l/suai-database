SELECT u.*
-- Основной запрос, чтобы выбрать пользователей
FROM Users u
-- Проверяем, что не существует страны, для которой не найдена связь с путевкой пользователя
WHERE NOT EXISTS (
    -- Подзапрос для выбора всех стран
    SELECT c.ID
    FROM Countries c
    -- Проверяем, что не существует страны, для которой нет связи с путевкой пользователя
    WHERE NOT EXISTS (
        -- Подзапрос для выбора путевок пользователя, связанных с текущей страной
        SELECT 1
        FROM TravelPackages tp
        JOIN TourCountries tc ON tp.TourID = tc.TourID
        -- Связываем таблицы, чтобы найти путевки пользователя, связанные с текущей страной
        WHERE tp.UserID = u.ID
        AND tc.CountryID = c.ID
    )
);

