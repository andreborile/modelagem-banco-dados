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
-- Table `mydb`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`professor` (
  `idprofessor` INT NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `data_nasc` DATE NOT NULL,
  `posicao` VARCHAR(45) NOT NULL,
  `especialidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idprofessor`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`projeto` (
  `idprojeto` INT NOT NULL AUTO_INCREMENT,
  `financiador` VARCHAR(45) NOT NULL,
  `data_incio` DATE NOT NULL,
  `data_fim` DATE NOT NULL,
  `orcamento` DECIMAL(8,2) NOT NULL,
  `prof_pesquisador` INT NOT NULL,
  PRIMARY KEY (`idprojeto`, `prof_pesquisador`),
  INDEX `fk_projeto_professor1_idx` (`prof_pesquisador` ASC) VISIBLE,
  CONSTRAINT `fk_projeto_professor1`
    FOREIGN KEY (`prof_pesquisador`)
    REFERENCES `mydb`.`professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`departamento` (
  `iddepartamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `escritorio` VARCHAR(45) NOT NULL,
  `prof_chefe_dpto` INT NOT NULL,
  PRIMARY KEY (`iddepartamento`, `prof_chefe_dpto`),
  INDEX `fk_departamento_professor1_idx` (`prof_chefe_dpto` ASC) VISIBLE,
  CONSTRAINT `fk_departamento_professor1`
    FOREIGN KEY (`prof_chefe_dpto`)
    REFERENCES `mydb`.`professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aluno` (
  `idaluno` INT NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `data_nasc` DATE NOT NULL,
  `programa` VARCHAR(45) NOT NULL,
  `departamento_iddepartamento` INT NOT NULL,
  `conselheiro` INT NULL,
  PRIMARY KEY (`idaluno`, `departamento_iddepartamento`),
  INDEX `fk_aluno_departamento1_idx` (`departamento_iddepartamento` ASC) VISIBLE,
  INDEX `fk_conselheiro_idx` (`conselheiro` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_departamento1`
    FOREIGN KEY (`departamento_iddepartamento`)
    REFERENCES `mydb`.`departamento` (`iddepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conselheiro`
    FOREIGN KEY (`conselheiro`)
    REFERENCES `mydb`.`aluno` (`idaluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`professor_has_projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`professor_has_projeto` (
  `professor_idprofessor` INT NOT NULL,
  `projeto_idprojeto` INT NOT NULL,
  PRIMARY KEY (`professor_idprofessor`, `projeto_idprojeto`),
  INDEX `fk_professor_has_projeto_projeto1_idx` (`projeto_idprojeto` ASC) VISIBLE,
  INDEX `fk_professor_has_projeto_professor_idx` (`professor_idprofessor` ASC) VISIBLE,
  CONSTRAINT `fk_professor_has_projeto_professor`
    FOREIGN KEY (`professor_idprofessor`)
    REFERENCES `mydb`.`professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_has_projeto_projeto1`
    FOREIGN KEY (`projeto_idprojeto`)
    REFERENCES `mydb`.`projeto` (`idprojeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`projeto_has_aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`projeto_has_aluno` (
  `projeto_idprojeto` INT NOT NULL,
  `aluno_idaluno` INT NOT NULL,
  `prof_supervisor` INT NOT NULL,
  PRIMARY KEY (`projeto_idprojeto`, `aluno_idaluno`, `prof_supervisor`),
  INDEX `fk_projeto_has_aluno_aluno1_idx` (`aluno_idaluno` ASC) VISIBLE,
  INDEX `fk_projeto_has_aluno_projeto1_idx` (`projeto_idprojeto` ASC) VISIBLE,
  INDEX `fk_prof_supervisor_idx` (`prof_supervisor` ASC) VISIBLE,
  CONSTRAINT `fk_projeto_has_aluno_projeto1`
    FOREIGN KEY (`projeto_idprojeto`)
    REFERENCES `mydb`.`projeto` (`idprojeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projeto_has_aluno_aluno1`
    FOREIGN KEY (`aluno_idaluno`)
    REFERENCES `mydb`.`aluno` (`idaluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prof_supervisor`
    FOREIGN KEY (`prof_supervisor`)
    REFERENCES `mydb`.`professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`departamento_has_professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`departamento_has_professor` (
  `departamento_iddepartamento` INT NOT NULL,
  `professor_idprofessor` INT NOT NULL,
  `porcentagem_tempo` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`departamento_iddepartamento`, `professor_idprofessor`),
  INDEX `fk_departamento_has_professor_professor1_idx` (`professor_idprofessor` ASC) VISIBLE,
  INDEX `fk_departamento_has_professor_departamento1_idx` (`departamento_iddepartamento` ASC) VISIBLE,
  CONSTRAINT `fk_departamento_has_professor_departamento1`
    FOREIGN KEY (`departamento_iddepartamento`)
    REFERENCES `mydb`.`departamento` (`iddepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_departamento_has_professor_professor1`
    FOREIGN KEY (`professor_idprofessor`)
    REFERENCES `mydb`.`professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
