-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: resumar
-- ------------------------------------------------------
-- Server version	8.0.25

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

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aula` (
  `idaula` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `diaSemana` varchar(45) DEFAULT NULL,
  `hora` datetime DEFAULT NULL,
  `local` varchar(45) DEFAULT NULL,
  `duracao` varchar(45) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `disciplina` int DEFAULT NULL,
  PRIMARY KEY (`idaula`),
  KEY `fk_aula_1_idx` (`disciplina`),
  CONSTRAINT `fk_aula_1` FOREIGN KEY (`disciplina`) REFERENCES `edicaoDisciplina` (`idDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sigla` varchar(12) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `conferegrau` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (3,'LEIT','Engenharia Informática e Telecomunicações','Licenciatura'),(4,'LEC','Engenharia Civil','Licenciatura'),(5,'BIO','Biologia Marinha','Licenciatura'),(7,'LEE','Engenharia Electrotécnica','Licenciatura');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(6) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `sinopse` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'INF001','Introdução á Programação',NULL),(2,'INF002','Algoritmos e Estruturas de Dados',NULL),(3,'MAT001','Análise Matemática I',NULL),(4,'ETE001','Sistemas Digitais',NULL),(5,'INF003','introdução à Engenharia Informática e Telecomunicações',NULL),(6,'MAT002','Análise Matemática II',NULL),(7,'INF004','Arquitectura de Computadores',NULL),(8,'CET002','Mecânica e Vibrações',NULL),(9,'INF304','Engenharia de Software',NULL),(10,'INF300','Sistemas Distribuídos',NULL);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `idDocente` int NOT NULL AUTO_INCREMENT,
  `sigla` varchar(6) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `nomeCompleto` varchar(80) DEFAULT NULL,
  `ocupacao` varchar(45) DEFAULT NULL,
  `grau` varchar(45) DEFAULT NULL,
  `idUser` int NOT NULL,
  `area` int DEFAULT NULL,
  PRIMARY KEY (`idDocente`),
  UNIQUE KEY `sigla_UNIQUE` (`sigla`),
  KEY `fk_docente_1_idx` (`idUser`),
  KEY `fk_docente_2_idx` (`area`),
  CONSTRAINT `fk_docente_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`iduser`),
  CONSTRAINT `fk_docente_2` FOREIGN KEY (`area`) REFERENCES `grupoDisciplinar` (`idarea`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'PAS','Paulo Silva','Paulo Alexandre dos Santos Silva','Tempo Inteiro	','Mestre',1,1),(2,'ERS','Emanuel Ribeiro	','Emanuel dos Santos Ribeiro Silva','Tempo Integral','Mestre',2,1);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsd`
--

DROP TABLE IF EXISTS `dsd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsd` (
  `iddsd` int NOT NULL AUTO_INCREMENT,
  `docente` int NOT NULL,
  `disciplina` int NOT NULL,
  `funcao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddsd`),
  KEY `fk_dsd_1_idx` (`docente`),
  KEY `fk_dsd_2_idx` (`disciplina`),
  CONSTRAINT `fk_dsd_1` FOREIGN KEY (`docente`) REFERENCES `docente` (`idDocente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_dsd_2` FOREIGN KEY (`disciplina`) REFERENCES `edicaoDisciplina` (`idDisciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsd`
--

LOCK TABLES `dsd` WRITE;
/*!40000 ALTER TABLE `dsd` DISABLE KEYS */;
INSERT INTO `dsd` VALUES (1,1,1,'Responsável'),(2,2,4,'Responsável');
/*!40000 ALTER TABLE `dsd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edicaoDisciplina`
--

DROP TABLE IF EXISTS `edicaoDisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edicaoDisciplina` (
  `idEdicao` int NOT NULL AUTO_INCREMENT,
  `edicao` varchar(45) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `anoLectivo` varchar(45) NOT NULL,
  `periodo` varchar(45) NOT NULL,
  `idDisciplina` int DEFAULT NULL,
  PRIMARY KEY (`idEdicao`),
  KEY `fk_EdicaoDisciplina_1_idx` (`idDisciplina`),
  CONSTRAINT `fk_EdicaoDisciplina_1` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edicaoDisciplina`
--

LOCK TABLES `edicaoDisciplina` WRITE;
/*!40000 ALTER TABLE `edicaoDisciplina` DISABLE KEYS */;
INSERT INTO `edicaoDisciplina` VALUES (1,'19/20	','Em andamento','2019/2020','1',1),(2,'19/20','Em andamento','2019/2020','1',4);
/*!40000 ALTER TABLE `edicaoDisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudante`
--

DROP TABLE IF EXISTS `estudante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudante` (
  `codigo` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `nomeCompleto` varchar(45) DEFAULT NULL,
  `idUser` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_estudante_1_idx` (`idUser`),
  CONSTRAINT `fk_estudante_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudante`
--

LOCK TABLES `estudante` WRITE;
/*!40000 ALTER TABLE `estudante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupoDisciplinar`
--

DROP TABLE IF EXISTS `grupoDisciplinar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupoDisciplinar` (
  `idarea` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idarea`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupoDisciplinar`
--

LOCK TABLES `grupoDisciplinar` WRITE;
/*!40000 ALTER TABLE `grupoDisciplinar` DISABLE KEYS */;
INSERT INTO `grupoDisciplinar` VALUES (1,'Engenharia Informática');
/*!40000 ALTER TABLE `grupoDisciplinar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planocurso`
--

DROP TABLE IF EXISTS `planocurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planocurso` (
  `idPlano` int NOT NULL AUTO_INCREMENT,
  `idCurso` int NOT NULL,
  `idDisci` int NOT NULL,
  `ano` int NOT NULL,
  `semestre` int NOT NULL,
  `activo` tinyint DEFAULT '1',
  `dataStatus` datetime DEFAULT NULL,
  PRIMARY KEY (`idPlano`),
  KEY `fk_planocurso_2_idx` (`idDisci`),
  KEY `fk_planocurso_1` (`idCurso`),
  CONSTRAINT `fk_planocurso_1` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`id`),
  CONSTRAINT `fk_planocurso_2` FOREIGN KEY (`idDisci`) REFERENCES `disciplina` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planocurso`
--

LOCK TABLES `planocurso` WRITE;
/*!40000 ALTER TABLE `planocurso` DISABLE KEYS */;
INSERT INTO `planocurso` VALUES (2,3,1,1,1,1,NULL);
/*!40000 ALTER TABLE `planocurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sumario`
--

DROP TABLE IF EXISTS `sumario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sumario` (
  `idsumario` int NOT NULL AUTO_INCREMENT,
  `conteudo` varchar(120) NOT NULL,
  `biblio` varchar(45) DEFAULT NULL,
  `presenca` int DEFAULT NULL,
  `aula` int DEFAULT NULL,
  PRIMARY KEY (`idsumario`),
  KEY `fk_sumario_1_idx` (`aula`),
  CONSTRAINT `fk_sumario_1` FOREIGN KEY (`aula`) REFERENCES `aula` (`idaula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sumario`
--

LOCK TABLES `sumario` WRITE;
/*!40000 ALTER TABLE `sumario` DISABLE KEYS */;
/*!40000 ALTER TABLE `sumario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'paulosilva	','psilva@uta.cv','Lala123'),(2,'emanuel','eribeiro','lala123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-02  1:28:29
