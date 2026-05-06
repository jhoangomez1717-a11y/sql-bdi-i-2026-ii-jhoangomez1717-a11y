Table departments {
  department_code varchar(10) [pk]
  department_name varchar(100) [not null]
}

Table municipalities {
  municipality_code varchar(10) [pk]
  municipality_name varchar(100) [not null]
  department_code varchar(10) [not null, ref: > departments.department_code]
}

Table addresses {
  address_id serial [pk]
  municipality_code varchar(10) [not null, ref: > municipalities.municipality_code]
  address_line varchar(200) [not null]
  postal_code varchar(20)
  active boolean
}

Table document_types {
  document_type_id serial [pk]
  type_name varchar(50) [not null]
  type_code varchar(10) [not null]
  description text
}

Table patients {
  patient_id serial [pk]
  first_name varchar(50) [not null]
  middle_name varchar(50)
  first_surname varchar(50) [not null]
  second_surname varchar(50)
  birth_date date [not null]
  gender char(1) [not null]
  email varchar(100)
  document_type_id int [not null, ref: > document_types.document_type_id]
  document_number varchar(50) [not null]
  registration_date timestamp
  active boolean
}

Table patient_phones {
  patient_phone_id serial [pk]
  patient_id int [not null, ref: > patients.patient_id]
  phone_type varchar(20) [not null]
  phone_number varchar(20) [not null]
  is_primary boolean
}

Table patient_addresses {
  patient_address_id serial [pk]
  patient_id int [not null, ref: > patients.patient_id]
  address_id int [not null, ref: > addresses.address_id]
  address_type varchar(20) [not null]
  is_primary boolean
  valid_from date
  valid_to date
}

Table doctors {
  doctor_id serial [pk]
  internal_code varchar(20) [not null]
  medical_license_number varchar(50) [not null]
  first_name varchar(100) [not null]
  last_name varchar(100) [not null]
}

Table doctor_addresses {
  doctor_address_id serial [pk]
  doctor_id int [not null, ref: > doctors.doctor_id]
  address_id int [not null, ref: > addresses.address_id]
  address_type varchar(20) [not null]
}

Table doctor_specialties {
  doctor_specialty_id serial [pk]
  doctor_id int [not null, ref: > doctors.doctor_id]
  specialty_id int [not null]
  certification_date date
  is_active boolean
}

Table rooms {
  room_id serial [pk]
  room_name varchar(50) [not null]
  room_type varchar(50) [not null]
}

Table patient_allergies {
  patient_allergy_id serial [pk]
  patient_id int [not null, ref: > patients.patient_id]
  medication_id int [not null]
  severity varchar(20) [not null]
  reaction_description text
  diagnosed_date date
}