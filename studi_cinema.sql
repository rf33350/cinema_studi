/*Creation de la base de données CINEMA_STUDI*/
CREATE DATABASE IF NOT EXISTS cinema_studi CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

/*creation de la table Administrator*/
CREATE TABLE cinema_studi.administrator(
	IdAdministrator int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	FirstName varchar(250),
	LastName varchar(250), 
	Email varchar(250),
	Password varchar(250)
)engine=INNODB;

/*remplissage de la table Administrator*/
INSERT INTO cinema_studi.administrator (FirstName, LastName, Email, Password)  VALUES ('Dupond',' Antoine', 'dupond@mail.fr', 'dsfqdfSDQDQS1561@^]');
INSERT INTO cinema_studi.administrator (FirstName, LastName, Email, Password)  VALUES ('Petit',' Henry', 'petit@mail.fr', 'dsfq154MMllDQS1561@^');
INSERT INTO cinema_studi.administrator (FirstName, LastName, Email, Password)  VALUES ('Poirier','Lucas', 'lpoir@mail.fr', 'dsgqfkliuMM1561@^');
INSERT INTO cinema_studi.administrator (FirstName, LastName, Email, Password)  VALUES ('Basil',' Aude', 'aude358@mail.fr', 'dqdfsqf1561@^');
INSERT INTO cinema_studi.administrator (FirstName, LastName, Email, Password)  VALUES ('Aignard',' Louis', 'louisar@mail.fr', '45^sdgfdsgreD]');

/*creation de la table TOWN*/
CREATE TABLE cinema_studi.town (
	IdTown int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	PostCode int,
	Name varchar(250)
)engine=INNODB;

/*remplissage de la table TOWN*/
INSERT INTO cinema_studi.town (PostCode, Name)  VALUES (33500, 'Libourne');
INSERT INTO cinema_studi.town (PostCode, Name)  VALUES (33000, 'Bordeaux');
INSERT INTO cinema_studi.town (PostCode, Name)  VALUES (33400, 'Talence');
INSERT INTO cinema_studi.town (PostCode, Name)  VALUES (38000, 'Grenoble');
INSERT INTO cinema_studi.town (PostCode, Name)  VALUES (13000, 'Marseille');

/*creation de la table CLIENT*/
CREATE TABLE cinema_studi.client(
	IdClient int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	FirstName varchar(250),
	LastName varchar(250), 
	Email varchar(250),
	Password varchar(250)
)engine=INNODB;

/*remplissage de la table CLIENT*/
INSERT INTO cinema_studi.client (FirstName, LastName, Email, Password)  VALUES ('Laurent',' Antoine', 'dupond@mail.fr', 'dsfqdfSDQDQS1561@^]');
INSERT INTO cinema_studi.client (FirstName, LastName, Email, Password)  VALUES ('Authier',' Henry', 'petit@mail.fr', 'dsfq154MMllDQS1561@^]');
INSERT INTO cinema_studi.client (FirstName, LastName, Email, Password)  VALUES ('Zinger','Lucas', 'lpoir@mail.fr', 'dsgqfkliuMM1561@^]');
INSERT INTO cinema_studi.client (FirstName, LastName, Email, Password)  VALUES ('Harper',' Aude', 'aude358@mail.fr', 'dqdfsqf1561@^]');
INSERT INTO cinema_studi.client (FirstName, LastName, Email, Password)  VALUES ('Faure',' Louis', 'louisar@mail.fr', '45^sdgfdsgreD]');

/*creation de la table PRICE*/
CREATE TABLE cinema_studi.price(
	IdPrice int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	Price float,
	Description varchar(255)
)engine=INNODB;

/*remplissage de la table PRICE*/
INSERT INTO cinema_studi.price (Price, Description) VALUES (9.20, 'Plein tarif');
INSERT INTO cinema_studi.price (Price, Description) VALUES (7.60, 'Etudiant');
INSERT INTO cinema_studi.price (Price, Description) VALUES (5.90, 'Moins de 14 ans');

/*creation de la table cinema*/
CREATE TABLE cinema_studi.cinema(
	IdCinema int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	Name varchar(250),
	Address varchar(250),
	IdTown int,
	FOREIGN KEY (IdTown) REFERENCES cinema_studi.town (IdTown)
)engine=INNODB;

/*remplissage de la table CINEMA*/
INSERT INTO cinema_studi.cinema (Name, Address, IdTown)  VALUES ('Grand Ecran', '8 Allée des roses', 1);
INSERT INTO cinema_studi.cinema (Name, Address, IdTown)  VALUES ('Multiplex', '8 Allée des lilas', 2);
INSERT INTO cinema_studi.cinema (Name, Address, IdTown)  VALUES ('Grand Ecran', '8 Allée des acacias', 3);
INSERT INTO cinema_studi.cinema (Name, Address, IdTown)  VALUES ('Grand Ecran', '7 Allée des cerisiers', 4);
INSERT INTO cinema_studi.cinema (Name, Address, IdTown)  VALUES ('Grand Ecran', '15 Allée des la prairie', 5);

