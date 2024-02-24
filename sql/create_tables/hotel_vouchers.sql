CREATE TABLE IF NOT EXISTS HotelVouchers (
    ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    OrderID INTEGER NOT NULL REFERENCES Orders (ID),
    HotelTitle VARCHAR(200),
    RegistrationDate DATE,
    RegistrationTime TIME,
    CheckInDate DATE,
    MoveOutDate DATE,
    Price INTEGER
);