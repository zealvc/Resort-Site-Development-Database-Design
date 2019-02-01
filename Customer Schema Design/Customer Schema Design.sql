show SEARCH_PATH;
set SEARCH_PATH to customer;

CREATE TABLE "Customer" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "ProfilePhoto" varchar,
  "FirstName" varchar NOT NULL,
  "LastName" varchar NOT NULL,
  "Email" varchar UNIQUE NOT NULL,
  "Password" varchar UNIQUE NOT NULL,
  "TypeID" bigint NOT NULL,
  "Gender" int NOT NULL,
  "DateOfBirth" date NOT NULL,
  "About" varchar,
  "RegisteredDate" timestamp with time zone NOT NULL,
  "VerificationStatus" varchar NOT NULL,
  "LastSeen" timestamp with time zone
);

CREATE TABLE "Type" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "Type" varchar NOT NULL UNIQUE
);

CREATE TABLE "PhoneNumber" (
  "CustomerID" bigint PRIMARY KEY,
  "Phone" varchar
);

CREATE TABLE "ExtraInformation" (
  "CustomerID" bigint PRIMARY KEY,
  "School" varchar,
  "Work" varchar,
  "TimeZone" varchar,
  "EmergencyContact" varchar,
  "Occupation" varchar
);

CREATE TABLE "SocialMedia" (
  "CustomerID" bigint PRIMARY KEY,
  "FacebookID" int,
  "InstagramID" int,
  "TwitterID" int,
  "SnapchatID" int,
  "PinterestID" int
);

CREATE TABLE "LoginHistory" (
  "CustomerID" bigint PRIMARY KEY,
  "Browser" varchar,
  "Device" varchar,
  "IP" varchar,
  "Date" timestamp with time zone,
  "RecentActivity" varchar,
  "NumberOfLoginPerDay" int
);

CREATE TABLE "PaymentMethod" (
  "CustomerID" bigint PRIMARY KEY,
  "CardNumber" int NOT NULL,
  "CardTypeID" bigint NOT NULL,
  "CardHolderName" varchar NOT NULL,
  "ExpiryDate" timestamp NOT NULL,
  "IssuingBank" varchar NOT NULL
);

CREATE TABLE "CardType" (
  "ID" bigserial PRIMARY KEY NOT NULL,
  "Type" varchar UNIQUE NOT NULL
);

ALTER TABLE "Customer" ADD FOREIGN KEY ("TypeID") REFERENCES "Type" ("ID");

ALTER TABLE "PhoneNumber" ADD FOREIGN KEY ("CustomerID") REFERENCES "Customer" ("ID");

ALTER TABLE "ExtraInformation" ADD FOREIGN KEY ("CustomerID") REFERENCES "Customer" ("ID");

ALTER TABLE "SocialMedia" ADD FOREIGN KEY ("CustomerID") REFERENCES "Customer" ("ID");

ALTER TABLE "LoginHistory" ADD FOREIGN KEY ("CustomerID") REFERENCES "Customer" ("ID");

ALTER TABLE "PaymentMethod" ADD FOREIGN KEY ("CustomerID") REFERENCES "Customer" ("ID");

ALTER TABLE "PaymentMethod" ADD FOREIGN KEY ("CardTypeID") REFERENCES "CardType" ("ID");