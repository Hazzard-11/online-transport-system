CREATE DATABASE IF NOT EXISTS myDB_TransportSys;
USE myDB_TransportSys;

-- Akshayan: Feedback / Inquiry
CREATE TABLE IF NOT EXISTS inquiry_feedback (
id INT AUTO_INCREMENT PRIMARY KEY,
sender_name VARCHAR(100),
sender_email VARCHAR(100),
sender_role ENUM('passenger','driver'),
message TEXT,
date_submitted DATETIME DEFAULT CURRENT_TIMESTAMP,
status ENUM('Pending', 'Resolved') DEFAULT 'Pending',
remark TEXT,
remark_date DATETIME
);

-- Aisha: Users
CREATE TABLE IF NOT EXISTS users (
id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(50) UNIQUE,
email VARCHAR(100),
password VARCHAR(100),
role ENUM('passenger','driver'),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Aisha: Vehicles
CREATE TABLE IF NOT EXISTS vehicles (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
type VARCHAR(50),
capacity INT,
number_plate VARCHAR(50),
availability ENUM('Available','Unavailable') DEFAULT 'Available'
);

-- Anushanger: Bookings
CREATE TABLE IF NOT EXISTS travel_bookings (
id INT AUTO_INCREMENT PRIMARY KEY,
passenger_name VARCHAR(100),
from_location VARCHAR(100),
to_location VARCHAR(100),
travel_date DATE,
contact_number VARCHAR(15),
notes TEXT
);

-- Roskan: Drivers
CREATE TABLE IF NOT EXISTS drivers (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100),
license_number VARCHAR(50),
phone_number VARCHAR(15),
address TEXT
);