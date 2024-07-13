CREATE TABLE IF NOT EXISTS Environmentalist(
    EnvironmentalistID INT(5) NOT NULL,
    PRIMARY KEY (EnvironmentalistID),
    FirstName VARCHAR(10),
    LastName VARCHAR(10),
    ContactEmail VARCHAR(20),
    ExpertiseArea VARCHAR(50),
    Certification VARCHAR(10),
    MembershipStatus CHAR(3),
    JoinDate DATE,
    LastLoginDate DATE,
    INDEX (EnvironmentalistID)
);

CREATE TABLE IF NOT EXISTS Project(
    ProjectID INT(5) NOT NULL,
    PRIMARY KEY (ProjectID),
    ProjectName VARCHAR(50),
    ProjectDescription TEXT,
    StartDate DATE,
    EndDate DATE,
    FundingSource VARCHAR(50),
    EnvironmentalistID INT(5),
    INDEX (EnvironmentalistID), -- Adding index before creating foreign key constraint
    FOREIGN KEY (EnvironmentalistID) REFERENCES Environmentalist(EnvironmentalistID),
    Collaborators VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Sensor(
    SensorID INT(5) NOT NULL,
    SensorType VARCHAR(50),
    Manufacturer VARCHAR(50),
    PRIMARY KEY(SensorID),
    InstallationDate DATE,
    CalibrationDate DATE,
    MeasurementUnit VARCHAR(50),
    Accuracy FLOAT(5),
    PowerConsumption DECIMAL(5),
    SensingRange DECIMAL(5)
);

CREATE TABLE IF NOT EXISTS Location(
    LocationID INT(5) NOT NULL,
    PRIMARY KEY(LocationID),
    LocationName VARCHAR(50),
    Latitude DECIMAL(5),
    Longitude DECIMAL(5),
    Country VARCHAR(50),
    Region VARCHAR(50),
    Elevation DECIMAL(5),
    Climate VARCHAR(50),
    SoilType VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Measurement (
    MeasurementID INT(5) AUTO_INCREMENT,
    PRIMARY KEY (MeasurementID),
    SensorID INT(5) NOT NULL,
    FOREIGN KEY (SensorID) REFERENCES Sensor(SensorID),
    LocationID INT(5) NOT NULL,
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
    MeasurementType VARCHAR(50),
    MeasurementValue DECIMAL(5),
    MeasurementTime DATETIME,
    DataQuality VARCHAR(50),
    WeatherConditions TEXT,
    AnalysisResults TEXT,
    Interpretation TEXT
);

CREATE TABLE IF NOT EXISTS CalibrationRecord(
    CalibrationRecordID INT(5) NOT NULL,
    PRIMARY KEY(CalibrationRecordID),
    SensorID INT(5),
    FOREIGN KEY (SensorID) REFERENCES Sensor(SensorID),
    CalibrationDate DATE,
    CalibratedBy DECIMAL(5),
    CalibrationResults DECIMAL(5),
    NextCalibrationDueDate DATE
);

CREATE TABLE IF NOT EXISTS DataLog(
    LogID INT(5) NOT NULL,
    PRIMARY KEY(LogID),
    SensorID INT(5) NOT NULL,
    FOREIGN KEY (SensorID) REFERENCES Sensor(SensorID),
    MeasurementID INT(5) NOT NULL,
    FOREIGN KEY (MeasurementID) REFERENCES Measurement(MeasurementID),
    LogTimestamp DATETIME,
    LogDetails DECIMAL(5),
    LogType VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Alert(
    AlertID INT(5) NOT NULL,
    PRIMARY KEY(AlertID),
    SensorID INT(5) NOT NULL,
    FOREIGN KEY (SensorID) REFERENCES Sensor(SensorID),
    MeasurementID INT(5) NOT NULL,
    FOREIGN KEY (MeasurementID) REFERENCES Measurement(MeasurementID),
    AlertTimestamp DATETIME,
    AlertType CHAR(40),
    AlertDetails TEXT,
    AlertStatus VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS AnalysisReport(
    ReportID INT(5) NOT NULL,
    PRIMARY KEY(ReportID), 
    MeasurementID INT(5) NOT NULL,
    FOREIGN KEY (MeasurementID) REFERENCES Measurement(MeasurementID),
    ReportTitle VARCHAR(50),
    ReportDate DATE,
    AnalystID INT(5) NOT NULL,
    FOREIGN KEY (AnalystID) REFERENCES Environmentalist(EnvironmentalistID),
    ReportContent TEXT
);

CREATE TABLE IF NOT EXISTS MaintenanceLog(
    MaintenanceLogID INT(5) NOT NULL,
    PRIMARY KEY(MaintenanceLogID),
    SensorID INT(5) NOT NULL,
    FOREIGN KEY (SensorID) REFERENCES Sensor(SensorID),
    MaintenanceDate DATE,
    MaintenancePerformedBy VARCHAR(50),
    MaintenanceDetails VARCHAR(50),
    DowntimeDuration TIME,
    MaintenanceCost INT(5)
);

CREATE TABLE IF NOT EXISTS Temperature(
    SensorID INT(5) NOT NULL,
    TemperatureRange VARCHAR(50),
    Accuracy DECIMAL(10,2),
    FOREIGN KEY (SensorID) REFERENCES Sensor(SensorID)
);

CREATE TABLE IF NOT EXISTS Humidity(
    SensorID INT(5) NOT NULL,
    HumidityRange VARCHAR(50),
    Accuracy DECIMAL(10,2),
    FOREIGN KEY (SensorID) REFERENCES Sensor(SensorID)
);

CREATE TABLE IF NOT EXISTS Pressure(
    SensorID INT(5) NOT NULL,
    PressureRange VARCHAR(50),
    Accuracy DECIMAL(10,2),
    FOREIGN KEY (SensorID) REFERENCES Sensor(SensorID)
);

CREATE TABLE IF NOT EXISTS Windspeed(
    SensorID INT(5) NOT NULL,
    WindspeedRange VARCHAR(50),
    Accuracy DECIMAL(10,2),
    FOREIGN KEY (SensorID) REFERENCES Sensor(SensorID)
);


INSERT INTO Environmentalist (EnvironmentalistID, FirstName, LastName, ContactEmail, ExpertiseArea, Certification, MembershipStatus, JoinDate, LastLoginDate) 
VALUES 
(401, 'Emily', 'Adams', 'emily@example.com', 'Sustainability', 'SUS101', 'ACT', '2023-04-10', '2024-02-25'), 
(402, 'David', 'Clark', 'david@example.com', 'Renewable Energy', 'REN201', 'INA', '2023-05-20', '2024-02-28'), 
(403, 'Sophia', 'Evans', 'sophia@example.com', 'Environmental Policy', 'EPO301', 'ACT', '2023-06-15', '2024-03-05'), 
(404, 'James', 'Ford', 'james@example.com', 'Climate Change', 'CCC401', 'INA', '2023-07-05', '2024-03-10'), 
(405, 'Olivia', 'Garcia', 'olivia@example.com', 'Water Conservation', 'WCO501', 'ACT', '2023-08-12', '2024-03-15'), 
(406, 'Michael', 'Harris', 'michael@example.com', 'Ecological Restoration', 'ECO601', 'INA', '2023-09-01', '2024-03-20'), 
(407, 'Emma', 'Jones', 'emma@example.com', 'Biodiversity', 'BIO701', 'ACT', '2023-10-02', '2024-03-25'), 
(408, 'William', 'King', 'william@example.com', 'Green Building', 'GRB801', 'INA', '2023-11-15', '2024-03-30'), 
(409, 'Ava', 'Lee', 'ava@example.com', 'Waste Management', 'WMA901', 'ACT', '2023-12-20', '2024-04-05'), 
(410, 'Daniel', 'Miller', 'daniel@example.com', 'Environmental Education', 'EED101', 'INA', '2024-01-05', '2024-04-10');


INSERT INTO Project (ProjectID, ProjectName, ProjectDescription, StartDate, EndDate, FundingSource, EnvironmentalistID, Collaborators)
VALUES
(501, 'Solar Power Initiative', 'Implementing solar panels in urban areas', '2023-04-15', '2023-12-31', 'Government Grant', 401, 'Solar Energy Solutions'),
(502, 'Coastal Cleanup Campaign', 'Cleaning up beaches and coastal areas', '2023-05-25', '2023-11-30', 'NGO Funding', 402, 'Coastal Guardians'),
(503, 'Urban Gardening Project', 'Promoting community gardens in cities', '2023-06-10', '2024-06-30', 'Private Donation', 403, 'Green Thumb Society'),
(504, 'Renewable Energy Research', 'Researching new renewable energy technologies', '2023-07-05', '2024-07-31', 'Government Grant', 404, 'Renewable Energy Lab'),
(505, 'Water Quality Assessment', 'Assessing water quality in rivers and lakes', '2023-08-20', '2024-08-31', 'Foundation Grant', 405, 'Water Quality Institute'),
(506, 'Ecosystem Restoration Initiative', 'Restoring degraded ecosystems', '2023-09-15', '2024-09-30', 'NGO Funding', 406, 'Eco Restoration Group'),
(507, 'Green Infrastructure Development', 'Developing sustainable infrastructure', '2023-10-10', '2024-10-31', 'Government Grant', 407, 'Green Infrastructure Consortium'),
(508, 'Zero Waste Program', 'Implementing waste reduction strategies', '2023-11-20', '2024-11-30', 'Private Donation', 408, 'Zero Waste Alliance'),
(509, 'Environmental Education Outreach', 'Educating communities about environmental issues', '2023-12-05', '2025-01-31', 'NGO Funding', 409, 'Environmental Education Network'),
(510, 'Climate Adaptation Planning', 'Developing strategies for climate change adaptation', '2024-01-10', '2025-02-28', 'Government Grant', 410, 'Climate Resilience Task Force');

INSERT INTO Sensor (SensorID, SensorType, Manufacturer, InstallationDate, CalibrationDate, MeasurementUnit, Accuracy, PowerConsumption, SensingRange)
VALUES
(601, 'Temperature', 'ClimateTech', '2023-01-15', '2023-01-20', 'Celsius', 0.1, 5.0, 50.0),
(602, 'Humidity', 'EnviroSensors', '2023-02-25', '2023-03-01', 'Percentage', 1.0, 7.0, 100.0),
(603, 'Pressure', 'AtmoTech', '2023-03-20', '2023-03-25', 'Pascal', 0.5, 6.0, 1000.0),
(604, 'Wind Speed', 'MeteorTech', '2023-04-10', '2023-04-15', 'm/s', 0.2, 8.0, 50.0),
(605, 'Air Quality', 'EcoSolutions', '2023-05-15', '2023-05-20', 'PPM', 1.0, 10.0, 500.0),
(606, 'Soil Moisture', 'AgriSensors', '2023-06-20', '2023-06-25', 'Percentage', 1.0, 7.0, 100.0),
(607, 'Light Intensity', 'LuminoTech', '2023-07-25', '2023-07-30', 'Lux', 1.0, 5.0, 1000.0),
(608, 'Sound Level', 'AcousticTech', '2023-08-10', '2023-08-15', 'dB', 0.5, 8.0, 120.0),
(609, 'Water Level', 'AquaSensors', '2023-09-05', '2023-09-10', 'Meter', 0.2, 10.0, 20.0),
(610, 'CO2 Concentration', 'EnviroSolutions', '2023-10-15', '2023-10-20', 'PPM', 2.0, 6.0, 10000.0);

INSERT INTO Location (LocationID, LocationName, Latitude, Longitude, Country, Region, Elevation, Climate, SoilType)
VALUES
(701, 'City Park', 40.7128, -74.0060, 'USA', 'Northeast', 10.0, 'Temperate', 'Loam'),
(702, 'River Delta', 34.0522, -118.2437, 'USA', 'West', 5.0, 'Mediterranean', 'Silt'),
(703, 'Forest Reserve', 45.4215, -75.6919, 'Canada', 'Ontario', 300.0, 'Boreal', 'Podzol'),
(704, 'Urban Area', 51.5074, -0.1278, 'UK', 'London', 20.0, 'Temperate', 'Clay'),
(705, 'Mountain Range', 47.6062, -122.3321, 'USA', 'Pacific Northwest', 1000.0, 'Alpine', 'Rocky'),
(706, 'Desert Oasis', 36.7783, -119.4179, 'USA', 'Southwest', 200.0, 'Desert', 'Sand'),
(707, 'Tropical Rainforest', -3.4653, -62.2159, 'Brazil', 'Amazon', 100.0, 'Tropical', 'Laterite'),
(708, 'Coastal Area', -33.8688, 151.2093, 'Australia', 'Sydney', 5.0, 'Mediterranean', 'Sand'),
(709, 'Arctic Region', 78.2232, 15.6267, 'Norway', 'Svalbard', 50.0, 'Arctic', 'Permafrost'),
(710, 'Island Ecosystem', 21.3069, -157.8583, 'USA', 'Hawaii', 100.0, 'Tropical', 'Volcanic Soil');

INSERT INTO Measurement (SensorID, LocationID, MeasurementType, MeasurementValue, MeasurementTime, DataQuality, WeatherConditions, AnalysisResults, Interpretation)
VALUES
(601, 701, 'Temperature', 20.5, '2023-01-20 08:00:00', 'Good', 'Sunny', 'Normal', 'Stable'),
(602, 702, 'Humidity', 60.0, '2023-02-25 12:00:00', 'Excellent', 'Partly Cloudy', 'Normal', 'Optimal'),
(603, 703, 'Pressure', 101.3, '2023-03-20 16:00:00', 'Good', 'Rainy', 'Normal', 'Stable'),
(604, 704, 'Wind Speed', 12.0, '2023-04-10 14:00:00', 'Good', 'Windy', 'Normal', 'Stable'),
(605, 705, 'Air Quality', 50.0, '2023-05-15 10:00:00', 'Fair', 'Clear', 'Normal', 'Acceptable'),
(606, 706, 'Soil Moisture', 35.0, '2023-06-20 12:00:00', 'Good', 'Sunny', 'Normal', 'Optimal'),
(607, 707, 'Light Intensity', 8000.0, '2023-07-25 15:00:00', 'Good', 'Sunny', 'Normal', 'Optimal'),
(608, 708, 'Sound Level', 70.0, '2023-08-10 13:00:00', 'Fair', 'Noisy', 'Normal', 'Acceptable'),
(609, 709, 'Water Level', 15.0, '2023-09-05 11:00:00', 'Good', 'Rainy', 'Normal', 'Stable'),
(610, 710, 'CO2 Concentration', 500.0, '2023-10-15 09:00:00', 'Fair', 'Clear', 'Normal', 'Acceptable');

INSERT INTO CalibrationRecord (CalibrationRecordID, SensorID, CalibrationDate, CalibratedBy, CalibrationResults, NextCalibrationDueDate)
VALUES
(801, 601, '2023-01-20', 12345, 0.09, '2023-07-20'),
(802, 602, '2023-02-25', 54321, 0.98, '2023-08-25'),
(803, 603, '2023-03-20', 98765, 0.49, '2023-09-20'),
(804, 604, '2023-04-15', 13579, 0.88, '2023-10-15'),
(805, 605, '2023-05-20', 24680, 0.75, '2023-11-20'),
(806, 606, '2023-06-25', 13579, 0.92, '2023-12-25'),
(807, 607, '2023-07-30', 98765, 0.83, '2024-01-30'),
(808, 608, '2023-08-15', 24680, 0.95, '2024-02-15'),
(809, 609, '2023-09-10', 12345, 0.87, '2024-03-10'),
(810, 610, '2023-10-20', 54321, 0.81, '2024-04-20');

INSERT INTO DataLog (LogID, SensorID, MeasurementID, LogTimestamp, LogDetails, LogType)
VALUES
(901, 601, 1, '2023-01-20 08:00:00', 0.1, 'Info'),
(902, 602, 2, '2023-02-25 12:00:00', 0.5, 'Warning'),
(903, 603, 3, '2023-03-20 16:00:00', 0.3, 'Error'),
(904, 604, 4, '2023-04-10 14:00:00', 0.2, 'Info'),
(905, 605, 5, '2023-05-15 10:00:00', 0.4, 'Warning'),
(906, 606, 6, '2023-06-20 12:00:00', 0.6, 'Error'),
(907, 607, 7, '2023-07-25 15:00:00', 0.3, 'Info'),
(908, 608, 8, '2023-08-10 13:00:00', 0.7, 'Warning'),
(909, 609, 9, '2023-09-05 11:00:00', 0.2, 'Error'),
(910, 610, 10, '2023-10-15 09:00:00', 0.8, 'Info');

INSERT INTO Alert (AlertID, SensorID, MeasurementID, AlertTimestamp, AlertType, AlertDetails, AlertStatus)
VALUES
(1001, 601, 1, '2023-01-20 08:00:00', 'TEMP', 'Temperature exceeds normal range', 'Open'),
(1002, 602, 2, '2023-02-25 12:00:00', 'HUM', 'Humidity level critically low', 'Closed'),
(1003, 603, 3, '2023-03-20 16:00:00', 'PRESS', 'Pressure sensor malfunction', 'Open'),
(1004, 604, 4, '2023-04-10 14:00:00', 'WIND', 'Wind speed too high', 'Closed'),
(1005, 605, 5, '2023-05-15 10:00:00', 'AIRQ', 'Air quality below acceptable level', 'Open'),
(1006, 606, 6, '2023-06-20 12:00:00', 'MOIST', 'Soil moisture too low', 'Closed'),
(1007, 607, 7, '2023-07-25 15:00:00', 'LIGHT', 'Light intensity too high', 'Open'),
(1008, 608, 8, '2023-08-10 13:00:00', 'SOUND', 'Sound level exceeds threshold', 'Closed'),
(1009, 609, 9, '2023-09-05 11:00:00', 'WATER', 'Water level dangerously high', 'Open'),
(1010, 610, 10, '2023-10-15 09:00:00', 'CO2', 'CO2 concentration above safe limit', 'Closed');

INSERT INTO AnalysisReport (ReportID, MeasurementID, ReportTitle, ReportDate, AnalystID, ReportContent)
VALUES
(1101, 1, 'Temperature Analysis', '2023-01-25', 401, 'Temperature within acceptable range.'),
(1102, 2, 'Humidity Analysis', '2023-03-01', 402, 'Humidity level stabilized.'),
(1103, 3, 'Pressure Analysis', '2023-04-01', 403, 'Pressure readings consistent.'),
(1104, 4, 'Wind Speed Analysis', '2023-05-01', 404, 'Wind speed within safe limits.'),
(1105, 5, 'Air Quality Analysis', '2023-06-01', 405, 'Air quality improved.'),
(1106, 6, 'Soil Moisture Analysis', '2023-07-01', 406, 'Soil moisture levels optimized.'),
(1107, 7, 'Light Intensity Analysis', '2023-08-01', 407, 'Light intensity within desired range.'),
(1108, 8, 'Sound Level Analysis', '2023-09-01', 408, 'Sound level acceptable.'),
(1109, 9, 'Water Level Analysis', '2023-10-01', 409, 'Water level normal.'),
(1110, 10, 'CO2 Concentration Analysis', '2023-11-01', 410, 'CO2 concentration controlled.');

INSERT INTO MaintenanceLog (MaintenanceLogID, SensorID, MaintenanceDate, MaintenancePerformedBy, MaintenanceDetails, DowntimeDuration, MaintenanceCost) 
VALUES 
(1201, 601, '2023-01-30', 'John', 'Sensor cleaning', '02:00:00', 50), 
(1202, 602, '2023-03-05', 'Alice', 'Sensor recalibration', '04:00:00', 100), 
(1203, 603, '2023-04-05', 'Bob', 'Replacement of faulty part', '03:30:00', 75), 
(1204, 604, '2023-05-10', 'Charlie', 'Wind speed sensor calibration', '01:30:00', 60), 
(1205, 605, '2023-06-15', 'David', 'Air quality sensor replacement', '02:30:00', 80), 
(1206, 606, '2023-07-20', 'Emily', 'Soil moisture sensor calibration', '03:00:00', 90), 
(1207, 607, '2023-08-25', 'Sophia', 'Light intensity sensor cleaning', '01:00:00', 40), 
(1208, 608, '2023-09-30', 'James', 'Sound level sensor recalibration', '02:00:00', 70), 
(1209, 609, '2023-11-05', 'Olivia', 'Water level sensor replacement', '03:30:00', 100), 
(1210, 610, '2023-12-10', 'Michael', 'CO2 sensor calibration', '01:45:00', 55);

INSERT INTO Temperature (SensorID, TemperatureRange, Accuracy)
VALUES
(601, '-20°C to 50°C', 0.1),
(602, '-10°C to 70°C', 0.2),
(603, '-30°C to 40°C', 0.15),
(604, '-15°C to 60°C', 0.3),
(605, '-5°C to 80°C', 0.25),
(606, '-25°C to 30°C', 0.2),
(607, '0°C to 100°C', 0.1),
(608, '-20°C to 70°C', 0.2),
(609, '-10°C to 60°C', 0.25),
(610, '-30°C to 50°C', 0.15);

INSERT INTO Humidity (SensorID, HumidityRange, Accuracy)
VALUES
(611, '0% to 100%', 1.0),
(612, '0% to 100%', 1.0),
(613, '0% to 100%', 1.0),
(614, '0% to 100%', 1.0),
(615, '0% to 100%', 1.0),
(616, '0% to 100%', 1.0),
(617, '0% to 100%', 1.0),
(618, '0% to 100%', 1.0),
(619, '0% to 100%', 1.0),
(620, '0% to 100%', 1.0);

INSERT INTO Pressure (SensorID, PressureRange, Accuracy)
VALUES
(621, '800 hPa to 1100 hPa', 0.5),
(622, '800 hPa to 1100 hPa', 0.5),
(623, '800 hPa to 1100 hPa', 0.5),
(624, '800 hPa to 1100 hPa', 0.5),
(625, '800 hPa to 1100 hPa', 0.5),
(626, '800 hPa to 1100 hPa', 0.5),
(627, '800 hPa to 1100 hPa', 0.5),
(628, '800 hPa to 1100 hPa', 0.5),
(629, '800 hPa to 1100 hPa', 0.5),
(630, '800 hPa to 1100 hPa', 0.5);

INSERT INTO Windspeed (SensorID, WindspeedRange, Accuracy)
VALUES
(631, '0 m/s to 50 m/s', 0.1),
(632, '0 m/s to 50 m/s', 0.1),
(633, '0 m/s to 50 m/s', 0.1),
(634, '0 m/s to 50 m/s', 0.1),
(635, '0 m/s to 50 m/s', 0.1),
(636, '0 m/s to 50 m/s', 0.1),
(637, '0 m/s to 50 m/s', 0.1),
(638, '0 m/s to 50 m/s', 0.1),
(639, '0 m/s to 50 m/s', 0.1),
(640, '0 m/s to 50 m/s', 0.1);

INSERT INTO Temperature (SensorID, TemperatureRange, Accuracy)
SELECT SensorID, '-20°C to 50°C', 0.1 FROM Sensor WHERE SensorType = 'Temperature';

INSERT INTO Humidity (SensorID, HumidityRange, Accuracy)
SELECT SensorID, '0% to 100%', 1.0 FROM Sensor WHERE SensorType = 'Humidity';

INSERT INTO Pressure (SensorID, PressureRange, Accuracy)
SELECT SensorID, '800 hPa to 1100 hPa', 0.5 FROM Sensor WHERE SensorType = 'Pressure';

INSERT INTO Windspeed (SensorID, WindspeedRange, Accuracy)
SELECT SensorID, '0 m/s to 50 m/s', 0.1 FROM Sensor WHERE SensorType = 'Wind Speed';

select * from environmentalist;
select * from project;
select * from sensor;
select * from location;
select * from measurement;
select * from calibrationrecord;
select * from datalog;
select * from alert;
select * from analysisreport;
select * from maintenancelog;
select * from temperature
where Accuracy > 0.15;

select * from sensor
where sensortype = 'Air Quality';
