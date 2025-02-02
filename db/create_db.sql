CREATE DATABASE Pelart_db;

USE Pelart_db;

CREATE TABLE Role (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL UNIQUE,

    CREATED_AT TIMESTAMP,
    UPDATED_AT TIMESTAMP
);

CREATE TABLE Accounts (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    E_mail VARCHAR(255) NOT NULL UNIQUE,
    Name VARCHAR(255) NOT NULL,
    Surname VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role_id INT NOT NULL REFERENCES Role(ID),

    CREATED_AT TIMESTAMP,
    UPDATED_AT TIMESTAMP
);

ALTER TABLE Role ADD CREATOR_ACCOUNT_ID INT REFERENCES Accounts(ID);
ALTER TABLE Role ADD ;

CREATE TABLE Addresses (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Country VARCHAR(255) NOT NULL,
    Zip_code VARCHAR(255) NOT NULL,
    City VARCHAR(255),
    Address VARCHAR(255) NOT NULL,
    Account_id INT NOT NULL REFERENCES Accounts(ID),

    CREATED_AT TIMESTAMP,
    UPDATED_AT TIMESTAMP
);

CREATE TABLE Statuses (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL UNIQUE,

    CREATED_AT TIMESTAMP,
    UPDATED_AT TIMESTAMP
);

CREATE TABLE Orders (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Placed_at DATETIME NOT NULL,
    Is_delivery BIT NOT NULL,
    Status_id INT NOT NULL REFERENCES Statuses(ID),
    Account_id INT NOT NULL REFERENCES Accounts(ID),
    Address_id INT NOT NULL REFERENCES Addresses(ID),

    CREATED_AT TIMESTAMP,
    UPDATED_AT TIMESTAMP
);

CREATE TABLE Categories (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL UNIQUE,

    CREATED_AT TIMESTAMP,
    UPDATED_AT TIMESTAMP
);

CREATE TABLE Products (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_nr VARCHAR(255) NOT NULL UNIQUE,
    Name VARCHAR(255) NOT NULL,
    Details VARCHAR(1000),
    Quantity INT NOT NULL,
    Img_url VARCHAR(255),
    Category_id INT NOT NULL REFERENCES Categories(ID),

    CREATED_AT TIMESTAMP,
    UPDATED_AT TIMESTAMP
);

CREATE TABLE Price_types (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL UNIQUE,

    CREATED_AT TIMESTAMP,
    UPDATED_AT TIMESTAMP
);

CREATE TABLE Prices (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_id INT NOT NULL REFERENCES Products(ID),
    Value DECIMAL(10,2) NOT NULL,
    Active_from DATETIME NOT NULL,
    Price_type_id INT NOT NULL REFERENCES Price_type(ID),
    Is_sell_price BIT NOT NULL,

    CREATED_AT TIMESTAMP,
    UPDATED_AT TIMESTAMP
);

CREATE TABLE Order_details (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Qunatity INT NOT NULL,
    Product_id INT NOT NULL REFERENCES Products(ID),
    Price_id INT NOT NULL REFERENCES Prices(ID),
    Order_id INT NOT NULL REFERENCES Orders(ID),

    CREATED_AT TIMESTAMP,
    UPDATED_AT TIMESTAMP
);