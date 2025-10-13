-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2025 at 04:11 AM
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
-- Database: `insaat`
--
CREATE DATABASE IF NOT EXISTS `insaat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `insaat`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_kadi` varchar(80) NOT NULL,
  `admin_sifre` varchar(255) NOT NULL,
  `admin_mail` varchar(255) NOT NULL,
  `admin_ad` varchar(80) NOT NULL,
  `admin_soyad` varchar(80) NOT NULL,
  `son_guncelleme` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_kadi`, `admin_sifre`, `admin_mail`, `admin_ad`, `admin_soyad`, `son_guncelleme`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'yönetici@gmail.com', 'Mustafa', 'Biler', '2022-03-23 21:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `ayarlar`
--

CREATE TABLE `ayarlar` (
  `id` int(11) NOT NULL,
  `site_ad` varchar(255) NOT NULL,
  `logo_img` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `kisa_tanitim` text NOT NULL,
  `adres` text NOT NULL,
  `harita_link` longtext NOT NULL,
  `header_renk` varchar(255) NOT NULL,
  `footer_renk` varchar(255) NOT NULL,
  `bg_renk` varchar(255) NOT NULL,
  `acilis_zaman` time NOT NULL,
  `kapanis_zaman` time NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ayarlar`
--

INSERT INTO `ayarlar` (`id`, `site_ad`, `logo_img`, `email`, `tel`, `kisa_tanitim`, `adres`, `harita_link`, `header_renk`, `footer_renk`, `bg_renk`, `acilis_zaman`, `kapanis_zaman`, `tarih`) VALUES
(1, 'İnşaat Kurumsal', 'images/logo.png', 'bilgi@suryapi.com', '0530-348-85-13', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since ', 'Altunizade, Abdullahağa Cd. No.21, 34676 Üsküdar/İstanbul', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d192573.6107330623!2d28.741773813626658!3d41.04794547713867!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cab7db512ad435%3A0x8aa9c257baf9fb95!2sSuryap%C4%B1%20%7C%20Tilia!5e0!3m2!1str!2str!4v1646468930097!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', '#0e2bc5', '#0e2bc5', '#ffffff', '08:30:00', '17:35:00', '2022-04-30 08:00:19');

-- --------------------------------------------------------

--
-- Table structure for table `bolum_1`
--

