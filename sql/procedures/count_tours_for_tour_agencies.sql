CREATE OR REPLACE FUNCTION get_travel_agency_tour_counts()
RETURNS TABLE (
    agency_title VARCHAR(50),
    agency_inn VARCHAR(50),
    tour_count BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        ta.Title AS agency_title,
        ta.INN AS agency_inn,
        COUNT(t.ID) AS tour_count
    FROM
        TravelAgencies ta
    LEFT JOIN
        Tours t ON ta.ID = t.TravelAgencyID
    GROUP BY
        ta.ID;
END;
$$ LANGUAGE plpgsql;

