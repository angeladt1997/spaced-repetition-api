BEGIN;

TRUNCATE
  "word",
  "language",
  "spacerepuser";

INSERT INTO "spacerepuser" ("id", "username", "name", "password")
VALUES
  (
    1,
    'admin',
    'Dunder Mifflin Admin',
    -- password = "pass"
    '$2a$10$fCWkaGbt7ZErxaxclioLteLUgg4Q3Rp09WW0s/wSLxDKYsaGYUpjG'
  );

INSERT INTO "language" ("id", "name", "user_id")
VALUES
  (1, 'Balinese', 1);

INSERT INTO "word" ("id", "language_id", "original", "translation", "next")
VALUES
  (1, 1, 'Hai', 'Hello', 2),
  (2, 1, 'Tolong', 'Help', 3),
  (3, 1, 'Minum', 'Drink', 4),
  (4, 1, 'Makan', 'Eat', 5),
  (5, 1, 'Sampai', 'Good', 6),
  (6, 1, 'Jumpa', 'Bye', 7),
  (7, 1, 'Maaf', 'Sorry', 8),
  (8, 1, 'Tidak', 'No', 9),
  (9, 1, 'Beli', 'Buy', 10),
  (10, 1, 'Bernang', 'Swam', null);

UPDATE "language" SET head = 1 WHERE id = 1;

-- because we explicitly set the id fields
-- update the sequencer for future automatic id setting
SELECT setval('word_id_seq', (SELECT MAX(id) from "word"));
SELECT setval('language_id_seq', (SELECT MAX(id) from "language"));
SELECT setval('spacerepuser_id_seq', (SELECT MAX(id) from "spacerepuser"));

COMMIT;
