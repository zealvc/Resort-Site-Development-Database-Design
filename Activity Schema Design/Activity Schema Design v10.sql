CREATE TABLE "Activity" (
  "ID" int,
  "Name" varchar,
  "ActivityTypeID" varchar,
  "ReservationStatus" varchar,
  "PricePerPerson" varchar,
  "Duration" int,
  "CreditCardID" int,
  "Language" varchar,
  "Include" varchar,
  "LocationID" int,
  "Host" varchar,
  "ToDo" varchar,
  "Provide" varchar,
  "ToBring" varchar,
  "OtherDescription" varchar,
  "GroupSize" int,
  "WhoCanCome" varchar,
  "CancellationPolicy" varchar
);

CREATE TABLE "Location" (
  "ID" bigserial,
  "Name" varchar,
  "Address" varchar,
  "Description" varchar,
  "Distance" varchar,
  "DistanceDescription" varchar,
  "Longitude" float,
  "Latitude" float
);

CREATE TABLE "ActivityType" (
  "ID" int,
  "Name" varchar
);

CREATE TABLE "Reservation" (
  "ID" bigserial,
  "CustomerID" int,
  "ActivityID" int,
  "Adult" int,
  "Children" int,
  "Infant" int,
  "Date" timestamp,
  "AmountPaid" decimal,
  "RefundPaid" decimal,
  "Created" timestamp,
  "Modified" timestamp,
  "CancellationDate" timestamp,
  "Status" varchar
);

CREATE TABLE "Rating" (
  "ActivityID" int UNIQUE,
  "CustomerID" int,
  "Star" int,
  "Comment" varchar,
  "Date" timestamp,
  "Modified" timestamp
);

ALTER TABLE "Activity" ADD FOREIGN KEY ("LocationID") REFERENCES "Location" ("ID");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("ActivityID") REFERENCES "Activity" ("ID");

ALTER TABLE "Rating" ADD FOREIGN KEY ("ActivityID") REFERENCES "Activity" ("ID");

ALTER TABLE "Activity" ADD FOREIGN KEY ("ActivityTypeID") REFERENCES "ActivityType" ("ID");