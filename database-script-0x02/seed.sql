INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
(1, 'Amara', 'Okafor', 'amara.okafor@example.com', 'hash_pw1', '08012345678', 'guest', '2025-01-05 10:20:00'),
(2, 'Tunde', 'Bello', 'tunde.bello@example.com', 'hash_pw2', '08023456789', 'host', '2025-02-10 09:00:00'),
(3, 'Chika', 'Eze', 'chika.eze@example.com', 'hash_pw3', '08034567890', 'guest', '2025-02-18 13:45:00'),
(4, 'Ibrahim', 'Adamu', 'ibrahim.adamu@example.com', 'hash_pw4', '08045678901', 'admin', '2025-03-02 08:30:00'),
(5, 'Ngozi', 'Obi', 'ngozi.obi@example.com', 'hash_pw5', '08056789012', 'guest', '2025-03-12 16:10:00'),
(6, 'Kunle', 'Adewale', 'kunle.adewale@example.com', 'hash_pw6', '08067890123', 'host', '2025-04-01 12:05:00'),
(7, 'Fatima', 'Usman', 'fatima.usman@example.com', 'hash_pw7', '08078901234', 'guest', '2025-04-15 18:45:00'),
(8, 'David', 'Johnson', 'david.johnson@example.com', 'hash_pw8', '08089012345', 'host', '2025-05-09 14:00:00'),
(9, 'Lola', 'Adeyemi', 'lola.adeyemi@example.com', 'hash_pw9', '08090123456', 'guest', '2025-05-21 09:15:00'),
(10, 'Emeka', 'Nwosu', 'emeka.nwosu@example.com', 'hash_pw10', '08101234567', 'guest', '2025-06-03 11:40:00');

INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
(1, 2, 'Lagoon View Apartment', 'A cozy 2-bedroom apartment overlooking the Lagos Lagoon.', 'Lagos', 25000.00, '2025-02-12 11:00:00', '2025-02-12 11:00:00'),
(2, 6, 'Abuja Serenity Villa', 'Luxury villa in a quiet neighborhood with private pool.', 'Abuja', 45000.00, '2025-03-20 10:30:00', '2025-03-20 10:30:00'),
(3, 8, 'Ibadan Green Cottage', 'Eco-friendly 1-bedroom cottage surrounded by lush gardens.', 'Ibadan', 18000.00, '2025-04-10 09:00:00', '2025-04-10 09:00:00'),
(4, 6, 'Lekki Studio Suite', 'Compact modern suite close to Lekki Phase 1.', 'Lagos', 20000.00, '2025-04-21 14:15:00', '2025-04-21 14:15:00'),
(5, 2, 'Enugu Hillside Apartment', 'Spacious apartment with a beautiful hillside view.', 'Enugu', 22000.00, '2025-05-03 16:45:00', '2025-05-03 16:45:00');

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
(1, 1, 1, '2025-03-01', '2025-03-05', 100000.00, 'confirmed', '2025-02-25 09:30:00'),
(2, 2, 3, '2025-04-02', '2025-04-06', 180000.00, 'pending', '2025-03-25 12:00:00'),
(3, 3, 5, '2025-05-01', '2025-05-03', 36000.00, 'confirmed', '2025-04-28 15:20:00'),
(4, 4, 7, '2025-05-10', '2025-05-15', 100000.00, 'cancelled', '2025-05-02 17:00:00'),
(5, 5, 9, '2025-06-05', '2025-06-09', 88000.00, 'confirmed', '2025-05-30 10:10:00');

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
(1, 1, 100000.00, '2025-02-26 10:15:00', 'credit_card'),
(2, 2, 180000.00, '2025-03-28 13:45:00', 'paypal'),
(3, 3, 36000.00, '2025-04-30 08:20:00', 'stripe'),
(4, 4, 100000.00, '2025-05-03 11:00:00', 'credit_card'),
(5, 5, 88000.00, '2025-06-01 15:50:00', 'paypal');

INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
(1, 1, 1, 5, 'Amazing stay! Clean and beautiful view of the lagoon.', '2025-03-06 10:30:00'),
(2, 2, 3, 4, 'The villa was luxurious, though the WiFi was spotty.', '2025-04-08 12:45:00'),
(3, 3, 5, 5, 'Peaceful and relaxing getaway. Loved it!', '2025-05-04 18:10:00'),
(4, 4, 7, 3, 'Good value for money but noisy area.', '2025-05-17 09:25:00'),
(5, 5, 9, 4, 'Great host, very responsive. Would stay again.', '2025-06-10 14:40:00');


INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
(1, 1, 2, 'Hi, I have a question about the apartment’s check-in time.', '2025-02-24 08:30:00'),
(2, 2, 1, 'Check-in starts at 2 PM. I’ll send details soon.', '2025-02-24 08:45:00'),
(3, 3, 6, 'Can you confirm my booking for the villa?', '2025-03-22 14:10:00'),
(4, 6, 3, 'Yes, your booking is confirmed. See you soon.', '2025-03-22 14:25:00'),
(5, 5, 8, 'Is there parking available near the cottage?', '2025-04-28 07:55:00'),
(6, 8, 5, 'Yes, free parking is available right outside.', '2025-04-28 08:05:00'),
(7, 7, 6, 'I need to cancel my booking. How do I proceed?', '2025-05-02 09:20:00'),
(8, 6, 7, 'No problem, your cancellation is processed.', '2025-05-02 09:40:00'),
(9, 9, 2, 'Thanks for the lovely stay!', '2025-06-09 10:00:00'),
(10, 2, 9, 'Glad you enjoyed it, come again!', '2025-06-09 10:10:00');

