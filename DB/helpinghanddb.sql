-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema helpinghanddb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `helpinghanddb` ;

-- -----------------------------------------------------
-- Schema helpinghanddb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `helpinghanddb` DEFAULT CHARACTER SET utf8 ;
USE `helpinghanddb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street_address` VARCHAR(75) NOT NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(2) NULL,
  `zip_code` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `image_url` VARCHAR(2000) NULL,
  `enabled` INT NULL,
  `address_id` INT NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `password_UNIQUE` (`password` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pantry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pantry` ;

CREATE TABLE IF NOT EXISTS `pantry` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `hours` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(3000) NULL,
  `user_id` INT NOT NULL,
  `address_id1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pantry_user1_idx` (`user_id` ASC),
  INDEX `fk_pantry_address1_idx` (`address_id1` ASC),
  CONSTRAINT `fk_pantry_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pantry_address1`
    FOREIGN KEY (`address_id1`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventory` ;

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `image_url` VARCHAR(5000) NULL,
  `limit` INT NULL,
  `description` TEXT NULL,
  `pantry_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_inventory_pantry1_idx` (`pantry_id` ASC),
  CONSTRAINT `fk_inventory_pantry1`
    FOREIGN KEY (`pantry_id`)
    REFERENCES `pantry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `appointment` ;

CREATE TABLE IF NOT EXISTS `appointment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `appointment_date` DATETIME NULL,
  `user_id` INT NOT NULL,
  `pantry_id` INT NOT NULL,
  `rating` INT NULL,
  `comment` TEXT NULL,
  `create_date` DATETIME NULL,
  INDEX `fk_appointment_user1_idx` (`user_id` ASC),
  INDEX `fk_appointment_pantry1_idx` (`pantry_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_appointment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_pantry1`
    FOREIGN KEY (`pantry_id`)
    REFERENCES `pantry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventory_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventory_item` ;

CREATE TABLE IF NOT EXISTS `inventory_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inventory_id` INT NOT NULL,
  `available` TINYINT NULL,
  `expiration` DATE NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_inventory_item_inventory1_idx` (`inventory_id` ASC),
  CONSTRAINT `fk_inventory_item_inventory1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `inventory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cart` ;

CREATE TABLE IF NOT EXISTS `cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `create_date` DATETIME NULL,
  `completed` TINYINT NULL,
  `appointment_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cart_user1_idx` (`user_id` ASC),
  INDEX `fk_cart_appointment1_idx` (`appointment_id` ASC),
  CONSTRAINT `fk_cart_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_appointment1`
    FOREIGN KEY (`appointment_id`)
    REFERENCES `appointment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopping_cart_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shopping_cart_item` ;

CREATE TABLE IF NOT EXISTS `shopping_cart_item` (
  `id` INT NOT NULL,
  `inventory_item_id` INT NOT NULL,
  `cart_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shopping_cart_item_inventory_item1_idx` (`inventory_item_id` ASC),
  INDEX `fk_shopping_cart_item_cart1_idx` (`cart_id` ASC),
  CONSTRAINT `fk_shopping_cart_item_inventory_item1`
    FOREIGN KEY (`inventory_item_id`)
    REFERENCES `inventory_item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shopping_cart_item_cart1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `cart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pantry_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pantry_comment` ;

CREATE TABLE IF NOT EXISTS `pantry_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pantry_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `comment` TEXT NULL,
  `create_date` DATETIME NULL,
  `in_reply_to` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pantry_comment_pantry1_idx` (`pantry_id` ASC),
  INDEX `fk_pantry_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_pantry_comment_pantry_comment1_idx` (`in_reply_to` ASC),
  CONSTRAINT `fk_pantry_comment_pantry1`
    FOREIGN KEY (`pantry_id`)
    REFERENCES `pantry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pantry_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pantry_comment_pantry_comment1`
    FOREIGN KEY (`in_reply_to`)
    REFERENCES `pantry_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO helpinghanduser@localhost;
 DROP USER helpinghanduser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'helpinghanduser'@'localhost' IDENTIFIED BY 'helpinghanduser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'helpinghanduser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (1, '230 SE 16th Street', 'Ames', 'IA', '50010');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (2, '908 Kellogg Ave', 'Ames', 'IA', '50010');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (3, '925 Carroll Ave', 'Ames', 'IA', '50010');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (4, '5412 Maryland St', 'Ames', 'IA', '50014');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (5, '5504 Valley Rd', 'Ames', 'IA', '50014');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (6, '612 Lynn Ave', 'Ames', 'IA', '50014');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (7, '814 20th St', 'Ames', 'IA', '50010');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (8, '827 8th St', 'Ames', 'IA', '50010');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (9, '110 Waterfront Dr', 'Ames', 'IA', '50010');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (10, '1100 Adams St', 'Ames', 'IA', '50010');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (11, '111 Oneil Dr', 'Ames', 'IA', '50010');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (12, '1110 Roosevelt Ave', 'Ames', 'IA', '50010');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (13, '1116 Marston Ave', 'Ames', 'IA', '50010');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (14, '1103 N Dakota Ave #4', 'Ames', 'IA', '50014');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (15, '4523 Hemingway Dr', 'Ames', 'IA', '50014');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (16, '1302 Maxwell Ave', 'Ames', 'IA', '50010');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (17, '334 S 4th St', 'Ames', 'IA', '50010');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (18, '20433 570th Ave', 'Ames', 'IA', '50010');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (19, '620 S 4th St', 'Ames', 'IA', '50010');
INSERT INTO `address` (`id`, `street_address`, `city`, `state`, `zip_code`) VALUES (20, '1603 Northwestern Ave', 'Ames', 'IA', '50010');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (1, 'Biff', 'Tannen', 'sportsbetter', 'butthead', '1', 'butthead1@gmail.com', '800-987-6543', 'https://static.wikia.nocookie.net/bttf/images/f/f7/BiffHD.jpg/revision/latest/scale-to-width-down/250?cb=20101210165807', 1, 1, '2021-09-24 17:18:33.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (2, 'Ralph', 'Larson', 'rlarson', 'ralphlarson', '1', 'ralphlarson@gmail.com', '626-891-7575', NULL, 1, 2, '2021-09-25 13:00:33.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (3, 'Alma ', 'Savage', 'asavage', 'almasavage', '1', 'almasavage@aol.com', '886-214-5925', NULL, 1, 3, '2021-09-25 13:00:34.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (4, 'Cruz', 'Barnes', 'cbarnes', 'cruzbarnes', '2', 'cruzbarnes@yahoo.com', '778-556-8282', NULL, 1, 4, '2021-09-25 13:00:35.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (5, 'Hedley', 'Sweeney', 'hsweeney', 'hedleysweeney', '2', 'hedleysweeney@gmail.com', '835-890-3132', NULL, 1, 5, '2021-09-25 13:00:36.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (6, 'Ann', 'Tate', 'atate', 'anntate', '2', 'anntate@aol.com', '716-218-5771', NULL, 1, 6, '2021-09-25 13:00:37.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (7, 'Eagan', 'Frye', 'efrye', 'eaganfrye', '1', 'eaganfrye@gmail.com', '894-341-1814', NULL, 1, 7, '2021-09-25 13:00:38.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (8, 'Dara', 'Henderson', 'dhenderson', 'darahenderson', '2', 'darahenderson@gmail.com', '552-945-9759', NULL, 1, 8, '2021-09-25 13:00:39.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (9, 'Carson', 'Terrell', 'cterrell', 'carsonterrell', '1', 'carsonterrell@yahoo.com', '325-323-6555', NULL, 1, 9, '2021-09-25 13:00:40.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (10, 'Lucy', 'Ferrell', 'lferrell', 'lucyferrell', '2', 'lucyferrell@yahoo.com', '816-986-2613', NULL, 1, 10, '2021-09-25 13:00:41.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (11, 'Mannix', 'Phillips', 'mphillips', 'mannixphillips', '2', 'mannixphillips@gmail.com', '617-564-3668', NULL, 1, 11, '2021-09-25 13:00:42.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (12, 'Stephen', 'Bond', 'sbond', 'stephenbond', '2', 'stephenbond@gmail.com', '304-557-3596', NULL, 1, 12, '2021-09-25 13:00:43.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (13, 'Fitzgerald', 'Smith', 'fsmith', 'fitzgeraldsmith', '2', 'fitzgeraldsmith@yahoo.com', '641-306-4161', NULL, 1, 13, '2021-09-25 13:00:44.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (14, 'Dai', 'Fuller', 'dfuller', 'daiguller', '2', 'daifuller@yahoo.com', '860-812-7560', NULL, 1, 14, '2021-09-25 13:00:45.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (15, 'Hope', 'Snyder', 'hsnyder', 'hopesnyder', '3', 'hopesnyder@gmail.com', '127-762-9748', NULL, 1, 15, '2021-09-25 13:00:46.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (16, 'Judah', 'Waller', 'jwaller', 'judahwaller', '2', 'judahwaller@yahoo.com', '582-252-8735', NULL, 1, 16, '2021-09-25 13:00:47.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (17, 'Macon', 'Prince', 'mprince', 'maconprince', '2', 'maconprince@gmail.com', '481-683-5204', NULL, 1, 17, '2021-09-25 13:00:48.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (18, 'Demetria ', 'Perkins', 'dperkins', 'demetriaperkins', '2', 'demetriaperkins@yahoo.com', '963-428-2321', NULL, 1, 18, '2021-09-25 13:00:49.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (19, 'Ross', 'Franks', 'rfranks', 'rossfranks', '2', 'rossfranks@yahoo.com', '384-810-1318', NULL, 1, 19, '2021-09-25 13:00:50.001');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (20, 'Carla', 'Fuller', 'cfuller', 'carlafuller', '2', 'carlafuller@yahoo.com', '550-652-1680', NULL, 1, 20, '2021-09-25 13:00:51.001');

COMMIT;


-- -----------------------------------------------------
-- Data for table `pantry`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `pantry` (`id`, `name`, `phone`, `hours`, `description`, `image_url`, `user_id`, `address_id1`) VALUES (1, 'Mid-Iowa Community Action (MICA) Food Pantry', '515-956-3333', '8:00 AM - 8:00 PM daily', 'pre baged items use back entrance for curbside delivery willing to deliver tohome if needed please call ', 'https://www.energyassistance.us/gallery/192_1610426352.pnghttps://www.energyassistance.us/gallery/192_1610426352.png', 1, 1);
INSERT INTO `pantry` (`id`, `name`, `phone`, `hours`, `description`, `image_url`, `user_id`, `address_id1`) VALUES (2, 'Greater Harvest', '515-955-1349', '9:00 AM - 7:00 PM daily', 'pre baged and individual items available', NULL, 2, 2);
INSERT INTO `pantry` (`id`, `name`, `phone`, `hours`, `description`, `image_url`, `user_id`, `address_id1`) VALUES (3, 'Souper Heroes', '515-756-1452', '10:00AM - 5:00 PM daily', 'pre bagged and individual items available. Hot meals available on the weekends.', NULL, 3, 3);
INSERT INTO `pantry` (`id`, `name`, `phone`, `hours`, `description`, `image_url`, `user_id`, `address_id1`) VALUES (4, 'Giving Gang', '515-763-9876', '7:00 AM - 7:00 PM daily ', 'pre bagged and individual gorcery items available based on current inventory', NULL, 7, 7);
INSERT INTO `pantry` (`id`, `name`, `phone`, `hours`, `description`, `image_url`, `user_id`, `address_id1`) VALUES (5, 'Curbside Pantry', '515-779-1815', '9:00 AM - 6:00 PM daily', 'pre bagged items only', NULL, 9, 9);

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventory`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (1, 'Bag Lunch', 'data:image/jpeg;base64,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', 1, 'This brown bag contains a lunch', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (2, 'PBJ sandwich', 'https://en.wikipedia.org/wiki/Peanut_butter_and_jelly_sandwich#/media/File:Peanut-Butter-Jelly-Sandwich.jpg', 1, 'Peanut butter and jelly sandwich ready for pickup', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (3, 'Applesauce', 'https://en.wikipedia.org/wiki/Apple_sauce#/media/File:Applesauce.jpg', 1, 'Applesauce with no sugar added', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (4, 'Pasta', 'https://en.wikipedia.org/wiki/Pasta#/media/File:CSIRO_ScienceImage_11385_Pasta_made_from_durum_wheat.jpg', 1, 'Box of pasta noodles or mac and cheese', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (5, 'Rice', 'https://en.wikipedia.org/wiki/Rice#/media/File:White,_Brown,_Red_&_Wild_rice.jpg', 1, 'Box of ready rice in multiple flavors', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (6, 'Milk', 'https://en.wikipedia.org/wiki/Milk#/media/File:Glass_of_Milk_(33657535532).jpg', 1, '(1) gallon of milk', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (7, 'Granola Bars', 'https://upload.wikimedia.org/wikipedia/commons/f/fb/Granola_bar.jpg', 1, '(12) count package of granola bars ', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (8, 'Mashed Potatoes', 'https://en.wikipedia.org/wiki/Mashed_potato#/media/File:MashedPotatoes.jpg', 1, 'Box of instant mashed potatoes', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (9, 'Canned Baked Beans', NULL, 1, 'Can of baked beans', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (10, 'Ham', 'https://en.wikipedia.org/wiki/Ham#/media/File:Ham_(4).jpg', 1, 'Spiral ham', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (11, 'Chicken', 'https://en.wikipedia.org/wiki/Rotisserie_chicken#/media/File:Rotissierie_chicken.JPG', 1, 'Rotisserie chicken', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (12, 'Apple', 'https://media.istockphoto.com/photos/red-apple-picture-id184276818?k=20&m=184276818&s=612x612&w=0&h=QxOcueqAUVTdiJ7DVoCu-BkNCIuwliPEgtAQhgvBA_g=', 1, 'Fuji apples', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (13, 'Bread', 'https://en.wikipedia.org/wiki/Bread#/media/File:Breadindia.jpg', 1, 'Loaf of bread ', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (14, 'Butter', 'https://en.wikipedia.org/wiki/Butter#/media/File:Stick-of-butter-salted.jpg', 1, '(1) pound of butter ', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (15, 'Lettuce', 'https://en.wikipedia.org/wiki/Lettuce#/media/File:Romaine_lettuce.jpg', 1, 'Head of lettuce or bagged lettuce', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (16, 'Cereal', NULL, 1, 'Assorted dry breakfast cereal ', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (17, 'Toothbrush', 'https://en.wikipedia.org/wiki/Toothbrush#/media/File:Toothbrush_x3_20050716_001.jpg', 1, 'Toothbrush', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (18, 'Toothpaste', 'https://en.wikipedia.org/wiki/Toothpaste#/media/File:Zahncremes.jpg', 1, 'Toothpaste', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (19, 'Socks', 'https://en.wikipedia.org/wiki/Sock#/media/File:Argyle_(PSF).png', 1, '(1) pair of socks ', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (20, 'Prepaid phone card', 'https://en.wikipedia.org/wiki/Telephone_card#/media/File:Phonecards_from_found_in_Olneyville_Rhode_Island_2008.tif', 1, '(1) prepaid phone card', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (21, 'Bag Lunch', 'data:image/jpeg;base64,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', 1, 'This brown bag contains a lunch', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (22, 'Bag Lunch', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxISEhUSExMVFhUXFRcVFxcXFRUVFRcVGBcWFxcXFRUYHSggGBolGxUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OFhAQGSsdFRo3LysrKysrLS0tLSsrKys3KystLS0rKy0tLS0rKystLS0tLSs3Ky0tLTcrNysrKysrLf/AABEIAK8BIAMBIgACEQEDEQH/xAAbAAEAAQUBAAAAAAAAAAAAAAAAAwECBAUHBv/EAEIQAAIBAgIGBgcECAYDAAAAAAABAgMRBCEGEjFBUZEFYXGhwdETIjJSgZKxB0JyshUWNENTY3OiFCMkYuHwM4LC/8QAGQEBAAMBAQAAAAAAAAAAAAAAAAECBAUD/8QAJBEBAQACAQQDAQADAQAAAAAAAAECEQQDEiExMkFRIhRhcRP/2gAMAwEAAhEDEQA/AO4gAAAAAAAAAAAADNBpZitWEYJ5yd3+Ff8ALRvzxv2jS9DReKvfUSgqdvacpbpXy3v4Hn1d9t0v09d021SmXxqI8EtO+OHmuySLo6dw30p/2mDV/G17zWKxrI8TR05o741F/wCt/oZUNMcI/vSS64sjynT1+vldPMvVXrfNnkv1qwl8qy5NEsNJcK/30eY8na9T6eXvS5slhip+/L5peZ5+l0hCSTjUi1tVmnkSPEt5qQ7qjtjeLHVf4k/mZX9IVf4kuZoHjJreWSxc88+4d1/Tsn49N+lK38SXd5BdLVl+8fJeR5j/AB8lbYXvpGXDIn/0v6jsn49N+mq3v9y8jHxGlk6M6Ou04zqwpyySspvVvktzcTSfpB8DQ6T4iU3FW9WytLL2m5N267RjzLTqZb9q3p43xp2+JUhwdRShGS+9FS5pMmOixAAAAAAAAAAAAAAAAAAAAAAAAKM8rpnq1NWk1dL1mut5Lu1uZ6pnhulsRrV5vcpaq7Fl4M8OvlrHX69ejN5f8ebraO0ZfdsayvopT+6euRRwMLY8LW0T4GJU0ZlwR0bUHoUTujmE9HnwMep0FbcdPnho8CGWBi9w7qacsqdCtbLlqwlWPszkuyUl4nTK3RcXuMeXQUHuJ7jTnyxGKjsrVPmv9SZdNYxfvG+1Rfge1qaORsYtTRtE90NPL/rHirWbi+2HkSR0pxO+MPll5m/novwRBLRiVx/KPLWQ0tr/AMOHeZ+Eq1MS1KSSSTSitmbu327OSLlo809ncbvA4b0UG3uTduzMi6THTND6utg6Dfuavytx8Dcmn0QX+jo/hf5mbg6OPxjn5e6AAsgAAAAAAAAAAAAAAAAAAAAAR16mrGUnuTfJXOaupd34u9+tnutJK+ph6nWlH5ml9LnP3IxcrLzI1cfHxayo1SaEzAVQrGsZttGmxhK5JJmDSrErrkoVltRfFIjUkSAWpF0YhlbgUmgqaKxkXpEixUisaaL9pJDaEMZ4dX2Gn0krqFF22ykoLrvdvui+Zv6+SueI0zr/AOZTp8E5vtk9WPdF8xUx1jQ2opYKi17r/MzdHkfs0xGthNX3KklztLxPWpnR6d3jGDOaysVABdUAAAAAAAAAAAAAAAAAAAAowPM6cV7U4Q96TfwivOSPGNnodOK160I+7C/xk34JHnWc3r3edb+hNYRRTLlLMjkVSPF6slVLEiqGGmSpk7NMhTJIVDEuVhUJ2jTMlULozMWMyWDG1UktpNTqbjH1i5EjMiSqJhUpszou5KEGOV0u05p07ifSYqrLcnqLshaP1TOkdK1/R05VPdjKXJXRyylQbze3f1kLYun/AGT18q0PwTXen4HQ0cn+y+q44uUPepS7nF+B1hG7j3eDH15rOqgA93iAAAAAAAAAAAAAAAAAAAUZUpIDnOlVS+KqdWquUV4tmrRkdM1tbEVn/MkuTt4GMn1HJzu8q6WE1jFJIuRRMqiqy1lYsrJFoSvTL4sjiXoISJkilkQJkikSLoyJXMhpsukEJqcthn06ljW0iX01i0qLGHpnXth9X35Rj8F6z+i5niqStY9PpVLWdNcIuXxdl4GgdIWrYzw9VoNK2MpPLNTi/lfkdXONaF1HHF0euVuaaOyI2ca/yx8n5xUAGlnAAAAAAAAAAAAAAAAAAAKMqUkByHHS/wA2o+NSb5yZZGoSVo6zbWfrPzI40XwZyL7dOeokjULlMi9EySNJvMhK9bSskWar2by6FwLksisUFs+BTMkXaqLoRI9dolp1twEqhbcESQrZbi1VkyUK3LZIuvciqXughq+kvWqPqSj3X8TXSgbRq7k+Lb7/ACRBVpkWrRZo7LVxNF8KkfzLzO1ROI4R6lWD4Ti+TR25GziXxWXlTzFQAa2UAAAAAAAAAAAAAAAAAAAtkXFGBx2plJ2dmpNP4Nl9KrLiRYt2rVY8KtRf3MuRyL7rqT1E/ppcVyJKdZmN2lW7EDKjieou9OvdMW5LCSAyfTR4FVVg9qfeY0QpEo0zNam95a6cHskr8cu8xiKqt42abSGGW6SfcWPByWaaMCM8zJ13kyZUJ1RqLg/gQ1ZTjdtK2/zvYpKrLizHxFeWpK73AWYdJq5StBGLCRlYZXuiq0YWJiuF+vedjwU9aEZcYxfNHLHCO86X0FK+Hpf04dySNfF91m5PqM8AG1kAAAAAAAAAAAAAAAAAAAKSKlJAcc6aVsTWX82f5mRwlkT6SQ/1VfZ/5JfW5g029hyMvlXVxn8xmRkSNGPEmg7lTSjkTQZBLZcU2BkxRUipyKqVwaTJFld5FIrrKVciUKbye7IPiHU7gMu6ZhY+Novrt9S9V7EeKqKUbX+95jZpiUmZ+CWZgWsbHopbWQmq1snmdH0c/ZqX4F4nhalJPaj3nQKth6a/2o18X5Vl5PqNgADcyAAAAAAAAAAAAAAAAAAAFGVKMDkWltFf4qtK22o7mnUUtlz0GmFO2IrfjT5xT8TQVNpx+p8q63T+MZ0IJ73n1jUe6b+v1MeMrImjMqtoipbNZfFF8Vben2XRG2tZk+He0IXQpSeaS5ry2Eiw8/df9vmIVLXJqOL6yUXaKFOfuvl5FMRB8H8r2cjOp4hE8p3TfBE6VtaZ05texK3GzsWRm17WXbkbnC13FW3GVCpF3ulcnR3PNSz2NPsa/wCoqqb2PivE9DUo0ntSfwNV0ilTajDer7M1ty695Fid7YSotyUbG3pU9VWNXGTve+f/AFmZTxZEpYzNfie76Ad8PSf+xeJz2piI6rd89i7ToGjn7NR/pxNfFv8AVZuT8Y2QANzGAAAAAAAAAAAAAAAAAAAUZUtnKwHNNM8sXUT3qD/tS8GeZrxV0el06qReI1tZJuCWbS2OX/B5ytOLSaknuyaOT1prPJ1Oj5wiqZfFkVORfF5nk9tKt5l0KjRHPJ5lqmDSVVGFMsQRG06ZNKoZdHG29VrJ+Br4SLq18nwJlUuLbRrXJYTvyNVh6qM2hVReVSxlNGtxmc31WXJedzPlUStd2zRgxg22+Lb5sVCyCKVI2uzLp4feV9EmV0tK19OEpbE2dV0ejbDUV/Lj9DmrWrmjpnQX7PR/pw/KjVw/lWblXxGeADoMQAAAAAAAAAAAAAAAAAABDiI3TJgwOc6T6Pzqt2PHVtCaq2XO5ypJ7iyWFi9xS4S+1pnZ6cFnoviY7JSXxIX0bjYbJX7VfvR3yWAg9yIZ9E03uR53oY36ek6+c+3B6tXGr7kHzXgRrpLEL28P8sr/AFO51OgKT+6jFq6L0nuRW8XD8ek5WbjMOnbP16NRcfVv9CddO0Htco/ii0dTq6H0nuRhVtCKb3I87xJ+rTl37jwFLpPDvZVXM2FPFU5KynF/FNm/r6A03uXcazEfZ3T92PcUvE/2v/ly/TDcLZrZwLlrrNeZSWgso+xOUfw1JLuuR/q/ioezXl8XGX1RW8XL6q05WP42WDxDqepOKyWte1m9Uy1B27DTUcJjE161N9sfJm1pdH4uf34xv7qX/wBXE4+f2rl18PpkRju45GPWxNODtKavwvd8lmZtHRKc/bqSl2yduSyNvgND6UNyPTHjX7rzvI/I8/0ZSnWkklqx3t7bdS8zpeCgowSWxJJdiVkYuD6LhDYjYRVjT0+lOn6eGfUuftUAHq8wAAAAAAAH/9k=', 1, 'This brown bag contains a lunch', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (23, 'Bag Lunch', 'data:image/jpeg;base64,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', 1, 'This brown bag contains a lunch', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (24, 'PBJ sandwich', NULL, 1, 'Peanut butter and jelly sandwich ready for pickup', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (25, 'PBJ sandwich', NULL, 1, 'Peanut butter and jelly sandwich ready for pickup', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (26, 'PBJ sandwich', NULL, 1, 'Peanut butter and jelly sandwich ready for pickup', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (27, 'Applesauce', NULL, 1, 'Applesauce with no sugar added', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (28, 'Applesauce', NULL, 1, 'Applesauce with no sugar added', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (29, 'Applesauce', NULL, 1, 'Applesauce with no sugar added', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (30, 'Pasta', NULL, 1, 'Box of pasta noodles or mac and cheese', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (31, 'Pasta', NULL, 1, 'Box of pasta noodles or mac and cheese', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (32, 'Pasta', NULL, 1, 'Box of pasta noodles or mac and cheese', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (33, 'Rice', NULL, 1, 'Box of ready rice in multiple flavors', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (34, 'Rice', NULL, 1, 'Box of ready rice in multiple flavors', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (35, 'Rice', NULL, 1, 'Box of ready rice in multiple flavors', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (36, 'Milk', NULL, 1, '(1) gallon of milk', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (37, 'Milk', NULL, 1, '(1) gallon of milk', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (38, 'Milk', NULL, 1, '(1) gallon of milk', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (39, 'Granola Bars', NULL, 1, '(12) count package of granola bars ', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (40, 'Granola Bars', NULL, 1, '(12) count package of granola bars ', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (41, 'Granola Bars', NULL, 1, '(12) count package of granola bars ', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (42, 'Mashed Potatoes', NULL, 1, 'Box of instant mashed potatoes', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (43, 'Mashed Potatoes', NULL, 1, 'Box of instant mashed potatoes', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (44, 'Mashed Potatoes', NULL, 1, 'Box of instant mashed potatoes', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (45, 'Canned Baked Beans', NULL, 1, 'Can of baked beans', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (46, 'Canned Baked Beans', NULL, 1, 'Can of baked beans', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (47, 'Canned Baked Beans', NULL, 1, 'Can of baked beans', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (48, 'Ham', NULL, 1, 'Spiral ham', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (49, 'Ham', NULL, 1, 'Spiral ham', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (50, 'Ham', NULL, 1, 'Spiral ham', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (51, 'Chicken', NULL, 1, 'Rotisserie chicken', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (52, 'Chicken', NULL, 1, 'Rotisserie chicken', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (53, 'Chicken', NULL, 1, 'Rotisserie chicken', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (54, 'Apple', NULL, 1, 'Fuji apples', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (55, 'Apple', NULL, 1, 'Fuji apples', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (56, 'Apple', NULL, 1, 'Fuji apples', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (57, 'Bread', NULL, 1, 'Loaf of bread ', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (58, 'Bread', NULL, 1, 'Loaf of bread ', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (59, 'Bread', NULL, 1, 'Loaf of bread ', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (60, 'Butter', NULL, 1, '(1) pound of butter ', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (61, 'Butter', NULL, 1, '(1) pound of butter ', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (62, 'Butter', NULL, 1, '(1) pound of butter ', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (63, 'Lettuce', NULL, 1, 'Head of lettuce or bagged lettuce', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (64, 'Lettuce', NULL, 1, 'Head of lettuce or bagged lettuce', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (65, 'Lettuce', NULL, 1, 'Head of lettuce or bagged lettuce', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (66, 'Cereal', NULL, 1, 'Assorted dry breakfast cereal ', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (67, 'Cereal', NULL, 1, 'Assorted dry breakfast cereal ', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (68, 'Cereal', NULL, 1, 'Assorted dry breakfast cereal ', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (69, 'Toothbrush', NULL, 1, 'Toothbrush', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (70, 'Toothbrush', NULL, 1, 'Toothbrush', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (71, 'Toothbrush', NULL, 1, 'Toothbrush', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (72, 'Toothpaste', NULL, 1, 'Toothpaste', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (73, 'Toothpaste', NULL, 1, 'Toothpaste', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (74, 'Toothpaste', NULL, 1, 'Toothpaste', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (75, 'Socks', NULL, 1, '(1) pair of socks ', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (76, 'Socks', NULL, 1, '(1) pair of socks ', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (77, 'Socks', NULL, 1, '(1) pair of socks ', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (78, 'Prepaid phone card', NULL, 1, '(1) prepaid phone card', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (79, 'Prepaid phone card', NULL, 1, '(1) prepaid phone card', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (80, 'Prepaid phone card', NULL, 1, '(1) prepaid phone card', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (81, 'Bag of vegetables', 'https://en.wikipedia.org/wiki/Vegetable#/media/File:Marketvegetables.jpg', 1, 'Bag of assorted vegetables', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (82, 'Bag of vegetables', 'https://en.wikipedia.org/wiki/Vegetable#/media/File:Marketvegetables.jpg', 1, 'Bag of assorted vegetables', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (83, 'Bag of vegetables', 'https://en.wikipedia.org/wiki/Vegetable#/media/File:Marketvegetables.jpg', 1, 'Bag of assorted vegetables', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (84, 'Bag of vegetables', 'https://en.wikipedia.org/wiki/Vegetable#/media/File:Marketvegetables.jpg', 1, 'Bag of assorted vegetables', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (85, 'Bag of fruit', 'https://en.wikipedia.org/wiki/Fruit#/media/File:Culinary_fruits_front_view.jpg', 1, 'Bag of assorted fruits', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (86, 'Bag of fruit', 'https://en.wikipedia.org/wiki/Fruit#/media/File:Culinary_fruits_front_view.jpg', 1, 'Bag of assorted fruits', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (87, 'Bag of fruit', 'https://en.wikipedia.org/wiki/Fruit#/media/File:Culinary_fruits_front_view.jpg', 1, 'Bag of assorted fruits', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (88, 'Bag of fruit', 'https://en.wikipedia.org/wiki/Fruit#/media/File:Culinary_fruits_front_view.jpg', 1, 'Bag of assorted fruits', 4);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (89, 'Toilet paper', 'https://en.wikipedia.org/wiki/Toilet_paper#/media/File:Toiletpapier_(Gobran111).jpg', 1, '(1) pack of toilet paper ', 1);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (90, 'Toilet paper', 'https://en.wikipedia.org/wiki/Toilet_paper#/media/File:Toiletpapier_(Gobran111).jpg', 1, '(1) pack of toilet paper ', 2);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (91, 'Toilet paper', 'https://en.wikipedia.org/wiki/Toilet_paper#/media/File:Toiletpapier_(Gobran111).jpg', 1, '(1) pack of toilet paper ', 3);
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (92, 'Toilet paper', 'https://en.wikipedia.org/wiki/Toilet_paper#/media/File:Toiletpapier_(Gobran111).jpg', 1, '(1) pack of toilet paper ', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `appointment`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `appointment` (`id`, `appointment_date`, `user_id`, `pantry_id`, `rating`, `comment`, `create_date`) VALUES (1, '2021-09-25 17:18:33.001', 1, 1, 4, 'this is a comment from the appointment', '2021-09-24 17:18:33.001');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventory_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (1, 1, 1, '2022-09-24', '2021-09-24 17:18:33.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (2, 2, 1, '2022-09-25', '2021-09-25 17:18:35.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (3, 3, 1, '2022-09-26', '2021-09-25 17:18:36.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (4, 4, 1, '2022-09-27', '2021-09-25 17:18:37.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (5, 5, 1, '2022-09-28', '2021-09-25 17:18:38.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (6, 6, 1, '2022-09-29', '2021-09-25 17:18:39.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (7, 7, 1, '2022-10-01', '2021-09-25 17:18:40.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (8, 8, 1, '2022-10-02', '2021-09-25 17:18:41.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (9, 9, 1, '2022-10-03', '2021-09-25 17:18:42.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (10, 10, 1, '2022-10-04', '2021-09-25 17:18:43.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (11, 11, 1, '2022-10-05', '2021-09-25 17:18:44.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (12, 12, 1, '2022-10-06', '2021-09-25 17:18:45.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (13, 13, 1, '2022-10-07', '2021-09-25 17:18:46.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (14, 14, 1, '2022-10-08', '2021-09-25 17:18:47.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (15, 15, 1, '2022-10-09', '2021-09-25 17:18:48.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (16, 16, 1, '2022-10-10', '2021-09-25 17:18:49.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (17, 17, 1, '2022-10-11', '2021-09-25 17:18:50.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (18, 18, 1, '2022-10-12', '2021-09-25 17:18:51.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (19, 19, 1, '2022-10-13', '2021-09-25 17:18:52.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (20, 20, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (21, 1, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (22, 1, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (23, 1, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (24, 2, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (25, 2, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (26, 2, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (27, 3, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (28, 3, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (29, 3, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (30, 4, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (31, 4, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (32, 4, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (33, 5, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (34, 5, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (35, 5, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (36, 6, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (37, 6, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (38, 6, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (39, 7, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (40, 7, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (41, 7, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (42, 8, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (43, 8, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (44, 8, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (45, 9, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (46, 9, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (47, 9, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (48, 10, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (49, 10, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (50, 10, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (51, 11, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (52, 11, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (53, 11, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (54, 12, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (55, 12, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (56, 12, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (57, 13, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (58, 13, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (59, 13, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (60, 14, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (61, 14, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (62, 14, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (63, 15, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (64, 15, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (65, 15, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (66, 16, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (67, 16, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (68, 16, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (69, 17, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (70, 17, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (71, 17, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (72, 18, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (73, 18, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (74, 18, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (75, 19, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (76, 19, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (77, 19, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (78, 20, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (79, 20, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (80, 20, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (81, 21, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (82, 21, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (83, 21, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (84, 21, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (85, 22, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (86, 22, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (87, 22, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (88, 22, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (89, 23, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (90, 23, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (91, 23, 1, '2022-10-14', '2021-09-25 17:18:53.001');
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (92, 23, 1, '2022-10-14', '2021-09-25 17:18:53.001');

COMMIT;


-- -----------------------------------------------------
-- Data for table `cart`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `cart` (`id`, `user_id`, `create_date`, `completed`, `appointment_id`) VALUES (1, 1, '2021-09-24 17:18:33.001', 0, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `shopping_cart_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `shopping_cart_item` (`id`, `inventory_item_id`, `cart_id`) VALUES (1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pantry_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `pantry_comment` (`id`, `pantry_id`, `user_id`, `comment`, `create_date`, `in_reply_to`) VALUES (1, 1, 1, 'this is a comment from pantry_comment', '2021-09-24 17:18:33.001', 1);

COMMIT;

