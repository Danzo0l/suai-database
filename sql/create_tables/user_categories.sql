CREATE TABLE IF NOT EXISTS UserCategories (
    ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    Title VARCHAR(50),
    TotalPrice INTEGER NOT NULL
);