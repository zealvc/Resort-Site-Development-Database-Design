show search_path;
set search_path to restaurant;

CREATE TABLE "Restaurant" (
  "ID" bigserial PRIMARY KEY,
  "CategoryID" bigint NOT NULL,
  "Name" varchar NOT NULL,
  "RestaurantTypeID" bigint NOT NULL,
  "ReservationStatus" varchar,
  "PriceRange" decimal,
  "Price" varchar,
  "CreditCard" varchar,
  "Wifi" varchar,
  "Drink" varchar,
  "MealService" varchar,
  "DiningOption" varchar,
  "Restroom" varchar,
  "Parking" varchar,
  "LanguageID" bigint
);

ALTER TABLE "Restaurant" ADD FOREIGN KEY ("CategoryID") REFERENCES category."Category" ("ID");
ALTER TABLE "Restaurant" ADD FOREIGN KEY ("RestaurantTypeID") REFERENCES "RestaurantType" ("ID");
ALTER TABLE "Restaurant" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

CREATE TABLE "RestaurantType" (
  "ID" bigserial PRIMARY KEY,
  "Name" varchar NOT NULL,
  "LanguageID" bigint
);

ALTER TABLE "RestaurantType" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

CREATE TABLE "RestaurantMenu"
(
  "RestaurantID" bigint PRIMARY KEY,
  "MenuID" bigint NOT NULL
);

ALTER TABLE "RestaurantMenu" ADD FOREIGN KEY ("RestaurantID") REFERENCES "Restaurant" ("ID");
ALTER TABLE "RestaurantMenu" ADD FOREIGN KEY ("MenuID") REFERENCES "Menu" ("ID");

CREATE TABLE "Menu" (
  "ID" bigserial PRIMARY KEY,
  "MenuType" varchar,
  "Description" varchar,
  "LanguageID" bigint
);

ALTER TABLE "Menu" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

CREATE TABLE "FoodType"
(
  "ID" bigserial PRIMARY KEY,
  "MenuID" bigint,
  "FoodType" varchar,
  "LanguageID" bigint
);

ALTER TABLE "FoodType" ADD FOREIGN KEY ("MenuID") REFERENCES "Menu" ("ID");
ALTER TABLE "FoodType" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

CREATE TABLE "Food"
(
  "FoodTypeID" bigint PRIMARY KEY,
  "Name" varchar NOT NULL,
  "Price" decimal NOT NULL,
  "Ingredients" varchar NOT NULL,
  "LanguageID" bigint
);

ALTER TABLE "Food" ADD FOREIGN KEY ("FoodTypeID") REFERENCES "FoodType" ("ID");
ALTER TABLE "Food" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

CREATE TABLE "Reservation" (
  "ID" bigserial PRIMARY KEY,
  "UserID" bigint NOT NULL,
  "RestaurantID" bigint NOT NULL,
  "Adult" int NOT NULL,
  "Children" int NOT NULL,
  "Infant" int NOT NULL,
  "Date" timestamp with time zone,
  "Created" timestamp with time zone,
  "Modified" timestamp with time zone,
  "CancellationDate" timestamp,
  "Status" varchar,
  "LanguageID" bigint
);

ALTER TABLE "Reservation" ADD FOREIGN KEY ("UserID") REFERENCES "user"."User" ("ID");
ALTER TABLE "Reservation" ADD FOREIGN KEY ("RestaurantID") REFERENCES "Restaurant" ("ID");
ALTER TABLE "Reservation" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

CREATE TABLE "Rating" (
  "RestaurantID" bigint PRIMARY KEY,
  "UserID" bigint,
  "Star" int,
  "Comment" varchar,
  "Date" timestamp with time zone,
  "Modified" timestamp with time zone
);

ALTER TABLE "Rating" ADD FOREIGN KEY ("RestaurantID") REFERENCES "Restaurant" ("ID");
ALTER TABLE "Rating" ADD FOREIGN KEY ("UserID") REFERENCES "user"."User" ("ID");
