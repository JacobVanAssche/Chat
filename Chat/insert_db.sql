-- MySQL Script generated by MySQL Workbench
-- 12/03/14 10:45:42
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `Username` VARCHAR(30) NOT NULL,
  `Password` VARCHAR(512) NOT NULL,
  `PublicKey` VARCHAR(256) NULL,
  PRIMARY KEY (`Username`),
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`IP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`IP` (
  `Username` VARCHAR(30) NOT NULL,
  `IP` VARCHAR(30) NULL,
  PRIMARY KEY (`Username`),
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC),
  CONSTRAINT `UsernameFK`
    FOREIGN KEY (`Username`)
    REFERENCES `mydb`.`Users` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Friends`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Friends` (
  `Username` VARCHAR(30) NOT NULL,
  `Friend` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Username`, `Friend`),
  INDEX `FriendsFK_idx` (`Friend` ASC),
  CONSTRAINT `UsernameFK`
    FOREIGN KEY (`Username`)
    REFERENCES `mydb`.`Users` (`Username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FriendsFK`
    FOREIGN KEY (`Friend`)
    REFERENCES `mydb`.`Users` (`Username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
