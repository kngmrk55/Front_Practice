-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-08-2023 a las 05:42:15
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `electronicsstore`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_purchased_view` ()   BEGIN
	SELECT * FROM `purchased_view`;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_client` int(8) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postalZip` varchar(10) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_client`, `name`, `phone`, `email`, `address`, `postalZip`, `region`, `country`) VALUES
(1, 'Shelby Head', '(862) 485-0434', 'facilisi.sed@aol.net', 'Ap #750-9614 Ac Street', '36-735', 'Puno', 'Canada'),
(2, 'Cora Stephenson', '(146) 281-5853', 'duis@yahoo.ca', 'P.O. Box 724, 4933 Magna. Rd.', '9221', 'Papua', 'Vietnam'),
(3, 'Ulysses Howell', '(687) 844-3825', 'nullam.vitae@yahoo.edu', 'Ap #923-6162 Vitae Avenue', 'P34 1BF', 'Zamboanga Peninsula', 'Russian Federation'),
(4, 'Ishmael Moody', '1-777-187-6351', 'nibh.dolor.nonummy@aol.ca', 'Ap #103-955 Amet, Street', '2462', 'Free State', 'Costa Rica'),
(5, 'Alyssa Watson', '1-206-237-7428', 'et.eros@protonmail.org', '734-1650 Sem St.', '29782', 'Central Luzon', 'Poland'),
(6, 'Lucius Campbell', '(566) 201-8032', 'duis.gravida@icloud.com', '467-5816 Vitae Ave', '72436', 'Ulster', 'Spain'),
(7, 'Victor Moon', '(552) 953-7297', 'ullamcorper.nisl@icloud.net', 'P.O. Box 921, 2495 Pede. Road', '93-48', 'Trøndelag', 'Mexico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_product` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `release_date` date DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_product`, `name`, `release_date`, `stock`, `price`) VALUES
(1, 'Apple MacBook Pro Retina', '2020-11-01', 50, 30000),
(2, 'Apple iPhone 14 Pro', '2022-09-16', 23, 21000),
(3, 'Acer Nitro 5', '2019-04-01', 2, 24000),
(4, 'Samsung Galaxy S23', '2022-06-14', 33, 25000),
(5, 'Huawei P60 Pro', '2023-03-31', 8, 26000),
(6, 'HP Pavilion 15', '2018-08-01', 1, 8000),
(7, 'Nubia RedMagic 8', '2021-03-10', 12, 16999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_sold`
--

CREATE TABLE `products_sold` (
  `id_sold` int(10) UNSIGNED NOT NULL,
  `id_client` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `date_of_purchase` date NOT NULL,
  `ship_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products_sold`
--

INSERT INTO `products_sold` (`id_sold`, `id_client`, `id_product`, `date_of_purchase`, `ship_date`) VALUES
(1, 6, 7, '2023-08-01', '2023-08-02'),
(2, 4, 5, '2023-07-26', '2023-07-27'),
(3, 5, 4, '2023-05-22', '2023-05-23'),
(4, 7, 2, '2023-03-12', '2023-03-13'),
(5, 6, 3, '2022-08-30', '2022-08-31'),
(6, 4, 2, '2023-06-14', '2023-06-15'),
(7, 4, 1, '2023-05-17', '2023-05-18'),
(8, 2, 5, '2023-08-01', '2023-08-02'),
(9, 3, 1, '2023-08-01', '2023-08-02');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `purchased_view`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `purchased_view` (
`ID` int(10) unsigned
,`Customer` varchar(255)
,`Product` varchar(255)
,`Purchased` date
,`Shipped` date
,`Shipped_to` varchar(255)
,`Charged` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `purchased_view`
--
DROP TABLE IF EXISTS `purchased_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `purchased_view`  AS SELECT `products_sold`.`id_sold` AS `ID`, `clients`.`name` AS `Customer`, `products`.`name` AS `Product`, `products_sold`.`date_of_purchase` AS `Purchased`, `products_sold`.`ship_date` AS `Shipped`, `clients`.`address` AS `Shipped_to`, `products`.`price` AS `Charged` FROM ((`products_sold` join `clients` on(`products_sold`.`id_client` = `clients`.`id_client`)) join `products` on(`products_sold`.`id_product` = `products`.`id_product`)) ORDER BY `products_sold`.`id_sold` ASC ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

--
-- Indices de la tabla `products_sold`
--
ALTER TABLE `products_sold`
  ADD PRIMARY KEY (`id_sold`),
  ADD KEY `client_purchases` (`id_client`),
  ADD KEY `product_purchases` (`id_product`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `products_sold`
--
ALTER TABLE `products_sold`
  MODIFY `id_sold` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products_sold`
--
ALTER TABLE `products_sold`
  ADD CONSTRAINT `client_purchases` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `product_purchases` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
