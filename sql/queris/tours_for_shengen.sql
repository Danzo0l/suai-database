-- Выбираем уникальные данные о турах
SELECT DISTINCT T.*
FROM Tours T
-- Присоединяем таблицу TourCountries, чтобы получить информацию о странах в каждом туре
JOIN TourCountries TC ON T.ID = TC.TourID
WHERE TC.CountryID IN (
    -- Выбираем ID стран, которые соответствуют типу визы "Шенген"
    SELECT CountryID
    FROM VisaCountries VC
    JOIN VisaTypes VT ON VC.VisaID = VT.ID
    WHERE VT.Title LIKE '%Шенген%' -- Используем оператор LIKE для
    -- поиска типа визы, содержащего слово "Шенген"
)
AND NOT EXISTS (
    -- Проверяем отсутствие других стран, не принадлежащих к типу визы "Шенген", в каждом туре
    SELECT 1
    FROM TourCountries TC2
    LEFT JOIN VisaCountries VC2 ON TC2.CountryID = VC2.CountryID
    LEFT JOIN VisaTypes VT2 ON VC2.VisaID = VT2.ID
    WHERE TC2.TourID = T.ID
    AND VT2.Title NOT LIKE '%Шенген%' -- Используем оператор LIKE для поиска типа визы,
    -- не содержащего слово "Шенген"
);

