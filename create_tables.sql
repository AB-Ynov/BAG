-- create_tables.sql

-- Créez la base de données si elle n'existe pas
CREATE DATABASE IF NOT EXISTS base_de_donnees;

-- Utilisez la base de données
USE base_de_donnees;

-- Créez la table des utilisateurs
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

-- Créez la table des rôles
CREATE TABLE IF NOT EXISTS roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(255) UNIQUE NOT NULL
);

-- Ajoutez des rôles spécifiques (administrateur, utilisateur régulier, etc.)
INSERT INTO roles (role_name) VALUES ('administrateur'), ('utilisateur_regulier');

-- Ajoutez une colonne pour stocker le rôle de chaque utilisateur
ALTER TABLE users ADD COLUMN role_id INT;

-- Associez les utilisateurs à leurs rôles respectifs
UPDATE users SET role_id = (SELECT role_id FROM roles WHERE role_name = 'administrateur') WHERE username = 'admin';
UPDATE users SET role_id = (SELECT role_id FROM roles WHERE role_name = 'utilisateur_regulier') WHERE username = 'utilisateur1';

-- Créez la table des autorisations
CREATE TABLE IF NOT EXISTS permissions (
    permission_id INT PRIMARY KEY AUTO_INCREMENT,
    permission_name VARCHAR(255) UNIQUE NOT NULL
);

-- Associez les autorisations aux rôles
CREATE TABLE IF NOT EXISTS role_permissions (
    role_id INT,
    permission_id INT,
    PRIMARY KEY (role_id, permission_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY (permission_id) REFERENCES permissions(permission_id)
);

-- Ajoutez des autorisations spécifiques
INSERT INTO permissions (permission_name) VALUES ('accès_page_administration'), ('accès_page_utilisateur');

INSERT INTO role_permissions (role_id, permission_id) VALUES
((SELECT role_id FROM roles WHERE role_name = 'administrateur'), (SELECT permission_id FROM permissions WHERE permission_name = 'accès_page_administration')),
((SELECT role_id FROM roles WHERE role_name = 'utilisateur_regulier'), (SELECT permission_id FROM permissions WHERE permission_name = 'accès_page_utilisateur'));

-- Créez la table des journaux d'audit
CREATE TABLE IF NOT EXISTS audit_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    action VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Exemple : Enregistrez l'attribution d'une nouvelle autorisation à un utilisateur
INSERT INTO audit_logs (user_id, action) VALUES (1, 'Attribution d\'une nouvelle autorisation à un utilisateur');
