-- MySQL Script generated by MySQL Workbench
-- 12/03/14 11:07:26
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema chat
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema chat
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `chat` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `chat` ;

-- -----------------------------------------------------
-- Table `chat`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chat`.`Users` (
  `Username` VARCHAR(30) NOT NULL,
  `Password` VARCHAR(512) NOT NULL,
  `PublicKey` VARCHAR(256) NULL,
  PRIMARY KEY (`Username`),
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chat`.`IP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chat`.`IP` (
  `Username` VARCHAR(30) NOT NULL,
  `IP` VARCHAR(30) NULL,
  PRIMARY KEY (`Username`),
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC),
  CONSTRAINT `UsernameFK`
    FOREIGN KEY (`Username`)
    REFERENCES `chat`.`Users` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chat`.`Friends`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chat`.`Friends` (
  `Username` VARCHAR(30) NOT NULL,
  `Friend` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Username`, `Friend`),
  INDEX `FriendsFK_idx` (`Friend` ASC),
  CONSTRAINT `userFK`
    FOREIGN KEY (`Username`)
    REFERENCES `chat`.`Users` (`Username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `friendsFK`
    FOREIGN KEY (`Friend`)
    REFERENCES `chat`.`Users` (`Username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
