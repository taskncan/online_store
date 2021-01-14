-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 13 Nis 2020, 21:42:31
-- Sunucu sürümü: 10.4.8-MariaDB
-- PHP Sürümü: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `chill_buy`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`category_id`, `category_title`) VALUES
(1, 'Toys & Games'),
(2, 'Tools & Home Improvement'),
(3, 'Supermarket'),
(4, 'Sports'),
(5, 'Software & Computer Games'),
(6, 'Shoes'),
(7, 'Outdoors'),
(8, 'Office Products'),
(9, 'Home & Garden'),
(10, 'Hobbies'),
(11, 'Health & Personal Care'),
(12, 'Handbags & Sunglasses'),
(13, 'Electronics'),
(14, 'Clothing & Accessories'),
(15, 'Books'),
(16, 'Beauty Tools');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `client_table`
--

--customerlar için table
CREATE TABLE `client_table` (
  `client_id` int(11) NOT NULL,
  `client_email` varchar(255) DEFAULT NULL,
  `client_password` varchar(255) DEFAULT NULL,
  `client_last_login` datetime DEFAULT NULL,
  `client_sign_up` datetime DEFAULT NULL,
  `client_phone` varchar(30) DEFAULT NULL,
  `client_address` varchar(300) DEFAULT NULL,
  `client_total_orders` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `order_evaluation_table`
--

--siparişlerin değerlendirilmesi için table
CREATE TABLE `order_evaluation_table` (
  `order_evaluation_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_comment` varchar(400) DEFAULT NULL,
  `product_rating` int(11) DEFAULT NULL,
  `seller_rating` int(11) DEFAULT NULL,
  `seller_comment` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `order_table`
--

CREATE TABLE `order_table` (
  `order_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_quantity` int(11) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `order_statues` varchar(255) DEFAULT NULL,
  `order_shipment_time` datetime DEFAULT NULL,
  `order_statue_last_change` datetime DEFAULT NULL,
  `order_received` tinyint(1) DEFAULT NULL,
  `order_compleated` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_table`
--

CREATE TABLE `product_table` (
  `product_id` int(11) NOT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_shipment_time` int(11) DEFAULT NULL,
  `product_details` varchar(1000) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_rating` int(11) DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `product_image_link` varchar(255) DEFAULT NULL,
  `product_label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `return_table`
--

--iade için table
CREATE TABLE `return_table` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `return_reason` varchar(400) DEFAULT NULL,
  `return_received` tinyint(1) DEFAULT NULL,
  `return_approved` tinyint(1) DEFAULT NULL,
  `return_receive_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sales_table`
--

--indirim ve kampanyalar için table
CREATE TABLE `sales_table` (
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `sale_start_time` datetime DEFAULT NULL,
  `sale_end_time` datetime DEFAULT NULL,
  `sale_details` varchar(400) DEFAULT NULL,
  `sale_new_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `seller_table`
--

--product ownerlar için table
CREATE TABLE `seller_table` (
  `seller_id` int(11) NOT NULL,
  `seller_email` varchar(255) DEFAULT NULL,
  `seller_password` varchar(255) DEFAULT NULL,
  `seller_rating` int(11) DEFAULT NULL,
  `seller_total_sells` int(11) DEFAULT NULL,
  `seller_last_login` datetime DEFAULT NULL,
  `seller__signup` datetime DEFAULT NULL,
  `seller_phone` varchar(30) DEFAULT NULL,
  `seller_username` varchar(255) DEFAULT NULL,
  `seller_address` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Tablo için indeksler `client_table`
--
ALTER TABLE `client_table`
  ADD PRIMARY KEY (`client_id`);

--
-- Tablo için indeksler `order_evaluation_table`
--
ALTER TABLE `order_evaluation_table`
  ADD PRIMARY KEY (`order_evaluation_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Tablo için indeksler `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Tablo için indeksler `product_table`
--
ALTER TABLE `product_table`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_category_id` (`product_category_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Tablo için indeksler `return_table`
--
ALTER TABLE `return_table`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Tablo için indeksler `sales_table`
--
ALTER TABLE `sales_table`
  ADD PRIMARY KEY (`sales_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Tablo için indeksler `seller_table`
--
ALTER TABLE `seller_table`
  ADD PRIMARY KEY (`seller_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Tablo için AUTO_INCREMENT değeri `client_table`
--
ALTER TABLE `client_table`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `order_evaluation_table`
--
ALTER TABLE `order_evaluation_table`
  MODIFY `order_evaluation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `order_table`
--
ALTER TABLE `order_table`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `product_table`
--
ALTER TABLE `product_table`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `return_table`
--
ALTER TABLE `return_table`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `sales_table`
--
ALTER TABLE `sales_table`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `seller_table`
--
ALTER TABLE `seller_table`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `order_evaluation_table`
--
ALTER TABLE `order_evaluation_table`
  ADD CONSTRAINT `order_evaluation_table_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`order_id`);

--
-- Tablo kısıtlamaları `order_table`
--
ALTER TABLE `order_table`
  ADD CONSTRAINT `order_table_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller_table` (`seller_id`),
  ADD CONSTRAINT `order_table_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client_table` (`client_id`),
  ADD CONSTRAINT `order_table_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`product_id`);

--
-- Tablo kısıtlamaları `product_table`
--
ALTER TABLE `product_table`
  ADD CONSTRAINT `product_table_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `product_table_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `seller_table` (`seller_id`);

--
-- Tablo kısıtlamaları `return_table`
--
ALTER TABLE `return_table`
  ADD CONSTRAINT `return_table_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`order_id`);

--
-- Tablo kısıtlamaları `sales_table`
--
ALTER TABLE `sales_table`
  ADD CONSTRAINT `sales_table_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`product_id`),
  ADD CONSTRAINT `sales_table_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `seller_table` (`seller_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
