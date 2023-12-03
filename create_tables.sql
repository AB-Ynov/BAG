-- create_tables.sql
-- Table pour les utilisateurs
CREATE TABLE IF NOT EXISTS utilisateurs (
    id INT PRIMARY KEY,
    nom_utilisateur VARCHAR(255),
    mot_de_passe VARCHAR(255),
    niveau_acces INT
);

-- Autres tables pour les membres de la famille, les relations familiales, etc.
-- Ajoutez d'autres attributs selon vos besoins.
