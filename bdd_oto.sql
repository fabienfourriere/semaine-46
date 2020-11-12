CREATE DATABASE Oto;

USE Oto;

CREATE TABLE Client(
   num_client INT,
   nom_client VARCHAR(50),
   prenom_client VARCHAR(50),
   adresse_client VARCHAR(200),
   PRIMARY KEY(num_client)
);

CREATE TABLE Service(
   num_service INT,
   nom_service VARCHAR(50),
   vente_service BOOLEAN NOT NULL,
   PRIMARY KEY(num_service)
);

CREATE TABLE Salarie(
   num_salarie INT,
   nom_salarie VARCHAR(50),
   prenom_salarie VARCHAR(50),
   PRIMARY KEY(num_salarie)
);

CREATE TABLE Accessoire(
   num_accessoire INT,
   nom_accessoire VARCHAR(50),
   vente_accessoire BOOLEAN NOT NULL,
   PRIMARY KEY(num_accessoire)
);

CREATE TABLE Marque(
   num_marque INT,
   nom_marque VARCHAR(50),
   PRIMARY KEY(num_marque)
);

CREATE TABLE Modele(
   num_modele INT,
   nom_modele VARCHAR(50),
   PRIMARY KEY(num_modele),
);

CREATE TABLE Commande(
   num_commande INT,
   num_client INT,
   date_commande DATE NOT NULL,
   PRIMARY KEY(num_commande, num_client),
   FOREIGN KEY(num_client) REFERENCES Client(num_client)
);

CREATE TABLE Vehicule(
   num_vehicule INT,
   nom_vehicule VARCHAR(50),
   vente_vehicule BOOLEAN NOT NULL,
   PRIMARY KEY(num_vehicule),
);

CREATE TABLE LigneDeCommande(
   num_commande INT,
   num_accessoire INT,
   nom_accessoire VARCHAR(50),
   nb_accessoire INT,
   num_vehicule INT,
   nom_vehicule VARCHAR(50),
   nb_vehicule INT,
   num_service INT,
   nom_service VARCHAR(50),
   nb_service INT,
   PRIMARY KEY(num_commande),
   FOREIGN KEY(num_accessoire) REFERENCES Accessoire(num_accessoire),
   FOREIGN KEY(num_service) REFERENCES Service(num_service),
   FOREIGN KEY(num_vehicule) REFERENCES Vehicule(num_vehicule),
   FOREIGN KEY(num_commande) REFERENCES Commande(num_commande),
);

CREATE INDEX client
ON client ( num_client, num_commande, date_commande ASC )


