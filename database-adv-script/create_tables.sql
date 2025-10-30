CREATE DATABASE AirBnB;

USE AirBnB;
CREATE TABLE Users (
    user_id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    role VARCHAR(10) NOT NULL DEFAULT 'guest' CHECK (role IN ('guest', 'host', 'admin')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

DROP TABLE Users;

INSERT INTO Users (first_name, last_name, email, password_hash, phone_number, role)
VALUES
('Amara', 'Okafor', 'amara.okafor@example.com', 'hash_pw1', '08012345678', 'guest'),
('Tunde', 'Bello', 'tunde.bello@example.com', 'hash_pw2', '08023456789', 'host'),
('Chika', 'Eze', 'chika.eze@example.com', 'hash_pw3', '08034567890', 'guest'),
('Ibrahim', 'Adamu', 'ibrahim.adamu@example.com', 'hash_pw4', '08045678901', 'admin'),
('Ngozi', 'Obi', 'ngozi.obi@example.com', 'hash_pw5', '08056789012', 'guest'),
('Kunle', 'Adewale', 'kunle.adewale@example.com', 'hash_pw6', '08067890123', 'host'),
('Fatima', 'Usman', 'fatima.usman@example.com', 'hash_pw7', '08078901234', 'guest'),
('David', 'Johnson', 'david.johnson@example.com', 'hash_pw8', '08089012345', 'host'),
('Lola', 'Adeyemi', 'lola.adeyemi@example.com', 'hash_pw9', '08090123456', 'guest'),
('Emeka', 'Nwosu', 'emeka.nwosu@example.com', 'hash_pw10', '08101234567', 'guest'),
('Bola', 'Ogunleye', 'bola.ogunleye@example.com', 'hash_pw11', '08111223344', 'guest'),
('Kemi', 'Akinola', 'kemi.akinola@example.com', 'hash_pw12', '08112223344', 'host'),
('Chinedu', 'Okeke', 'chinedu.okeke@example.com', 'hash_pw13', '08113323344', 'guest'),
('Halima', 'Abdullahi', 'halima.abdullahi@example.com', 'hash_pw14', '08114423344', 'guest'),
('Segun', 'Olumide', 'segun.olumide@example.com', 'hash_pw15', '08115523344', 'host'),
('Aisha', 'Mohammed', 'aisha.mohammed@example.com', 'hash_pw16', '08116623344', 'guest'),
('Tope', 'Adebanjo', 'tope.adebanjo@example.com', 'hash_pw17', '08117723344', 'guest'),
('Uche', 'Okoro', 'uche.okoro@example.com', 'hash_pw18', '08118823344', 'guest'),
('Tosin', 'Adeniran', 'tosin.adeniran@example.com', 'hash_pw19', '08119923344', 'host'),
('Grace', 'Ojo', 'grace.ojo@example.com', 'hash_pw20', '08120023344', 'guest'),
('Michael', 'Oladipo', 'michael.oladipo@example.com', 'hash_pw21', '08121123344', 'guest'),
('Ruth', 'Nnamdi', 'ruth.nnamdi@example.com', 'hash_pw22', '08122223344', 'guest'),
('Samuel', 'Okon', 'samuel.okon@example.com', 'hash_pw23', '08123323344', 'host'),
('Patience', 'Lawal', 'patience.lawal@example.com', 'hash_pw24', '08124423344', 'guest'),
('Zainab', 'Yusuf', 'zainab.yusuf@example.com', 'hash_pw25', '08125523344', 'guest'),
('Olu', 'Ajayi', 'olu.ajayi@example.com', 'hash_pw26', '08126623344', 'host'),
('Blessing', 'Ekpo', 'blessing.ekpo@example.com', 'hash_pw27', '08127723344', 'guest'),
('Bamidele', 'Ogun', 'bamidele.ogun@example.com', 'hash_pw28', '08128823344', 'guest'),
('Ify', 'Ekwueme', 'ify.ekwueme@example.com', 'hash_pw29', '08129923344', 'guest'),
('Rasaq', 'Ibrahim', 'rasaq.ibrahim@example.com', 'hash_pw30', '08130023344', 'guest'),
('Omotola', 'Afolabi', 'omotola.afolabi@example.com', 'hash_pw31', '08131123344', 'guest'),
('Sadiq', 'Aliyu', 'sadiq.aliyu@example.com', 'hash_pw32', '08132223344', 'guest'),
('Chisom', 'Nwankwo', 'chisom.nwankwo@example.com', 'hash_pw33', '08133323344', 'guest'),
('Efe', 'Igwe', 'efe.igwe@example.com', 'hash_pw34', '08134423344', 'guest'),
('Opeyemi', 'Ogunlana', 'opeyemi.ogunlana@example.com', 'hash_pw35', '08135523344', 'host'),
('Ada', 'Okafor', 'ada.okafor@example.com', 'hash_pw36', '08136623344', 'guest'),
('Tomiwa', 'Bamidele', 'tomiwa.bamidele@example.com', 'hash_pw37', '08137723344', 'guest'),
('Yetunde', 'Olawale', 'yetunde.olawale@example.com', 'hash_pw38', '08138823344', 'guest'),
('Olamide', 'Sule', 'olamide.sule@example.com', 'hash_pw39', '08139923344', 'guest'),
('Ifeoma', 'Chukwu', 'ifeoma.chukwu@example.com', 'hash_pw40', '08140023344', 'guest'),
('Abdul', 'Karim', 'abdul.karim@example.com', 'hash_pw41', '08141123344', 'guest'),
('Mercy', 'John', 'mercy.john@example.com', 'hash_pw42', '08142223344', 'guest'),
('Paul', 'George', 'paul.george@example.com', 'hash_pw43', '08143323344', 'guest'),
('Rita', 'Eze', 'rita.eze@example.com', 'hash_pw44', '08144423344', 'guest'),
('Nura', 'Garba', 'nura.garba@example.com', 'hash_pw45', '08145523344', 'guest'),
('Uduak', 'Essien', 'uduak.essien@example.com', 'hash_pw46', '08146623344', 'guest'),
('Ishaq', 'Abubakar', 'ishaq.abubakar@example.com', 'hash_pw47', '08147723344', 'guest'),
('Juliet', 'Obi', 'juliet.obi@example.com', 'hash_pw48', '08148823344', 'guest'),
('Ovie', 'Oghene', 'ovie.oghene@example.com', 'hash_pw49', '08149923344', 'host'),
('Mariam', 'Ali', 'mariam.ali@example.com', 'hash_pw50', '08150023344', 'guest');


CREATE TABLE Property (
    property_id CHAR(36) PRIMARY KEY default(UUID()),
    host_id CHAR(36) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(100) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_host_id_user_id FOREIGN KEY (host_id) REFERENCES Users(user_id)
);


INSERT INTO Property (host_id, name, description, location, price_per_night)
VALUES
('b068ebd7-b4ec-11f0-814d-00155dce263b', 'Abuja Serenity Villa', 'Luxury villa in a quiet neighborhood with private pool.', 'Abuja', 45000.00),
('b068f160-b4ec-11f0-814d-00155dce263b', 'Lagos Lagoon Apartment', 'A cozy 2-bedroom apartment overlooking the Lagos Lagoon.', 'Lagos', 25000.00),
('b068f5ed-b4ec-11f0-814d-00155dce263b', 'Ibadan Green Cottage', 'Eco-friendly 1-bedroom cottage surrounded by lush gardens.', 'Ibadan', 18000.00),
('b068f923-b4ec-11f0-814d-00155dce263b', 'Lekki Studio Suite', 'Compact modern suite close to Lekki Phase 1.', 'Lagos', 20000.00),
('b068fb89-b4ec-11f0-814d-00155dce263b', 'Port Harcourt Riverside House', 'Spacious house with modern amenities and river view.', 'Port Harcourt', 38000.00),
('b068fd90-b4ec-11f0-814d-00155dce263b', 'Kano Royal Villa', 'Traditional villa redesigned with luxury fittings.', 'Kano', 30000.00),
('b0690610-b4ec-11f0-814d-00155dce263b', 'Abeokuta Heritage Bungalow', 'Rustic 3-bedroom home built with local materials.', 'Abeokuta', 22000.00),
('b0690d58-b4ec-11f0-814d-00155dce263b', 'Enugu Hillside Apartment', 'Spacious apartment with a beautiful hillside view.', 'Enugu', 27000.00);

CREATE TABLE Booking (
    booking_id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK(status IN ('pending', 'confirmed', 'cancelled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_booking_property FOREIGN KEY(property_id) REFERENCES Property(property_id),
    CONSTRAINT fk_booking_user FOREIGN KEY(user_id) REFERENCES Users(user_id)
)

DROP TABLE Booking;

INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status) VALUES
('830c72c4-b4f0-11f0-814d-00155dce263b', 'b068ebd7-b4ec-11f0-814d-00155dce263b', '2025-11-10', '2025-11-15', 500.00, 'confirmed'),
('830ca8d6-b4f0-11f0-814d-00155dce263b', 'b068efd3-b4ec-11f0-814d-00155dce263b', '2025-12-01', '2025-12-05', 420.00, 'pending'),
('830cab46-b4f0-11f0-814d-00155dce263b', 'b068f0ea-b4ec-11f0-814d-00155dce263b', '2025-12-20', '2025-12-25', 750.00, 'confirmed'),
('830cad6c-b4f0-11f0-814d-00155dce263b', 'b068f1e7-b4ec-11f0-814d-00155dce263b', '2025-11-18', '2025-11-22', 380.00, 'cancelled'),
('830cb5bd-b4f0-11f0-814d-00155dce263b', 'b068f307-b4ec-11f0-814d-00155dce263b', '2025-11-25', '2025-11-30', 620.00, 'confirmed'),
('830cb758-b4f0-11f0-814d-00155dce263b', 'b068f385-b4ec-11f0-814d-00155dce263b', '2025-12-10', '2025-12-14', 480.00, 'pending'),
('830cc509-b4f0-11f0-814d-00155dce263b', 'b068f40f-b4ec-11f0-814d-00155dce263b', '2025-12-02', '2025-12-06', 520.00, 'confirmed'),
('830cad6c-b4f0-11f0-814d-00155dce263b', 'b068f53e-b4ec-11f0-814d-00155dce263b', '2025-12-05', '2025-12-08', 310.00, 'confirmed'),
('830cb5bd-b4f0-11f0-814d-00155dce263b', 'b068f599-b4ec-11f0-814d-00155dce263b', '2025-11-12', '2025-11-15', 260.00, 'pending'),
('830cc509-b4f0-11f0-814d-00155dce263b', 'b068f65d-b4ec-11f0-814d-00155dce263b', '2025-12-03', '2025-12-07', 400.00, 'cancelled'),
('830c72c4-b4f0-11f0-814d-00155dce263b', 'b068f7ff-b4ec-11f0-814d-00155dce263b', '2025-11-22', '2025-11-26', 560.00, 'confirmed'),
('830c9d17-b4f0-11f0-814d-00155dce263b', 'b068f89b-b4ec-11f0-814d-00155dce263b', '2025-12-18', '2025-12-22', 610.00, 'confirmed'),
('830ca8d6-b4f0-11f0-814d-00155dce263b', 'b068f9bb-b4ec-11f0-814d-00155dce263b', '2025-12-05', '2025-12-09', 450.00, 'pending'),
('830cad6c-b4f0-11f0-814d-00155dce263b', 'b068fa61-b4ec-11f0-814d-00155dce263b', '2025-12-12', '2025-12-15', 320.00, 'confirmed'),
('830cb5bd-b4f0-11f0-814d-00155dce263b', 'b068faf3-b4ec-11f0-814d-00155dce263b', '2025-12-14', '2025-12-18', 510.00, 'cancelled'),
('830cb5bd-b4f0-11f0-814d-00155dce263b', 'b068fc3c-b4ec-11f0-814d-00155dce263b', '2025-12-01', '2025-12-05', 450.00, 'confirmed'),
('830cb5bd-b4f0-11f0-814d-00155dce263b', 'b068fcef-b4ec-11f0-814d-00155dce263b', '2025-12-07', '2025-12-12', 530.00, 'confirmed'),
('830c9d17-b4f0-11f0-814d-00155dce263b', 'b068fe1c-b4ec-11f0-814d-00155dce263b', '2025-12-20', '2025-12-25', 700.00, 'pending'),
('830cb5bd-b4f0-11f0-814d-00155dce263b', 'b068feaa-b4ec-11f0-814d-00155dce263b', '2025-12-24', '2025-12-28', 590.00, 'confirmed'),
('830cc509-b4f0-11f0-814d-00155dce263b', 'b068ff50-b4ec-11f0-814d-00155dce263b', '2025-12-02', '2025-12-06', 400.00, 'pending'),
('830cab46-b4f0-11f0-814d-00155dce263b', 'b0690002-b4ec-11f0-814d-00155dce263b', '2025-11-15', '2025-11-20', 475.00, 'confirmed'),
('830ca8d6-b4f0-11f0-814d-00155dce263b', 'b0690373-b4ec-11f0-814d-00155dce263b', '2025-11-25', '2025-11-28', 360.00, 'confirmed');

SELECT * FROM Users;

create table Payment(
    payment_id char(36) primary key default (uuid()), 
    booking_id char(36) not null, 
    amount decimal(10, 2) not null, 
    payment_date timestamp default 
    current_timestamp, 
    payment_method varchar(20) not null check(payment_method in ('credit_card', 'paypal', 'stripe'))
);

create table Review (
    review_id char(36) Primary key default (uuid()), 
    property_id char(36) not null, 
    user_id char(36) not null, 
    rating int not null check(rating >= 1 and rating <= 5), 
    comment text not null, created_at timestamp default current_timestamp
);


-- RUN QUERIES BELOW --

SELECT * FROM Users AS u INNER JOIN Booking AS b ON u.user_id = b.user_id;

SELECT * FROM Property AS p where (SELECT AVG(rating) FROM Review AS r where
(p.property_id = r.property_id)) > 4;
-- RUN QUERIES --