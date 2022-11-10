-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema GrowSkill
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GrowSkill
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GrowSkill` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema sql_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sql_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sql_store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `GrowSkill` ;

-- -----------------------------------------------------
-- Table `GrowSkill`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrowSkill`.`Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `date_registered` DATETIME NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrowSkill`.`Instructors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrowSkill`.`Instructors` (
  `instructor_id` SMALLINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`instructor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrowSkill`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrowSkill`.`courses` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `instructor_id` SMALLINT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_courses_Instructors1_idx` (`instructor_id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  CONSTRAINT `fk_courses_Instructors1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `GrowSkill`.`Instructors` (`instructor_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrowSkill`.`enrollments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrowSkill`.`enrollments` (
  `customer_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  INDEX `fk_enrollments_students_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_enrollments_courses1_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_enrollments_students`
    FOREIGN KEY (`customer_id`)
    REFERENCES `GrowSkill`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_enrollments_courses`
    FOREIGN KEY (`course_id`)
    REFERENCES `GrowSkill`.`courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrowSkill`.`class_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrowSkill`.`class_status` (
  `class_status_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`class_status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrowSkill`.`Links`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrowSkill`.`Links` (
  `link_id` INT NOT NULL,
  `url_link` VARCHAR(2048) NULL,
  PRIMARY KEY (`link_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrowSkill`.`classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GrowSkill`.`classes` (
  `class_id` INT NOT NULL AUTO_INCREMENT,
  `topic` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  `course_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `link_id` INT NOT NULL,
  PRIMARY KEY (`class_id`),
  INDEX `fk_classes_courses1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_classes_class_status1_idx` (`status_id` ASC) VISIBLE,
  INDEX `fk_classes_Links1_idx` (`link_id` ASC) VISIBLE,
  CONSTRAINT `fk_classes_courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `GrowSkill`.`courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_classes_class_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `GrowSkill`.`class_status` (`class_status_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_classes_Links1`
    FOREIGN KEY (`link_id`)
    REFERENCES `GrowSkill`.`Links` (`link_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `sql_store` ;

-- -----------------------------------------------------
-- Table `sql_store`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_store`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `birth_date` DATE NULL DEFAULT NULL,
  `phone` VARCHAR(50) NULL DEFAULT NULL,
  `address` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `points` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sql_store`.`order_item_notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_store`.`order_item_notes` (
  `note_id` INT NOT NULL,
  `order_Id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `note` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`note_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sql_store`.`order_statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_store`.`order_statuses` (
  `order_status_id` TINYINT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`order_status_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sql_store`.`shippers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_store`.`shippers` (
  `shipper_id` SMALLINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`shipper_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sql_store`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_store`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `status` TINYINT NOT NULL DEFAULT '1',
  `comments` VARCHAR(2000) NULL DEFAULT NULL,
  `shipped_date` DATE NULL DEFAULT NULL,
  `shipper_id` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_orders_customers_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_orders_shippers_idx` (`shipper_id` ASC) VISIBLE,
  INDEX `fk_orders_order_statuses_idx` (`status` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `sql_store`.`customers` (`customer_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_order_statuses`
    FOREIGN KEY (`status`)
    REFERENCES `sql_store`.`order_statuses` (`order_status_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_shippers`
    FOREIGN KEY (`shipper_id`)
    REFERENCES `sql_store`.`shippers` (`shipper_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sql_store`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_store`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `quantity_in_stock` INT NOT NULL,
  `unit_price` DECIMAL(4,2) NOT NULL,
  `size` ENUM('small', 'medium', 'large') NULL DEFAULT NULL,
  `properties` JSON NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sql_store`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_store`.`order_items` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `unit_price` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`),
  INDEX `fk_order_items_products_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_items_orders`
    FOREIGN KEY (`order_id`)
    REFERENCES `sql_store`.`orders` (`order_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_items_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `sql_store`.`products` (`product_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
