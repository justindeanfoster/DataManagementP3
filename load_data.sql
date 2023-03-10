COPY address_district( address, district)
FROM  '.\address_district.csv'
DELIMETER ','
CSV HEADER;

COPY size_priority(pothole_size, repair_priority)
FROM  '.\size_priority.csv'
DELIMETER ','
CSV HEADER;

COPY pothole(pothole_id, street_address,pothole_size,street_location)
FROM  '.\pothole.csv'
DELIMETER ','
CSV HEADER;

COPY property_damage(property_damage_id, citizen_name, citizen_address, citizen_phone_number, damage_type, dollar_amt, pothole_id)
FROM  '.\property_damage.csv'
DELIMETER ','
CSV HEADER;

COPY work_crew(work_crew_id, num_people)
FROM  '.\work_crew.csv'
DELIMETER ','
CSV HEADER;

COPY equipment(equipment_id, equipment_type, assigned_work_crew)
FROM  '.\work_crew.csv'
DELIMETER ','
CSV HEADER;

COPY work_order(work_order_id, pothole_id, assigned_work_crew,hrs_applied, amt_filler_used, "cost", status)
FROM  '.\work_crew.csv'
DELIMETER ','
CSV HEADER;

