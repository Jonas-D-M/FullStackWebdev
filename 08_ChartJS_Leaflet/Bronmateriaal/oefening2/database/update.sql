USE `trein`; 

ALTER TABLE `bestemmingen` RENAME COLUMN `Llngitude` TO `longitude`;

UPDATE `bestemmingen` SET `latitude` = "50.8454639", `longitude` = "4.3569867" WHERE `idbestemming` = 100; 
UPDATE `bestemmingen` SET `latitude` = "51.217179", `longitude` = "4.421361" WHERE `idbestemming` = 101; 
UPDATE `bestemmingen` SET `latitude` = "51.036225", `longitude` = "3.710821" WHERE `idbestemming` = 102; 
UPDATE `bestemmingen` SET `latitude` = "51.223653", `longitude` = "3.202935" WHERE `idbestemming` = 103; 