/*creation de la table ROOM*/
CREATE TABLE cinema_studi.room(
	IdRoom int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	Capacity int not null,
	IdCinema int,
	FOREIGN KEY (IdCinema) REFERENCES cinema_studi.cinema (IdCinema)
)engine=INNODB;

/*remplissage de la table ROOM*/
INSERT INTO cinema_studi.room (Capacity, IdCinema) VALUES (250, 1);
INSERT INTO cinema_studi.room (Capacity, IdCinema) VALUES (320, 2);
INSERT INTO cinema_studi.room (Capacity, IdCinema) VALUES (200, 3);
INSERT INTO cinema_studi.room (Capacity, IdCinema) VALUES (50, 4);
INSERT INTO cinema_studi.room (Capacity, IdCinema) VALUES (500, 5);

/*creation de la table MOVIE*/
CREATE TABLE cinema_studi.movie(
	IdMovie int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	Title varchar(250),
	Duration int
)engine=INNODB;

/*remplissage de la table MOVIE*/
INSERT INTO cinema_studi.movie (Title, Duration) VALUES ('Matrix', 122);
INSERT INTO cinema_studi.movie (Title, Duration) VALUES ('Inception', 184);
INSERT INTO cinema_studi.movie (Title, Duration) VALUES ('Le seigneur des anneaux', 320);
INSERT INTO cinema_studi.movie (Title, Duration) VALUES ('The tree of life', 132);
INSERT INTO cinema_studi.movie (Title, Duration) VALUES ('Bullet Train', 142);

/*creation de la table PROJECTION*/
CREATE TABLE cinema_studi.projection(
	IdProjection int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	DateTimeProj datetime, 
	IdRoom int,
	IdMovie int,
	IdCinema int,
	FOREIGN KEY (IdRoom) REFERENCES cinema_studi.room (IdRoom),
	FOREIGN KEY (IdMovie) REFERENCES cinema_studi.movie (IdMovie),
	FOREIGN KEY (IdCinema) REFERENCES cinema_studi.cinema (IdCinema)
)engine=INNODB;

/*remplissage de la table PROJECTION*/
INSERT INTO cinema_studi.projection (DateTimeProj, IdRoom, IdMovie, IdCinema) VALUES ('2022-12-31 23:59:59', 1, 5, 1);
INSERT INTO cinema_studi.projection (DateTimeProj, IdRoom, IdMovie, IdCinema) VALUES ('2022-12-22 23:59:59', 2, 4, 2);
INSERT INTO cinema_studi.projection (DateTimeProj, IdRoom, IdMovie, IdCinema) VALUES ('2022-01-31 19:30:10', 3, 3, 3);
INSERT INTO cinema_studi.projection (DateTimeProj, IdRoom, IdMovie, IdCinema) VALUES ('2023-04-17 17:15:00', 4, 2, 4);
INSERT INTO cinema_studi.projection (DateTimeProj, IdRoom, IdMovie, IdCinema) VALUES ('2023-10-11 15:05:00', 5, 1, 5);

/*creation de la table PLACE*/
CREATE TABLE cinema_studi.place(
	IdPlace int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	IdPrice int,
	IdProjection int,
	IdClient int,
	FOREIGN KEY (IdPrice) REFERENCES cinema_studi.price (IdPrice),
	FOREIGN KEY (IdProjection) REFERENCES cinema_studi.projection (IdProjection),
	FOREIGN KEY (IdClient) REFERENCES cinema_studi.client (IdClient)
)engine=INNODB;


/*remplissage de la table PLACE*/
INSERT INTO cinema_studi.place (IdPrice, IdProjection, IdClient)  VALUES (1, 1, 1);
INSERT INTO cinema_studi.place (IdPrice, IdProjection, IdClient)  VALUES (2, 2, 2);
INSERT INTO cinema_studi.place (IdPrice, IdProjection, IdClient)  VALUES (3, 3, 3);
INSERT INTO cinema_studi.place (IdPrice, IdProjection, IdClient)  VALUES (1, 4, 4);
INSERT INTO cinema_studi.place (IdPrice, IdProjection, IdClient)  VALUES (2, 5, 5);

/*creation de la table administrator_cinema */
CREATE TABLE cinema_studi.administrator_cinema  (
	IdCinema int,
	FOREIGN KEY (IdCinema) REFERENCES cinema_studi.cinema (IdCinema),
	IdAdministrator int,
	FOREIGN KEY (IdAdministrator) REFERENCES cinema_studi.administrator (IdAdministrator)
)engine=INNODB;

/*creation de la table administrator_price*/
CREATE TABLE cinema_studi.administrator_price (
	IdPrice int,
	FOREIGN KEY (IdPrice) REFERENCES cinema_studi.price (IdPrice),
	IdAdministrator int,
	FOREIGN KEY (IdAdministrator) REFERENCES cinema_studi.administrator (IdAdministrator)
)engine=INNODB;