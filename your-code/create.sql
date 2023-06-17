CREATE TABLE IF NOT EXISTS `car_sales`.`cars` (
  `ID` INT(10) NOT NULL,
  `VIN` VARCHAR(17) NOT NULL,
  `Manufacturer` VARCHAR(20) NULL DEFAULT NULL,
  `Model` VARCHAR(20) NOT NULL,
  `Year` YEAR(4) NULL,
  `Color` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `VIN_UNIQUE` (`VIN` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `car_sales`.`customers` (
  `ID` INT(10) NOT NULL,
  `Customer ID` INT NOT NULL,
  `Name` VARCHAR(20) NOT NULL,
  `Phone` VARCHAR(30) NOT NULL,
  `Email` VARCHAR(30) NULL,
  `Adress` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State/Province` VARCHAR(45) NULL DEFAULT NULL,
  `Country` VARCHAR(20) NULL DEFAULT NULL,
  `Postal` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `car_sales`.`salespersons` (
  `ID` INT(10) NOT NULL,
  `Staff ID` INT(10) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `car_sales`.`invoices` (
  `ID` INT(10) NULL,
  `Invoice number` INT NOT NULL,
  `Date` DATE NOT NULL,
  `cars_ID` INT(10) NOT NULL,
  `customers_ID` INT(10) NOT NULL,
  `salespersons_ID` INT(10) NOT NULL,
  PRIMARY KEY (`cars_ID`, `customers_ID`, `salespersons_ID`),
  INDEX `fk_invoices_salespersons1_idx` (`salespersons_ID` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_ID` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars`
    FOREIGN KEY (`cars_ID`)
    REFERENCES `car_sales`.`cars` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salespersons1`
    FOREIGN KEY (`salespersons_ID`)
    REFERENCES `car_sales`.`salespersons` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_ID`)
    REFERENCES `car_sales`.`customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;