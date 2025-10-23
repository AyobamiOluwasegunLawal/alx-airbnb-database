## Entities and Attributes

### User
user\_id: Primary Key, UUID, Indexed
first\_name: VARCHAR, NOT NULL
last\_name: VARCHAR, NOT NULL
email: VARCHAR, UNIQUE, NOT NULL
password\_hash: VARCHAR, NOT NULL
phone\_number: VARCHAR, NULL
role: ENUM (guest, host, admin), NOT NULL
created\_at: TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP

---

### Property
property\_id: Primary Key, UUID, Indexed
host\_id: Foreign Key, references User(user\_id)
name: VARCHAR, NOT NULL
description: TEXT, NOT NULL
location: VARCHAR, NOT NULL
pricepernight: DECIMAL, NOT NULL
created\_at: TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP
updated\_at: TIMESTAMP, ON UPDATE CURRENT\_TIMESTAMP

---

### Booking
booking\_id: Primary Key, UUID, Indexed
property\_id: Foreign Key, references Property(property\_id)
user\_id: Foreign Key, references User(user\_id)
start\_date: DATE, NOT NULL
end\_date: DATE, NOT NULL
total\_price: DECIMAL, NOT NULL
status: ENUM (pending, confirmed, canceled), NOT NULL
created\_at: TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP

---

### Payment
payment\_id: Primary Key, UUID, Indexed
booking\_id: Foreign Key, references Booking(booking\_id)
amount: DECIMAL, NOT NULL
payment\_date: TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP
payment\_method: ENUM (credit\_card, paypal, stripe), NOT NULL

---

### Review
review\_id: Primary Key, UUID, Indexed
property\_id: Foreign Key, references Property(property\_id)
user\_id: Foreign Key, references User(user\_id)
rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
comment: TEXT, NOT NULL
created\_at: TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP

---

### Message
message\_id: Primary Key, UUID, Indexed
sender\_id: Foreign Key, references User(user\_id)
recipient\_id: Foreign Key, references User(user\_id)
message\_body: TEXT, NOT NULL
sent\_at: TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP

---

## Visual Representation of E-R Diagram
![E-R Diagram](/mnt/c/Users/ayoba/Downloads/Entity_Relationship_Diagram.png)
