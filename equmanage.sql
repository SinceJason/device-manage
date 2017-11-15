# SQL-Front 4.1  (Build 1.83)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: equmanage
# ------------------------------------------------------
# Server version 5.1.43-community

CREATE DATABASE equmanage
USE equmanage;

#
# Table structure for table equmessage
#

CREATE TABLE equmessage (
  Id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  price varchar(255) DEFAULT NULL,
  model varchar(255) DEFAULT NULL,
  date varchar(255) DEFAULT NULL,
  PRIMARY KEY (Id)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;


#
# Dumping data for table equmessage
#

LOCK TABLES equmessage WRITE;


INSERT INTO equmessage VALUES (2,'eew','300','AB-1005','2010-09-11');
INSERT INTO equmessage VALUES (4,'yy','4444','dw-1103','2009-08-17');
INSERT INTO equmessage VALUES (5,'rr','33','df-1107','2007-19-08');

UNLOCK TABLES;

#
# Table structure for table user
#

CREATE TABLE user (
  Id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(255) DEFAULT NULL,
  password varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;


#
# Dumping data for table user
#
LOCK TABLES user WRITE;


INSERT INTO user VALUES (1,'123','123');

UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
