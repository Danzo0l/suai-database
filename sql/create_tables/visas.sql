CREATE TABLE IF NOT EXISTS Visas (
    ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    VisaType INTEGER REFERENCES VisaTypes (ID),
    Number VARCHAR(50),
    UserId INTEGER REFERENCES Users (ID) ON DELETE CASCADE,
    DateOfIssue DATE NOT NULL
);