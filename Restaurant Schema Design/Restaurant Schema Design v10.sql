CREATE TABLE "Restaurant" (
  "ID" int,
  "Name" varchar,
  "RestaurantTypeID" varchar,
  "ReservationStatus" varchar,
  "PriceRange" decimal,
  "Price" varchar,
  "MenuID" varchar,
  "CreditCardID" int,
  "Wifi" varchar,
  "Drink" varchar,
  "MealService" varchar,
  "DiningOption" varchar,
  "Restroom" varchar,
  "Parking" varchar
);

CREATE TABLE "Menu" (
  "ID" varchar,
  "MenuType" varchar,
  "FoodType" varchar,
  "FoodName" varchar,
  "Description" varchar,
  "Price" varchar
);

CREATE TABLE "RestaurantType" (
  "ID" int,
  "Name" varchar
);

CREATE TABLE "CreditCard" (
  "ID" int,
  "CreditCardName" varchar
);

CREATE TABLE "Reservation" (
  "ID" bigserial,
  "CustomerID" int,
  "RestaurantID" int,
  "Adult" int,
  "Children" int,
  "Infant" int,
  "Date" timestamp,
  "Created" timestamp,
  "Modified" timestamp,
  "CancellationDate" timestamp,
  "Status" varchar
);

CREATE TABLE "Rating" (
  "RestaurantID" int UNIQUE,
  "CustomerID" int,
  "Star" int,
  "Comment" varchar,
  "Date" timestamp,
  "Modified" timestamp
);

ALTER TABLE "Restaurant" ADD FOREIGN KEY ("RestaurantTypeID") REFERENCES "RestaurantType" ("ID");

ALTER TABLE "Restaurant" ADD FOREIGN KEY ("MenuID") REFERENCES "Menu" ("ID");

ALTER TABLE "Restaurant" ADD FOREIGN KEY ("CreditCardID") REFERENCES "CreditCard" ("ID");

ALTER TABLE "Rating" ADD FOREIGN KEY ("RestaurantID") REFERENCES "Restaurant" ("ID");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("RestaurantID") REFERENCES "Restaurant" ("ID");