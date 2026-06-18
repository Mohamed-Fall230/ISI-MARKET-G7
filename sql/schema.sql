Entité vendeur (ou utilisateur)

· id_vendeur (PK)
· nom
· email
· téléphone (optionnel)
· mot_de_passe (pour la suite)

Entité categorie

· id_categorie (PK)
· nom (ex: "Immobilier", "Emploi", "Véhicules")
· description (optionnel)

Entité annonce

· id_annonce (PK)
· titre
· description
· prix
· date_publication
· id_vendeur (FK vers vendeur)
· id_categorie (FK vers categorie)
CREATE DATABASE IF NOT EXISTS site_annonces;
USE site_annonces;

-- Table vendeur
CREATE TABLE vendeur (
    id_vendeur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telephone VARCHAR(20),
    mot_de_passe VARCHAR(255) NOT NULL
);

-- Table categorie
CREATE TABLE categorie (
    id_categorie INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Table annonce
CREATE TABLE annonce (
    id_annonce INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(200) NOT NULL,
    description TEXT,
    prix DECIMAL(10,2),
    date_publication DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_vendeur INT NOT NULL,
    id_categorie INT NOT NULL,
    FOREIGN KEY (id_vendeur) REFERENCES vendeur(id_vendeur) ON DELETE CASCADE,
    FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie)
);