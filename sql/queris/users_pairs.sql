-- Выбираем идентификаторы пользователей, образующих пары (UserID1 и UserID2)
SELECT U1.ID AS UserID1, U2.ID AS UserID2
-- Объединяем таблицы Users и TravelPackages, чтобы получить информацию о пользователях и их путешествиях
FROM Users U1
JOIN TravelPackages TP1 ON U1.ID = TP1.UserID
JOIN TravelPackages TP2 ON TP1.TourID = TP2.TourID AND TP1.RegistrationDate = TP2.RegistrationDate
JOIN Users U2 ON TP2.UserID = U2.ID
-- Фильтруем только уникальные пары, где UserID1 < UserID2, чтобы избежать дубликатов
WHERE U1.ID < U2.ID
-- Группируем результаты по UserID1 и UserID2
GROUP BY U1.ID, U2.ID
-- пары которых количество записей в TravelPackages равно количеству записей этого пользователя
HAVING COUNT(*) = (
    SELECT COUNT(*)
    FROM TravelPackages TP3
    WHERE TP3.UserID = U1.ID
);
