CREATE TABLE IF NOT EXISTS TravelPackages
(
    ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    TourID INTEGER references Tours(ID) ON DELETE SET NULL,
    UserID INTEGER references Users(ID) ON DELETE SET NULL,
    RegistrationDate DATE,
    RegistrationTime TIME,
    price INTEGER
);
