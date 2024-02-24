CREATE TABLE IF NOT EXISTS TourCountries(
    ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    VisaID INTEGER NOT NULL REFERENCES Tours (ID),
    CountryID INTEGER NOT NULL REFERENCES Countries (ID)
)