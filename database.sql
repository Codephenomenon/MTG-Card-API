/*
// Author: Daniel Clayton
// Start: Please execute this script in PhpMyAdmin or another SQL server to install the database for this API.
// Description: This file creates the database and user utilized by the MTG card API.
// Info: root user, no password,
// Disclaimer: The following assets described in this file are properties belonging to Wizards of the Coast LLC, I do not claim ownership of any material used in this project.
// Last Updated: 02/11/2020
*/

DROP DATABASE IF EXISTS MagicCardApi;
CREATE DATABASE MagicCardApi;
USE MagicCardApi;
CREATE USER IF NOT EXISTS 'magicAdmin'@'localhost' IDENTIFIED BY 'mypassword123';
GRANT ALL PRIVILEGES ON MagicCardApi TO 'magicAdmin'@'localhost';

CREATE TABLE mtg_set (
    set_id INT NOT NULL AUTO_INCREMENT,
    set_name VARCHAR(100) NOT NULL,
    plane VARCHAR(100) NOT NULL,
    set_image VARCHAR(50) NOT NULL,
    release_date DATE NOT NULL,
    PRIMARY KEY (set_id)
);

CREATE TABLE mtg_card (
    card_id INT NOT NULL AUTO_INCREMENT,
    card_name VARCHAR(100) NOT NULL,
    set_name VARCHAR(100) NOT NULL,
    card_type VARCHAR(50) NOT NULL,
    card_color VARCHAR(50) NOT NULL,
    card_genericManaCost INT NOT NULL,
    card_colorManaCost INT NOT NULL,
    card_convertedManaCost INT NOT NULL,
    card_rarity VARCHAR(50) NOT NULL,
    card_ability VARCHAR(50) NOT NULL,
    card_text VARCHAR(500) NOT NULL,
    card_storyText VARCHAR(200),
    card_image VARCHAR(50) NOT NULL,
    PRIMARY KEY (card_id)
);

/* Test data for API */

INSERT INTO mtg_set (set_name, plane, set_image, release_date)
VALUES ("Theros Beyond Death", "Theros", "tbd-logo.png", "2020-01-24");

INSERT INTO mtg_card (card_name, set_name, card_type, card_color, card_genericManaCost, card_colorManaCost, card_convertedManaCost, card_rarity, card_ability, card_text, card_storyText, card_image)
VALUES ("Heliod, Sun-Crowned", "Theros Beyond Death", "Legendary Enchantment Creature - God", "White", 2, 1, 3, "Mythic Rare", "Indestructible", "As long as your devotion to white is less than five, Heliod isn't a creature.
Whenever you gain life, put a +1/+1 counter on target creature or enchantment you control. 1W: Another target creature gains lifelink until end of turn.", NULL, "heliod-sun-crowned.png");

INSERT INTO mtg_card (card_name, set_name, card_type, card_color, card_genericManaCost, card_colorManaCost, card_convertedManaCost, card_rarity, card_ability, card_text, card_storyText, card_image)
VALUES ("Atris, Oracle of Half-Truths", "Theros Beyond Death", "Legendary Creature - Human Advisor", "Blue, Black", 2, 2, 4, "Rare", "Menace", "When Atris, Oracle of Half-Truths enters the battlefield, target opponent looks 
at the top three cards of your library and separates them into a face-down pile and a face-up pile. Put one pile into your hand and the other into your graveyard.", NULL, "atris-oracle-half-truths.png");