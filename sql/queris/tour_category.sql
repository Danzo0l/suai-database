UPDATE Tours
SET CategoryID =
    CASE
        -- Если количество записей в TravelPackages для данного тура больше 100, присваиваем категорию 3
        WHEN (SELECT COUNT(*) FROM TravelPackages WHERE TourID = Tours.ID) > 100 THEN 3
        -- Если количество записей в TravelPackages для данного тура больше 50, присваиваем категорию 2
        WHEN (SELECT COUNT(*) FROM TravelPackages WHERE TourID = Tours.ID) > 50 THEN 2
        -- Если количество записей в TravelPackages для данного тура меньше или равно 50, оставляем
        ELSE CategoryID
    END;

