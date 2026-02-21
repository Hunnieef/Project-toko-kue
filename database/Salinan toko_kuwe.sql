-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2026 at 02:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_kuwe`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_03_050844_add_phone_to_users_table--table=users', 1),
(5, '2026_01_16_111130_create_categories_table', 1),
(6, '2026_01_17_053549_create_products_table', 2),
(7, '2026_01_21_042727_make_phone_nullable_in_users_table', 3),
(8, '2026_01_21_050037_add_is_admin_to_users_table', 4),
(9, '2026_01_27_061244_add_avatar_to_users_table', 5),
(10, '2026_01_28_160225_create_variants_table', 6),
(11, '2026_01_31_085428_add_is_featured_to_products_table', 7),
(12, '2026_02_01_072112_create_orders_table', 8),
(13, '2026_02_01_072743_crate_order_items_table', 8),
(14, '2026_02_01_074306_create_cart_items_table', 9),
(15, '2026_02_02_054352_add_inventory_to_products_table', 9),
(16, '2026_02_02_055106_create_store_setting_table', 10),
(17, '2026_02_02_061930_create_products_day_quotas_table', 11),
(18, '2026_02_02_163927_add_order_status_flow_fields_to_orders_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `shipping_method` enum('delivery','pickup') NOT NULL,
  `payment_method` enum('bank_transfer','midtrans') NOT NULL,
  `total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `full_name`, `phone`, `address`, `shipping_method`, `payment_method`, `total`, `status`, `paid_at`, `cancelled_at`, `delivered_at`, `created_at`, `updated_at`) VALUES
