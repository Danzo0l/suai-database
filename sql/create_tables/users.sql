CREATE TABLE IF NOT EXISTS Users (
    ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    Firstname VARCHAR(50) NOT NULL,
    Lastname VARCHAR(50) NOT NULL,
    Surname VARCHAR(50),
    Telephone VARCHAR(20),
    Birthday DATE NOT NULL,
    CategoryID INTEGER REFERENCES Categories (ID) NOT NULL
);