show SEARCH_PATH;
set SEARCH_PATH to payment;

CREATE TABLE "Payment"(
  "ID" bigserial PRIMARY KEY,
	"UserID" bigint,
	"CategoryID" bigint,
	"AccommodationReservationID" int,
	"RestaurantReservationID" int,
	"ActivityReservationID" int,
	"Status" varchar,
	"TotalPrice" decimal
);

ALTER TABLE "Payment" ADD FOREIGN KEY ("UserID") REFERENCES "user"."User" ("ID");
ALTER TABLE "Payment" ADD FOREIGN KEY ("CategoryID") REFERENCES category."Category" ("ID");
ALTER TABLE "Payment" ADD FOREIGN KEY ("AccommodationReservationID") REFERENCES accommodation."Reservation" ("ID");
ALTER TABLE "Payment" ADD FOREIGN KEY ("RestaurantReservationID") REFERENCES restaurant."Reservation" ("ID");
ALTER TABLE "Payment" ADD FOREIGN KEY ("ActivityReservationID") REFERENCES activity."Reservation" ("ID");
