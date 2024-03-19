CREATE OR REPLACE FUNCTION avg_price_for_tunisia()
RETURNS FLOAT AS
$$
DECLARE
    avg_price FLOAT;
BEGIN
    SELECT AVG(tp.price) INTO avg_price
    FROM TravelPackages tp
    JOIN TourCountries tc ON tp.TourID = tc.TourID
    JOIN Countries c ON tc.CountryID = c.ID
    WHERE c.Title = 'Тунис';

    RETURN avg_price;
END;
$$ LANGUAGE plpgsql;

