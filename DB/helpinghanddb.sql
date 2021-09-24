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
  `state` VARCHAR(45) NULL,
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
  `image_url` VARCHAR(2000) NULL,
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
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `image_url` VARCHAR(2000) NULL,
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
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `helpinghanddb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `role`, `email`, `phone`, `image_url`, `enabled`, `address_id`, `create_date`) VALUES (1, NULL, NULL, 'admin', 'helping', '1', NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;

