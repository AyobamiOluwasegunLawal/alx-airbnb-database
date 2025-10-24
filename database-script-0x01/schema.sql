CREATE TABLE Users (
	user_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	password_hash VARCHAR(50) NOT NULL,
	phone_number VARCHAR(11) NOT NULL,
	role ENUM('guest', 'host', 'admin') NOT NULL DEFAULT 'guest',
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Property (
	property_id SERIAL PRIMARY KEY,
	 host_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(50) NOT NULL,
	description TEXT NOT NULL,
	location VARCHAR(50) NOT NULL,
	price_per_night DECIMAL NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	FOREIGN KEY (host_id) REFERENCES Users(user_id)
);

CREATE TABLE Booking (
	booking_id SERIAL PRIMARY KEY,
	property_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED	NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	total_price DECIMAL NOT NULL,
	status ENUM('pending', 'confirmed', 'cancelled') NOT NULL DEFAULT 'pending',
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

	FOREIGN KEY (property_id) REFERENCES Property(property_id),
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Payment (
	payment_id SERIAL PRIMARY KEY,
	booking_id BIGINT UNSIGNED NOT NULL,
	amount DECIMAL NOT NULL,
	payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL DEFAULT 'credit_card',

	FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE TABLE Review (
	review_id SERIAL PRIMARY KEY,
	property_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	rating INT CHECK (rating >= 1 AND rating <= 5) NOT NULL,
	comment TEXT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	FOREIGN KEY (property_id) REFERENCES Property(property_id),
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Message (
	message_id SERIAL PRIMARY KEY,
	sender_id BIGINT UNSIGNED NOT NULL,
	recipient_id BIGINT UNSIGNED NOT NULL,
	message_body TEXT NOT NULL,
	sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	FOREIGN KEY (sender_id) REFERENCES Users(user_id),
	FOREIGN KEY (recipient_id) REFERENCES Users(user_id)
);
	
