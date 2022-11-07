BEGIN TRANSACTION;
DROP TABLE IF EXISTS "authors";
CREATE TABLE IF NOT EXISTS "authors" (
	"id"	INTEGER NOT NULL,
	"first"	TEXT NOT NULL,
	"last"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "titles";
CREATE TABLE IF NOT EXISTS "titles" (
	"isbn"	TEXT NOT NULL,
	"title"	TEXT NOT NULL,
	"edition"	INTEGER NOT NULL,
	"copyright"	TEXT NOT NULL,
	PRIMARY KEY("isbn")
);
DROP TABLE IF EXISTS "author_ISBN";
CREATE TABLE IF NOT EXISTS "author_ISBN" (
	"id"	INTEGER NOT NULL,
	"isbn"	TEXT NOT NULL,
	FOREIGN KEY("id") REFERENCES "authors"("id") ON DELETE CASCADE,
	FOREIGN KEY("isbn") REFERENCES "titles"("isbn") ON DELETE CASCADE,
	PRIMARY KEY("id","isbn")
);
INSERT INTO "authors" VALUES (1,'George','Orwell');
INSERT INTO "authors" VALUES (2,'Mark','Twain');
INSERT INTO "authors" VALUES (3,'Leo','Tolstoy');
INSERT INTO "authors" VALUES (4,'Louise','Maude');
INSERT INTO "titles" VALUES ('9780451524','1984',1,'1903');
INSERT INTO "titles" VALUES ('9780486280','The Adventures of Huckleberry Finn',1,'1910');
INSERT INTO "titles" VALUES ('1420951580','Anna Karenina',1,'1910');
INSERT INTO "titles" VALUES ('B01GBWT0L0','War and Peace',2,'2016');
INSERT INTO "author_ISBN" VALUES (1,'9780451524');
INSERT INTO "author_ISBN" VALUES (2,'9780486280');
INSERT INTO "author_ISBN" VALUES (3,'1420951580');
INSERT INTO "author_ISBN" VALUES (3,'B01GBWT0L0');
INSERT INTO "author_ISBN" VALUES (4,'B01GBWT0L0');
COMMIT;
