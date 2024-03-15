-- Выбираем ID агентства (AgencyID), его название (AgencyTitle), и количество пакетов путешествий (PackageCount).
SELECT ta.ID AS AgencyID, ta.Title AS AgencyTitle, COUNT(tp.ID) AS PackageCount
-- Присоединяем таблицу TravelAgencies (ta) к таблице Tours (t) через поле TravelAgencyID,
-- чтобы получить информацию о каждом агентстве и турах, предлагаемых им.
FROM TravelAgencies ta
LEFT JOIN Tours t ON ta.ID = t.TravelAgencyID
-- Присоединяем таблицу TravelPackages (tp) к таблице Tours (t) через поле TourID,
-- чтобы учесть все пакеты путешествий, связанные с каждым туром.
LEFT JOIN TravelPackages tp ON t.ID = tp.TourID
-- Группируем результаты запроса по ID и названию каждого агентства,
-- чтобы подсчитать количество пакетов путешествий для каждого агентства.
GROUP BY ta.ID, ta.Title;
-- В результате запроса получаем ID агентства (AgencyID), название агентства (AgencyTitle)
-- и количество пакетов путешествий (PackageCount), связанных с каждым агентством.

