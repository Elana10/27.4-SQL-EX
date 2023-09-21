DROP DATABASE medical_center_db; 
CREATE DATABASE medical_center_db; 
\c medical_center_db;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY, 
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL
);

INSERT INTO doctors (first_name, last_name)
VALUES 
('Dr. Bob', 'Ross'),
('Dr. Kermit', 'The Frog'),
('Dr. Samwise','Gamgee'),
('Dr. Hello','Goodbye');

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL
);

INSERT INTO patients (first_name, last_name)
VALUES
('Frodo','Baggins'),
('Helen','OfTroy'),
('Sister','Mary');


CREATE TABLE doctor_patient (
    id SERIAL PRIMARY KEY,
    doc INTEGER NOT NULL REFERENCES doctors,
    patient INTEGER NOT NULL REFERENCES patients
);

INSERT INTO doctor_patient (doc, patient)
VALUES 
(1,2),
(1,3),
(2,2),
(2,3),
(3,1);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY, 
    condition TEXT UNIQUE NOT NULL
);

INSERT INTO diagnosis (condition)
VALUES 
('Under Pressure'),
('Precious Metal Poisoning'),
('Short Stack'),
('Love Struck'),
('Headaches');

CREATE TABLE patient_diagnosis (
    id SERIAL PRIMARY KEY, 
    person INTEGER NOT NULL REFERENCES patients,
    issue INTEGER NOT NULL REFERENCES diagnosis
);

INSERT INTO patient_diagnosis (person, issue)
VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(2,1),
(2,3),
(2,4),
(3,3);
