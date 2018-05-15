-- MySQL Script generated by MySQL Workbench
-- Tue May 15 16:56:33 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema camagru
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `camagru` ;

-- -----------------------------------------------------
-- Schema camagru
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `camagru` DEFAULT CHARACTER SET utf8 ;
USE `camagru` ;

-- -----------------------------------------------------
-- Table `camagru`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camagru`.`users` ;

CREATE TABLE IF NOT EXISTS `camagru`.`users` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(12) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` CHAR(128) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `getmailpref` TINYINT NOT NULL DEFAULT 1,
  `activated` TINYINT NOT NULL DEFAULT 0,
  `hash` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`iduser`, `username`, `email`, `hash`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `hash_UNIQUE` (`hash` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `camagru`.`photos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camagru`.`photos` ;

CREATE TABLE IF NOT EXISTS `camagru`.`photos` (
  `idphoto` VARCHAR(30) NOT NULL,
  `iduser` INT NOT NULL,
  PRIMARY KEY (`idphoto`),
  INDEX `fk_photo_to_users_idx` (`iduser` ASC),
  CONSTRAINT `fk_photo_to_users`
    FOREIGN KEY (`iduser`)
    REFERENCES `camagru`.`users` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `camagru`.`likes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camagru`.`likes` ;

CREATE TABLE IF NOT EXISTS `camagru`.`likes` (
  `id_user` INT NOT NULL,
  `id_photo` VARCHAR(30) NOT NULL,
  INDEX `fk_id_user_idx` (`id_user` ASC),
  INDEX `fk_id_photo_idx` (`id_photo` ASC),
  CONSTRAINT `fk_likes_id_user`
    FOREIGN KEY (`id_user`)
    REFERENCES `camagru`.`users` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_id_photo`
    FOREIGN KEY (`id_photo`)
    REFERENCES `camagru`.`photos` (`idphoto`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `camagru`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camagru`.`comments` ;

CREATE TABLE IF NOT EXISTS `camagru`.`comments` (
  `idcomment` INT NOT NULL AUTO_INCREMENT,
  `id_user` INT NOT NULL,
  `id_photo` VARCHAR(30) NOT NULL,
  `comment` TEXT(500) NOT NULL,
  `date` DATETIME NOT NULL,
  INDEX `fk_id_user_idx` (`id_user` ASC),
  INDEX `fk_id_photo_idx` (`id_photo` ASC),
  PRIMARY KEY (`idcomment`),
  CONSTRAINT `fk_comments_id_user`
    FOREIGN KEY (`id_user`)
    REFERENCES `camagru`.`users` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_id_photo`
    FOREIGN KEY (`id_photo`)
    REFERENCES `camagru`.`photos` (`idphoto`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
