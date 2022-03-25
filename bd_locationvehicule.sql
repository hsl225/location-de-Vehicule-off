#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: client
#------------------------------------------------------------

CREATE TABLE client(
        n_client Int  Auto_increment  NOT NULL ,
        nom      Char (15) NOT NULL ,
        prenom   Char (50) NOT NULL ,
        n_cni    Char (50) NOT NULL ,
        numTel   Int NOT NULL
	,CONSTRAINT client_PK PRIMARY KEY (n_client)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: type_vehicule
#------------------------------------------------------------

CREATE TABLE type_vehicule(
        id_type    Int  Auto_increment  NOT NULL ,
        nom        Char (50) NOT NULL ,
        tarif_type Float NOT NULL
	,CONSTRAINT type_vehicule_PK PRIMARY KEY (id_type)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: vehicule
#------------------------------------------------------------

CREATE TABLE vehicule(
        n_serie          Int  Auto_increment  NOT NULL ,
        immat            Char (50) NOT NULL ,
        serie_vehicule   Char (30) NOT NULL ,
        couleur          Char (20) NOT NULL ,
        marque           Char (20) NOT NULL ,
        descrip_vehicule Char (100) NOT NULL ,
        id_type          Int NOT NULL
	,CONSTRAINT vehicule_PK PRIMARY KEY (n_serie)

	,CONSTRAINT vehicule_type_vehicule_FK FOREIGN KEY (id_type) REFERENCES type_vehicule(id_type)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: conducteur
#------------------------------------------------------------

CREATE TABLE conducteur(
        id_conducteur Int  Auto_increment  NOT NULL ,
        nom           Char (5) NOT NULL ,
        prenom        Char (50) NOT NULL ,
        numTel        Char (25) NOT NULL ,
        tarif_conduc  Float NOT NULL
	,CONSTRAINT conducteur_PK PRIMARY KEY (id_conducteur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Admin
#------------------------------------------------------------

CREATE TABLE Admin(
        id_admin  Int  Auto_increment  NOT NULL ,
        nom       Char (30) NOT NULL ,
        prenom    Char (50) NOT NULL ,
        mdp_admin Varchar (15) NOT NULL ,
        num_Tel   Int NOT NULL
	,CONSTRAINT Admin_PK PRIMARY KEY (id_admin)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: reservation
#------------------------------------------------------------

CREATE TABLE reservation(
        n_reservation     Int  Auto_increment  NOT NULL ,
        date_debut        Date NOT NULL ,
        date_fin          Date NOT NULL ,
        objet_reservation Char (100) NOT NULL ,
        tarif_reservation  Int NOT NULL ,
        n_client          Int NOT NULL ,
        n_serie           Int NOT NULL ,
        id_conducteur     Int NOT NULL ,
        id_admin          Int NOT NULL
	,CONSTRAINT reservation_PK PRIMARY KEY (n_reservation)

	,CONSTRAINT reservation_client_FK FOREIGN KEY (n_client) REFERENCES client(n_client)
	,CONSTRAINT reservation_vehicule0_FK FOREIGN KEY (n_serie) REFERENCES vehicule(n_serie)
	,CONSTRAINT reservation_conducteur1_FK FOREIGN KEY (id_conducteur) REFERENCES conducteur(id_conducteur)
	,CONSTRAINT reservation_Admin2_FK FOREIGN KEY (id_admin) REFERENCES Admin(id_admin)
)ENGINE=InnoDB;

