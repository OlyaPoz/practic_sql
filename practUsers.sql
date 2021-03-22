DROP TABLE "users";

CREATE TABLE "users" (
  id serial PRIMARY KEY,
  first_name varchar(64) NOT NULL,
  last_name varchar(64) NOT NULL,
  email varchar(256) NOT NULL CHECK (email != ''),
  is_male boolean NOT NULL,
  birthday date NOT NULL CHECK (
    birthday < current_date
    AND birthday > '1900/1/1'
  ),
  height numeric(3, 2) NOT NULL CHECK (
    height > 0.20
    AND height < 2.5
  ),
  CONSTRAINT "CK_FULL_NAME" CHECK (
    first_name != ''
    AND last_name != ''
  )
);
ALTER TABLE "users"
ADD COLUMN "weight" int CHECK (
    "weight" BETWEEN 0 AND 300
  );
/* */
SELECT avg("height") AS "Средний рост"
FROM "users";
/* */
SELECT avg("height") AS "h",
  "is_male"
FROM "users"
Group by "is_male";
/* */
SELECT min("height") AS "min h",
  "is_male"
FROM "users"
Group by "is_male";
/* */
SELECT avg("height"),
  min("height"),
  max("height"),
  "is_male"
FROM "users"
Group by "is_male";
/* */
SELECT count("birthday")
FROM "users"
WHERE extract(
    'month'
    from "birthday"
  ) = 1
  AND extract(
    'year'
    from "birthday"
  ) = 1970;
/* */
SELECT count("first_name")
FROM "users"
WHERE "first_name" = 'John';
/* */
SELECT count("birthday")
FROM "users"
WHERE age("birthday") BETWEEN make_interval(20) AND make_interval(30);
/* */
CREATE TABLE "phones" (
  id serial PRIMARY KEY,
  "brand" varchar(64) NOT NULL,
  "model" varchar(64) NOT NULL,
  "price" numeric NOT NULL,
  "quantity" int NOT NULL
);

