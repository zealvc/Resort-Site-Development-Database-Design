show search_path;
set search_path to "activity";

CREATE TABLE "Activity" (
  "ID" bigserial PRIMARY KEY,
  "CategoryID" bigint NOT NULL,
  "Name" varchar NOT NULL,
  "ActivityTypeID" bigint NOT NULL,
  "Duration" timestamp,
  "PricePerPerson" varchar,
  "LanguageAvailable" varchar,
  "Include" varchar,
  "LocationID" bigint,
  "ToDo" varchar,
  "Provide" varchar,
  "ToBring" varchar,
  "OtherDescription" varchar,
  "GroupSize" int,
  "WhoCanCome" varchar,
  "CancellationPolicy" varchar,
  "LanguageID" bigint
);

ALTER TABLE "Activity" ADD FOREIGN KEY ("CategoryID") REFERENCES category."Category" ("ID");
ALTER TABLE "Activity" ADD FOREIGN KEY ("ActivityTypeID") REFERENCES "ActivityType" ("ID");
ALTER TABLE "Activity" ADD FOREIGN KEY ("LocationID") REFERENCES "Location" ("ID");
ALTER TABLE "Activity" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

CREATE TABLE "ActivityType" (
  "ID" bigserial PRIMARY KEY,
  "Name" varchar UNIQUE NOT NULL,
  "LanguageID" bigint
);

ALTER TABLE "ActivityType" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

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

CREATE TABLE "Reservation" (
  "ID" bigserial PRIMARY KEY,
  "UserID" bigint NOT NULL,
  "ActivityID" bigint NOT NULL,
  "Adult" int NOT NULL,
  "Children" int NOT NULL,
  "Infant" int NOT NULL,
  "Date" timestamp with time zone,
  "AmountPaid" decimal,
  "RefundPaid" decimal,
  "Created" timestamp with time zone,
  "Modified" timestamp with time zone,
  "CancellationDate" timestamp with time zone,
  "Status" varchar,
  "LanguageID" bigint
);

ALTER TABLE "Reservation" ADD FOREIGN KEY ("UserID") REFERENCES "user"."User" ("ID");
ALTER TABLE "Reservation" ADD FOREIGN KEY ("ActivityID") REFERENCES "Activity" ("ID");
ALTER TABLE "Reservation" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

CREATE TABLE "Rating" (
  "ActivityID" bigint PRIMARY KEY,
  "UserID" bigint,
  "Star" int,
  "Comment" varchar,
  "Date" timestamp with time zone,
  "Modified" timestamp with time zone
);

ALTER TABLE "Rating" ADD FOREIGN KEY ("ActivityID") REFERENCES "Activity" ("ID");
ALTER TABLE "Rating" ADD FOREIGN KEY ("UserID") REFERENCES "user"."User" ("ID");




