show search_path;
set search_path to public;

CREATE TABLE "Language"
(
  "ID" bigserial PRIMARY KEY,
  "Language" varchar UNIQUE NOT NULL,
  "Code" varchar UNIQUE NOT NULL
);