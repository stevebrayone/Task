change the connection string before u run the application

create table in the database


CREATE TABLE Signatures (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(15),
    Signature NVARCHAR(MAX)
);

