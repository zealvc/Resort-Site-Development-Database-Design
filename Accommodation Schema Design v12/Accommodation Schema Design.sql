show search_path;
set search_path to "accommodation";

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

ALTER TABLE "Accommodation" ADD FOREIGN KEY ("CategoryID") REFERENCES category."Category" ("ID");
ALTER TABLE "Accommodation" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

CREATE TABLE "AccommodationType" (
  "ID" bigserial PRIMARY KEY,
  "Type" varchar UNIQUE NOT NULL,
  "LanguageID" bigint
);

ALTER TABLE "AccommodationType" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

CREATE TABLE "AccommodationImage" (
  "AccommodationID" bigint PRIMARY KEY,
  "Image" varchar
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

ALTER TABLE "Amenity" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

CREATE TABLE "SleepingArrangement" (
  "AccommodationID" bigint PRIMARY KEY,
  "Name" varchar NOT NULL,
  "Description" varchar,
  "LanguageID" bigint
);

ALTER TABLE "SleepingArrangement" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

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

ALTER TABLE "Location" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

CREATE TABLE "AccommodationHouseRule" (
  "AccommodationID" bigint PRIMARY KEY,
  "HouseRuleID" bigint
);

CREATE TABLE "HouseRule" (
  "ID" bigserial PRIMARY KEY,
  "Name" varchar,
  "LanguageID" bigint
);

ALTER TABLE "HouseRule" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

CREATE TABLE "HouseRuleDescription" (
  "HouseRuleID" bigint PRIMARY KEY,
  "HouseRuleDescription" varchar,
  "LanguageID" bigint
);

ALTER TABLE "HouseRuleDescription" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

CREATE TABLE "Rating" (
  "AccommodationID" bigint PRIMARY KEY,
  "UserID" bigint,
  "Star" int,
  "Comment" varchar,
  "Date" timestamp,
  "Modified" timestamp with time zone
);

ALTER TABLE "Rating" ADD FOREIGN KEY ("UserID") REFERENCES "user"."User" ("ID");

CREATE TABLE "Reservation" (
  "ID" bigserial PRIMARY KEY,
  "UserID" bigint NOT NULL,
  "AccommodationID" bigint NOT NULL,
  "Adult" int NOT NULL,
  "Children" int NOT NULL,
  "Infant" int NOT NULL,
  "NumberOfNight" int NOT NULL,
  "CheckIn" date NOT NULL,
  "CheckOut" date NOT NULL,
  "AmountPaid" decimal,
  "RefundPaid" decimal,
  "Created" timestamp with time zone,
  "Modified" timestamp with time zone,
  "CancellationDate" timestamp with time zone,
  "Status" varchar,
  "LanguageID" bigint
);

ALTER TABLE "Reservation" ADD FOREIGN KEY ("UserID") REFERENCES  "user"."User" ("ID");
ALTER TABLE "Reservation" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");


ALTER TABLE "Accommodation" ADD FOREIGN KEY ("AccommodationTypeID") REFERENCES "AccommodationType" ("ID");
ALTER TABLE "Accommodation" ADD FOREIGN KEY ("LocationID") REFERENCES "Location" ("ID");

ALTER TABLE "AccommodationImage" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");


ALTER TABLE "AccommodationAmenity" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");
ALTER TABLE "AccommodationAmenity" ADD FOREIGN KEY ("AmenityID") REFERENCES "Amenity" ("ID");

ALTER TABLE "SleepingArrangement" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "AccommodationHouseRule" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");
ALTER TABLE "AccommodationHouseRule" ADD FOREIGN KEY ("HouseRuleID") REFERENCES "HouseRule" ("ID");
ALTER TABLE "HouseRuleDescription" ADD FOREIGN KEY ("HouseRuleID") REFERENCES "HouseRule" ("ID");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "Rating" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");