(1, 3, 'Kim Yerim', '089682995062', 'Jl. Kesambi Gg.Mawar', 'delivery', 'bank_transfer', 40000.00, 'delivered', '2026-02-03 04:12:26', NULL, '2026-02-03 05:10:31', '2026-02-02 22:08:21', '2026-02-03 05:10:31'),
(2, 3, 'Kim Yerim', '089682995062', 'Jl. Kesambi Gg.Mawar', 'delivery', 'midtrans', 8000.00, 'pending', NULL, NULL, NULL, '2026-02-03 18:30:17', '2026-02-03 18:30:17'),
(3, 3, 'alim', '087771592276', 'mars', 'delivery', 'bank_transfer', 73000.00, 'paid', '2026-02-03 18:50:42', NULL, NULL, '2026-02-03 18:49:46', '2026-02-03 18:50:42'),
(4, 3, 'tiara', '08765432110', 'jl kalijaga', 'delivery', 'bank_transfer', 15000.00, 'pending', NULL, NULL, NULL, '2026-02-03 18:57:50', '2026-02-03 18:57:50'),
(5, 3, 'Kim Yerim', '089682995062', 'mars', 'pickup', 'bank_transfer', 40000.00, 'ready', NULL, NULL, NULL, '2026-02-03 19:28:29', '2026-02-03 19:32:10');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `qty`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 24, 'Kue sagu keju', 40000.00, 1, 40000.00, '2026-02-02 22:08:21', '2026-02-02 22:08:21'),
(2, 2, 19, 'Cake ketan hitam keju lumer', 8000.00, 1, 8000.00, '2026-02-03 18:30:17', '2026-02-03 18:30:17'),
(3, 3, 19, 'Cake ketan hitam keju lumer', 8000.00, 1, 8000.00, '2026-02-03 18:49:46', '2026-02-03 18:49:46'),
(4, 3, 18, 'Cake bolu jadul meises keju', 65000.00, 1, 65000.00, '2026-02-03 18:49:46', '2026-02-03 18:49:46'),
(5, 4, 14, 'Cupcake /cup', 15000.00, 1, 15000.00, '2026-02-03 18:57:50', '2026-02-03 18:57:50'),
(6, 5, 24, 'Kue sagu keju', 40000.00, 1, 40000.00, '2026-02-03 19:28:29', '2026-02-03 19:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `image`, `price`, `is_featured`, `category_id`, `created_at`, `updated_at`) VALUES
(10, 'Custom Fondant Cake', 'custom-fondant-cake', 'storage/products/gZv3Qx9peUG5fSbW8Eapy7Tivarw2BfOVeAZqnQK.jpg', 280000.00, 0, NULL, '2026-01-17 00:37:21', '2026-01-17 00:37:21'),
(11, 'Custom cake 3D', 'custom-cake-3d', 'storage/products/e6es97T7FsUtgs2yoQjLd4GDnm9rXDFvKx0WfVLf.jpg', 235000.00, 0, NULL, '2026-01-17 00:38:12', '2026-01-17 00:38:37'),
(12, 'Bento Cake', 'bento-cake', 'storage/products/qzBktKapdoHPnrM5XQ4AWAt2QvFdXZuRgx3DRefq.jpg', 75000.00, 0, NULL, '2026-01-17 00:39:13', '2026-01-17 00:39:13'),
(14, 'Cupcake /cup', 'cupcake-cup', 'storage/products/842eIxEeVfnSmuAVVhJP2RbM1IJOPDduboekqMmp.jpg', 15000.00, 1, NULL, '2026-01-23 22:22:32', '2026-01-28 08:16:52'),
(15, 'Mini Chocolate Cake', 'mini-chocolate-cake', 'storage/products/RZ9Buoe7Lhvwg1d9xuyUzOih9OFBT4B3GP7XIF7n.jpg', 15000.00, 0, NULL, '2026-01-28 08:18:12', '2026-01-28 08:18:12'),
(17, 'Mini Strawberry Cake', 'mini-strawberry-cake', 'storage/products/Kt37hjrNEORo6YxiQpV67ZdfzWofzwg1uPAhqvPj.jpg', 15000.00, 1, NULL, '2026-01-30 02:23:03', '2026-01-30 02:23:03'),
(18, 'Cake bolu jadul meises keju', 'cake-bolu-jadul-meises-keju', 'storage/products/qangAFqGD75dN3oAxdx88QEy7KQEV0aue3qh1fAc.jpg', 65000.00, 0, NULL, '2026-01-31 21:06:07', '2026-01-31 21:13:05'),
(19, 'Cake ketan hitam keju lumer', 'cake-ketan-hitam-keju-lumer', 'storage/products/NguHjFZF7Tjh6Z2DcrdI8hqUZlMAztXPYebCAneT.jpg', 8000.00, 1, NULL, '2026-01-31 21:07:57', '2026-01-31 21:13:22'),
(20, 'Cake ketan hitam caramel', 'cake-ketan-hitam-caramel', 'storage/products/hgg4Doey7DZEiBpnpb3qjxVRKOJidCEqIpSvONCy.jpg', 8000.00, 1, NULL, '2026-01-31 21:08:59', '2026-01-31 21:13:34'),
(21, 'Kue nastar', 'kue-nastar', 'storage/products/4qvyduyFIi76IbApuXBV23LazQFP8Hjk1Xpz9qMO.jpg', 65000.00, 1, NULL, '2026-01-31 21:10:17', '2026-01-31 21:14:35'),
(22, 'Kue putri salju', 'kue-putri-salju', 'storage/products/ENewAQqHHfUkQuTeqNO6ENa9YSFF5Hg896Q1kiz9.jpg', 65000.00, 0, NULL, '2026-01-31 21:15:09', '2026-01-31 21:15:09'),
(23, 'Kue kastengel', 'kue-kastengel', 'storage/products/qRKJGLABZU3YvDDNNsTgfUsrC89CcONzbG1HTyVP.jpg', 60000.00, 0, NULL, '2026-01-31 21:16:08', '2026-01-31 21:16:08'),
(24, 'Kue sagu keju', 'kue-sagu-keju', 'storage/products/A5e1aIN5kXyux4G2fhs0ZnfcMo5qfIeSWxiHX2u6.jpg', 40000.00, 0, NULL, '2026-01-31 21:16:43', '2026-01-31 21:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `product_day_quotas`
--

CREATE TABLE `product_day_quotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `quota` int(10) UNSIGNED NOT NULL,
  `reserved` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_settings`
--

CREATE TABLE `store_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `closed_message` varchar(255) DEFAULT NULL,
  `closed_from` datetime DEFAULT NULL,
  `closed_until` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_settings`
--

INSERT INTO `store_settings` (`id`, `is_open`, `closed_message`, `closed_from`, `closed_until`, `created_at`, `updated_at`) VALUES
(1, 0, 'Maaf stok habis', '2026-02-03 07:00:00', '2026-02-08 00:00:00', '2026-02-02 07:38:28', '2026-02-03 19:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'gita', NULL, 'gitasyifani@gmail.com', NULL, NULL, '$2y$12$nZ/Uonq3VhvO.A5CFYexuOjodxWWxmY5mwBQeDjfWtL68PyfI6QHi', NULL, '2026-01-20 21:52:41', '2026-01-20 21:52:41', 1),
(2, 'puputs', NULL, 'puputnopi@gmail.com', NULL, NULL, '$2y$12$a46mt7MbLq.p6BI7skWsEOlLOiFAiztuU/MqlYNR993QNLMbeAVUe', NULL, '2026-01-23 01:12:12', '2026-01-23 01:12:12', 0),
(3, 'keeno', NULL, 'keenkenosp@gmail.com', 'avatars/1769496381_คีน ยืม=ใจ.jpg', NULL, '$2y$12$6gI8xI2rmpx.VV9VcSjyvO.FMb8ik8lZgSPv2Zq3H4bIieVxI1O5G', NULL, '2026-01-24 02:22:24', '2026-01-26 23:46:21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_items_user_id_product_id_unique` (`user_id`,`product_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_status_index` (`status`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_day_quotas`
--
ALTER TABLE `product_day_quotas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_day_quotas_product_id_date_unique` (`product_id`,`date`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `store_settings`
--
ALTER TABLE `store_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product_day_quotas`
--
ALTER TABLE `product_day_quotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_settings`
--
ALTER TABLE `store_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_day_quotas`
--
ALTER TABLE `product_day_quotas`
  ADD CONSTRAINT `product_day_quotas_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
