-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 13, 2022 lúc 11:48 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duan1_ks_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id_bill` int(255) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_phong` int(11) NOT NULL,
  `create_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `price` int(255) NOT NULL,
  `ngay_thue` date NOT NULL,
  `ngay_tra` date NOT NULL,
  `loaiPhong_id` int(11) NOT NULL,
  `tong_tien` int(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1: Đang xử lý\r\n2: Đặt Thành Công'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id_bill`, `id_user`, `id_phong`, `create_at`, `price`, `ngay_thue`, `ngay_tra`, `loaiPhong_id`, `tong_tien`, `status`) VALUES
(24, 2, 19, '2022-12-06 17:49:02.173400', 1250000, '2022-12-10', '2022-12-24', 9, 17500000, 2),
(25, 2, 19, '2022-12-06 17:51:34.560871', 1250000, '2022-12-31', '2023-01-01', 9, 1250000, 2),
(27, 2, 19, '2022-12-06 17:52:43.416630', 1250000, '2023-02-14', '2023-02-15', 9, 1250000, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_phong` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `so_sao` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `id_user`, `id_phong`, `description`, `so_sao`, `create_at`) VALUES
(5, 2, 19, 'adfadsfasdfasdfasdfasdf', 5, '2022-12-04 16:37:49'),
(6, 2, 19, 'adfasdfasdfasdfa', 5, '2022-12-04 17:00:26'),
(7, 2, 19, 'adsdasd', 5, '2022-12-04 17:55:48'),
(8, 2, 16, 'ádasdad', 5, '2022-12-04 19:00:25'),
(9, 2, 16, 'ádkajđal', 3, '2022-12-04 19:00:32'),
(10, 2, 22, 'dfgdfg', 3, '2022-12-13 04:20:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaiphong`
--

CREATE TABLE `loaiphong` (
  `id` int(11) NOT NULL,
  `name` varchar(199) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `create_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `id_phong` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loaiphong`
--

INSERT INTO `loaiphong` (`id`, `name`, `description`, `create_id`, `created_at`, `id_phong`) VALUES
(8, 'Suite', 'Suite có hình thức như một căn hộ đầy đủ tiện nghi, có phòng khách, 1 hoặc 2 phòng ngủ, phòng tắm, bếp…......', 1, '2022-11-22 15:08:06', 0),
(9, 'Single Room', 'Phòng single có 1 giường dành cho 1 khách.', 1, '2022-11-22 15:08:23', 0),
(10, 'Quad Room', 'Phòng Quad dành cho 4 khách, gồm 2 giường (2 khách nằm chung 1 giường).', 1, '2022-11-22 15:46:50', 0),
(11, 'Double Room', 'Phòng double có 1 giường dành cho 2 khách.', 1, '2022-12-02 06:23:26', 0),
(13, 'Twin Room', 'Phòng twin có 2 giường dành cho 2 khách riêng biệt.', 1, '2022-12-02 06:26:58', 0),
(15, 'Tripple Room', 'Phòng triple có 3 giường dành cho 3 khách người lớn hoặc 1 gia đình (3 giường đơn hoặc 1 giường đôi, 1 giường đơn).', 1, '2022-12-02 06:31:03', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phong`
--

CREATE TABLE `phong` (
  `id` int(11) NOT NULL,
  `loaiphong_id` int(11) NOT NULL,
  `create_id` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `title` varchar(199) NOT NULL,
  `description` text DEFAULT NULL,
  `thumb` varchar(199) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `phong`
--

INSERT INTO `phong` (`id`, `loaiphong_id`, `create_id`, `count`, `price`, `title`, `description`, `thumb`, `status`, `created_at`) VALUES
(16, 8, 1, 1, 100000, 'SR_01', '<p>đẹp lắm</p>', 'phongsuite.jpg', 1, '2022-11-22 15:41:48'),
(19, 9, 1, 1, 1250000, 'SGR_05', '<p>abc bac cba</p>', 'singleroom.jpg', 1, '2022-12-02 06:10:57'),
(21, 9, 1, 2, 100000, 'SGR_04', '<p>Phòng dành riêng cho các trai đẹp</p>', 'singleroom1.jpg', 1, '2022-12-06 20:33:30'),
(22, 8, 1, 1, 100000, 'SR_02', '<p>Phòng hò hét 2h sáng</p>', 'suite1.jpeg', 1, '2022-12-06 21:11:30'),
(23, 8, 1, 1, 100000, 'SR_06', 'Suite có hình thức như một căn hộ đầy đủ tiện nghi, có phòng khách, 1 hoặc 2 phòng ngủ, phòng tắm, bếp…', 'suite2.jpg', 1, NULL),
(24, 8, 1, 1, 100000, 'SR_05', '<p>Suite có hình thức như một căn hộ đầy đủ tiện nghi, có phòng khách, 1 hoặc 2 phòng ngủ, phòng tắm, bếp…</p>', 'suite3.jpg', 1, '2022-12-06 23:39:19'),
(25, 8, 1, 1, 100000, 'SR_04', '<p>Suite có hình thức như một căn hộ đầy đủ tiện nghi, có phòng khách, 1 hoặc 2 phòng ngủ, phòng tắm, bếp…</p>', 'suite4.jpg', 1, '2022-12-06 23:39:47'),
(26, 8, 1, 1, 100000, 'SR_03', '<p>Suite có hình thức như một căn hộ đầy đủ tiện nghi, có phòng khách, 1 hoặc 2 phòng ngủ, phòng tắm, bếp…</p>', 'suite5.jpg', 1, '2022-12-06 23:40:06'),
(27, 9, 1, 1, 100000, 'SGR_03', '<p>Phòng single có 1 giường dành cho 1 khách.</p>', 'singleroom2.jpeg', 1, '2022-12-06 23:43:02'),
(28, 9, 1, 1, 100000, 'SGR_02', '<p>Phòng single có 1 giường dành cho 1 khách.</p>', 'singleroom3.webp', 1, '2022-12-06 23:44:44'),
(29, 9, 1, 1, 100000, 'SGR_01', '<p>Phòng single có 1 giường dành cho 1 khách.</p>', 'singleroom4.webp', 1, '2022-12-06 23:45:08'),
(30, 11, 1, 2, 200000, 'DBR_01', '<p>Phòng double có 1 giường dành cho 2 khách.</p>', 'twinroom4.jpg', 1, '2022-12-06 23:46:39'),
(31, 11, 1, 3, 200000, 'DBR_02', '<p>Phòng double có 1 giường dành cho 2 khách.</p>', 'twinroom3.jpg', 1, '2022-12-06 23:46:59'),
(32, 11, 1, 1, 200000, 'DBR_03', '<p>Phòng double có 1 giường dành cho 2 khách.</p>', 'twinroom2.jpg', 1, '2022-12-06 23:47:15'),
(33, 11, 1, 1, 200000, 'DBR_04', '<p>Phòng double có 1 giường dành cho 2 khách.</p>', 'twinroom1.jpg', 1, '2022-12-06 23:48:30'),
(34, 11, 1, 1, 200000, 'DBR_05', '<p>Phòng double có 1 giường dành cho 2 khách.</p>', 'twinroom.jpeg', 1, '2022-12-06 23:48:50'),
(35, 15, 1, 1, 300000, 'TPR_01', '<p>Phòng triple có 3 giường dành cho 3 khách người lớn hoặc 1 gia đình (3 giường đơn hoặc 1 giường đôi, 1 giường đơn).</p>', 'trippleroom.webp', 1, '2022-12-06 23:50:12'),
(36, 15, 1, 2, 300000, 'TPR_02', '<p>Phòng triple có 3 giường dành cho 3 khách người lớn hoặc 1 gia đình (3 giường đơn hoặc 1 giường đôi, 1 giường đơn).</p>', 'trippleroom1.jpg', 1, '2022-12-06 23:50:33'),
(37, 15, 1, 2, 300000, 'TPR_03', '<p>Phòng triple có 3 giường dành cho 3 khách người lớn hoặc 1 gia đình (3 giường đơn hoặc 1 giường đôi, 1 giường đơn).</p>', 'trippleroom2.jpg', 1, '2022-12-06 23:50:52'),
(38, 15, 1, 2, 300000, 'TPR_04', '<p>Phòng triple có 3 giường dành cho 3 khách người lớn hoặc 1 gia đình (3 giường đơn hoặc 1 giường đôi, 1 giường đơn).</p>', 'trippleroom3.jpg', 1, '2022-12-06 23:51:15'),
(39, 15, 1, 2, 300000, 'TPR_05', '<p>Phòng triple có 3 giường dành cho 3 khách người lớn hoặc 1 gia đình (3 giường đơn hoặc 1 giường đôi, 1 giường đơn).</p>', 'trippleroom4.jpg', 1, '2022-12-06 23:51:33'),
(40, 13, 1, 2, 250000, 'TR_01', '<p>Phòng twin có 2 giường dành cho 2 khách riêng biệt.</p>', 'twinroom.jpeg', 1, '2022-12-06 23:53:38'),
(41, 13, 1, 2, 250000, 'TR_02', '<p>Phòng twin có 2 giường dành cho 2 khách riêng biệt.</p>', 'twinroom1.jpg', 1, '2022-12-06 23:53:54'),
(42, 13, 1, 1, 250000, 'TR_03', '<p>Phòng twin có 2 giường dành cho 2 khách riêng biệt.</p>', 'twinroom2.jpg', 1, '2022-12-06 23:54:11'),
(43, 13, 1, 2, 250000, 'TR_04', '<p>Phòng twin có 2 giường dành cho 2 khách riêng biệt.</p>', 'twinroom3.jpg', 1, '2022-12-06 23:54:26'),
(44, 13, 1, 1, 250000, 'TR_05', '<p>Phòng twin có 2 giường dành cho 2 khách riêng biệt.</p>', 'twinroom4.jpg', 1, '2022-12-06 23:54:41'),
(45, 10, 1, 1, 490000, 'QR_01', '<p>Phòng Quad dành cho 4 khách, gồm 2 giường (2 khách nằm chung 1 giường).</p>', 'quadroom.jpg', 1, '2022-12-06 23:56:18'),
(46, 10, 1, 1, 490000, 'QR_02', '<p>Phòng Quad dành cho 4 khách, gồm 2 giường (2 khách nằm chung 1 giường).</p>', 'quadroom1.jpg', 1, '2022-12-06 23:56:33'),
(47, 10, 1, 1, 490000, 'QR_03', '<p>Phòng Quad dành cho 4 khách, gồm 2 giường (2 khách nằm chung 1 giường).</p>', 'quadroom2.png', 1, '2022-12-06 23:56:51'),
(48, 10, 1, 2, 490000, 'QR_04', '<p>Phòng Quad dành cho 4 khách, gồm 2 giường (2 khách nằm chung 1 giường).</p>', 'quadroom3.jpg', 1, '2022-12-06 23:57:10'),
(49, 10, 1, 3, 4900000, 'QR_05', '<p>Phòng Quad dành cho 4 khách, gồm 2 giường (2 khách nằm chung 1 giường).</p>', 'quadroom4.jpg', 1, '2022-12-06 23:57:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(199) NOT NULL,
  `email` varchar(199) NOT NULL,
  `numberphone` varchar(45) DEFAULT NULL,
  `password` varchar(199) NOT NULL,
  `role` int(11) DEFAULT NULL COMMENT '1: User\n2: Admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `thumb` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `numberphone`, `password`, `role`, `created_at`, `thumb`) VALUES
(1, 'Quản trị viên', 'admin@gmail.com', NULL, 'admin', 2, NULL, ''),
(2, 'Duong Van Duy', 'duy@gmail.com', '0342782299', '123456', 1, NULL, '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id_bill`),
  ADD KEY `id_prod` (`id_phong`),
  ADD KEY `bills_ibfk_2` (`id_user`),
  ADD KEY `loaiPhong_id` (`loaiPhong_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_phong` (`id_phong`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `loaiphong`
--
ALTER TABLE `loaiphong`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_categories_create_id_idx` (`create_id`);

--
-- Chỉ mục cho bảng `phong`
--
ALTER TABLE `phong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_productions_category_idx` (`loaiphong_id`),
  ADD KEY `pk_productions_create_id_idx` (`create_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id_bill` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `loaiphong`
--
ALTER TABLE `loaiphong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `phong`
--
ALTER TABLE `phong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`id_phong`) REFERENCES `phong` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`id_phong`) REFERENCES `phong` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `phong`
--
ALTER TABLE `phong`
  ADD CONSTRAINT `phong_ibfk_1` FOREIGN KEY (`loaiphong_id`) REFERENCES `loaiphong` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
