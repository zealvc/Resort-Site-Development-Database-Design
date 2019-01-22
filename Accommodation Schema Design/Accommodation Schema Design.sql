show SEARCH_PATH;
set SEARCH_PATH to accommodation;

CREATE TABLE "Accommodation" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "CategoryID" int UNIQUE NOT NULL,
  "Name" varchar UNIQUE NOT NULL,
  "AccommodationTypeID" int NOT NULL,
  "Description" varchar NOT NULL,
  "GuestCount" int NOT NULL,
  "BedRoomCount" int NOT NULL,
  "BedCount" int NOT NULL,
  "BathCount" int NOT NULL,
  "PricePerNight" decimal,
  "CoverImage" varchar,
  "MainImage" varchar,
  "SpecialOffer" varchar,
  "DateAdded" timestamp with time zone
);

CREATE TABLE "AccommodationType" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "Type" varchar
);

CREATE TABLE "AccommodationTour" (
  "AccommodationID" int UNIQUE NOT NULL,
  "TourID" int
);

CREATE TABLE "Tour" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "TourNameID" int,
  "Description" varchar
);

CREATE TABLE "TourName" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "Name" varchar UNIQUE NOT NULL
);

CREATE TABLE "AccommodationTourImage" (
  "TourID" int UNIQUE NOT NULL,
  "Images" varchar
);

CREATE TABLE "AccommodationAmenity" (
  "AccommodationID" int UNIQUE NOT NULL,
  "AmenityID" int
);

CREATE TABLE "Amenity" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "Name" varchar NOT NULL,
  "Description" varchar,
  "Images" varchar
);

CREATE TABLE "Accessibility" (
  "AccommodationID" int UNIQUE NOT NULL,
  "ID" bigserial PRIMARY KEY NOT NULL,
  "AccessibilityNameID" int,
  "SizeDescription" varchar,
  "Description" varchar
);

CREATE TABLE "AccessibilityName" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "Name" varchar
);

CREATE TABLE "AccommodationLocation" (
  "AccommodationID" int UNIQUE NOT NULL,
  "LocationID" int
);

CREATE TABLE "Location" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "Name" varchar NOT NULL,
  "Address" varchar NOT NULL,
  "Description" varchar,
  "Distance" varchar,
  "DistanceDescription" varchar,
  "Longitude" float NOT NULL,
  "Latitude" float NOT NULL,
  "Type" varchar
);

CREATE TABLE "AccommodationCancellationPolicy" (
  "AccommodationID" int UNIQUE NOT NULL,
  "CancellationPolicyID" int UNIQUE NOT NULL,
  "Description" varchar
);

CREATE TABLE "AccommodationHouseRule" (
  "AccommodationID" int UNIQUE NOT NULL,
  "HouseRuleID" int,
  "Description" varchar
);

CREATE TABLE "HouseRule" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "Name" varchar
);

CREATE TABLE "Reservation" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "CustomerID" int NOT NULL,
  "AccommodationID" int NOT NULL,
  "Status" varchar,
  "CancellationDate" timestamp with time zone
);

CREATE TABLE "ReservationAvailability" (
  "ReservationID" int UNIQUE NOT NULL,
  "Adult" int,
  "Children" int,
  "Infant" int,
  "NumberOfNight" int,
  "CheckIn" date NOT NULL,
  "CheckOut" date NOT NULL
);

CREATE TABLE "AccommodationRating" (
  "AccommodationID" int UNIQUE NOT NULL,
  "RatingID" int
);

CREATE TABLE "Rating" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "ReviewID" int,
  "Score" int,
  "AverageRate" int
);

CREATE TABLE "Review" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "CustomerID" int,
  "Comment" varchar,
  "Date" timestamp
);

CREATE TABLE "AccommodationFeature" (
  "AccommodationID" int UNIQUE NOT NULL,
  "FeatureID" int
);

CREATE TABLE "Feature" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "Name" varchar,
  "Image" varchar,
  "CoverImage" varchar,
  "Description" varchar
);

ALTER TABLE "Accommodation" ADD FOREIGN KEY ("CategoryID") REFERENCES category."Category" ("ID");

ALTER TABLE "Accommodation" ADD FOREIGN KEY ("AccommodationTypeID") REFERENCES "AccommodationType" ("ID");

ALTER TABLE "AccommodationTour" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "AccommodationTour" ADD FOREIGN KEY ("TourID") REFERENCES "Tour" ("ID");

ALTER TABLE "Tour" ADD FOREIGN KEY ("TourNameID") REFERENCES "TourName" ("ID");

ALTER TABLE "AccommodationTourImage" ADD FOREIGN KEY ("TourID") REFERENCES "Tour" ("ID");

ALTER TABLE "AccommodationAmenity" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "AccommodationAmenity" ADD FOREIGN KEY ("AmenityID") REFERENCES "Amenity" ("ID");

ALTER TABLE "Accessibility" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "Accessibility" ADD FOREIGN KEY ("AccessibilityNameID") REFERENCES "AccessibilityName" ("ID");

ALTER TABLE "AccommodationLocation" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "AccommodationLocation" ADD FOREIGN KEY ("LocationID") REFERENCES "Location" ("ID");

ALTER TABLE "AccommodationCancellationPolicy" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "AccommodationHouseRule" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "AccommodationHouseRule" ADD FOREIGN KEY ("HouseRuleID") REFERENCES "HouseRule" ("ID");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("CustomerID") REFERENCES customer."Customer" ("ID");

ALTER TABLE "ReservationAvailability" ADD FOREIGN KEY ("ReservationID") REFERENCES "Reservation" ("ID");

ALTER TABLE "AccommodationRating" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "AccommodationRating" ADD FOREIGN KEY ("RatingID") REFERENCES "Rating" ("ID");

ALTER TABLE "Rating" ADD FOREIGN KEY ("ReviewID") REFERENCES "Review" ("ID");

ALTER TABLE "Review" ADD FOREIGN KEY ("CustomerID") REFERENCES customer."Customer" ("ID");

ALTER TABLE "AccommodationFeature" ADD FOREIGN KEY ("AccommodationID") REFERENCES "Accommodation" ("ID");

ALTER TABLE "AccommodationFeature" ADD FOREIGN KEY ("FeatureID") REFERENCES "Feature" ("ID");
