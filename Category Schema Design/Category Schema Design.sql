show SEARCH_PATH;
set SEARCH_PATH to customer;

CREATE TABLE "Category"
(
	"ID" bigserial PRIMARY KEY NOT NULL,
	"Name" varchar,
	"Description" varchar,
	"Created" timestamp with time zone,
	"Modify" timestamp with time zone,
	"Status" varchar
);

