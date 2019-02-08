show SEARCH_PATH;
set SEARCH_PATH to category;

CREATE TABLE "Category"
(
	"ID" bigserial PRIMARY KEY NOT NULL,
	"Name" varchar UNIQUE NOT NULL,
	"Description" varchar,
	"Created" timestamp with time zone,
	"Modify" timestamp with time zone,
	"Status" varchar,
	"LanguageID" bigint NOT NULL
);

ALTER TABLE "Category" ADD FOREIGN KEY ("LanguageID") REFERENCES public."Language" ("ID");

