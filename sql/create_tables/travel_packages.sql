CREATE TABLE IF NOT EXISTS TravelPackages (
    ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    OrderID INTEGER NOT NULL REFERENCES Orders (ID),
    RegistrationDate DATE,
    RegistrationTime TIME,
    Price INTEGER
);