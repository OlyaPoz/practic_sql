
CREATE TABLE "workers" (
  "id" serial PRIMARY KEY,
  "name" varchar(64) NOT NULL,
  "birthday" date NOT NULL CHECK (
    "birthday" < current_date
    AND "birthday" > '1900/1/1'
  ),
  "salary" int NOT NULL
);
/* */
INSERT INTO "workers" ("name", "birthday", "salary")
VALUES('Nikita', '1995.10.05', '300'),
('Svetlana', '1997.05.15', '1200');
/* */
INSERT INTO "workers" ("name", "birthday", "salary")
VALUES('Yaroslav', '1980.10.05', '1200'),
('Petro', '1993.05.15', '1000');
/* */
INSERT INTO "workers" ("name", "birthday", "salary")
VALUES('Vasya', '1999.10.05', '100');
/* */
UPDATE "workers"
SET "salary" = 200
WHERE "id" = 5;
/* */
UPDATE "workers"
SET "birthday" = '1987.05.15'
WHERE "id" = 4;
/* */
UPDATE "workers"
SET "salary" = 700
WHERE "salary" = 300;
/* */
UPDATE "workers"
SET "birthday" = '1999.05.15'
WHERE "id" > 2 AND "id" <= 5;
/* */
UPDATE "workers"
SET "name" = 'Zhenya', "salary" = 900
WHERE "name" = 'Vasya';
/* */
SELECT * FROM "workers"
Where "id" = 3;
/* */
SELECT * FROM "workers"
Where "salary" > 400;
/*  */
SELECT "salary", age("birthday") FROM "workers"
WHERE "name" = 'Zhenya';
/* */
SELECT * FROM "workers"
WHERE "name" = 'Petro';
/* */
SELECT * FROM "workers"
WHERE "name" != 'Petro';
/*  */
SELECT * FROM "workers"
WHERE extract('years' from age("birthday")) = 27 OR "salary" = 1000;
/* */
SELECT *
FROM "workers"
WHERE age("birthday") BETWEEN make_interval(25) AND make_interval(29);
/* */
SELECT *
FROM "workers"
WHERE age("birthday") BETWEEN make_interval(23) AND make_interval(27) OR "salary" BETWEEN  make_interval(400) AND make_interval(1000);













