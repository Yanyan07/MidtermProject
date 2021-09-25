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
  `address_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pantry_address_idx` (`address_id` ASC),
  INDEX `fk_pantry_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_pantry_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pantry_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
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
-- Table `cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cart` ;

CREATE TABLE IF NOT EXISTS `cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `create_date` DATETIME NULL,
  `completed` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cart_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_cart_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
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
  `cart_id` INT NOT NULL,
  `rating` INT NULL,
  `comment` TEXT NULL,
  `create_date` DATETIME NULL,
  INDEX `fk_appointment_user1_idx` (`user_id` ASC),
  INDEX `fk_appointment_pantry1_idx` (`pantry_id` ASC),
  INDEX `fk_appointment_cart1_idx` (`cart_id` ASC),
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
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_cart1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `cart` (`id`)
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

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (1, 'Biff', 'Tannen', 'sportsbetter', 'butthead', '1', 'butthead1@gmail.com', '800-987-6543', 'https://static.wikia.nocookie.net/bttf/images/f/f7/BiffHD.jpg/revision/latest/scale-to-width-down/250?cb=20101210165807', 1, 1, '2021-09-24 17:18:33.001');

COMMIT;


-- -----------------------------------------------------
-- Data for table `pantry`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `pantry` (`id`, `name`, `phone`, `hours`, `description`, `image_url`, `address_id`, `user_id`) VALUES (1, 'Mid-Iowa Community Action (MICA) Food Pantry', '515-956-3333', '8:00 AM - 8:00 PM ', 'pre baged items use back entrance for curbside delivery willing to deliver tohome if needed please call ', 'https://www.energyassistance.us/gallery/192_1610426352.pnghttps://www.energyassistance.us/gallery/192_1610426352.png', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventory`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `inventory` (`id`, `name`, `image_url`, `limit`, `description`, `pantry_id`) VALUES (1, 'Bag Lunch', 'data:image/jpeg;base64,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', 1, 'This brown bag contains a lunch', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cart`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `cart` (`id`, `user_id`, `create_date`, `completed`) VALUES (1, 1, '2021-09-24 17:18:33.001', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `appointment`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `appointment` (`id`, `appointment_date`, `user_id`, `pantry_id`, `cart_id`, `rating`, `comment`, `create_date`) VALUES (1, '2021-09-25 17:18:33.001', 1, 1, 1, 4, 'this is a comment from the appointment', '2021-09-24 17:18:33.001');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventory_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `inventory_item` (`id`, `inventory_id`, `available`, `expiration`, `create_date`) VALUES (1, 1, 1, '2021-09-24', '2021-09-24 17:18:33.001');

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

