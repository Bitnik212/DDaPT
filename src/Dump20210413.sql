-- MySQL dump 10.13  Distrib 8.0.22-13, for Linux (x86_64)
--
-- Host: bit.bitapp.me    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `exam_marks`
--

DROP TABLE IF EXISTS `exam_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_marks` (
  `idlecturer` int NOT NULL COMMENT 'Код преподавателя',
  `idstudent` int NOT NULL COMMENT 'Код студента',
  `idsubject` int NOT NULL COMMENT 'Код предмета',
  `mark` int DEFAULT NULL COMMENT 'оценка',
  `exam_date` date DEFAULT NULL COMMENT 'Дата экзамена',
  PRIMARY KEY (`idlecturer`,`idstudent`,`idsubject`),
  KEY `fk_exam_marks_subject1_idx` (`idsubject`),
  KEY `fk_exam_marks_student1_idx` (`idstudent`),
  CONSTRAINT `fk_exam_marks_lecturer1` FOREIGN KEY (`idlecturer`) REFERENCES `lecturer` (`idlecturer`),
  CONSTRAINT `fk_exam_marks_student1` FOREIGN KEY (`idstudent`) REFERENCES `student` (`idstudent`),
  CONSTRAINT `fk_exam_marks_subject1` FOREIGN KEY (`idsubject`) REFERENCES `subject` (`idsubject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_marks`
--

LOCK TABLES `exam_marks` WRITE;
/*!40000 ALTER TABLE `exam_marks` DISABLE KEYS */;
INSERT INTO `exam_marks` VALUES (1101,10101,1,5,'2018-06-01'),(1101,10102,1,3,'2018-06-01'),(1101,10103,1,4,'2018-06-01'),(1101,10104,1,2,'2018-06-01'),(1101,10105,1,5,'2018-06-01'),(1102,10101,2,3,'2018-06-11'),(1102,10102,2,4,'2018-06-11'),(1102,10103,2,4,'2018-06-11'),(1102,10104,2,5,'2018-06-11'),(1102,10105,2,3,'2018-06-11'),(1103,10101,3,4,'2018-02-11'),(1103,10102,3,5,'2018-02-11'),(1103,10103,3,2,'2018-02-11'),(1103,10104,3,3,'2018-02-11'),(1103,10105,3,5,'2018-02-11'),(1201,10201,1,3,'2018-06-08'),(1201,10202,1,2,'2018-06-08'),(1201,10203,1,4,'2018-06-08'),(1201,10204,1,3,'2018-06-08'),(1201,10205,1,5,'2018-06-08'),(1301,10301,6,4,'2018-01-14'),(1301,10302,6,5,'2018-01-14'),(1301,10303,6,4,'2018-01-14'),(1301,10304,6,3,'2018-01-14'),(1301,10305,6,2,'2018-01-14'),(2102,20101,2,3,'2018-06-04'),(2102,20102,2,4,'2018-06-04'),(2102,20103,2,3,'2018-06-04'),(2102,20104,2,5,'2018-06-04'),(2102,20105,2,5,'2018-06-04'),(3102,30201,4,4,'2018-06-07'),(3102,30202,4,5,'2018-06-07'),(3102,30203,4,3,'2018-06-07'),(3102,30204,4,5,'2018-06-07'),(3102,30205,4,2,'2018-06-07'),(4102,40301,5,2,'2018-01-09'),(4102,40302,5,4,'2018-01-09'),(4102,40303,5,5,'2018-01-09'),(4102,40304,5,4,'2018-01-09'),(4102,40305,5,5,'2018-01-09');
/*!40000 ALTER TABLE `exam_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `group_name` char(3) NOT NULL COMMENT 'Номер группы',
  `groupcol` smallint DEFAULT NULL COMMENT 'Количество студентов в группе',
  `group_year` int DEFAULT NULL COMMENT 'Год поступления',
  `group_special` char(15) DEFAULT NULL COMMENT 'Специальность',
  `iduniversity` int DEFAULT NULL COMMENT 'Код университета',
  PRIMARY KEY (`group_name`),
  KEY `fk_group_university_idx` (`iduniversity`),
  CONSTRAINT `fk_group_university` FOREIGN KEY (`iduniversity`) REFERENCES `university` (`iduniversity`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES ('101',25,2015,'программист',11),('102',25,2017,'экономист',12),('103',25,2015,'логист',13),('201',25,2015,'программист',21),('302',25,2016,'экономист',31),('403',25,2016,'логист',41);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer` (
  `idlecturer` int NOT NULL,
  `lecturer_surname` char(20) DEFAULT NULL COMMENT 'Фамилия преподавателя',
  `lecturer_name` char(20) DEFAULT NULL COMMENT 'Имя преподавателя',
  `lecturer_city` varchar(45) DEFAULT NULL COMMENT 'Город, где живет преподаватель\n',
  `iduniversity` int DEFAULT NULL,
  PRIMARY KEY (`idlecturer`),
  KEY `fk_lecturer_university_idx` (`iduniversity`),
  CONSTRAINT `fk_lecturer_university` FOREIGN KEY (`iduniversity`) REFERENCES `university` (`iduniversity`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES (1101,'Фаустова','Инна','Санкт-Петербург',11),(1102,'Попова','Ирина','Санкт-Петербург',11),(1103,'Мельникова','Наталья','Санкт-Петербург',11),(1201,'Федосов','Николай','Санкт-Петербург',12),(1202,'Иванова','Виктория','Санкт-Петербург',12),(1203,'Сафонова','Елена','Санкт-Петербург',12),(1301,'Иванова','Ольга','Санкт-Петербург',13),(1302,'Сидоров','Виктор','Санкт-Петербург',13),(1303,'Колупаева','Светлана','Санкт-Петербург',13),(2101,'Обудовская','Анна','Москва',21),(2102,'Карелина','Ирина','Москва',21),(2103,'Мартынова','Маргарита','Москва',21),(3101,'Старенченко','Владимир','Воронеж',31),(3102,'Лазарев','Любовь','Воронеж',31),(3103,'Сергеева','Ольга','Воронеж',31),(4101,'Ковалевская','Татьяна','Томск',41),(4102,'Миронов','Андрей','Томск',41),(4103,'Пудан','Людмила','Томск',41);
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `idstudent` int NOT NULL COMMENT 'Номер студента',
  `surname_student` char(20) DEFAULT NULL COMMENT 'Фамилия студента',
  `name_student` char(20) DEFAULT NULL COMMENT 'Имя студента',
  `stipend` double DEFAULT NULL COMMENT 'Стипендия',
  `kurs` int DEFAULT NULL COMMENT 'Курс',
  `city_student` char(15) DEFAULT NULL COMMENT 'Город, из которого приехал студент',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `group_name` char(3) DEFAULT NULL COMMENT 'Номер группы',
  PRIMARY KEY (`idstudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (10101,'Антонов','Кирилл',1500,3,'Санкт-Петербург','1997-01-12','101'),(10102,'Благородов','Алексей',1000,3,'Санкт-Петербург','1997-02-23','101'),(10103,'Бочкарев','Андрей',0,3,'Санкт-Петербург','1997-02-12','101'),(10104,'Зубик','Роман',1000,3,'Санкт-Петербург','1997-05-24','101'),(10105,'Калинкин','Максим',0,3,'Санкт-Петербург','1997-06-06','101'),(10201,'Иванов','Константин',2000,1,'Вологда','1995-03-14','102'),(10202,'Исматов','Дилшод',1500,1,'Новгород','1999-03-19','102'),(10203,'Коротков','Никита',1000,1,'Псков','1999-05-17','102'),(10204,'Морозов','Константин',1000,1,'Новгород','1996-06-11','102'),(10205,'Никитин','Владислав',1000,1,'Санкт-Петербург','1999-07-13','102'),(10301,'Павленко','Олег',800,3,'Псков','1997-03-26','103'),(10302,'Покрышева','Юлия',800,3,'Воронеж','1997-06-26','103'),(10303,'Радченко','Татьяна',0,3,'Санкт-Петербург','1997-03-24','103'),(10304,'Романов','Дмитрий',800,3,'Воронеж','1997-09-06','103'),(10305,'Сажнев','Даниил',0,3,'Санкт-Петербург','1997-10-09','103'),(20101,'Белявский','Владислав',1500,3,'Москва','1997-11-19','201'),(20102,'Голубева','Елизавета',0,3,'Королев','1997-12-31','201'),(20103,'Дворецков','Кирилл',1500,3,'Москва','1997-01-09','201'),(20104,'Жавко','Степан',800,3,'Казань','1997-11-16','201'),(20105,'Зайцев','Андрей',0,3,'Санкт-Петербург','1997-02-19','201'),(30201,'Алексеев','Андрей',2000,2,'Воронеж','1998-02-24','302'),(30202,'Анисимов','Максим',2000,2,'Курск','1998-12-14','302'),(30203,'Веселов','Александр',2000,2,'Воронеж','1998-04-04','302'),(30204,'Владимиров','Владислав',0,2,'Курск','1998-08-11','302'),(30205,'Деревнин','Максим',0,2,'Воронеж','1998-09-21','302'),(40301,'Асланов','Эмиль',2500,2,'Томск','1998-08-24','403'),(40302,'Досмуханов','Айдиль',2500,2,'Новосибирск','1998-07-06','403'),(40303,'Кадышев','Вадим',1500,2,'Томск','1998-08-24','403'),(40304,'Левченко','Артем',1000,2,'Томск','1998-06-30','403'),(40305,'Марков','Александр',0,2,'Кемерово','1998-12-20','403');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `idsubject` int NOT NULL,
  `subject_name` char(20) DEFAULT NULL COMMENT 'Название предмета',
  `subject_hour` smallint DEFAULT NULL COMMENT 'Количество часов',
  `semester` int DEFAULT NULL COMMENT 'Номер семестра',
  PRIMARY KEY (`idsubject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Математика',180,2),(2,'Программирование',69,2),(3,'Информатика',80,1),(4,'Экономика',200,1),(5,'Иностранный',100,1),(6,'Логистика',150,1);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `university` (
  `iduniversity` int NOT NULL COMMENT 'Код университета',
  `university_name` char(10) DEFAULT NULL COMMENT 'Название университета',
  `university_rating` int DEFAULT NULL COMMENT 'Рейтинг университета',
  `university_city` char(15) DEFAULT NULL COMMENT 'Город, в котором находится университет\n',
  PRIMARY KEY (`iduniversity`),
  KEY `fk_university_lecturer_idx` (`iduniversity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES (11,'СПБГУ',1,'Санкт-Петербург'),(12,'СПБГУТ',4,'Санкт-Петербург'),(13,'СПБГЭУ',5,'Санкт-Петербург'),(21,'МГУ',3,'Москва'),(31,'ВГУ',6,'Воронеж'),(41,'ТПУ',2,'Томск');
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-13 16:21:24
