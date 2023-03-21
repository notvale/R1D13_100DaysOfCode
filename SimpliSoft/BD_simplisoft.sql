CREATE SCHEMA simplisoft;

USE simplisoft;

CREATE TABLE Users (
	id_user INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    rut VARCHAR(10) NOT NULL,
    username VARCHAR(50) NOT NULL,
    userPassword VARCHAR(50) NOT NULL,
    email VARCHAR(80) NOT NULL,
    address VARCHAR(80) NOT NULL,
    userStatus BOOLEAN,
    phone VARCHAR(50) NOT NULL,
    fk_id_role INTEGER UNSIGNED
);

CREATE TABLE Roles (
	id_role INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	roleName VARCHAR(50) NOT NULL
);

CREATE TABLE Tickets (
id_ticket INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
ticket_creation_date DATETIME NOT NULL,
ticket_close_date DATETIME NOT NULL,
ticket_status VARCHAR(50),
fk_id_ticketuser INTEGER UNSIGNED
);

CREATE TABLE Devices (
id_device INTEGER UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT, 
device_type VARCHAR(50) NOT NULL, 
device_brand VARCHAR(50), 
device_model VARCHAR(50),
serial_number VARCHAR(50) NOT NULL,
fk_id_user INTEGER UNSIGNED
);

CREATE TABLE Orders (
id_order_service INTEGER UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT, 
comment_initial TEXT,
comment_technical TEXT,
comment_client TEXT, 
files BLOB,
status_order VARCHAR (30),
order_creation_date DATETIME,
order_close_date DATETIME,
fk_id_device INTEGER UNSIGNED,
fk_id_ticket INTEGER UNSIGNED
);
-- -------------------------------------------------------------------
-- ----- Foreing Key -------
-- -------------------------------------------------------------------

-- FK de la tabla Dispositivos con Users
ALTER TABLE Devices ADD FOREIGN KEY (fk_id_user) REFERENCES Users(id_user);

-- Foreing Key a la tabla de TICKETS ---------

ALTER TABLE Tickets ADD FOREIGN KEY (fk_id_ticketuser) REFERENCES Users (id_user);

-- Foreing Key a la tabla de Orders ---------

ALTER TABLE Orders ADD FOREIGN KEY (fk_id_ticket) REFERENCES Tickets (id_ticket);

ALTER TABLE Orders ADD FOREIGN KEY (fk_id_device) REFERENCES Devices (id_device);

-- FK de la table Users con Roles
ALTER TABLE Users ADD FOREIGN KEY (fk_id_role) REFERENCES Roles(id_role);
