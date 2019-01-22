show SEARCH_PATH;
set SEARCH_PATH to payment;

CREATE TABLE "Payment"(
  "ID" bigserial PRIMARY KEY NOT NULL,
	"CustomerID" int,
	"CategoryID" int,
	"AccommodationReservationID" int,
	"RestaurantReservationID" int,
	"ActivityReservationID" int,
	"Status" varchar,
	"TotalPrice" decimal
);


ALTER TABLE "Payment" ADD FOREIGN KEY ("CustomerID") REFERENCES customer."Customer" ("ID");
ALTER TABLE "Payment" ADD FOREIGN KEY ("CategoryID") REFERENCES category."Category" ("ID");
ALTER TABLE "Payment" ADD FOREIGN KEY ("AccommodationReservationID") REFERENCES accommodation."Reservation" ("ID");
