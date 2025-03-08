-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2025 at 10:04 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignments_backend`
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
(4, '2025_03_03_043631_create_oauth_auth_codes_table', 1),
(5, '2025_03_03_043632_create_oauth_access_tokens_table', 1),
(6, '2025_03_03_043633_create_oauth_refresh_tokens_table', 1),
(7, '2025_03_03_043634_create_oauth_clients_table', 1),
(8, '2025_03_03_043635_create_oauth_personal_access_clients_table', 1),
(9, '2025_03_03_082558_create_hotels_table', 2),
(10, '2025_03_04_070407_create_personal_access_tokens_table', 3),
(11, '2025_03_04_085034_add_google_id_column', 4),
(12, '2025_03_06_040828_create_properties_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('017b6dde17cfc0c70f13e842e56eee80050a38e65948c0d1c1e63d37c0b520acb8f563dbc59b37ef', 5, 1, 'authToken', '[]', 0, '2025-03-04 22:59:45', '2025-03-04 22:59:45', '2026-03-05 04:59:45'),
('02809457498f01b6886415ef6f60a5d3845ead916c1656db63a6ce3d0454a32a2038733d93f72eaf', 18, 1, 'authToken', '[]', 0, '2025-03-05 02:36:38', '2025-03-05 02:36:38', '2026-03-05 08:36:38'),
('21a7ccbc302fa4bc4c21a4b9ee1745781cae78ecff6d7d96f632202e7f4ae1ece0b99c17a941377c', 4, 1, 'authToken', '[]', 0, '2025-03-04 22:58:18', '2025-03-04 22:58:18', '2026-03-05 04:58:18'),
('31537092f2a0e6cc61ab43d648f79b95bb345faa27e578a7ccfae676cf512429dad04ed21e30599d', 18, 1, 'authToken', '[]', 0, '2025-03-04 23:31:24', '2025-03-04 23:31:24', '2026-03-05 05:31:24'),
('4ab278c3a434aac35608730b022157a430f931786dafc014b02949a720e4a5d48d5ea62b161fb2af', 6, 1, 'authToken', '[]', 0, '2025-03-04 23:00:37', '2025-03-04 23:00:37', '2026-03-05 05:00:37'),
('6e0d9e586ad295cca48a565c9b2ffc68eb9171154892ac38c41eaaf92c806af62b7124f34b36882b', 22, 1, 'authToken', '[]', 0, '2025-03-08 02:51:44', '2025-03-08 02:51:44', '2026-03-08 08:51:44'),
('7126bdaeb90f277f259468117ad7ef8d6b6a0b72356ad7c2c99ef5859bea93ce07a3b925edec08e8', 9, 1, 'authToken', '[]', 0, '2025-03-04 23:02:57', '2025-03-04 23:02:57', '2026-03-05 05:02:57'),
('80a91a42099b6bbed554c68a2eff83f552c5f51c64e8a940e30db6a5637603db52592e1b5468c230', 12, 1, 'authToken', '[]', 0, '2025-03-04 23:09:03', '2025-03-04 23:09:03', '2026-03-05 05:09:03'),
('960f21572e94d2ffdc9b2f83fe5ffd2ba9375b1f507d382c99c27e88fe07c393767de8a3847d3510', 7, 1, 'authToken', '[]', 0, '2025-03-04 23:01:49', '2025-03-04 23:01:49', '2026-03-05 05:01:49'),
('99aba9f3780345fbc8d477e5683bf6bc79cf5487e8c634e2d8007fcc9bbe6759525f867326b75152', 8, 1, 'authToken', '[]', 0, '2025-03-04 23:02:19', '2025-03-04 23:02:19', '2026-03-05 05:02:19'),
('b04e4f152c91db2276edaff485dd0ac226d63be75988ba9090b946a5dad9ce488b8a5ac53ca5862c', 15, 1, 'authToken', '[]', 0, '2025-03-04 23:11:28', '2025-03-04 23:11:28', '2026-03-05 05:11:28'),
('b167f6aa2c0f0beb1c18035a0aee6769f5d3d9eedbc25acc1f17d6d015a21d634cff767cc75f2021', 13, 1, 'authToken', '[]', 0, '2025-03-04 23:09:38', '2025-03-04 23:09:38', '2026-03-05 05:09:38'),
('b6cbad7a5e619a99f3f3074616dcf936988e6cd3f9caf41aa0d419d369643baf4b764157f7a80fd7', 1, 1, 'authToken', '[]', 0, '2025-03-04 04:03:27', '2025-03-04 04:03:27', '2026-03-04 10:03:27'),
('b8ae4a52b5a7755ff5fb57ea788c586090bb4050c4aa3c2d7fcde1747badb32ce5356f3b3d0544dd', 17, 1, 'authToken', '[]', 0, '2025-03-04 23:23:03', '2025-03-04 23:23:03', '2026-03-05 05:23:03'),
('c9309b43f8bc25b57970aca781382c83b90e2d9827b53f89f99e02686d3dd51360501559fa071757', 18, 1, 'authToken', '[]', 0, '2025-03-05 02:36:38', '2025-03-05 02:36:38', '2026-03-05 08:36:38'),
('dadcdeef2831eca6abccda6df88a3f4d23c56dfda1405422203a2ba0eeb91cd51cb1d9e3e5282f66', 2, 1, 'authToken', '[]', 0, '2025-03-04 22:41:32', '2025-03-04 22:41:32', '2026-03-05 04:41:32'),
('e5bae9a31445b7b07c9bb9e8822daef91f06ac312c6318b4738745de9ec35d46228cc6c5441b571e', 10, 1, 'authToken', '[]', 0, '2025-03-04 23:04:28', '2025-03-04 23:04:28', '2026-03-05 05:04:28'),
('ed68b757699d1562b48156f5728313efd86e7f673a717fa18a8e69be301284e57a650224c84be0e6', 11, 1, 'authToken', '[]', 0, '2025-03-04 23:07:58', '2025-03-04 23:07:58', '2026-03-05 05:07:58'),
('f02ba0ad21c16314493ae8584e0eb2601a2edf072cdbf01142b17eabeecbecc1b5f7b263affeb2f4', 16, 1, 'authToken', '[]', 0, '2025-03-04 23:12:30', '2025-03-04 23:12:30', '2026-03-05 05:12:30'),
('f0f8ed309428a2d9ac0da060c5453b2d2caf026a91f0d024f3fd7e0e50bc1f4d5b978eb85527c21c', 14, 1, 'authToken', '[]', 0, '2025-03-04 23:10:09', '2025-03-04 23:10:09', '2026-03-05 05:10:09'),
('fb7b18f9f9f54a2b9f440b728be07d6af13212a84c0a3d592b17b055e56f9a1298c8220ea7038437', 3, 1, 'authToken', '[]', 0, '2025-03-04 22:56:20', '2025-03-04 22:56:21', '2026-03-05 04:56:20');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '73lFQ5oLBL1P6bgAof6juN2TJeZ8DcmMcyl4vlAu', NULL, 'http://localhost', 1, 0, 0, '2025-03-02 22:36:45', '2025-03-02 22:36:45'),
(2, NULL, 'Laravel Password Grant Client', 'wf5rCqBdzzqF827qN5wshDLmAxp3ZSZk5490saJx', 'users', 'http://localhost', 0, 1, 0, '2025-03-02 22:36:45', '2025-03-02 22:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-03-02 22:36:45', '2025-03-02 22:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` mediumtext DEFAULT NULL,
  `cost_per_night` decimal(8,2) NOT NULL DEFAULT 0.00,
  `available_rooms` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `average_rating` decimal(3,2) NOT NULL,
  `property_description` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `user_id`, `name`, `address`, `cost_per_night`, `available_rooms`, `image`, `average_rating`, `property_description`, `is_active`, `created_at`, `updated_at`) VALUES
