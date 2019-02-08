CREATE TABLE "Activity" (
  "ID" bigserial PRIMARY KEY,
  "CategoryID" bigint NOT NULL,
  "Name" varchar NOT NULL,
  "ActivityTypeID" varchar NOT NULL,
  "Duration" timestamp,
  "PricePerPerson" varchar,
  "LanguageAvailable" varchar,
  "Include" varchar,
  "LocationID" bigint,
  "Host" varchar,
  "ToDo" varchar,
  "Provide" varchar,
  "ToBring" varchar,
  "OtherDescription" varchar,
  "GroupSize" int,
  "WhoCanCome" varchar,
  "CancellationPolicy" varchar,
  "LanguageID" bigint
);

CREATE TABLE "ActivityType" (
  "ID" int,
  "Name" varchar,
  "LanguageID" int
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

CREATE TABLE "Reservation" (
  "ID" bigserial PRIMARY KEY,
  "UserID" bigint,
  "ActivityID" bigint,
  "Adult" int,
  "Children" int,
  "Infant" int,
  "Date" timestamp with time zone,
  "AmountPaid" decimal,
  "RefundPaid" decimal,
  "Created" timestamp with time zone,
  "Modified" timestamp with time zone,
  "CancellationDate" timestamp with time zone,
  "Status" varchar,
  "LanguageID" bigint
);

CREATE TABLE "Rating" (
  "ActivityID" int UNIQUE,
  "UserID" bigint,
  "Star" bigint,
  "Comment" varchar,
  "Date" timestamp with time zone,
  "Modified" timestamp with time zone
);

ALTER TABLE "Activity" ADD FOREIGN KEY ("LocationID") REFERENCES "Location" ("ID");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("ActivityID") REFERENCES "Activity" ("ID");

ALTER TABLE "Rating" ADD FOREIGN KEY ("ActivityID") REFERENCES "Activity" ("ID");

ALTER TABLE "Activity" ADD FOREIGN KEY ("ActivityTypeID") REFERENCES "ActivityType" ("ID");