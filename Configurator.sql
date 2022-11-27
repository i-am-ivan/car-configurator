-- Car Configurator Database
-- Drop database if exists
DROP DATABASE IF EXISTS cconfigurator;

-- Create Database Afresh
USE MASTER;
GO

CREATE DATABASE cconfigurator;
GO

-- Create Database Tables
USE [cconfigurator];
GO

DROP TABLE IF EXISTS cconfigurator.Exteriors;
-- Exteriors Table
CREATE TABLE Exteriors(
	ExteriorID INT PRIMARY KEY IDENTITY (1001, 1),
	ExteriorColor VARCHAR(100) NOT NULL,
	Stripes VARCHAR(100) NOT NULL
);
GO

DROP TABLE IF EXISTS cconfigurator.Wheels;
-- Wheels Table
CREATE TABLE Wheels(
	WheelID INT PRIMARY KEY IDENTITY (2001, 1),
	ForgedAluminium VARCHAR(150) NOT NULL,
	CarbonFiber VARCHAR(150) NOT NULL
);
GO

DROP TABLE IF EXISTS cconfigurator.Interiors;
-- Interiors Table
CREATE TABLE Interiors(
	InteriorID INT PRIMARY KEY IDENTITY (3001, 1),
	Description VARCHAR(150) NOT NULL
);
GO

DROP TABLE IF EXISTS cconfigurator.Series;
-- Series Table
CREATE TABLE Series(
	SeriesID INT PRIMARY KEY IDENTITY (4001, 1),
	Description VARCHAR(150) NOT NULL
);
GO

DROP TABLE IF EXISTS cconfigurator.Configurators;
-- Configurators Table
CREATE TABLE Configurators(
	ConfiguratorID INT PRIMARY KEY IDENTITY (4001, 1),
	ExteriorID INT,
	WheelID INT,
	InteriorID INT,
	SeriesID INT,
	Created TIMESTAMP,
	CONSTRAINT fk_configurator_exterior FOREIGN KEY (ExteriorID) REFERENCES Exteriors (ExteriorID),
	CONSTRAINT fk_configurator_wheels FOREIGN KEY (WheelID) REFERENCES Wheels (WheelID),
	CONSTRAINT fk_configurator_interior FOREIGN KEY (InteriorID) REFERENCES Interiors (InteriorID),
	CONSTRAINT fk_configurator_series FOREIGN KEY (SeriesID) REFERENCES Series (SeriesID)
);
GO

-- INSERT Primary Data
