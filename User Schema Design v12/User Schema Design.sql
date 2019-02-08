show search_path;
set search_path to "user";

CREATE TABLE "User" (
  "ID" bigserial PRIMARY KEY,
  "ProfilePhoto" varchar,
  "FirstName" varchar,
  "LastName" varchar,
  "Email" varchar UNIQUE NOT NULL,
  "Password" varchar UNIQUE NOT NULL,
  "TypeID" bigint NOT NULL,
  "RoleID" bigint NOT NULL,
  "Gender" varchar,
  "DateOfBirth" date,
  "About" varchar,
  "RegisteredDate" timestamp,
  "VerificationStatus" varchar,
  "LastSeen" timestamp,
  "GoogleID" varchar,
  "FacebookID" varchar,
  "InstagramID" varchar,
  "TwitterID" varchar,
  "LinkedInID" varchar,
  "YahooID" varchar
);

CREATE TABLE "Type" (
  "ID" bigserial PRIMARY KEY,
  "Type" varchar UNIQUE NOT NULL
);

CREATE TABLE "Role" (
  "ID" bigserial PRIMARY KEY,
  "Role" varchar UNIQUE NOT NULL
);

CREATE TABLE "PhoneNumber" (
  "UserID" bigint PRIMARY KEY,
  "Phone" varchar NOT NULL
);

CREATE TABLE "ExtraInformation" (
  "UserID" bigint PRIMARY KEY,
  "School" varchar,
  "Work" varchar,
  "TimeZone" varchar,
  "EmergencyContact" varchar,
  "Occupation" varchar
);

CREATE TABLE "LoginHistory" (
  "UserID" bigint PRIMARY KEY,
  "Browser" varchar,
  "Device" varchar,
  "IP" cidr,
  "Date" timestamp with time zone,
  "RecentActivity" varchar,
  "NumberOfLoginPerDay" int
);

CREATE TABLE "PaymentMethod" (
  "UserID" bigint PRIMARY KEY,
  "CardNumber" int NOT NULL,
  "CardTypeID" bigint NOT NULL,
  "CardHolderName" varchar NOT NULL,
  "ExpiryDate" timestamp NOT NULL,
  "IssuingBank" varchar NOT NULL
);

CREATE TABLE "CardType" (
  "ID" bigserial PRIMARY KEY,
  "Type" varchar UNIQUE NOT NULL
);

ALTER TABLE "User" ADD FOREIGN KEY ("TypeID") REFERENCES "Type" ("ID");

ALTER TABLE "User" ADD FOREIGN KEY ("RoleID") REFERENCES "Role" ("ID");

ALTER TABLE "PhoneNumber" ADD FOREIGN KEY ("UserID") REFERENCES "User" ("ID");

ALTER TABLE "ExtraInformation" ADD FOREIGN KEY ("UserID") REFERENCES "User" ("ID");

ALTER TABLE "LoginHistory" ADD FOREIGN KEY ("UserID") REFERENCES "User" ("ID");

ALTER TABLE "PaymentMethod" ADD FOREIGN KEY ("UserID") REFERENCES "User" ("ID");

ALTER TABLE "PaymentMethod" ADD FOREIGN KEY ("CardTypeID") REFERENCES "CardType" ("ID");



