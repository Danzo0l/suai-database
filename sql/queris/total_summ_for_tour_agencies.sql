-- Выбираем название турагентства и общую сумму цен всех пакетов, предоставленных им
SELECT
    TA.Title AS TravelAgency, -- Выбираем название турагентства и используем псевдоним TA
    SUM(TP.price) AS TotalPrice -- Суммируем цены всех пакетов и называем итоговую сумму TotalPrice
FROM
    TravelAgencies TA -- Объединяем таблицу TravelAgencies с другими таблицами с помощью JOIN
JOIN
    Tours T ON TA.ID = T.TravelAgencyID -- Объединяем таблицу Tours с таблицей TravelAgencies
JOIN
    TravelPackages TP ON T.ID = TP.TourID -- Объединяем таблицу TravelPackages с таблицей Tours
GROUP BY
    TA.Title; -- Группируем результат по названию турагентства


