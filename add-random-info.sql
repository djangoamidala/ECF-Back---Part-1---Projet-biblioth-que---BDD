

-- Valeurs aléatoires dans la table user

INSERT INTO user (email, roles, password, enabled, created_at, updated_at, emprunteur_id)
SELECT
  CONCAT('user', num, '@example.com') AS email,
  '["ROLE_USER"]' AS roles,
  '123' AS password,
  CASE WHEN num % 2 = 0 THEN true ELSE false END AS enabled,
  NOW() AS created_at,
  NOW() AS updated_at,
  FLOOR(RAND() * 100) + 1 AS emprunteur_id
FROM (
  SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS num
  FROM information_schema.columns c1, information_schema.columns c2
) AS t
WHERE num <= 100;



-- Valeurs aléatoires dans la table livre 

INSERT INTO livre (titre, annee_edition, nombre_pages, code_isbn, auteur_id)
SELECT
  CONCAT('Livre', num) AS titre,
  FLOOR(RAND() * (2023 - 1900 + 1) + 1900) AS annee_edition,
  FLOOR(RAND() * (1000 - 50 + 1) + 50) AS nombre_pages,
  CONCAT(FLOOR(RAND() * 9000000000000 + 1000000000000)) AS code_isbn,
  FLOOR(RAND() * (4 - 1 + 1) + 1) AS auteur_id
FROM (
  SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS num
  FROM information_schema.columns c1, information_schema.columns c2
) AS t
WHERE num <= 1000;

-- Valeurs aléatoires dans la table auteur

INSERT INTO auteur (nom, prenom)
SELECT
  CONCAT('Nom', num) AS nom,
  CONCAT('Prenom', num) AS prenom
FROM (
  SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS num
  FROM information_schema.columns c1, information_schema.columns c2
) AS t
WHERE num <= 1000
LIMIT 500;
