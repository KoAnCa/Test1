-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 04, 2019 lúc 05:29 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fight-facefly_2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `airways`
--

CREATE TABLE `airways` (
  `airways_id` int(11) NOT NULL,
  `airways_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `airways`
--

INSERT INTO `airways` (`airways_id`, `airways_name`) VALUES
(1, 'Vietjet air'),
(2, 'Vietnam Airlines'),
(3, 'JetStar');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flights`
--

CREATE TABLE `flights` (
  `flight_id` int(11) NOT NULL,
  `airways_id` int(11) NOT NULL,
  `flight_time_from` datetime NOT NULL,
  `flight_time_to` datetime NOT NULL,
  `flight_city_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flight_city_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flight_transit` int(2) NOT NULL,
  `flight_direction` int(11) NOT NULL,
  `flight_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flights`
--

INSERT INTO `flights` (`flight_id`, `airways_id`, `flight_time_from`, `flight_time_to`, `flight_city_from`, `flight_city_to`, `flight_transit`, `flight_direction`, `flight_price`) VALUES
(3, 2, '2019-02-22 18:45:00', '2019-02-22 19:50:00', 'SNG', 'SIN', 0, 0, 823),
(4, 2, '2019-02-22 18:45:00', '2019-02-22 02:55:00', 'Hà Nội (HAN)', 'Hồ Chí MInh (SNG)', 0, 1, 431),
(5, 3, '2019-02-22 18:45:00', '2019-02-22 02:55:00', 'PAN', 'SNG', 1, 1, 4315),
(6, 1, '2019-02-22 18:45:00', '2019-02-22 02:55:00', 'Hà Nội (HAN)', 'Hồ Chí MInh (SNG)', 1, 0, 5000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flights_booking`
--

CREATE TABLE `flights_booking` (
  `booking_id` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flight_id` int(11) NOT NULL,
  `cus_title` int(10) NOT NULL,
  `cus_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_price` double NOT NULL,
  `payment` int(3) NOT NULL,
  `card_number` int(3) NOT NULL,
  `card_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ccv_code` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flights_booking`
--

INSERT INTO `flights_booking` (`booking_id`, `user_email`, `flight_id`, `cus_title`, `cus_name`, `total_price`, `payment`, `card_number`, `card_name`, `ccv_code`) VALUES
(1, '1', 2, 0, '$cus_name', 3, 4, 1, '1', 1),
(7, 'quocvinhtdc@gmail.com', 6, 0, 'THanhVinh', 20000, 0, 0, '', 0),
(8, 'quocvinhtdc@gmail.com', 6, 0, '', 20000, 0, 0, '', 0),
(9, 'quocvinhtdc@gmail.com', 6, 0, 'QuocVinh', 20000, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `list_cities`
--

CREATE TABLE `list_cities` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `list_cities`
--

INSERT INTO `list_cities` (`city_id`, `city_name`, `city_code`) VALUES
(1, 'TP. Hồ Chí Minh', 'SNG'),
(2, 'Hà Nội', 'HAN'),
(3, 'Singapore', 'SIN'),
(4, 'PuSan', 'PUS'),
(5, 'Đà Nẵng', 'DAD'),
(6, 'Đà Lạt', 'DAL');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transit`
--

CREATE TABLE `transit` (
  `transit_id` int(11) NOT NULL,
  `transit_place` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transit_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_phone` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_gender` int(2) DEFAULT NULL,
  `user_bird` date DEFAULT NULL,
  `user_adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempt` int(2) DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `user_phone`, `user_gender`, `user_bird`, `user_adress`, `attempt`, `last_access`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Quan Vu', 'admin@gmail.com', NULL, '$2y$10$4DYyW43i7Au4uuPaaOA/0OODD3ZiOHo0VaOv.BC/5qzkrnf80UkSW', NULL, NULL, NULL, NULL, 0, '2019-03-03 08:36:21', NULL, '2019-03-03 10:48:33', '2019-03-03 13:36:21'),
(2, 'Trieu Van', 'user@gmail.com', NULL, '$2y$10$T3Qj1.ddwFK9jZvYLf58huYu.tAV86fz//D7DHH/J/xtC2iRrWktW', NULL, NULL, NULL, NULL, 3, '2019-03-04 09:33:43', NULL, '2019-03-03 10:52:17', '2019-03-04 14:33:43');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `airways`
--
ALTER TABLE `airways`
  ADD PRIMARY KEY (`airways_id`),
  ADD UNIQUE KEY `airways_id` (`airways_id`),
  ADD KEY `airways_id_2` (`airways_id`);

--
-- Chỉ mục cho bảng `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flight_id`),
  ADD UNIQUE KEY `flight_id` (`flight_id`),
  ADD KEY `flight_id_2` (`flight_id`),
  ADD KEY `airways_id` (`airways_id`),
  ADD KEY `flight_city_to_id` (`flight_city_to`),
  ADD KEY `flight_city_from_id` (`flight_city_from`);

--
-- Chỉ mục cho bảng `flights_booking`
--
ALTER TABLE `flights_booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Chỉ mục cho bảng `list_cities`
--
ALTER TABLE `list_cities`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transit`
--
ALTER TABLE `transit`
  ADD PRIMARY KEY (`transit_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `airways`
--
ALTER TABLE `airways`
  MODIFY `airways_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `flights`
--
ALTER TABLE `flights`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `flights_booking`
--
ALTER TABLE `flights_booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `list_cities`
--
ALTER TABLE `list_cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `transit`
--
ALTER TABLE `transit`
  MODIFY `transit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`airways_id`) REFERENCES `airways` (`airways_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
