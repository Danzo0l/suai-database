CREATE TABLE IF NOT EXISTS Orders (
    ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    UserID INTEGER NOT NULL REFERENCES Users (ID),
    TravelAgencyID INTEGER NOT NULL REFERENCES TravelAgencies (ID),
    Status INTEGER NOT NULL REFERENCES OrderStatuses (ID),
    RegistrationDate DATE,
    RegistrationTime TIME,
    Price INTEGER
);