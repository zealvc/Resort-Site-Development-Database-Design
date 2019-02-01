show search_path;
set search_path to "accommodation";

CREATE TABLE "Accommodation" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "CategoryID" bigint UNIQUE,
  "Name" varchar UNIQUE,
  "AccommodationTypeID" bigint NOT NULL,
  "Description" varchar,
  "GuestCount" int,
  "BedRoomCount" int,
  "BedCount" int,
  "BathCount" int,
  "LocationID" bigint UNIQUE,
  "AccessibilitySizeDescription" varchar,
  "PricePerNight" decimal NOT NULL,
  "CancellationPolicy" varchar,
  "DateAdded" timestamp with time zone
);

CREATE TABLE "AccommodationType" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "Type" varchar NOT NULL
);

CREATE TABLE "AccommodationImage" (
  "AccommodationID" bigint PRIMARY KEY,
  "Images" varchar
);

CREATE TABLE "AccommodationAmenity" (
  "AccommodationID" bigint PRIMARY KEY,
  "AmenityID" bigint
);

CREATE TABLE "Amenity" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "Name" varchar NOT NULL,
  "Description" varchar,
  "Images" varchar
);

CREATE TABLE "Accessibility" (
  "AccommodationID" bigint PRIMARY KEY,
  "AccessibilityNameID" bigint,
  "Description" varchar
);

CREATE TABLE "AccessibilityName" (
  "ID" bigserial PRIMARY KEY,
  "Name" varchar NOT NULL
);

CREATE TABLE "Location" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "Name" varchar NOT NULL,
  "Address" varchar NOT NULL,
  "Description" varchar,
  "Distance" varchar,
  "DistanceDescription" varchar,
  "Longitude" float NOT NULL,
  "Latitude" float NOT NULL
);

CREATE TABLE "AccommodationHouseRule" (
  "AccommodationID" bigint PRIMARY KEY,
  "HouseRuleID" bigint,
  "HouseRuleDescription" varchar
);

CREATE TABLE "HouseRule" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "Name" varchar
);

CREATE TABLE "Rating" (
  "AccommodationID" bigint PRIMARY KEY,
  "CustomerID" bigint NOT NULL,
  "Star" int NOT NULL,
  "Comment" varchar,
  "Date" timestamp with time zone NOT NULL,
  "Modified" timestamp with time zone NOT NULL
);

CREATE TABLE "Feature" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "AccommodationID" bigint UNIQUE NOT NULL,
  "Name" varchar NOT NULL,
  "Image" varchar,
  "CoverImage" varchar,
  "Description" varchar
);

CREATE TABLE "Reservation" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "CustomerID" bigint NOT NULL,
  "AccommodationID" bigint NOT NULL,
  "Adult" int NOT NULL,
  "Children" int NOT NULL,
  "Infant" int NOT NULL,
  "NumberOfNight" int NOT NULL,
  "CheckIn" date NOT NULL,
  "CheckOut" date NOT NULL,
  "AmountPaid" decimal,
  "RefundPaid" decimal,
  "Created" timestamp,
  "Modified" timestamp,
  "CancellationDate" timestamp,
  "Status" varchar
);

ALTER TABLE "Accommodation" ADD FOREIGN KEY ("CategoryID") REFERENCES category."Category" ("ID");

ALTER TABLE "Accommodation" ADD FOREIGN KEY ("ID") REFERENCES "AccommodationImage" ("AccommodationID");

ALTER TABLE "Accommodation" ADD FOREIGN KEY ("AccommodationTypeID") REFERENCES "AccommodationType" ("ID");

ALTER TABLE "Accessibility" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "Accessibility" ADD FOREIGN KEY ("AccessibilityNameID") REFERENCES "AccessibilityName" ("ID");

ALTER TABLE "Feature" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "Rating" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "Rating" ADD FOREIGN KEY ("CustomerID") REFERENCES customer."Customer" ("ID");

ALTER TABLE "AccommodationAmenity" ADD FOREIGN KEY ("AmenityID") REFERENCES "Amenity" ("ID");

ALTER TABLE "AccommodationAmenity" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "AccommodationHouseRule" ADD FOREIGN KEY ("HouseRuleID") REFERENCES "HouseRule" ("ID");

ALTER TABLE "AccommodationHouseRule" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "Accommodation" ADD FOREIGN KEY ("LocationID") REFERENCES "Location" ("ID");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("CustomerID") REFERENCES customer."Customer" ("ID");