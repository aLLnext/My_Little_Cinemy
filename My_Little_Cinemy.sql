-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `group` ENUM('admin', 'cinema', 'usher', 'viewer', 'reader') NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `e_mail` VARCHAR(45) NULL DEFAULT NULL,
  `telephon` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Login` (`e_mail` ASC, `telephon` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`books` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Users_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `Users_id`),
  INDEX `fk_Books_Users1_idx` (`Users_id` ASC) VISIBLE,
  CONSTRAINT `fk_Books_Users1`
    FOREIGN KEY (`Users_id`)
    REFERENCES `mydb`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`cinema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cinema` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `icon` TEXT NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `address` (`adress` ASC) INVISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`countrys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`countrys` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`films` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `date_release` DATE NOT NULL,
  `duration` INT(11) NOT NULL,
  `rars` INT(11) NOT NULL,
  `main_photo` TEXT NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `imdb_rate` DOUBLE NULL DEFAULT NULL,
  `kinopoisk_rate` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`title` ASC, `date_release` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`film_county`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`film_county` (
  `Country_id` INT(11) NOT NULL,
  `Films_id` INT(11) NOT NULL,
  PRIMARY KEY (`Country_id`, `Films_id`),
  INDEX `fk_film_Films1_idx` (`Films_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_Country1`
    FOREIGN KEY (`Country_id`)
    REFERENCES `mydb`.`countrys` (`id`),
  CONSTRAINT `fk_film_Films1`
    FOREIGN KEY (`Films_id`)
    REFERENCES `mydb`.`films` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genres` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`film_genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`film_genre` (
  `Films_id` INT(11) NOT NULL,
  `Genres_id` INT(11) NOT NULL,
  PRIMARY KEY (`Films_id`, `Genres_id`),
  INDEX `fk_film_genre_Genres1_idx` (`Genres_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_genre_Films`
    FOREIGN KEY (`Films_id`)
    REFERENCES `mydb`.`films` (`id`),
  CONSTRAINT `fk_film_genre_Genres1`
    FOREIGN KEY (`Genres_id`)
    REFERENCES `mydb`.`genres` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`people`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`people` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `full_name` (`name` ASC, `surname` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`posts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`film_post_person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`film_post_person` (
  `Films_id` INT(11) NOT NULL,
  `Posts_id` INT(11) NOT NULL,
  `People_id` INT(11) NOT NULL,
  PRIMARY KEY (`Films_id`, `Posts_id`, `People_id`),
  INDEX `fk_film_post_person_Posts1_idx` (`Posts_id` ASC) VISIBLE,
  INDEX `fk_film_post_person_People1_idx` (`People_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_post_person_Films1`
    FOREIGN KEY (`Films_id`)
    REFERENCES `mydb`.`films` (`id`),
  CONSTRAINT `fk_film_post_person_People1`
    FOREIGN KEY (`People_id`)
    REFERENCES `mydb`.`people` (`id`),
  CONSTRAINT `fk_film_post_person_Posts1`
    FOREIGN KEY (`Posts_id`)
    REFERENCES `mydb`.`posts` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`halls`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`halls` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Cinema_id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `rows` INT(11) NOT NULL,
  `columns` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `Cinema_id`),
  INDEX `fk_Halls_Cinema1_idx` (`Cinema_id` ASC) VISIBLE,
  CONSTRAINT `fk_Halls_Cinema1`
    FOREIGN KEY (`Cinema_id`)
    REFERENCES `mydb`.`cinema` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`media` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `picture` TEXT NOT NULL,
  `Films_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `Films_id`),
  INDEX `fk_Posters_Films1_idx` (`Films_id` ASC) VISIBLE,
  CONSTRAINT `fk_Posters_Films1`
    FOREIGN KEY (`Films_id`)
    REFERENCES `mydb`.`films` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reviews` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `text` TEXT NOT NULL,
  `publication_date` DATE NOT NULL,
  `Films_id` INT(11) NOT NULL,
  `Users_id` INT(11) NOT NULL,
  `mark` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `Films_id`, `Users_id`),
  INDEX `fk_Reviews_Films1_idx` (`Films_id` ASC) VISIBLE,
  INDEX `fk_Reviews_Users1_idx` (`Users_id` ASC) VISIBLE,
  CONSTRAINT `fk_Reviews_Films1`
    FOREIGN KEY (`Films_id`)
    REFERENCES `mydb`.`films` (`id`),
  CONSTRAINT `fk_Reviews_Users1`
    FOREIGN KEY (`Users_id`)
    REFERENCES `mydb`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`session` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `Films_id` INT(11) NOT NULL,
  `Cinema_id` INT(11) NOT NULL,
  `Halls_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `Films_id`, `Cinema_id`, `Halls_id`),
  INDEX `fk_Session_Films1_idx` (`Films_id` ASC) VISIBLE,
  INDEX `fk_Session_Cinema1_idx` (`Cinema_id` ASC) VISIBLE,
  INDEX `fk_Session_Halls1_idx` (`Halls_id` ASC) VISIBLE,
  CONSTRAINT `fk_Session_Cinema1`
    FOREIGN KEY (`Cinema_id`)
    REFERENCES `mydb`.`cinema` (`id`),
  CONSTRAINT `fk_Session_Films1`
    FOREIGN KEY (`Films_id`)
    REFERENCES `mydb`.`films` (`id`),
  CONSTRAINT `fk_Session_Halls1`
    FOREIGN KEY (`Halls_id`)
    REFERENCES `mydb`.`halls` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`telephone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telephone` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `Cinema_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `Cinema_id`),
  INDEX `fk_Telephon_Cinema1_idx` (`Cinema_id` ASC) VISIBLE,
  CONSTRAINT `fk_Telephon_Cinema1`
    FOREIGN KEY (`Cinema_id`)
    REFERENCES `mydb`.`cinema` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tickets` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `status` ENUM('а', 'booked', 'stock') NOT NULL,
  `price_rub` INT(11) NOT NULL,
  `row` INT(11) NOT NULL,
  `place` INT(11) NOT NULL,
  `Session_id` INT(11) NOT NULL,
  `Books_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `Session_id`),
  INDEX `fk_Tickets_Session1_idx` (`Session_id` ASC) VISIBLE,
  INDEX `fk_Tickets_Books1_idx` (`Books_id` ASC) VISIBLE,
  CONSTRAINT `fk_Tickets_Books1`
    FOREIGN KEY (`Books_id`)
    REFERENCES `mydb`.`books` (`id`),
  CONSTRAINT `fk_Tickets_Session1`
    FOREIGN KEY (`Session_id`)
    REFERENCES `mydb`.`session` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `mydb` ;

-- -----------------------------------------------------
-- procedure get_all_cinemas
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_cinemas`()
BEGIN
	select name, adress, description from Cinema;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure get_all_films
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_films`()
BEGIN
	select title, date_release, main_photo, imdb_rate, kinopoisk_rate, rars  from Films;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure get_cinema
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_cinema`(n varchar(45))
BEGIN
	declare i int;
    select id into i from Cinema where n = name;
	select * from Cinema where id = i;
    select name from Telephone where Cinema_id = i;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure get_film
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_film`(d_r date, t varchar(45))
BEGIN
	declare i int;
    select id into i from Films where t = title and date_release = d_t;
    select * from Films where id = i;
    select name from Genres inner join film_genre on Genres_id = id where Films_id = i;
    select name from Countrys inner join film_country on Countrys_id = id where Films_id = i;
    select name, surname, Posts.name from 
		People inner join film_post_person on People.id = People_id 
        inner join Posts on Posts_id = Posts.id where Films_id = i order by Posts.id;
	select picture from Media where Films_id = i;
    select name, publication_date, text, mark from
		Users inner join Reviews on Users_id = Users.id where Films_id = i order by publication_date;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
