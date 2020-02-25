/*
// Author: Daniel Clayton
// Start: Please execute this script in PhpMyAdmin or another SQL server to install the database for this API.
// Description: This file creates the database and user utilized by the MTG card API.
// Info: root user, no password,
// Disclaimer: The following assets described in this file are properties belonging to Wizards of the Coast LLC, I do not claim ownership of any material used in this project.
// Last Updated: 02/25/2020
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
    card_ability VARCHAR(50),
    card_text VARCHAR(500) NOT NULL,
    card_storyText VARCHAR(200),
    card_power INT,
    card_toughness INT,
    card_image VARCHAR(50) NOT NULL,
    PRIMARY KEY (card_id)
);

/* Single set API data: */

INSERT INTO mtg_set (set_name, plane, set_image, release_date)
VALUES ("Theros Beyond Death", "Theros", "tbd-logo.png", "2020-01-24");


/* White Cards */
INSERT INTO mtg_card (card_name, set_name, card_type, card_color, card_genericManaCost, card_colorManaCost, card_convertedManaCost, card_rarity, card_ability, card_text, card_storyText, card_power, card_toughness, card_image)
VALUES ("Heliod, Sun-Crowned", "Theros Beyond Death", "Legendary Enchantment Creature - God", "White", 2, 1, 3, "Mythic Rare", "Indestructible", "As long as your devotion to white is less than five, Heliod isn't a creature.
Whenever you gain life, put a +1/+1 counter on target creature or enchantment you control. {1}W: Another target creature gains lifelink until end of turn.", NULL, 5, 5, "heliod-sun-crowned.png");

INSERT INTO mtg_card (card_name, set_name, card_type, card_color, card_genericManaCost, card_colorManaCost, card_convertedManaCost, card_rarity, card_ability, card_text, card_storyText, card_power, card_toughness, card_image)
VALUES ("Alseid of Life's Bounty", "Theros Beyond Death", "Enchantment Creature - Nymph", "White", 0, 1, 1, "Uncommon", "Lifelink", "{1}, Sacrifice Alseid of Life’s Bounty: Target creature or enchantment you control gains 
protection from the color of your choice until end of turn.", "'Dawn-kissed, he nourishes the golden grain.' -Psemilla, Meletian poet", 1, 1, "alseid-lifes-bounty.png");

INSERT INTO mtg_card (card_name, set_name, card_type, card_color, card_genericManaCost, card_colorManaCost, card_convertedManaCost, card_rarity, card_ability, card_text, card_storyText, card_power, card_toughness, card_image)
VALUES ("Archon of Falling Stars", "Theros Beyond Death", "Creature - Archon", "White", 4, 2, 6, "Uncommon", "Flying", "When Archon of Falling Stars dies, you may return target enchantment card from your graveyard to the battlefield.", 
NULL, 4, 4, "archon-falling-stars.png");

INSERT INTO mtg_card (card_name, set_name, card_type, card_color, card_genericManaCost, card_colorManaCost, card_convertedManaCost, card_rarity, card_ability, card_text, card_storyText, card_power, card_toughness, card_image)
VALUES ("Banishing Light", "Theros Beyond Death", "Enchantment", "White", 2, 1, 3, "Uncommon", NULL, "When Banishing Light enters the battlefield, exile target nonland permanent an opponent controls until Banishing Light leaves the
battlefield. (That permanent returns under its owner’s control.)", "The Champion reached for a stone, and Heliod placed the sun into her hand. -The Theriad", NULL, NULL, "banishing-light.png");

/* Blue Cards */
INSERT INTO mtg_card (card_name, set_name, card_type, card_color, card_genericManaCost, card_colorManaCost, card_convertedManaCost, card_rarity, card_ability, card_text, card_storyText, card_power, card_toughness, card_image)
VALUES ("Deny the Divine", "Theros Beyond Death", "Instant", "Blue", 2, 1, 3, "Common", NULL, "Counter target creature or enchantment spell. If that spell is countered this way, exile it instead of 
putting it into its owner’s graveyard.", "'A great wave crashed, and a mighty wind blew out the stars.' -The Cosmogony", NULL, NULL, "deny-divine.png");

INSERT INTO mtg_card (card_name, set_name, card_type, card_color, card_genericManaCost, card_colorManaCost, card_convertedManaCost, card_rarity, card_ability, card_text, card_storyText, card_power, card_toughness, card_image)
VALUES ("Callaphe, Beloved of the Sea", "Theros Beyond Death", "Legendary Enchantment Creature — Demigod", "Blue", 1, 2, 3, "Uncommon", "Callaphe’s power is equal to your devotion to blue.", "Creatures and enchantments you control have 'Spells your 
opponents cast that target this permanent cost {1} more to cast'.", NULL, NULL, 3, "callaphe-loved-sea.png");

INSERT INTO mtg_card (card_name, set_name, card_type, card_color, card_genericManaCost, card_colorManaCost, card_convertedManaCost, card_rarity, card_ability, card_text, card_storyText, card_power, card_toughness, card_image)
VALUES ("Omen of the Sea", "Theros Beyond Death", "Enchantment", "Blue", 1, 1, 2, "Common", "Flash", "When Omen of the Sea enters the battlefield, scry 2, then draw a card. {2}U, Sacrifice Omen of the Sea: Scry 2.", 
"'My time will come, when the rising tide will surge above the tallest mountain.'", NULL, NULL, "omen-of-sea.png");

/* Black Cards */
INSERT INTO mtg_card (card_name, set_name, card_type, card_color, card_genericManaCost, card_colorManaCost, card_convertedManaCost, card_rarity, card_ability, card_text, card_storyText, card_power, card_toughness, card_image)
VALUES ("Aphemia, the Cacophony", "Theros Beyond Death", "Legendary Enchantment Creature — Harpy", "Black", 1, 1, 2, "Rare", "Flying", "At the beginning of your end step, you may exile an enchantment card from your graveyard. If you do, 
create a 2/2 black Zombie creature token.", "'Sing, beauty. Sing for death, and for the dead.' -Ashiok", 2, 1, "aphemia-the-cacophony.png");

/* Multi-colored Cards */
INSERT INTO mtg_card (card_name, set_name, card_type, card_color, card_genericManaCost, card_colorManaCost, card_convertedManaCost, card_rarity, card_ability, card_text, card_storyText, card_power, card_toughness, card_image)
VALUES ("Atris, Oracle of Half-Truths", "Theros Beyond Death", "Legendary Creature - Human Advisor", "Blue, Black", 2, 2, 4, "Rare", "Menace", "When Atris, Oracle of Half-Truths enters the battlefield, target opponent looks 
at the top three cards of your library and separates them into a face-down pile and a face-up pile. Put one pile into your hand and the other into your graveyard.", NULL, 3, 2, "atris-oracle-half-truths.png");
