CREATE TABLE IF NOT EXISTS Orders (
    ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    UserID INTEGER REFERENCES Users (ID),
    TravelAgencyID INTEGER REFERENCES TravelAgencies (ID),
    Status INTEGER REFERENCES OrderStatuses (ID),
    RegistrationDate DATE,
    RegistrationTime TIME,
    Price INTEGER
);