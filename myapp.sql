-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 01-Maio-2024 às 22:35
-- Versão do servidor: 8.0.31
-- versão do PHP: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `myapp`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `line1` varchar(255) DEFAULT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `street_name` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_addresses_users1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'Dresses'),
(2, 'Pants');

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_users1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `orders`
--

INSERT INTO `orders` (`id`, `user_id`) VALUES
(122, 22);

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders_details`
--

DROP TABLE IF EXISTS `orders_details`;
CREATE TABLE IF NOT EXISTS `orders_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_orders_has_products_products1_idx` (`product_id`),
  KEY `fk_orders_has_products_orders1_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `orders_details`
--

INSERT INTO `orders_details` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(201, 122, 66, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `images` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `quantity` int NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `cat_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_ibfk_1` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `title`, `image`, `images`, `description`, `price`, `quantity`, `short_desc`, `cat_id`) VALUES
(64, 'Floral Dress', 'img_floral_dress.jpg', 'img1.jpg,img2.jpg,img3.jpg', 'The perfect summer floral dress, light and colorful.', 59.99, 10, 'Light summer dress', 1),
(65, 'Slim Fit Jeans', 'img_slim_fit_jeans.jpg', 'img4.jpg,img5.jpg,img6.jpg', 'Comfortable and stylish slim fit jeans.', 89.99, 15, 'Stylish slim jeans', 2),
(66, 'Evening Gown', 'img_evening_gown.jpg', 'img7.jpg,img8.jpg,img9.jpg', 'Elegant dress for special occasions.', 120, 4, 'Elegance and style', 1),
(67, 'White Dress Shirt', 'img_white_dress_shirt.jpg', 'img10.jpg,img11.jpg,img12.jpg', 'Essential white dress shirt for any wardrobe.', 49.99, 20, 'Classic and essential', 2),
(68, 'Linen Trousers', 'img_linen_trousers.jpg', 'img13.jpg,img14.jpg,img15.jpg', 'Light linen trousers, ideal for warm weather.', 69.99, 15, 'Summer comfort', 2),
(69, 'Casual Midi Dress', 'img_casual_midi_dress.jpg', 'img16.jpg,img17.jpg,img18.jpg', 'Casual midi dress perfect for outdoor strolls.', 75, 8, 'Casual and charming', 1),
(70, 'Basic Grey T-shirt', 'img_basic_grey_tshirt.jpg', 'img19.jpg,img20.jpg,img21.jpg', 'Basic grey t-shirt, matches everything.', 25.99, 30, 'Versatile and comfortable', 2),
(71, 'Cargo Pants', 'img_cargo_pants.jpg', 'img22.jpg,img23.jpg,img24.jpg', 'Practical and modern cargo pants with multiple pockets.', 95, 12, 'Style and practicality', 2),
(72, 'Printed Long Dress', 'img_printed_long_dress.jpg', 'img25.jpg,img26.jpg,img27.jpg', 'Chic long printed dress with a unique design.', 85, 7, 'Chic and contemporary', 1),
(73, 'Beige Chino Pants', 'img_beige_chino.jpg', 'img28.jpg,img29.jpg,img30.jpg', 'Ideal beige chino pants for a casual work look.', 79.99, 20, 'Workplace classic', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'not set',
  `lname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'not set',
  `age` int DEFAULT '18',
  `role` int DEFAULT '555',
  `photoUrl` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `type` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `fname`, `lname`, `age`, `role`, `photoUrl`, `type`) VALUES
(22, '', '25f9e794323b453885f5181f1b624d0b', 'teste@gmail.com', 'Gabriel Henrique da Paz e Silva', 'not set', 18, 555, NULL, 'local');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `products`
--
ALTER TABLE `products` ADD FULLTEXT KEY `description` (`description`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_addresses_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `orders_details`
--
ALTER TABLE `orders_details`
  ADD CONSTRAINT `fk_orders_has_products_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_has_products_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
