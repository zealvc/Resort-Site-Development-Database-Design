CREATE TABLE "Restaurant" (
  "ID" bigserial,
  "CategoryID" bigint,
  "Name" varchar,
  "RestaurantTypeID" bigint,
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

CREATE TABLE "RestaurantType" (
  "ID" bigserial,
  "Name" varchar,
  "LanguageID" bigint
);

CREATE TABLE "RestaurantMenu" (
  "RestaurantID" bigint,
  "MenuID" bigint
);

CREATE TABLE "Menu" (
  "ID" bigserial,
  "MenuType" varchar,
  "Description" varchar,
  "LanguageID" bigint
);

CREATE TABLE "FoodType" (
  "ID" bigserial,
  "MenuID" bigint,
  "FoodType" varchar,
  "LanguageID" bigint
);

CREATE TABLE "Food" (
  "FoodTypeID" bigint,
  "Name" varchar,
  "Price" decimal,
  "Ingredients" varchar,
  "LanguageID" bigint
);

CREATE TABLE "Reservation" (
  "ID" bigserial,
  "UserID" bigint,
  "RestaurantID" bigint,
  "Adult" int,
  "Children" int,
  "Infant" int,
  "Date" timestamp,
  "Created" timestamp,
  "Modified" timestamp,
  "CancellationDate" timestamp,
  "Status" varchar,
  "LanguageID" bigint
);

CREATE TABLE "Rating" (
  "RestaurantID" bigint,
  "UserID" bigint,
  "Star" int,
  "Comment" varchar,
  "Date" timestamp,
  "Modified" timestamp
);

ALTER TABLE "Restaurant" ADD FOREIGN KEY ("RestaurantTypeID") REFERENCES "RestaurantType" ("ID");

ALTER TABLE "RestaurantMenu" ADD FOREIGN KEY ("RestaurantID") REFERENCES "Restaurant" ("ID");

ALTER TABLE "RestaurantMenu" ADD FOREIGN KEY ("MenuID") REFERENCES "Menu" ("ID");

ALTER TABLE "FoodType" ADD FOREIGN KEY ("MenuID") REFERENCES "Menu" ("ID");

ALTER TABLE "Food" ADD FOREIGN KEY ("FoodTypeID") REFERENCES "FoodType" ("ID");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("RestaurantID") REFERENCES "Restaurant" ("ID");

ALTER TABLE "Rating" ADD FOREIGN KEY ("RestaurantID") REFERENCES "Restaurant" ("ID");