(13, 22, 'Dhaka Smart Home', 'Dhanmondi, Dhaka, Bangladesh', '5000.00', 30, '174141402562440.jpg', '4.50', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, '2025-03-08 00:07:05', '2025-03-08 00:07:42'),
(14, 22, 'Rose Garden Guest House', '43 Outer Bypass Road, 9100 Khulna, Bangladesh', '3000.00', 23, '174141622698735.jpg', '5.00', 'Rose Garden Guest House offers air-conditioned accommodations in Khulna. This property offers access to a terrace and free private parking.\r\n\r\nEach unit comes with a sofa, a seating area, a flat-screen TV, a well-equipped kitchen with a dining area, and a private bathroom with slippers. A balcony with city views is offered in every unit. At the guest house, the units include bed linen and towels.\r\n\r\nGuests at the guest house can enjoy an Asian breakfast.\r\n\r\nGuests can also relax in the garden.', 1, '2025-03-08 00:43:20', '2025-03-08 00:43:46'),
(15, 22, 'The Westin Dhaka', 'Main Gulshan Avenue, Gulshan Avenue, Dhaka, Gulshan, 1212 Dhaka, Bangladesh', '60000.00', 10, '174141644021025.jpg', '5.00', 'Conveniently placed just 5 mi away from Hazrat Shahjalal International Airport, The Westin Dhaka features a spacious swimming pool and offers free Wi-Fi at all areas. It also houses 5 restaurants.\r\n\r\nLocated just 0.6 mi away from Shopper’s World Mall, the property is also a 5 mi away from the historical Bahadur Shah Park Memorial.  The Ramna Park – known for its serene atmosphere, is 3.1 mi away from the hotel.\r\n\r\nFeaturing floor-to-ceiling windows, air-conditioned rooms are fitted with a cable flat-screen TV, ironing facilities, a seating area and tea/coffee making facilities. Spacious private bathrooms include a bath, shower facilities and free toiletries.\r\n\r\nGuests at Westin Dhaka can enjoy a good workout at the fitness center, or treat themselves at the spa facilities. A 24-hour front desk can assist with travel arrangements and meeting facilities. Airport shuttle services are also available at a surcharge.', 1, '2025-03-08 00:47:20', '2025-03-08 00:47:20'),
(16, 22, 'Test Hotel', 'House Number : 44(new) 744(old) Dhanmondi, 1209 Dhaka, Bangladesh', '8000.00', 20, '174141650135372.jpg', '5.00', 'Featuring floor-to-ceiling windows, air-conditioned rooms are fitted with a cable flat-screen TV, ironing facilities, a seating area and tea/coffee making facilities. Spacious private bathrooms include a bath, shower facilities and free toiletries.\r\n\r\nGuests at Westin Dhaka can enjoy a good workout at the fitness center, or treat themselves at the spa facilities. A 24-hour front desk can assist with travel arrangements and meeting facilities. Airport shuttle services are also available at a surcharge.', 1, '2025-03-08 00:48:21', '2025-03-08 00:51:55'),
(17, 22, 'PARKCITY RESORT', 'Amin Bazar, House Number : 44(new) 744(old) Dhanmondi, 1209 Dhaka, Bangladesh', '9000.00', 7, '174141654181812.jpg', '5.00', 'Located just 0.6 mi away from Shopper’s World Mall, the property is also a 5 mi away from the historical Bahadur Shah Park Memorial.  The Ramna Park – known for its serene atmosphere, is 3.1 mi away from the hotel.\r\n\r\nFeaturing floor-to-ceiling windows, air-conditioned rooms are fitted with a cable flat-screen TV, ironing facilities, a seating area and tea/coffee making facilities. Spacious private bathrooms include a bath, shower facilities and free toiletries.', 1, '2025-03-08 00:49:01', '2025-03-08 00:52:18'),
(18, 22, 'The Ambassador Hotel Dhaka', 'Satmasjid Road 5th Floor, House Number :Dhanmondi, 1209 Dhaka, Bangladesh', '8000.00', 59, '174141663458991.jpg', '4.00', 'Genius discounts at this property are subject to booking dates, stay dates, and other available deals.\r\n\r\nThe Ambassador Hotel Dhaka provides rooms in Dhaka near State University of Bangladesh and Daffodil International University. With free WiFi, this 3-star hotel offers room service and a 24-hour front desk. The property is non-smoking throughout and is located a 2-minute walk from United International University.', 1, '2025-03-08 00:50:34', '2025-03-08 00:52:30'),
(19, 22, 'Grand Vistana', 'Road: 6, House: 11, Sector: 1, Uttara Model Town, Uttara, 1230 Dhaka, Bangladesh', '6700.00', 3, '174141687682237.jpg', '5.00', 'Genius discounts at this property are subject to booking dates, stay dates, and other available deals.\r\n\r\nIdeally set in the Uttara district of Dhaka, Grand Vistana is located a 14-minute walk from Dhaka Airport Train Station, 1.1 miles from Uttara University and 3 miles from IUBAT. This 4-star hotel offers room service and a 24-hour front desk. There\'s a restaurant serving Indian cuisine, and free private parking is available.', 1, '2025-03-08 00:54:36', '2025-03-08 00:54:36'),
(20, 22, 'Hotel Omni Residency Dhaka', '11, Sector: 1, Uttara Model Town, Uttara, 1230 Dhaka, Bangladesh', '8888.00', 6, '174141693334735.jpg', '5.00', 'Armed Forces Medical College is 4.1 miles from Grand Vistana, while Independent University Bangladesh is 4.1 miles from the property. Hazrat Shahjalal International Airport is 1.9 miles away.\r\n\r\nSolo travelers in particular like the excellent location – they rated it 8.9 for a one-person stay.', 1, '2025-03-08 00:55:33', '2025-03-08 00:55:33'),
(21, 22, 'Hotel Elite PalaceOpens in new window', 'House: 11, Sector: 1, Uttara Model Town, Uttara, 1230 Dhaka, Bangladesh', '3000.00', 55, '174141698967058.jpg', '5.00', 'All rooms come with air conditioning, a flat-screen TV with satellite channels, a minibar, a electric tea pot, a bidet, free toiletries and a desk. With a private bathroom equipped with a shower and a hairdryer, rooms at the hotel also feature free WiFi, while some rooms contain a city view. The rooms have a closet.\r\n\r\nA buffet, continental or Full English/Irish breakfast is served at the property.', 1, '2025-03-08 00:56:29', '2025-03-08 00:56:29');

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

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('170xHKVBYYE9Y7P1LzlyrjDjmXyYvSCiRycPeiL3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:136.0) Gecko/20100101 Firefox/136.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVY0bEFTSTQ5UE9qNTRUTnJKeVpJbXl1S1NGb0pvczhqbDROWlBMRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1741158118),
('1JVOQZH2LOXmanDA4MIfMNjy6RH6wjTywUhfQeYA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTmtrb3dGNmg5OWxqVTRyeWJBcEM0S2NwTEcxcExGY2h3UkdVc2RKWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740983177),
('m0AzuzOIKgYSARzpBWNCmLH0IIvERmMJaZJk2WQM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGpXTVpTRzFleXZKdVNoZmM5VkVneUJxZndWd3NWTXNRQ1lyYTJvNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1741163400),
('u77SJLeqV3mex5xFGscaZi6bxeIK64pZ5E9YM9MW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:136.0) Gecko/20100101 Firefox/136.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkZEOHVkR3l4ekNFckVtOU00M3hnMWFoOVZzNzgzNFQwampEbWRHVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1741158116);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `google_id`) VALUES
(18, 'Ariful Sohan', 'arif@gmail.com', NULL, '$2y$12$bN8/JPOIGlkF382PuZR8x.P3.uAPWjN4pvyroQ8kTKPNuYvnACT16', NULL, '2025-03-04 23:31:24', '2025-03-04 23:31:24', NULL),
(19, 'durjoy Paul', 'durjoypaul@gmail.com', NULL, '$2y$12$U2V7AkFt3d38FSTR9J9A1.sDvzpMN1FLhE/TzRK67A9wqkUYwXDKq', NULL, '2025-03-04 23:33:30', '2025-03-04 23:33:30', NULL),
(22, 'Ridoy paul', 'cse.ridoypaul@gmail.com', NULL, '$2y$12$b0e83uLduLDfSrIICgn/WeITSPcc8dPJ50134yHCVZhsHzSv/5MIO', NULL, '2025-03-05 23:14:25', '2025-03-05 23:14:25', NULL);

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
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `properties_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `properties_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
