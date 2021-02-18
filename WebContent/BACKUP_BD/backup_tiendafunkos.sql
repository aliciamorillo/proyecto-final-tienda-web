/*
SQLyog Community Edition- MySQL GUI v8.15 Beta1
MySQL - 5.0.37-community-nt : Database - tiendafunkos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tiendafunkos` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tiendafunkos`;

/*Table structure for table `detalleventa` */

DROP TABLE IF EXISTS `detalleventa`;

CREATE TABLE `detalleventa` (
  `codigoVenta` int(3) NOT NULL,
  `codigoProducto` int(3) NOT NULL,
  `cantidad` double(5,2) NOT NULL,
  `descuento` double(5,2) NOT NULL,
  PRIMARY KEY  (`codigoVenta`,`codigoProducto`),
  KEY `FK_DetalleVenta_Producto` (`codigoProducto`),
  CONSTRAINT `FK_DetalleVenta_Producto` FOREIGN KEY (`codigoProducto`) REFERENCES `productos` (`id`),
  CONSTRAINT `FK_DetalleVenta_Venta` FOREIGN KEY (`codigoVenta`) REFERENCES `ventas` (`codigoVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detalleventa` */

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id` int(3) NOT NULL,
  `nombreFunko` varchar(50) NOT NULL,
  `seccion` varchar(30) NOT NULL,
  `precio` double(5,2) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `productos` */

insert  into `productos`(`id`,`nombreFunko`,`seccion`,`precio`,`imagen`) values (1,'Homer Simpson','Animacion',12.99,'imagenes/funkos/Animacion/AnimacionHomer.jpg'),(2,'Bart Simpson','Animacion',12.99,'imagenes/funkos/Animacion/AnimacionBart.jpg'),(3,'Set Los Simpson','Animacion',59.99,'imagenes/funkos/Animacion/AnimacionSetSimpsons.jpg'),(4,'Set South Park','Animacion',29.99,'imagenes/funkos/Animacion/AnimacionSetSouthPark.jpg'),(5,'Snoopy y Woodstock','Animacion',19.50,'imagenes/funkos/Animacion/AnimacionSnoopy.jpg'),(6,'Pokemon - Mew','Anime',14.99,'imagenes/funkos/Anime/AnimeMew.jpg'),(7,'Naruto Uzumaki','Anime',13.99,'imagenes/funkos/Anime/AnimeNaruto.jpg'),(8,'Pokemon - Pikachu','Anime',12.50,'imagenes/funkos/Anime/AnimePikachu.jpg'),(9,'Set Dragon Ball','Anime',39.99,'imagenes/funkos/Anime/AnimeSetDragonBall.jpg'),(10,'Set Naruto','Anime',39.99,'imagenes/funkos/Anime/AnimeSetNaruto.jpg'),(11,'Set Pokemon','Anime',39.99,'imagenes/funkos/Anime/AnimeSetPokemon.jpg'),(12,'Set Saint Seiya','Anime',29.50,'imagenes/funkos/Anime/AnimeSetSaintSeiya.jpg'),(13,'Eminem - 8 Millas','Cine',12.99,'imagenes/funkos/Cine/Cine8Millas.jpg'),(14,'Chewbacca - Star Wars','Cine',12.99,'imagenes/funkos/Cine/CineChewbacca.jpg'),(15,'Godzilla','Cine',9.50,'imagenes/funkos/Cine/CineGodzilla.jpg'),(16,'Set Los Goonies','Cine',29.50,'imagenes/funkos/Cine/CineGoonies.jpg'),(17,'Set Hocus Pocus','Cine',34.99,'imagenes/funkos/Cine/CineSetHocusPocus.jpg'),(18,'Escape from New York - Snake','Cine',12.99,'imagenes/funkos/Cine/CineSnake.jpg'),(19,'Deathpool','Comic',13.99,'imagenes/funkos/Comic/ComicDeathpool.jpg'),(20,'Set Marvel Zombies','Comic',59.50,'imagenes/funkos/Comic/ComicSetMarvelZombies.jpg'),(21,'Set X Men','Comic',29.50,'imagenes/funkos/Comic/ComicSetXmen.jpg'),(22,'Thor','Comic',12.99,'imagenes/funkos/Comic/ComicThor.jpg'),(23,'Venom','Comic',11.50,'imagenes/funkos/Comic/ComicVenom.jpg'),(24,'Aladdin','Disney',13.50,'imagenes/funkos/Disney/DisneyAladdin.png'),(25,'Jasmine','Disney',13.50,'imagenes/funkos/Disney/DisneyJasmine.jpg'),(26,'Bella','Disney',10.99,'imagenes/funkos/Disney/DisneyBella.jpg'),(27,'Bestia','Disney',11.50,'imagenes/funkos/Disney/DisneyBestia.jpg'),(28,'Goofy y Pluto','Disney',15.50,'imagenes/funkos/Disney/DisneyGoofyPluto.jpg'),(29,'Set Pixar - UP','Disney',29.99,'imagenes/funkos/Disney/DisneySetUp.jpg'),(30,'AC-DC','Musica',11.50,'imagenes/funkos/Musica/MusicaACDC.jpg'),(31,'Britney Spears','Musica',13.50,'imagenes/funkos/Musica/MusicaBritney.jpg'),(32,'Freddie Mercury','Musica',11.50,'imagenes/funkos/Musica/MusicaMercury.jpg'),(33,'Motorhead','Musica',13.50,'imagenes/funkos/Musica/MusicaMotorhead.jpg'),(34,'Shawn Mendes','Musica',11.50,'imagenes/funkos/Musica/MusicaShawn.jpg');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(3) unsigned NOT NULL auto_increment,
  `nombreUsuario` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `perfil` varchar(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`nombreUsuario`,`pass`,`perfil`) values (1,'alicia','1234','admin'),(2,'nolan','4321','user');

/*Table structure for table `ventas` */

DROP TABLE IF EXISTS `ventas`;

CREATE TABLE `ventas` (
  `codigoVenta` int(3) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY  (`codigoVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ventas` */

insert  into `ventas`(`codigoVenta`,`cliente`,`fecha`) values (1,'Alicia','2021-02-15');

/* Procedure structure for procedure `listarProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProducto`()
SELECT * FROM productos ORDER BY id */$$
DELIMITER ;

/* Procedure structure for procedure `sp_actualizarProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_actualizarProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarProducto`(cod int, nom varchar(100), pre decimal(18,2))
update producto set nombreFunko = nom, precio = pre
where id = cod */$$
DELIMITER ;

/* Procedure structure for procedure `sp_Login` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_Login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Login`(usu varchar(10), clave varchar(10))
select * from usuarios where nombreUsuario=usu and pass=clave */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ProductoCod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ProductoCod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ProductoCod`(id INT)
SELECT p.id, p.nombreFunko, p.seccion, p.precio, p.imagen
	FROM productos p WHERE p.id = id ORDER BY p.nombreFunko */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
