CREATE TABLE Customer(
    ID serial PRIMARY KEY,
    Name varchar(50) NOT NULL,
    Contact varchar(50),
    Address varchar(255)
);

CREATE TABLE Contract(
    ID serial PRIMARY KEY,
    CustomerID integer REFERENCES Customer(ID) ON DELETE CASCADE,
    ExecutorID integer REFERENCES Executor(ID) ON DELETE CASCADE,
    CategoryID integer REFERENCES Category(ID) ON DELETE CASCADE,
    ConcluslonDate timestamp,
    Deadline timestamp,
    PaymentAmount DECIMAL(10, 2),
    Completion integer,
    Status varchar(50)
);

CREATE TABLE Position(
    ID serial PRIMARY KEY,
    Type VARCHAR(50) NOT NULL
);

CREATE TABLE Category(
    ID serial PRIMARY KEY,
    Type VARCHAR(50) NOT NULL
);

CREATE TABLE Service(
    ID serial PRIMARY KEY,
    Description varchar(50),
    ContractID integer REFERENCES Contract(ID) ON DELETE CASCADE
);

CREATE TABLE Executor(
    ID serial PRIMARY KEY,
    Name varchar(50) NOT NULL,
    PositionID integer REFERENCES Position(ID) ON DELETE SET NULL
);

