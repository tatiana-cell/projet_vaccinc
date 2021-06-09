DROP DATABASE IF EXISTS MLR1_vaccines;

CREATE DATABASE IF NOT EXISTS MLR1_vaccines;
USE MLR1_vaccines;
# -----------------------------------------------------------------------------
#       TABLE : MEDECIN
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MEDECIN
 (
   ID_MEDECIN CHAR(5) NOT NULL  ,
   ID_CENTRE INTEGER NOT NULL  ,
   ID_CENTRE_1 INTEGER NOT NULL  ,
   NOM_MEDECIN CHAR(32) NULL  ,
   PRÉNOM_MEDECIN CHAR(32) NULL  
   , PRIMARY KEY (ID_MEDECIN) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MEDECIN
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MEDECIN_CENTRE
     ON MEDECIN (ID_CENTRE ASC);

CREATE  INDEX I_FK_MEDECIN_CENTRE1
     ON MEDECIN (ID_CENTRE_1 ASC);

# -----------------------------------------------------------------------------
#       TABLE : ENFANT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ENFANT
 (
   ID_ENFANT INTEGER NOT NULL AUTO_INCREMENT ,
   ID_ECOLE INTEGER NOT NULL  ,
   ID_ECOLE_1 INTEGER NOT NULL  ,
   NOM_ENFANT VARCHAR(128) NULL  ,
   PRÉNOM_ENFANT VARCHAR(128) NULL  ,
   POIDS SMALLINT NULL  ,
   TAILLE SMALLINT NULL  ,
   ANNEE_SCOLAIRE INTEGER NULL  
   , PRIMARY KEY (ID_ENFANT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ENFANT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ENFANT_ECOLE
     ON ENFANT (ID_ECOLE ASC);

CREATE  INDEX I_FK_ENFANT_ECOLE1
     ON ENFANT (ID_ECOLE_1 ASC);

# -----------------------------------------------------------------------------
#       TABLE : SPECIALITE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SPECIALITE
 (
   ID_SPECIALITÉ INTEGER NOT NULL AUTO_INCREMENT ,
   INTITULE_SPECIALITE CHAR(32) NULL  
   , PRIMARY KEY (ID_SPECIALITÉ) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CENTRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CENTRE
 (
   ID_CENTRE INTEGER NOT NULL AUTO_INCREMENT ,
   NOM_CENTRE VARCHAR(128) NULL  ,
   ADRESSE_CENTRE VARCHAR(128) NULL  
   , PRIMARY KEY (ID_CENTRE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CATEGORY
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CATEGORY
 (
   CODE_VACCIN INTEGER NOT NULL AUTO_INCREMENT ,
   INTITULE_CATEGORY VARCHAR(128) NULL  
   , PRIMARY KEY (CODE_VACCIN) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : VACCIN
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS VACCIN
 (
   ID_VACCIN INTEGER NOT NULL AUTO_INCREMENT ,
   CODE_VACCIN INTEGER NOT NULL  ,
   CODE_VACCIN_1 INTEGER NOT NULL  ,
   INTITULÉ_VACCIN CHAR(32) NULL  
   , PRIMARY KEY (ID_VACCIN) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE VACCIN
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_VACCIN_CATEGORY
     ON VACCIN (CODE_VACCIN ASC);

CREATE  INDEX I_FK_VACCIN_CATEGORY1
     ON VACCIN (CODE_VACCIN_1 ASC);

# -----------------------------------------------------------------------------
#       TABLE : ECOLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ECOLE
 (
   ID_ECOLE INTEGER NOT NULL AUTO_INCREMENT ,
   NOM_ECOLE CHAR(32) NULL  ,
   ADRESSE_ECOLE CHAR(32) NULL  ,
   NOMBRE_ELEVES INTEGER NULL  
   , PRIMARY KEY (ID_ECOLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SE_FAIRE_VACCINER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SE_FAIRE_VACCINER
 (
   ID_ENFANT INTEGER NOT NULL  ,
   ID_VACCIN INTEGER NOT NULL  ,
   ID_ENFANT_1 INTEGER NOT NULL  ,
   ID_VACCIN_1 INTEGER NOT NULL  ,
   DATE_VACCCINATION CHAR(32) NULL  
   , PRIMARY KEY (ID_ENFANT,ID_VACCIN,ID_ENFANT_1,ID_VACCIN_1) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE SE_FAIRE_VACCINER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_SE_FAIRE_VACCINER_ENFANT
     ON SE_FAIRE_VACCINER (ID_ENFANT ASC);

CREATE  INDEX I_FK_SE_FAIRE_VACCINER_VACCIN
     ON SE_FAIRE_VACCINER (ID_VACCIN ASC);

CREATE  INDEX I_FK_SE_FAIRE_VACCINER_ENFANT1
     ON SE_FAIRE_VACCINER (ID_ENFANT_1 ASC);

CREATE  INDEX I_FK_SE_FAIRE_VACCINER_VACCIN1
     ON SE_FAIRE_VACCINER (ID_VACCIN_1 ASC);

# -----------------------------------------------------------------------------
#       TABLE : AVOIR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS AVOIR
 (
   ID_MEDECIN CHAR(5) NOT NULL  ,
   ID_SPECIALITÉ INTEGER NOT NULL  ,
   ID_MEDECIN_1 CHAR(5) NOT NULL  ,
   ID_SPECIALITÉ_1 INTEGER NOT NULL  
   , PRIMARY KEY (ID_MEDECIN,ID_SPECIALITÉ,ID_MEDECIN_1,ID_SPECIALITÉ_1) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE AVOIR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_AVOIR_MEDECIN
     ON AVOIR (ID_MEDECIN ASC);

CREATE  INDEX I_FK_AVOIR_SPECIALITE
     ON AVOIR (ID_SPECIALITÉ ASC);

CREATE  INDEX I_FK_AVOIR_MEDECIN1
     ON AVOIR (ID_MEDECIN_1 ASC);

CREATE  INDEX I_FK_AVOIR_SPECIALITE1
     ON AVOIR (ID_SPECIALITÉ_1 ASC);

# -----------------------------------------------------------------------------
#       TABLE : ATTACHER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ATTACHER
 (
   ID_MEDECIN CHAR(5) NOT NULL  ,
   ID_ECOLE INTEGER NOT NULL  ,
   ID_MEDECIN_1 CHAR(5) NOT NULL  ,
   ID_ECOLE_1 INTEGER NOT NULL  ,
   ANEE_SCOLAIRE INTEGER NULL  
   , PRIMARY KEY (ID_MEDECIN,ID_ECOLE,ID_MEDECIN_1,ID_ECOLE_1) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ATTACHER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ATTACHER_MEDECIN
     ON ATTACHER (ID_MEDECIN ASC);

CREATE  INDEX I_FK_ATTACHER_ECOLE
     ON ATTACHER (ID_ECOLE ASC);

CREATE  INDEX I_FK_ATTACHER_MEDECIN1
     ON ATTACHER (ID_MEDECIN_1 ASC);

CREATE  INDEX I_FK_ATTACHER_ECOLE1
     ON ATTACHER (ID_ECOLE_1 ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE MEDECIN 
  ADD FOREIGN KEY FK_MEDECIN_CENTRE (ID_CENTRE)
      REFERENCES CENTRE (ID_CENTRE) ;


ALTER TABLE MEDECIN 
  ADD FOREIGN KEY FK_MEDECIN_CENTRE1 (ID_CENTRE_1)
      REFERENCES CENTRE (ID_CENTRE) ;


ALTER TABLE ENFANT 
  ADD FOREIGN KEY FK_ENFANT_ECOLE (ID_ECOLE)
      REFERENCES ECOLE (ID_ECOLE) ;


ALTER TABLE ENFANT 
  ADD FOREIGN KEY FK_ENFANT_ECOLE1 (ID_ECOLE_1)
      REFERENCES ECOLE (ID_ECOLE) ;


ALTER TABLE VACCIN 
  ADD FOREIGN KEY FK_VACCIN_CATEGORY (CODE_VACCIN)
      REFERENCES CATEGORY (CODE_VACCIN) ;


ALTER TABLE VACCIN 
  ADD FOREIGN KEY FK_VACCIN_CATEGORY1 (CODE_VACCIN_1)
      REFERENCES CATEGORY (CODE_VACCIN) ;


ALTER TABLE SE_FAIRE_VACCINER 
  ADD FOREIGN KEY FK_SE_FAIRE_VACCINER_ENFANT (ID_ENFANT)
      REFERENCES ENFANT (ID_ENFANT) ;


ALTER TABLE SE_FAIRE_VACCINER 
  ADD FOREIGN KEY FK_SE_FAIRE_VACCINER_VACCIN (ID_VACCIN)
      REFERENCES VACCIN (ID_VACCIN) ;


ALTER TABLE SE_FAIRE_VACCINER 
  ADD FOREIGN KEY FK_SE_FAIRE_VACCINER_ENFANT1 (ID_ENFANT_1)
      REFERENCES ENFANT (ID_ENFANT) ;


ALTER TABLE SE_FAIRE_VACCINER 
  ADD FOREIGN KEY FK_SE_FAIRE_VACCINER_VACCIN1 (ID_VACCIN_1)
      REFERENCES VACCIN (ID_VACCIN) ;


ALTER TABLE AVOIR 
  ADD FOREIGN KEY FK_AVOIR_MEDECIN (ID_MEDECIN)
      REFERENCES MEDECIN (ID_MEDECIN) ;


ALTER TABLE AVOIR 
  ADD FOREIGN KEY FK_AVOIR_SPECIALITE (ID_SPECIALITÉ)
      REFERENCES SPECIALITE (ID_SPECIALITÉ) ;


ALTER TABLE AVOIR 
  ADD FOREIGN KEY FK_AVOIR_MEDECIN1 (ID_MEDECIN_1)
      REFERENCES MEDECIN (ID_MEDECIN) ;


ALTER TABLE AVOIR 
  ADD FOREIGN KEY FK_AVOIR_SPECIALITE1 (ID_SPECIALITÉ_1)
      REFERENCES SPECIALITE (ID_SPECIALITÉ) ;


ALTER TABLE ATTACHER 
  ADD FOREIGN KEY FK_ATTACHER_MEDECIN (ID_MEDECIN)
      REFERENCES MEDECIN (ID_MEDECIN) ;


ALTER TABLE ATTACHER 
  ADD FOREIGN KEY FK_ATTACHER_ECOLE (ID_ECOLE)
      REFERENCES ECOLE (ID_ECOLE) ;


ALTER TABLE ATTACHER 
  ADD FOREIGN KEY FK_ATTACHER_MEDECIN1 (ID_MEDECIN_1)
      REFERENCES MEDECIN (ID_MEDECIN) ;


ALTER TABLE ATTACHER 
  ADD FOREIGN KEY FK_ATTACHER_ECOLE1 (ID_ECOLE_1)
      REFERENCES ECOLE (ID_ECOLE) ;

