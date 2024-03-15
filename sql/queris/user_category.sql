UPDATE Users
SET CategoryID =
    CASE
        WHEN TotalPrice >= 150000 THEN 4
        WHEN TotalPrice >= 100000 THEN 3
        WHEN TotalPrice >= 50000 THEN 2
        ELSE CategoryID
    END
FROM (
    SELECT UserID, SUM(Price) AS TotalPrice
    FROM TravelPackages
    GROUP BY UserID
) AS UserTotalPrice
WHERE Users.ID = UserTotalPrice.UserID;