CREATE TABLE `bolum_1` (
  `id` int(11) NOT NULL,
  `ana_baslik` varchar(255) NOT NULL,
  `alt_baslik` varchar(255) NOT NULL,
  `proje_sayi` varchar(255) NOT NULL,
  `personel_sayi` varchar(255) NOT NULL,
  `görsel` varchar(255) NOT NULL,
  `icerik` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `bolum_1`
--

INSERT INTO `bolum_1` (`id`, `ana_baslik`, `alt_baslik`, `proje_sayi`, `personel_sayi`, `görsel`, `icerik`) VALUES
(1, 'Bina ve İnşaat İnşaat Alanında Öncülük Ediyoruz', 'Yüksek Kaliteli İnşaat Projeleri Sunmaya ve Yenilikçi Tasarıma Adanmış!', '6,150', '2,500', 'images/1 (1).jpg', '<p>Yine de değişimi kucaklayanlar gelişiyor, her zamankinden daha büyük, daha iyi, daha hızlı ve daha güçlü ürünler üretiyorlar. Suçu yönetmeye yardımcı oluyorsunuz; geçmişinizi inşa etmenize ve geleceği hazırlamanıza yardımcı olabiliriz.&nbsp;</p><p>Dünya her zamankinden daha hızlı değişiyor, teknoloji bozuldukça ve yazılımlar değiştikçe Eteon inşaatları tehdit ediliyor. Kalite Kontrol Sistemi %100 Memnuniyet Garantisi Son Derece Profesyonel Kadro Rakipsiz Işçilik Doğru Test Süreçleri Profesyonel Ve Nitelikli</p>');

-- --------------------------------------------------------

--
-- Table structure for table `hakkimizda`
--

CREATE TABLE `hakkimizda` (
  `id` int(11) NOT NULL,
  `baslik` varchar(255) NOT NULL,
  `icerik` longtext NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `hakkimizda`
--

INSERT INTO `hakkimizda` (`id`, `baslik`, `icerik`, `tarih`) VALUES
(1, 'Biz Kimiz ?', '<h2><strong>Biz Kimiz?</strong></h2><p>Faaliyetlerimize başladığımız 1992 yılından bu yana pek çok prestijli projeyi başarıyla hayata geçirerek sektörde öncü bir kimlik kazandık. Sur Yapı olarak, proje aşamasından başlayarak ürün geliştirme, mimarı yapım-üretim dahil yüksek kalitede, anahtar teslim işlerin yanı sıra ofis ve AVM projeleri üretimi, site yönetimleri, sitelerin ikinci ellerinin yönetimi, AVM projelerinin kiralama ve yönetimlerini de yapan bir şirketler grubu olarak sektörde öne çıkıyoruz. Geleceğe yatırım yaparak yaşam için en ideal koşulları oluşturmayı hedefleyerek ürettiğimiz her eserle içinde yaşadığımız topluma kalıcı değerler katmayı amaçlıyoruz. İnşaat sektöründe istikrarlı büyümemizi sürdürürken 2007 yılında başladığımız enerji sektöründe de başarılara imza atıyoruz.</p><h3><strong>Neden Farklıyız?</strong></h3><p>Faaliyet gösterdiğimiz ilk günden bu yana dürüstlük, mükemmeliyetçilik, ekip ruhu, yenilikçilik, sahiplenme, istikrar ve girişimcilik en önemli değerlerimizin arasında yer aldı. Müşterilerimize, iş ortaklarıma ve çalışanlarımıza karşı şeffaflık ilkesini benimsedik. En kısa sürede en ideal bütçe ile yeni teknolojiyi takip ederek en iyi işi başarmayı hedefliyoruz. Kazandığımız itibar, deneyim, bilgi ve birikim ile geleceğe daha güçlü yürüyoruz. Yalnızca proje başlangıcından anahtar teslimine kadar tüm süreçleri takip etmekle kalmıyor, satış sonrası hizmetlerimizle projelerimizden ev sahibi olanların bizi her zaman yanlarında hissetmelerini sağlıyoruz. Müşteri memnuniyetini en önde tutarak, müşterilerimizle en iyi şekilde iletişim kurmanın yollarını günümüz koşulları içerisinde sürekli geliştiriyoruz. Müşterilerimizle olan iletişimize verdiğimiz önemi, teknoloji ile birleştirerek iHome uygulamamız ile gayrimenkul sektörüne yeni bir soluk kazandırıyoruz. Bu anlayış ile projelerimizde marka kimliğimizi ve Sur Yapı güvenirliğini vurgulamak adına tüm gücümüzle çalışıyor, her yeni projemizi ilk günkü heyecanımızla inşa ediyoruz.</p><h3><strong>Misyonumuz</strong></h3><p>Yatırımımız gelecek, amacımız ideal koşullarda yaşayan insan. Misyonumuz uygarlığı imar</p><p>etmek, ürettiğimiz her eserle içinde yaşadığımız topluma kalıcı değerler katmak.</p><h3><strong>Vizyonumuz</strong></h3><p>Kazandığımız itibar, deneyim, bilgi ve birikim idealimize yönelişimize destek oluyor. Biz,</p><p>geçmişten aldığımız güçle geleceğe yürüyoruz. Çünkü bir idealimiz ve ideale ulaşmak için</p><p>yapacak çok şeyimiz var.</p>', '2022-04-02 15:44:22');

-- --------------------------------------------------------

--
-- Table structure for table `hizmetler`
--

CREATE TABLE `hizmetler` (
  `id` int(11) NOT NULL,
  `baslik` varchar(255) NOT NULL,
  `görsel` varchar(255) NOT NULL,
  `icerik` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `hizmetler`
--

INSERT INTO `hizmetler` (`id`, `baslik`, `görsel`, `icerik`) VALUES
(4, 'MÜHENDİSLİK', 'images/engineer.png', 'Reyapı İnşaat Şirketi olarak birden fazla hizmet sunuyoruz. Sektörde uzun süredir yer almanın\r\n                verdiği deneyimler ve profesyonellik neticesinde, sektöre ilişkin tüm ihtiyaçlara cevap\r\n                veren her hizmet için destek olmaya çalışıyoruz.…'),
(5, 'MİMARLIK', 'images/appartment.png', 'Reyapı İnşaat Şirketi olarak birden fazla hizmet sunuyoruz. Sektörde uzun süredir yer almanın\r\n                verdiği deneyimler ve profesyonellik neticesinde, sektöre ilişkin tüm ihtiyaçlara cevap\r\n                veren her hizmet için destek olmaya çalışıyoruz.…'),
(7, 'SERVİSLER', 'images/service-icon.png', 'Reyapı İnşaat Şirketi olarak birden fazla hizmet sunuyoruz. Sektörde uzun süredir yer almanın verdiği deneyimler ve profesyonellik neticesinde, sektöre ilişkin tüm ihtiyaçlara cevap veren her hizmet için destek olmaya çalışıyoruz.…	\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `loglar`
--

CREATE TABLE `loglar` (
  `id` int(11) NOT NULL,
  `ip_adres` varchar(255) NOT NULL,
  `giris_tarih` datetime NOT NULL,
  `cikis_tarih` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `loglar`
--

INSERT INTO `loglar` (`id`, `ip_adres`, `giris_tarih`, `cikis_tarih`) VALUES
(8, '::1', '2022-04-16 16:04:18', '2022-04-16 18:04:33'),
(9, '::1', '2022-04-24 12:04:41', '2022-04-24 18:04:52'),
(10, '::1', '2022-04-30 09:04:51', '2022-04-30 10:04:52'),
(11, '::1', '2022-05-18 07:05:39', '2022-05-18 07:05:03');

-- --------------------------------------------------------

--
-- Table structure for table `menuler`
--

CREATE TABLE `menuler` (
  `id` int(11) NOT NULL,
  `ad` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `durum` tinyint(1) NOT NULL DEFAULT 1,
  `sira` int(11) NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `menuler`
--

INSERT INTO `menuler` (`id`, `ad`, `url`, `durum`, `sira`, `tarih`) VALUES
(18, 'İletişim', './iletisim.php', 1, 2, '2022-05-17 11:50:51'),
(19, 'Hakkımızda', './hakkımızda.php', 1, 1, '2022-05-17 11:50:51'),
(20, 'Anasayfa', './index.php', 1, 0, '2022-05-17 11:50:50');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `baslik` varchar(255) NOT NULL,
  `resim` varchar(255) NOT NULL,
  `aciklama` varchar(250) NOT NULL,
  `durum` tinyint(1) NOT NULL DEFAULT 1,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `baslik`, `resim`, `aciklama`, `durum`, `tarih`) VALUES
(20, 'Proje Yönetimi ve İnşaat Yapıları', 'images/emma-houghton-EixJzIdl4bc-unsplash.jpg', 'Yine de değişimi kucaklayanlar gelişiyor, her zamankinden daha büyük, daha iyi, daha hızlı ve daha güçlü ürünler üretiyorlar. Suçu yönetmeye yardımcı oluyorsunuz; geçmişinizi inşa etmenize ve geleceği hazırlamanıza yardımcı olabiliriz.', 1, '2022-04-23 16:24:36'),
(23, 'Slider 2', 'images/mufid-majnun-cXOmuS-iKPE-unsplash.jpg', 'Açıklama giriniz....', 1, '2022-05-17 11:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `sosyal`
--

CREATE TABLE `sosyal` (
  `id` int(11) NOT NULL,
  `ad` varchar(255) NOT NULL,
  `görsel` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sosyal`
--

INSERT INTO `sosyal` (`id`, `ad`, `görsel`, `link`) VALUES
(7, 'Facebook', 'images/5296499_fb_facebook_facebook logo_icon.png', 'https://www.facebook.com/suryapi/'),
(8, 'Twitter', 'images/5296516_tweet_twitter_twitter logo_icon.png', 'https://twitter.com/suryapi');

-- --------------------------------------------------------

--
-- Table structure for table `yazilar`
--

CREATE TABLE `yazilar` (
  `id` int(11) NOT NULL,
  `baslik` varchar(255) NOT NULL,
  `icerik` longtext NOT NULL,
  `yazi_resim` varchar(255) NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `yazilar`
--

INSERT INTO `yazilar` (`id`, `baslik`, `icerik`, `yazi_resim`, `tarih`) VALUES
(14, 'Test Başlık 1', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book</p>', 'images/4.jpg', '2022-04-16 15:25:18'),
(15, 'Test Başlık 2', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 'images/1 (1).jpg', '2022-04-16 15:25:55'),
(16, 'Test Başlık 3', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 'images/2.jpg', '2022-04-16 15:28:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `ayarlar`
--
ALTER TABLE `ayarlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bolum_1`
--
ALTER TABLE `bolum_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hakkimizda`
--
ALTER TABLE `hakkimizda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hizmetler`
--
ALTER TABLE `hizmetler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loglar`
--
ALTER TABLE `loglar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menuler`
--
ALTER TABLE `menuler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sosyal`
--
ALTER TABLE `sosyal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yazilar`
--
ALTER TABLE `yazilar`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ayarlar`
--
ALTER TABLE `ayarlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bolum_1`
--
ALTER TABLE `bolum_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hakkimizda`
--
ALTER TABLE `hakkimizda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hizmetler`
--
ALTER TABLE `hizmetler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `loglar`
--
ALTER TABLE `loglar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `menuler`
--
ALTER TABLE `menuler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sosyal`
--
ALTER TABLE `sosyal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `yazilar`
--
ALTER TABLE `yazilar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Database: `nabstar`
--
CREATE DATABASE IF NOT EXISTS `nabstar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `nabstar`;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `description`, `is_active`, `created_at`, `last_updated_at`) VALUES
(1, 'sousse', NULL, 1, '2025-08-26 15:22:00', '2025-08-26 15:22:00'),
(2, 'enfidha', NULL, 1, '2025-08-26 15:22:00', '2025-08-26 15:22:00'),
(3, 'sfax', NULL, 1, '2025-08-26 15:52:02', '2025-08-26 15:52:02'),
(4, 'gabes', NULL, 1, '2025-08-26 15:52:02', '2025-08-26 15:52:02'),
(5, 'gbeli', NULL, 1, '2025-08-26 15:52:02', '2025-08-26 15:52:02'),
(6, 'monistir', NULL, 1, '2025-08-26 15:52:02', '2025-08-26 15:52:02'),
(7, 'kairouawn', NULL, 1, '2025-08-26 15:52:02', '2025-08-26 15:52:02'),
(8, 'benzart', NULL, 1, '2025-08-26 15:52:02', '2025-08-26 15:52:02'),
(9, 'tunis', NULL, 1, '2025-08-31 18:43:25', '2025-08-31 18:43:25'),
(10, 'manouba', NULL, 1, '2025-08-31 18:43:25', '2025-08-31 18:43:25'),
(11, 'tataouin', NULL, 1, '2025-08-31 18:43:25', '2025-08-31 18:43:25'),
(12, 'jandouba', NULL, 1, '2025-08-31 18:43:25', '2025-08-31 18:43:25'),
(13, 'kef', NULL, 1, '2025-08-31 18:43:25', '2025-08-31 18:43:25'),
(14, 'seliana', NULL, 1, '2025-08-31 18:43:25', '2025-08-31 18:43:25');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `service_id`, `message`, `seen`, `created_at`) VALUES
(1, 'ahmed boutarfa', 'email@email.com', '1234567', NULL, 'ahmed hiihiihih', 0, '2025-09-19 18:42:37'),
(2, 'ahmed boutarfa', 'email@email.com', '1234567', NULL, 'ahmed', 0, '2025-09-27 02:19:35'),
(3, 'a boutarfa', 'email@email.com', '1234567', NULL, 'aa', 0, '2025-09-27 02:22:09'),
(4, 'a boutarfa', 'email@email.com', '1234567', NULL, 'aa', 0, '2025-09-27 02:22:44'),
(5, 'a boutarfa', 'email@email.com', '1234567', NULL, 'aa', 0, '2025-09-27 02:23:38'),
(6, 'a boutarfa', 'email@email.com', '1234567', NULL, 'z', 0, '2025-09-27 02:25:19'),
(7, 'a boutarfa', 'email@email.com', '1234567', NULL, 'aa', 0, '2025-09-29 16:44:40'),
(8, 'a boutarfa', 'email@email.com', '1234567', NULL, 'ssss', 0, '2025-09-29 16:45:12'),
(9, 'a boutarfa', 'email@email.com', '1234567', NULL, 'ghff', 0, '2025-09-29 16:47:14'),
(10, 'a boutarfa', 'email@email.com', '1234567', NULL, 'jddgy', 0, '2025-09-29 16:47:22'),
(11, 'a boutarfa', 'email@email.com', '1234567', NULL, 'azef', 0, '2025-09-29 16:48:14'),
(12, 'Ahmed  baal', 'boutarfa.ahmed.boutarfa.ahmed@gmail.com', '4686786', NULL, 'cfjydty', 0, '2025-09-29 16:51:30'),
(13, 'a boutarfa', 'email@email.com', '1234567', NULL, 'gbhx', 0, '2025-09-29 16:53:07'),
(14, 'a boutarfa', 'email@email.com', '1234567', NULL, 'v n', 0, '2025-09-29 16:53:13'),
(15, 'Ahmed  Boutarfa', 'hadi.baal@gmail.com', '4686786', NULL, 'Xsqdfse', 0, '2025-09-29 16:54:15'),
(16, 'Ahmed  baal', 'hadi.baal@gmail.com', '4686786', NULL, 'ed', 0, '2025-09-29 17:02:08'),
(17, 'Ahmed  baal', 'hadi.baal@gmail.com', '4686786', NULL, 'tyju', 0, '2025-09-29 17:08:59'),
(18, 'Ahmed  baal', 'boutarfa.ahmed.boutarfa.ahmed@gmail.com', '4686786', NULL, 'ghgdd', 0, '2025-09-29 17:11:42'),
(19, 'a boutarfa', 'email@email.com', '1234567', NULL, 'fdh', 0, '2025-09-29 17:20:35'),
(20, 'xhb dgxb', 'email@email.com', '1234567', NULL, 'ezfq', 0, '2025-09-30 02:08:45');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `service_id`, `order`, `created_at`, `last_updated_at`) VALUES
(1, 'ahmed?', 'azertyuiopqsdfghjklmwxcvbn,;', NULL, 0, '2025-09-18 12:56:10', '2025-09-18 12:56:10'),
(2, 'boutarfa?', 'qksfuhbaher qbsfihbdiufbdz ibqifiqfm pbqidbidbf pibqefbqifbq pbqiyfbiuqef pugruy piugryi lzgfrypiau', NULL, 0, '2025-09-18 12:56:10', '2025-09-18 12:56:10'),
(3, 'qdkfgeiuFGBIUMAEDNAI hfiubzeide IBFIEBFI?', '', NULL, 0, '2025-09-18 12:57:20', '2025-09-18 12:57:20'),
(5, 'hfoqshf sihfqzm mqksfmi rooitk ksdhguf kushqdiu?', 'zefiu iqugefd iQUGD qgef ygsidf ksuhf kusghfib skfhusidqoh khefuzehronfd kheriubnoifhzoef lsehfuqbnroiq kqgsiuhq', NULL, 0, '2025-09-18 12:57:20', '2025-09-18 12:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `alt` text DEFAULT NULL,
  `uploaded_by` varchar(100) DEFAULT NULL,
  `display_order` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `service_id`, `filename`, `title`, `caption`, `alt`, `uploaded_by`, `display_order`, `created_at`) VALUES
(1, NULL, 'assets\\images\\bg-pc.jpg', 'first', NULL, NULL, NULL, 0, '2025-09-25 00:35:48'),
(2, NULL, 'assets\\images\\bg-pc.jpg', 'first', NULL, NULL, NULL, 0, '2025-09-25 00:35:48'),
(3, NULL, 'assets\\images\\bg-pc.jpg', 'first', NULL, NULL, NULL, 0, '2025-09-25 00:36:38'),
(4, NULL, 'assets\\images\\bg-pc.jpg', 'first', NULL, NULL, NULL, 0, '2025-09-25 00:36:38'),
(5, NULL, 'assets\\images\\bg-pc.jpg', 'first', NULL, NULL, NULL, 0, '2025-09-25 00:36:38'),
(6, NULL, 'assets\\images\\bg-pc.jpg', 'first', NULL, NULL, NULL, 0, '2025-09-25 00:36:38'),
(7, NULL, 'assets\\images\\bg-pc.jpg', 'first', NULL, NULL, NULL, 0, '2025-09-25 00:36:38');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `slug`, `description`, `icon`, `is_active`, `created_at`, `last_updated_at`) VALUES
(3, 'New Property Builds', NULL, 'Building new homes and commercial properties from plans to final completion', 'fa-solid fa-house', 1, '2025-08-24 16:24:44', '2025-08-24 16:32:02'),
(4, 'Home Extensions', NULL, 'Single or multi-storey extensions to expand your living space and property value', 'fa-solid fa-object-group', 1, '2025-08-24 16:24:44', '2025-08-24 16:52:11'),
(5, 'Loft Conversions', NULL, 'Transforming your unused loft into a bright, functional living area or extra bedroom', 'fa-solid fa-layer-group', 1, '2025-08-24 16:24:44', '2025-09-07 15:22:42'),
(6, 'Renovations & Refurbishments', NULL, 'Improving properties with comprehensive renovation and refurbishment services', 'fa-solid fa-arrows-rotate', 1, '2025-08-25 14:08:40', '2025-08-25 14:08:40'),
(7, 'Kitchen Design & Fitting', NULL, 'Supplying and fitting bespoke kitchens, from contemporary designs to classic styles', 'fa-solid fa-pen', 1, '2025-08-25 14:08:40', '2025-08-25 14:08:40'),
(8, 'Bathroom Design & Fitting', NULL, 'Complete bathroom installations, including wet rooms, suites, tiling, and plumbing', 'fa-solid fa-sink', 1, '2025-08-25 14:08:40', '2025-08-25 14:08:40'),
(9, 'Brickwork & Masonry', NULL, 'Quality bricklaying, blockwork, stonework, and repointing for all construction projects', 'fa-solid fa-check', 1, '2025-08-25 14:08:40', '2025-08-25 14:08:40'),
(10, '\r\nPlastering & Rendering', NULL, 'Internal plastering and external rendering for smooth, durable, and professional finishes.', 'fa-solid fa-pen-to-square', 1, '2025-08-25 14:13:53', '2025-08-25 14:13:53');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `client_name` varchar(200) NOT NULL,
  `company` varchar(200) DEFAULT NULL,
  `content` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `rating` tinyint(3) UNSIGNED DEFAULT 5,
  `approved` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `client_name`, `company`, `content`, `photo`, `rating`, `approved`, `created_at`, `last_updated_at`) VALUES
(1, '3years', '3years', 'Transforming your unused loft into a bright, functional living area or extra bedroom', 'benzart', 5, 1, '2025-09-15 14:27:44', '2025-09-15 14:27:44'),
(2, '3years', 'C:\\xampp\\htdocs\\Nabstar Construction\\assets\\images\\bg-pc', 'Transforming your unused loft into a bright, functional living area or extra bedroom', 'benzart', 5, 1, '2025-09-15 14:27:44', '2025-09-15 14:27:44'),
(5, 'ahmed', 'azure', 'Transforming your unused loft into a bright, functional living area or extra bedroom', '', 5, 1, '2025-09-15 13:54:25', '2025-09-15 13:54:25'),
(6, '3years', 'C:\\xampp\\htdocs\\Nabstar Construction\\assets\\images\\bg-pc', 'Transforming your unused loft into a bright, functional living area or extra bedroom', 'benzart', 5, 1, '2025-09-15 13:54:25', '2025-09-15 14:12:27'),
(10, 'azure', 'azure', 'Transforming your unused loft into a bright, functional living area or extra bedroom', 'benzart', 5, 1, '2025-09-17 15:11:50', '2025-09-17 15:12:29'),
(11, 'azure', 'azure', 'Transforming your unused loft into a bright, functional living area or extra bedroom', 'benzart', 5, 1, '2025-09-17 15:11:50', '2025-09-17 15:12:37'),
(12, 'azure', 'azure', 'Transforming your unused loft into a bright, functional living area or extra bedroom', 'benzart', 5, 1, '2025-09-17 15:12:02', '2025-09-17 15:12:45'),
(13, 'azure', 'azure', 'Transforming your unused loft into a bright, functional living area or extra bedroom', 'benzart', 5, 1, '2025-09-17 15:12:02', '2025-09-17 15:12:52'),
(14, 'azure', 'azure', 'Transforming your unused loft into a bright, functional living area or extra bedroom', 'benzart', 5, 1, '2025-09-17 15:13:46', '2025-09-17 15:13:46'),
(15, 'azure', 'azure', 'Transforming your unused loft into a bright, functional living area or extra bedroom', 'benzart', 5, 1, '2025-09-17 15:13:46', '2025-09-17 15:13:46');

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

CREATE TABLE `works` (
  `title` varchar(100) NOT NULL,
  `bio` varchar(400) NOT NULL,
  `location` varchar(100) NOT NULL,
  `total-area` varchar(100) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `date-beg` date NOT NULL,
  `date-fin` date NOT NULL,
  `image` varchar(600) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`title`, `bio`, `location`, `total-area`, `duration`, `date-beg`, `date-fin`, `image`) VALUES
('first', 'first bigg project in this web site', 'enfidha', '1500m', '3years', '2023-09-17', '2023-09-17', 'assets\\images\\bg-pc.jpg'),
('qegiyegbi', 'kjidhiubdai izuefbiuzbeduo izeubfiuzebd iuzehdiuzbedo kzbfdiuze iuehbdiuz iuzehbdiua iuehbdiu iuehbdouized zkfduzehfidze fiuzezfbduiozef iuzbfhoapoze ieutr fziufhzev iuqhedpzafnc z giz\"taeio coahfo', 'adzefzv ev', '1400', '3y', '0000-00-00', '0000-00-00', 'assets\\images\\bg-pc.jpg'),
('qegiysegbi', 'kjidhiubdai izuefbiuzbeduo izeubfiuzebd iuzehdiuzbedo kzbfdiuze iuehbdiuz iuzehbdiua iuehbdiu iuehbdouized zkfduzehfidze fiuzezfbduiozef iuzbfhoapoze ieutr fziufhzev iuqhedpzafnc z giz\"taeio coahfo', 'adzefzv ev', '1400', '3y', '0000-00-00', '0000-00-00', 'assets\\images\\bg-pc.jpg'),
('zbfiubdfj', 'zbfizbhfouz kzbhfiuzbfuiz kbrifzbuofbz zbefiuzbefouzbe kzbefiuzburf ozfuoibzeuof zboubfoubzef zbiufhzuirbnz iuzhfuhzof ouzhefobnhezorb izubfiubfz iuzbeiufbz izebfhuizerhbuzoenhioehfnzoie', 'zhegfbdize izuehf', '1400', '4y 3m', '0000-00-00', '0000-00-00', 'assets\\images\\bg-pc.jpg'),
('zbfiubefj', 'zbfizbhfouz kzbhfiuzbfuiz kbrifzbuofbz zbefiuzbefouzbe kzbefiuzburf ozfuoibzeuof zboubfoubzef zbiufhzuirbnz iuzhfuhzof ouzhefobnhezorb izubfiubfz iuzbeiufbz izebfhuizerhbuzoenhioehfnzoie', 'zhegfbdize izuehf', '1400', '4y 3m', '0000-00-00', '0000-00-00', 'assets\\images\\bg-pc.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `email` (`email`),
  ADD KEY `phone` (`phone`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `gallery_ibfk_2` FOREIGN KEY (`title`) REFERENCES `works` (`title`);
--
-- Database: `nabstar_construction_db`
--
CREATE DATABASE IF NOT EXISTS `nabstar_construction_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `nabstar_construction_db`;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `ID_CONTACT` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PHONE` int(20) DEFAULT NULL,
  `ID_SERVICE` int(11) DEFAULT NULL,
  `MESSAGE` text NOT NULL,
  `SEEN` int(11) DEFAULT 0,
  `CREATED_AT` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID_USER` int(11) NOT NULL,
  `FIRST_NAME` varchar(20) NOT NULL,
  `LAST_NAME` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ID_CONTACT`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_USER`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `ID_CONTACT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"nabstar_construction_db\",\"table\":\"contact\"},{\"db\":\"nabstar\",\"table\":\"contacts\"},{\"db\":\"nabstar_construction_db\",\"table\":\"CONTACT\"},{\"db\":\"nabstar_construction_db\",\"table\":\"user\"},{\"db\":\"nabstar_construction_db\",\"table\":\"USER\"},{\"db\":\"nabstar\",\"table\":\"works\"},{\"db\":\"nabstar\",\"table\":\"gallery\"},{\"db\":\"nabstar\",\"table\":\"faqs\"},{\"db\":\"nabstar\",\"table\":\"testimonials\"},{\"db\":\"nabstar\",\"table\":\"areas\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('nabstar', 'gallery', 'filename');

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'nabstar', 'services', '{\"sorted_col\":\"`name` ASC\"}', '2025-09-07 15:22:42');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-09-30 02:10:25', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":0}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
