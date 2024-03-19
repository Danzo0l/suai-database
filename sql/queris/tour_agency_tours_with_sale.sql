-- Обновляем цены путевок в таблице TravelPackages
UPDATE TravelPackages
-- Устанавливаем новую цену, учитывая размер скидки в процентах
SET price = price * (1 - (:discount / 100.0))
-- Фильтруем только те путевки, которые относятся к турам выбранного турагентства
WHERE TourID IN (
    -- Подзапрос для выбора ID туров, принадлежащих выбранному турагентству
    SELECT ID
    FROM Tours
    WHERE TravelAgencyID = :agency_id
);

