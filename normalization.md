## Normalize schema to 3NF — Review & Changes

Short version: your schema was mostly sane but had a few places that violated 3NF (and one sloppy design choice that would let people review places they never stayed at). I fixed those and explain why.

Original notable points (as provided)

Entities: User, Property, Booking, Payment, Review, Message.

Some attributes that look derived or denormalized: Booking.total\_price (derivable from price\_per\_night and dates).

Review referenced property\_id and user\_id (but not booking\_id). That allows reviews without a booking — security hole for fake praise/vengeance.

Property.location is a single free-text field (fine functionally, but may hide repeated address components).

user.role used to indicate host/guest/admin. No DB-level guarantee that host\_id in Property points to a User with role = host (enforce at app or with extra constraint).

### Goals

Achieve Third Normal Form (3NF): eliminate repeating groups, remove partial dependencies, and remove transitive dependencies.

Preserve practical constraints (one review per booking, payment linked to booking).

Keep schema usable for common queries (availability, host properties, guest history).

Issues found (and why they matter)

Booking.total\_price is a derived attribute

It depends on Property.price\_per\_night and the length of the stay (end\_date - start\_date). Storing it creates risk of inconsistency if either side changes.

Review not tied to Booking

Without booking\_id you cannot ensure the reviewer actually stayed at the property. This is a transitive/semantical integrity issue. Also you may want to ensure at most one review per booking.

Property.location as single text field

Not a normalization violation per se, but if you need to query by city, state, or country, you will benefit from splitting the address into components (or a separate Address entity).

Role enforcement for hosts

Property.host\_id references User(user\_id) — DB cannot guarantee role='host' unless you add a check or use a separate table or triggers.

Payment cardinality unclear

Original narrative implied a 1:1 Booking→Payment. In real life you might support multiple payments (partial payments, refunds). Design should allow flexibility.

Indexing and naming inconsistencies

pricepernight should be price\_per\_night for readability and consistency. Enum spellings and naming should be consistent (canceled vs cancelled).

Adjusted schema (3NF-friendly)
users

user\_id UUID PRIMARY KEY

first\_name VARCHAR NOT NULL

last\_name VARCHAR NOT NULL

email VARCHAR UNIQUE NOT NULL

password\_hash VARCHAR NOT NULL

phone\_number VARCHAR NULL

role ENUM('guest','host','admin') NOT NULL

created\_at TIMESTAMP DEFAULT CURRENT\_TIMESTAMP

Notes: keep role here. Enforce role-related invariants in application logic or add DB checks/triggers if you must enforce at DB level.

properties

property\_id UUID PRIMARY KEY

host\_id UUID NOT NULL REFERENCES users(user\_id)

name VARCHAR NOT NULL

description TEXT NOT NULL

address\_line1 VARCHAR NOT NULL

address\_line2 VARCHAR NULL

city VARCHAR NOT NULL

state VARCHAR NULL

country VARCHAR NOT NULL

zipcode VARCHAR NULL

price\_per\_night DECIMAL NOT NULL

status ENUM('available','booked','inactive') NOT NULL DEFAULT 'available'

created\_at TIMESTAMP DEFAULT CURRENT\_TIMESTAMP

updated\_at TIMESTAMP DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP

Splitting address into components is optional. If you will search/filter by city or country, split it. If not, a single location text field is OK.

bookings

booking\_id UUID PRIMARY KEY

property\_id UUID NOT NULL REFERENCES properties(property\_id)

guest\_id UUID NOT NULL REFERENCES users(user\_id)

start\_date DATE NOT NULL

end\_date DATE NOT NULL

status ENUM('pending','confirmed','canceled') NOT NULL DEFAULT 'pending'

created\_at TIMESTAMP DEFAULT CURRENT\_TIMESTAMP

Removed total\_price (derived). If you must store it (for historical record or price locking), store it and document immutability rules; otherwise compute from price\_per\_night * nights when needed.

payments

payment\_id UUID PRIMARY KEY

booking\_id UUID NOT NULL REFERENCES bookings(booking\_id)

amount DECIMAL NOT NULL

payment\_date TIMESTAMP DEFAULT CURRENT\_TIMESTAMP

payment\_method ENUM('credit\_card','paypal','stripe') NOT NULL

payment\_status ENUM('paid','pending','failed','refunded') NOT NULL DEFAULT 'paid'

Allow multiple payments per booking to support partial payments or refunds. If you truly want 1:1, add a UNIQUE constraint on booking\_id.

reviews

review\_id UUID PRIMARY KEY

booking\_id UUID NOT NULL REFERENCES bookings(booking\_id) UNIQUE

property\_id UUID NOT NULL REFERENCES properties(property\_id)

reviewer\_id UUID NOT NULL REFERENCES users(user\_id)

rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5)

comment TEXT NOT NULL

created\_at TIMESTAMP DEFAULT CURRENT\_TIMESTAMP

Key change: tie review to booking\_id. Add UNIQUE (booking\_id) if you want to enforce exactly one review per booking. Keep property\_id and reviewer\_id for convenient joins and to make review queries fast; they are not transitive if they reflect the booking — you can validate via CHECK/trigger that booking.property\_id = property\_id and booking.guest\_id = reviewer\_id to prevent mismatch.

messages

message\_id UUID PRIMARY KEY

sender\_id UUID NOT NULL REFERENCES users(user\_id)

recipient\_id UUID NOT NULL REFERENCES users(user\_id)

message\_body TEXT NOT NULL

sent\_at TIMESTAMP DEFAULT CURRENT\_TIMESTAMP

If you anticipate group chats, convert to a conversations + conversation\_messages model. For simple 1:1 messaging this is fine.

How these changes satisfy Normal Forms
First Normal Form (1NF)

All tables have atomic column values. No repeating groups or arrays stored in a single field (addresses split if needed).

Second Normal Form (2NF)

All non-key attributes depend on the whole primary key. Our PKs are single-column UUIDs. There are no partial dependencies on composite keys.

Third Normal Form (3NF)

No non-key attribute depends on another non-key attribute (no transitive dependencies).

total\_price removed because it transitively depends on properties.price\_per\_night and bookings dates.

reviews now rely on booking\_id as the proven source of truth that ties reviewer to property; if you keep property\_id and reviewer\_id as duplicated columns for join efficiency, enforce integrity via triggers or CHECKs so they do not diverge from the booking record.

Additional constraints and practical notes

Enforce host role: Add an application-level check or a DB trigger to ensure properties.host\_id points to a users row with role = 'host'. Some RDBMS support partial foreign keys or filtered indexes; otherwise use triggers.

Booking overlap checks: Enforce availability via application logic or DB exclusion constraints (Postgres EXCLUDE USING gist on property\_id & daterange(start\_date, end\_date) to prevent double-booking).

Indexing recommendations:

users(email) UNIQUE index

properties(host\_id)

bookings(property\_id, start\_date, end\_date) for availability queries

payments(booking\_id)

reviews(property\_id) for quick property review lookups

Denormalization trade-offs: If you plan heavy read traffic and want to store total\_price to avoid computing it often, keep it but treat it as an immutable snapshot captured when booking is confirmed. Add triggers to set it at confirmation time so it doesn’t silently diverge.
