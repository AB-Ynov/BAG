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

-- Ajoutez d'autres tables selon votre modèle