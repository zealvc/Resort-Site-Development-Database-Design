CREATE TABLE "Accommodation" (
  "ID" bigserial PRIMARY KEY,
  "CategoryID" bigint NOT NULL,
  "Name" varchar NOT NULL,
  "AccommodationTypeID" bigint NOT NULL,
  "Description" varchar,
  "GuestCount" int,
  "BedRoomCount" int,
  "BedCount" int,
  "BathCount" int,
  "LocationID" bigint,
  "PricePerNight" decimal,
  "CoverImage" varchar,
  "MainImage" varchar,
  "CancellationPolicy" varchar,
  "DateAdded" timestamp,
  "LanguageID" bigint
);

CREATE TABLE "AccommodationType" (
  "ID" bigserial PRIMARY KEY,
  "Type" varchar UNIQUE NOT NULL,
  "LanguageID" bigint
);

CREATE TABLE "AccommodationImage" (
  "AccommodationID" bigint PRIMARY KEY,
  "Images" varchar
);

CREATE TABLE "AccommodationAmenity" (
  "AccommodationID" bigint PRIMARY KEY,
  "AmenityID" bigint NOT NULL
);

CREATE TABLE "Amenity" (
  "ID" bigserial PRIMARY KEY,
  "Name" varchar UNIQUE NOT NULL,
  "Description" varchar,
  "Image" varchar,
  "LanguageID" bigint
);

CREATE TABLE "SleepingArrangement" (
  "AccommodationID" bigint PRIMARY KEY ,
  "Name" varchar NOT NULL,
  "Description" varchar,
  "LanguageID" bigint
);

CREATE TABLE "Location" (
  "ID" bigserial PRIMARY KEY,
  "Name" varchar NOT NULL,
  "Address" varchar NOT NULL,
  "Description" varchar,
  "Distance" varchar,
  "DistanceDescription" varchar,
  "Longitude" float,
  "Latitude" float,
  "LanguageID" bigint
);

CREATE TABLE "AccommodationHouseRule" (
  "AccommodationID" bigint PRIMARY KEY,
  "HouseRuleID" bigint
);

CREATE TABLE "HouseRule" (
  "ID" bigserial PRIMARY KEY,
  "Name" varchar,
  "LanguageID" varchar
);

CREATE TABLE "HouseRuleDescription" (
  "HouseRuleID" bigint PRIMARY KEY,
  "HouseRuleDescription" varchar,
  "LanguageID" bigint
);

CREATE TABLE "Rating" (
  "AccommodationID" bigint PRIMARY KEY,
  "UserID" bigint,
  "Star" int,
  "Comment" varchar,
  "Date" timestamp,
  "Modified" timestamp with time zone
);

CREATE TABLE "Reservation" (
  "ID" bigserial PRIMARY KEY,
  "UserID" bigint,
  "AccommodationID" bigint,
  "Adult" int,
  "Children" int,
  "Infant" int,
  "NumberOfNight" int,
  "CheckIn" date,
  "CheckOut" date,
  "AmountPaid" decimal,
  "RefundPaid" decimal,
  "Created" timestamp with time zone,
  "Modified" timestamp with time zone,
  "CancellationDate" timestamp with time zone,
  "Status" varchar,
  "LanguageID" bigint
);

ALTER TABLE "Accommodation" ADD FOREIGN KEY ("ID") REFERENCES "AccommodationImage" ("AccommodationID");

ALTER TABLE "Accommodation" ADD FOREIGN KEY ("AccommodationTypeID") REFERENCES "AccommodationType" ("ID");

ALTER TABLE "Rating" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "AccommodationAmenity" ADD FOREIGN KEY ("AmenityID") REFERENCES "Amenity" ("ID");

ALTER TABLE "AccommodationAmenity" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "AccommodationHouseRule" ADD FOREIGN KEY ("HouseRuleID") REFERENCES "HouseRule" ("ID");

ALTER TABLE "AccommodationHouseRule" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("CategoryID");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "Accommodation" ADD FOREIGN KEY ("LocationID") REFERENCES "Location" ("ID");

ALTER TABLE "SleepingArrangement" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "HouseRuleDescription" ADD FOREIGN KEY ("HouseRuleID") REFERENCES "HouseRule" ("ID");