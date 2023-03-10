DROP SCHEMA IF EXISTS potholes CASCADE;
CREATE SCHEMA potholes;

SET search_path TO potholes;

CREATE TABLE address_district (
	address VARCHAR(100) PRIMARY KEY,
	district VARCHAR(50) NOT NULL
);

CREATE TABLE size_priority (
	pothole_size SERIAL PRIMARY KEY,
	repair_priority INTEGER NOT NULL
);

CREATE TABLE pothole (
	pothole_id SERIAL PRIMARY KEY,
	street_address VARCHAR(100) NOT NULL REFERENCES address_district(address),
	pothole_size INTEGER NOT NULL REFERENCES size_priority(pothole_size),
	street_location VARCHAR(20) NOT NULL
);

CREATE TABLE property_damage (
	property_damage_id SERIAL PRIMARY KEY,
	citizen_name VARCHAR(100),
	citizen_address VARCHAR(100),
	citizen_phone_number VARCHAR(15),
	damage_type VARCHAR(20),
	dollar_amt DECIMAL,
	pothole_id INTEGER REFERENCES pothole(pothole_id)
);

CREATE TABLE work_crew (
	work_crew_id SERIAL PRIMARY KEY,
	num_people INTEGER NOT NULL
);

CREATE TABLE equipment (
	equipment_id SERIAL PRIMARY KEY,
	equipment_type VARCHAR(20) NOT NULL,
	assigned_work_crew INTEGER REFERENCES work_crew(work_crew_id)
);

CREATE TABLE work_order (
	work_order_id SERIAL PRIMARY KEY,
	pothole_id INTEGER NOT NULL REFERENCES pothole(pothole_id),
	assigned_work_crew INTEGER NOT NULL REFERENCES work_crew(work_crew_id),
	hrs_applied DECIMAL NOT NULL,
	amt_filler_used DECIMAL NOT NULL,
	"cost" DECIMAL NOT NULL,
	status VARCHAR(20) NOT NULL
);



