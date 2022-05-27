-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 27 May 2021, 00:10:55
-- Sunucu sürümü: 10.4.14-MariaDB
-- PHP Sürümü: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `blogscripti`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_kadi` varchar(500) NOT NULL,
  `admin_sifre` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_kadi`, `admin_sifre`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ayarlar`
--

CREATE TABLE `ayarlar` (
  `site_id` int(11) NOT NULL,
  `site_url` varchar(500) NOT NULL,
  `site_title` varchar(500) NOT NULL,
  `site_desc` varchar(500) NOT NULL,
  `site_keyw` varchar(500) NOT NULL,
  `site_logo` varchar(500) NOT NULL,
  `site_favicon` varchar(500) NOT NULL,
  `site_facebook` varchar(500) NOT NULL,
  `site_google` varchar(500) NOT NULL,
  `site_instagram` varchar(500) NOT NULL,
  `site_youtube` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Tablo döküm verisi `ayarlar`
--

INSERT INTO `ayarlar` (`site_id`, `site_url`, `site_title`, `site_desc`, `site_keyw`, `site_logo`, `site_favicon`, `site_facebook`, `site_google`, `site_instagram`, `site_youtube`) VALUES
(1, 'http://localhost/blogscripti/', 'Mitolojiler.com ', 'Mitolojiler Hakkında Her Şey...', 'Mitoloji, iskandinav, mit, zeus,odin, thor, apollo, algos', 'site1.png', 'favicon.ico', 'https://www.facebook.com/dursun1515/', 'http://www.google.com', 'https://www.instagram.com/dogukandursun_/', 'http://www.youtube.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hakkimizda`
--

CREATE TABLE `hakkimizda` (
  `hakkimizda_id` int(11) NOT NULL,
  `hakkimizda_fotograf` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `hakkimizda_aciklama` text COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `iletisim`
--

CREATE TABLE `iletisim` (
  `id` int(11) NOT NULL,
  `iletisim_icerik` varchar(5000) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `iletisim`
--

INSERT INTO `iletisim` (`id`, `iletisim_icerik`) VALUES
(1, 'İLETİŞİM\r\n\r\n\r\nBana site üzerinden herhangi bir konuya yorum yaparak veya aşağıdaki iletişim adreslerimden ulaşabilirsiniz.\r\n\r\n\r\nMail adresim : mitolojiler@gmail.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `kategori_id` int(11) NOT NULL,
  `kategori_baslik` varchar(500) NOT NULL,
  `kategori_tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `kategori_url` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`kategori_id`, `kategori_baslik`, `kategori_tarih`, `kategori_url`) VALUES
(1, 'Yunan Mitolojisi', '2021-04-21 14:46:13', 'yunan-mitolojisi'),
(5, 'Japon Mitolojisi', '2021-04-29 22:47:06', 'japon-mitolojisi'),
(4, 'Mısır Mitolojisi', '2021-04-25 11:19:24', 'misir-mitolojisi'),
(3, 'Türk Mİtolojisi', '2021-04-29 22:47:53', 'turk-mitolojisi'),
(2, 'İskandinav Mitolojisi', '2021-04-21 14:46:13', 'iskandinav-mitolojisi'),
(19, 'Roma Mitolojisi', '2021-05-03 21:19:37', 'roma-mitolojisi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mesajlar`
--

CREATE TABLE `mesajlar` (
  `mesaj_id` int(11) NOT NULL,
  `mesaj_gonderenisim` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `mesaj_gonderenmail` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `mesaj_konu` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `mesaj_aciklama` text COLLATE utf8_turkish_ci NOT NULL,
  `mesaj_tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `mesaj_okunma` varchar(500) COLLATE utf8_turkish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `mesajlar`
--

INSERT INTO `mesajlar` (`mesaj_id`, `mesaj_gonderenisim`, `mesaj_gonderenmail`, `mesaj_konu`, `mesaj_aciklama`, `mesaj_tarih`, `mesaj_okunma`) VALUES
(1, 'Doğukan', 'dod63y@gmail.com', 'öneri', 'sitenize Hitit mitolojisi ekler misiniz ?', '2021-05-10 23:14:52', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sponsorlar`
--

CREATE TABLE `sponsorlar` (
  `sponsor_id` int(11) NOT NULL,
  `sponsor_resim` varchar(500) DEFAULT NULL,
  `sponsor_adi` varchar(255) DEFAULT NULL,
  `sponsor_link` varchar(255) DEFAULT NULL,
  `sponsor_tarih` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Tablo döküm verisi `sponsorlar`
--

INSERT INTO `sponsorlar` (`sponsor_id`, `sponsor_resim`, `sponsor_adi`, `sponsor_link`, `sponsor_tarih`) VALUES
(1, 'dogubank.jpg', 'Doğubank İletişim', 'https://www.instagram.com/dogubank_iletisim/?hl=tr', '2021-04-23 20:53:35'),
(2, 'sponsor2.jpg', 'sponsor 2', 'https://www.sponsor2.com', '2018-04-28 04:10:07'),
(3, 'sponsor3.jpg', 'sponsor 3', 'https://www.sponsor3.com', '2018-04-28 04:10:07'),
(6, '46468560760_site.png', NULL, 'yunanmitolojisi.html', '2021-05-05 21:26:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazilar`
--

CREATE TABLE `yazilar` (
  `yazi_id` int(11) NOT NULL,
  `yazi_foto` varchar(255) DEFAULT NULL,
  `yazi_baslik` varchar(500) NOT NULL,
  `yazi_icerik` text NOT NULL,
  `yazi_tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `yazi_kategori_id` int(11) NOT NULL,
  `yazi_ekleyen` varchar(255) NOT NULL,
  `yazi_okunma` varchar(255) NOT NULL DEFAULT '0',
  `yazi_durum` varchar(255) DEFAULT '0',
  `yazi_seolink` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Tablo döküm verisi `yazilar`
--

INSERT INTO `yazilar` (`yazi_id`, `yazi_foto`, `yazi_baslik`, `yazi_icerik`, `yazi_tarih`, `yazi_kategori_id`, `yazi_ekleyen`, `yazi_okunma`, `yazi_durum`, `yazi_seolink`) VALUES
(1, '69594569660_299338660ae_10205369726_zeus2.jpg', 'Zeus', 'Zeus&nbsp;(Eski Yunanca:&nbsp;Grek&ccedil;e:&nbsp;&Zeta;&epsilon;ύ&sigmaf;,&nbsp;Ze&uacute;s;&nbsp;Modern Yunanca: &Delta;ί&alpha;&sigmaf;,&nbsp;D&iacute;as),&nbsp;&quot;Tanrıların ve İnsanların Babası&quot;&nbsp;Yunan mitolojisinde&nbsp;en g&uuml;&ccedil;l&uuml; ve &ouml;nemli tanrıdır.&nbsp;Roma&#39;da&nbsp;J&uuml;piter&nbsp;olarak da bilinir. G&ouml;klerin, şimşeklerin ve g&ouml;k g&uuml;r&uuml;lt&uuml;lerinin tanrısıdır. &Ccedil;oğu zaman elinde bir şimşek ile resmedilmiştir. Bereket ile &ouml;zdeşleşmiştir, yağmur ondan beklenir.&nbsp;Titan&nbsp;Kronos&#39;un ve eşi&nbsp;Rhea&#39;nın en k&uuml;&ccedil;&uuml;k &ccedil;ocuğu ve oğludur. Tanrı&ccedil;a&nbsp;Hera&#39;nın kocasıdır. Simgesi şimşeğin yanında boğa, kartal ve&nbsp;meşe&nbsp;ağacıdır. Aynı zamanda tanrıların kralı olduğu i&ccedil;in taht ve asa ile de sık sık betimlenir. Ayrıca&nbsp;Athena&#39;nın ona hediyesi olan&nbsp;Aegis&#39;in de taşıyıcısıdır. Zeus&#39;un en eski k&uuml;lt ve bilicilik merkezi&nbsp;Yunanistan&#39;daki&nbsp;Dodona&nbsp;antik şehirdir. Habercisi oğlu&nbsp;Hermes&#39;tir. Gigantlar arasındaki karşıtı Kral&nbsp;Porphyrion&#39;dur.\r\n\r\nEn bilinen &ouml;zelliklerinden biri &ccedil;apkın oluşudur. İstediği her şeyin şekline girebilen Zeus&#39;un&nbsp;Leda&nbsp;i&ccedil;in kuğu,&nbsp;Antiope&nbsp;i&ccedil;in satir,&nbsp;Aegina&nbsp;i&ccedil;in ateş,&nbsp;Danae&nbsp;i&ccedil;in altın yağmuru,&nbsp;Alkmene&nbsp;i&ccedil;in kocasının kılığına,&nbsp;Hera&nbsp;i&ccedil;in guguk kuşu,&nbsp;Callisto&nbsp;i&ccedil;in Bakire Tanrı&ccedil;a&nbsp;Artemis&#39;in kılığına,&nbsp;Mnemosyne&nbsp;i&ccedil;in yakışıklı bir &ccedil;oban,&nbsp;İo&nbsp;i&ccedil;in bulut,&nbsp;Demeter&nbsp;i&ccedil;in geyik,&nbsp;Europa&nbsp;i&ccedil;in boğa oluşu kudretine en iyi &ouml;rnektir. &Ouml;l&uuml;ml&uuml; &ouml;l&uuml;ms&uuml;z herkese aşık olabilen tanrıların tanrısı Zeus &ccedil;apkınlığı y&uuml;z&uuml;nden eşi Hera tarafından s&uuml;rekli takip ettirilmektedir. Tanrı Zeus&#39;un tahtı i&ccedil;in yaptıkları şeylerin başlıcaları şunlardır: Eşi&nbsp;Metis&#39;i yutması,&nbsp;Prometheus&#39;u zincirlemesi,&nbsp;Thetis&#39;i bir &ouml;l&uuml;ml&uuml; ile evlendirmesi.\r\n\r\n&nbsp;\r\n\r\nBabası olan Titan Tanrı Kronos&#39;u diğer&nbsp;Olimpos&nbsp;tanrılarının yardımıyla yer Tartarusa hapsetti. Sonra&nbsp;Atlantisliler&nbsp;Tanrı Zeus&#39;un takip&ccedil;ilerini (yani Yunanları) ellerinde olmadan (&ccedil;&uuml;nk&uuml; onlara tuzak kurulmuştu) yok ederek Olimposlu tanrıların g&uuml;c&uuml;n&uuml; azaltıp Kronos ve yanındaki diğer Titanları serbest bıraktılar.\r\n\r\nZeus ayrıca&nbsp;İksion,&nbsp;Salmoneus, Arkadya Kralı&nbsp;Lykaon&nbsp;ve ateşi &ccedil;alan&nbsp;Prometheus&#39;u k&uuml;stahlıkları nedeniyle cezalandırmıştır.\r\n', '2021-05-26 18:47:35', 1, '', '1', '0', 'zeus'),
(2, '12432208886_13216957660_odin.jpg', 'Odin', 'Odin&nbsp;(Eski Nor&ccedil;a:&nbsp;&Oacute;&eth;inn),&nbsp;Cermen mitolojisinde yer alan &ouml;nemli bir&nbsp;tanrı. Odin ile ilgili g&uuml;n&uuml;m&uuml;ze ulaşan &ccedil;oğu bilginin kaynağı olan&nbsp;İskandinav mitolojisi; Odin&#39;i bilgelik, şifa, &ouml;l&uuml;m, kraliyet, darağacı, bilgi, savaş, zafer, b&uuml;y&uuml;c&uuml;l&uuml;k, şiir, &ccedil;ılgınlık ve runik alfabeyle ilişkilendirir. İskandinav mitolojisine g&ouml;re tanrı&ccedil;a&nbsp;Frigg&#39;in kocasıdır. Genellikle en y&uuml;ce&nbsp;Cermen&nbsp;tanrısı olarak kabul edilir. Eski İngilizce ve Eski Saksoncada&nbsp;Wōden, Eski Felemenk&ccedil;ede&nbsp;Wuodan&nbsp;ve Eski Y&uuml;ksek Almancada&nbsp;Wuotan&nbsp;adıyla bilinir. T&uuml;m bu adların k&ouml;keni ise Ana Almanca *Wōđanaz&#39;dır. İngilizce dahil bir&ccedil;ok Cermen dilinde &ccedil;arşamba g&uuml;n&uuml; (İngilizce: Wednesday), bu tanrının adını taşır.\r\n\r\nAdı &quot;tahrik&quot;, &quot;hiddet&quot; ve &quot;şiir&quot; anlamına gelen &oacute;&eth;r&#39;dan gelmektedir. İskandinav&nbsp;panteonundaki&nbsp;diğer bir&ccedil;ok ilahi varlık gibi karmaşık bir rol &uuml;stlenir; savaş ve bilgelik tanrısıdır. Ayrıca b&uuml;y&uuml;, zafer ve av tanrısı olarak bilinir.&nbsp;G&uuml;neş&nbsp;ve&nbsp;Kelt ha&ccedil;ı&nbsp;ile sembolize edilir.\r\n\r\nOdin: (Alfadir,&nbsp;Allfather&nbsp;(Herkesin Babası)) Tanrıların babası;&nbsp;Asgard&#39;daki salonu Valaskjalf&#39;da (Katledilmişlerin Korunağı) tahtı Hlidskjalf bulunur. Bu tahttan dokuz diyarda olan t&uuml;m olayları g&ouml;zler. Ayrıca yery&uuml;z&uuml;ne ve g&ouml;ky&uuml;z&uuml;ne h&acirc;kimdir, gerektiğinde kartala d&ouml;n&uuml;şebilir. Odin&#39;in sadece g&uuml;neş gibi parlayan tek bir g&ouml;z&uuml; vardır. Diğer g&ouml;z&uuml;n&uuml; Bilgelik Kuyusundan i&ccedil;ebilmek i&ccedil;in feda etmiş ve sonsuz bilgi elde etmiştir. Habercileri&nbsp;Valkyrie&rsquo;ler &ouml;l&uuml; savaş&ccedil;ıların ruhlarını&nbsp;Valhalla&rsquo;ya taşırlar. İngilizcedeki&nbsp;Wednesday&nbsp;(&Ccedil;arşamba) g&uuml;n&uuml;&nbsp;Woden&#39;s Day&nbsp;(Odin&#39;in G&uuml;n&uuml;) den gelmektedir.&nbsp;Tacitus&nbsp;gibi Romalı yazarlar tarafından&nbsp;Merk&uuml;r&#39;le&nbsp;&ouml;zdeşleştirilmiştir.&nbsp;Avrasya Şamanizm&#39;iyle&nbsp;bağlantılı olduğu d&uuml;ş&uuml;n&uuml;lmektedir. Ger&ccedil;ekten de &ccedil;ok belirgin&nbsp;şaman&nbsp;&ouml;zellikleri g&ouml;stermektedir.\r\n\r\nSimgeleri, hi&ccedil; hedefini ıskalamayan mızrağı Gungnir, her dokuzuncu gecede yeni sekiz y&uuml;z&uuml;ğ&uuml; ortaya &ccedil;ıkran y&uuml;z&uuml;ğ&uuml; Draupnir ve sekiz ayaklı atı&nbsp;Sleipnir&#39;dir. Sleipnir suda ve karada gidebilir ayrıca iki kuzgunu vardır. Bu kuzgunlar ona d&uuml;nyadan haberler getirir. Kuzgunlardan birinin adı Huginn (d&uuml;ş&uuml;nce) ve diğerinin adı Muninn&#39;dir (hafıza). Ayrıca yanında Freki ve Geri adında iki tane kurt eşlik eder.\r\n\r\nKuzey mitolojisinin&nbsp;Zeusu&nbsp;denilebilcek tanrı. Eşi&nbsp;Frigg&#39;den olan &ccedil;ocukları,&nbsp;Balder,&nbsp;Hod&nbsp;Bragi&nbsp;ve&nbsp;Hermod, tanrı&ccedil;a&nbsp;Jord&#39;dan olan &ccedil;ocuğu&nbsp;Thor&nbsp;ve dev&nbsp;Grid&#39;den olan &ccedil;ocuğu da&nbsp;Vidar&#39;dır.\r\n\r\nBu da ona yeni bir unvan kazandırır, bu Tanrıların Tanrısı&#39;dır. Elindeki mızrak ise yine 9 ya da 7 g&uuml;n asılı kaldığı kuzey mitolojisin ger&ccedil;ekleştiği yerin yaşam ağacında&nbsp;runeleri&nbsp;&ouml;ğrenmesi sonucu kurtulduğunda kopardığı bir daldan yapılmıştır.&nbsp;Yeşil Adam&nbsp;fig&uuml;r&uuml;yle bağlantılı g&ouml;r&uuml;nmektedir.&nbsp;Hızır&nbsp;ve&nbsp;Z&uuml;lkarneyn&nbsp;olduğu da &ouml;ne s&uuml;r&uuml;lm&uuml;şt&uuml;r.\r\n\r\nRagnarok g&uuml;n&uuml; geldiğinde, Fenrir Odin&#39;i &ouml;ld&uuml;recektir.\r\n\r\n&nbsp;\r\n', '2021-05-26 18:48:51', 2, '', '1', '0', 'odin'),
(3, '90723840160_13299535736_Hephaistos.jpg', 'Hephaistos', 'Hephaistos,&nbsp;Yunan mitolojisinde&nbsp;Zeus&nbsp;ile&nbsp;Hera&#39;nın oğlu, ya da&nbsp;Hera&#39;nın yalnız başına doğurduğu oğlu. Tanrılar ve kahramanlar i&ccedil;in&nbsp;demircilik&nbsp;zanaatıyla uğraşarak&nbsp;silahlar&nbsp;ve zırhlar &uuml;reten&nbsp;ateşler&nbsp;tanrısı. Aşk ve g&uuml;zellik tanrı&ccedil;ası&nbsp;Afrodit&#39;in eşidir.\r\n\r\nHephaistos, zanaatkarlar tarafından&nbsp;Athena&nbsp;ile birlikte mesleklerin piri ve koruyucusu olarak kabul edilen bir ateş tanrısıdır. Tarımı, uygarlığı ve şehir hayatını korur. Anadolu k&ouml;kenli tanrılardan biri olan Hephaistos, &ouml;zellikle s&ouml;nm&uuml;ş bir yanardağ olarak saygı g&ouml;rm&uuml;ş, sonraları yanardağların i&ccedil;inde &ccedil;alıştığına inanılmaya başlamıştır. Gigantlar arasındaki karşıtı&nbsp;Mimas&#39;dır\r\n\r\nZeus&#39;la&nbsp;Hera&#39;nın oğlu olarak bilinmesine rağmen,&nbsp;Zeus&#39;un eşi&nbsp;Metis, hamileyken kendisinden daha g&uuml;&ccedil;l&uuml; bir &ccedil;ocuk doğurmasından korkup onu yutması ve bunun sonucunda da&nbsp;Athena&#39;yı başından doğurmasına karşılık Hera&#39;nın da Hephaistos&#39;u tek başına doğurduğu da s&ouml;ylenmektedir.\r\n\r\nHephaistos, tanrıların en &ccedil;irkinidir. İki ayağı da topaldır.&nbsp;Homeros&#39;un&nbsp;İlyada&#39;sında bunun sebebi iki şekilde a&ccedil;ıklanır. Birinciye g&ouml;re babası Zeus, Hera ile kavga ederken Hephaistos annesinin tarafını tutmuş, buna kızan Zeus oğlunu&nbsp;Lemnos&nbsp;(Limni) adasına fırlatmış ve Hephaistos bu y&uuml;zden sakat kalmıştır. İkinci efsaneye g&ouml;re Hephaistos sakat doğmuş, bu durumdan utanan annesi onu&nbsp;Olympos&#39;tan aşağı fırlatmış ve Hephaistos&#39;u&nbsp;nereidler&nbsp;ve&nbsp;Thetis&nbsp;b&uuml;y&uuml;tm&uuml;şt&uuml;r. Hephaistos&#39;la Hera hi&ccedil;bir zaman birbirlerini sevmemişlerdir. Yunan mitolojisinde ise Hera, Hephaistos&#39;u kendi başına oluşturmuş ve doğurmuştur. Fakat bebeği ayaklarını topal kendisinin &ccedil;irkin olduğunu g&ouml;r&uuml;nce ve b&uuml;t&uuml;n Tanrılar onla alay edince, Hephaistos&#39;u&nbsp;Olimpos Dağı&#39;ndan atmıştır.\r\n\r\nTanrıların arasında en &ccedil;irkin olan olmasına rağmen, hem onlar hem de insanlar arasında en sevilen tanrıdır. Olimpos&#39;taki g&ouml;rkemli saraylar onun elinden &ccedil;ıkmıştır. Tanrılar ve kahramanlar i&ccedil;in en g&uuml;zel silahları yapmıştır.&nbsp;Eros&#39;un okları ve yayları,&nbsp;Afrodit&#39;in &uuml;nl&uuml; g&ouml;z kamaştırıcı kemeri,&nbsp;Dionysos&#39;un eşi&nbsp;Ariadne&#39;nin tacı,&nbsp;Truva&nbsp;Kralı&nbsp;Laomedon&#39;un b&uuml;y&uuml;l&uuml; &uuml;z&uuml;m bağı, Ares ve Afrodit&#39;in kızı&nbsp;yasak aşkından olan&nbsp;Harmonia&#39;ya d&uuml;ğ&uuml;n hediyesi olarak yaptığı lanetli gerdanlık, Zeus&#39;un emriyle insanları cezalandırmak i&ccedil;in g&ouml;nderilen ilk kadın&nbsp;Pandora&nbsp;da onun eseridir. Hephaistos ayrıca bir&ccedil;ok&nbsp;otomat&nbsp;da yapmıştır.&nbsp;Girit adası&#39;nı&nbsp;koruyan bronz dev&nbsp;Talos, kendisine yardımcı olmaları i&ccedil;in &uuml;rettiği, hareket edebilen, g&uuml;zel birer kadın g&ouml;r&uuml;n&uuml;m&uuml;ndeki bir &ccedil;ift heykel,&nbsp;Prometheus&#39;a işkence etmeleri i&ccedil;in bronzdan yapılmış Kafkas Kartalı,&nbsp;Apollon&nbsp;tapınağı i&ccedil;in altından yapılmış, şarkı s&ouml;yleyen sihirli kız korosu bunlardan birka&ccedil;ıdır. Hephaistos, İlyada&#39;da&nbsp;Kharis&nbsp;(zarafet, neşe ve sevinci temsil eden tanrı&ccedil;alardan biri) ile evlidir.\r\n\r\n&nbsp;\r\n\r\nHephaistos hakkında anlatılan bir mitte de Hephaistos&#39;un Olimpos&#39;a &ccedil;ıkma hik&acirc;yesi ş&ouml;yle anlatılır; Hephaistos annesi i&ccedil;in muhteşem bir taht yaptırmıştı. O aralar Hera Hephaistos&#39;un hayatta olduğunu bilmiyordu. Hephaistos ona bu tahtı verirken saygılarını sunarak &uuml;zerine &quot;sevgili annem Hera&#39;ya- oğlu Hephaistos&#39;tan&quot; diye yazdı ve annesine kendisini tanıttı. Hera o g&uuml;n bu tahtta yedi i&ccedil;ti ve g&uuml;l&uuml;şt&uuml;. Kalkmaya &ccedil;alışırken demirlerin elini ve ayağını kıskıvrak tuttuğunu g&ouml;rd&uuml;. Giden tanrılara seslendi. Bazı tanrılar onu duydu ve yanına geldi ve olanları g&ouml;r&uuml;nce Zeus&#39;a haber verdiler. Sonra şarap tanrısı Dionysos, Hephaistos&#39;un yanına gitti ve onu sarhoş edip geri getirdi. Zeus ona Hera&#39;yı kurtarmasını emretti. Hephaistos annesini affetti. Sabah uyandığı zaman kendini Olimpos&#39;ta buldu. Artık o da Olimpos&#39;taki bir tanrıydı. Zeus onun isteğini kabul etmişti. Daha sonra Afrodit&#39;le evlendi. Bu Hephaistos&#39;un ikinci isteğiydi. B&ouml;ylece tanrılar yine eski huzuruna kavuştular. Ancak Afrodit, onu Etna Dağı&#39;na &ccedil;alışmaya gittiğinde zamanlar&nbsp;Ares&nbsp;ile aldatır. G&uuml;neş Tanrısı&nbsp;Helios&#39;un bu durumu g&ouml;r&uuml;p haber vermesi &uuml;zerine Hephaistos bir d&uuml;zenek hazırlar ve bunu yataklarına yerleştirir. Ares ve Afrodit tekrar birlikte olduklarında d&uuml;zenek &ccedil;alışarak ikiliyi zincirler. Hephaistos diğer tanrıları toplayarak ikiliyi rezil eder ve adalet ister.&nbsp;Poseidon&nbsp;Hephaistos&#39;u ikna ederek Ares&#39;e zina cezasını &ouml;detir. Sonrasında Hephaistos, Afrodit&#39;i iade edip başlık parasını geri ister.\r\n', '2021-05-26 21:28:45', 1, '', '0', '0', 'hephaistos'),
(4, '13269792596_raijin.jpg', 'Raijin', 'Raijin&nbsp;(雷神),&nbsp;Şintoizm&nbsp;ve&nbsp;Japon mitolojisinde&nbsp;yıldırım,&nbsp;g&ouml;k&nbsp; &nbsp; &nbsp; g&uuml;r&uuml;lt&uuml;s&uuml;&nbsp;ve&nbsp;fırtınalar&nbsp;tanrısıdır.&nbsp;Adı,&nbsp;Japoncada&nbsp;rai&nbsp;(雷, &quot;g&ouml;k g&uuml;r&uuml;lt&uuml;s&uuml;&quot;) ve &quot;tanrı&quot; ya da &quot;kami&quot; (神 shin) kelimelerinden almaktadır. Genellikle tamburlarda &ccedil;izilmiş tomoe sembol&uuml; ile g&ouml;k g&uuml;r&uuml;lt&uuml;s&uuml; yaratmak i&ccedil;in davul &ccedil;alan iblis g&ouml;r&uuml;n&uuml;ml&uuml; bir ruh olarak tasvir edilir.\r\n\r\nRaijin genellikle sert, korkutucu bir y&uuml;zle ve yer &ccedil;ekimine meydan okuyan sa&ccedil;ları olan kaslı bir fig&uuml;rle tasvir edilir. Şimsek sesini yaratmak i&ccedil;in &ccedil;aldığı Taiko davullarıyla &ccedil;evrili bir fig&uuml;r olarak tasvir edilir. Bazı durumlarda Raijin ge&ccedil;mişi, bug&uuml;n&uuml; ve geleceği temsil ettiği s&ouml;ylenen &uuml;&ccedil; parmakla tasvir edilir.Raijin&#39;in en &ouml;nemli heykellerinden ikisi Sanjusangendo tapınağında ve Taiyuin Rinnoji tapınağında bulunmaktadır.\r\n', '2021-05-26 21:53:19', 5, '', '0', '0', 'raijin'),
(5, '16681743460_osrisi-tanrı-1.jpg', 'Osiris', 'Geb&nbsp;ve&nbsp;Nut&#39;un oğlu yeraltı d&uuml;nyasının hakimi, &ouml;l&uuml;ms&uuml;z yaşam i&ccedil;in diriliş tanrısı, kardeşi&nbsp;Set&#39;in tam zıddı olarak iyilik tanrısı, kural koyucu, koruyucu; &ouml;l&uuml;lerin yargıcı lahitinin bulunduğu yer&nbsp;Abidos&rsquo;ta&nbsp;k&uuml;lt&uuml;n&uuml;n&nbsp;oluştuğu yerdir. Osiris,&nbsp;Nut&nbsp;ve&nbsp;Geb&rsquo;in ilk &ccedil;ocuğuydu. Set,&nbsp;Nephthys&nbsp;ve&nbsp;İsis&rsquo;in kardeşiydi, aynı zamanda&nbsp;İsis&rsquo;in kocasıydı.&nbsp;Horus,&nbsp;İsis&#39;ten oğluydu. Bir hik&acirc;yeye g&ouml;re&nbsp;Nephthys,&nbsp;İsis&nbsp;gibi davranarak ve Osiris&rsquo;i baştan &ccedil;ıkarmış ve&nbsp;Anubis&rsquo;i doğurmuştur. Osiris adı bu tanrıya eski Yunanların verdiği bir addır. Osiris&rsquo;in eski Mısırcadaki asıl adı &ldquo;g&ouml;z&uuml;n yeri&rdquo; anlamındaki &ldquo;As-&acirc;r&rdquo;dır ( ya da Usire). Bu ad, hiyeroglif yazısı ile yazılırken iki ideogram kullanılarak yazılır; kullanılan iki ideogramdan biri taht, diğeri g&ouml;zd&uuml;r.\r\n\r\nOsiris başta erkeklerin d&uuml;nyasının kural koyucusu olmuş ve&nbsp;Ra&nbsp;g&ouml;ky&uuml;z&uuml;ne kural koymak i&ccedil;in d&uuml;nyayı bıraktığında kardeşi Set, Osiris&rsquo;i &ouml;ld&uuml;rd&uuml;.&nbsp;İsis&rsquo;in sihri sayesinde tekrar yaşama d&ouml;nd&uuml;. İlk &ouml;len yaşayan canlı olduğu i&ccedil;in sonraları &ouml;l&uuml;lerin lordu oldu. Oğlu&nbsp;Horus, onun &ouml;l&uuml;m&uuml;n&uuml;n &ouml;c&uuml;n&uuml; aldı. Set&#39;i yendi ve onu batı Mısır&rsquo;ın &ccedil;&ouml;l&uuml;ne (Sahra) g&ouml;nderdi.\r\n\r\nT&uuml;m&nbsp;Mısır&nbsp;tarihi boyunca dualar ve b&uuml;y&uuml;ler Osiris&rsquo;e y&ouml;neltilmişti, onu kutsayarak kendisinin kural koyduğu &ouml;b&uuml;r d&uuml;nyaya girmesi umulmuştu, &ouml;zellikle&nbsp;Orta krallık&nbsp;d&ouml;neminde popularitesi arttı. 18. s&uuml;lale d&ouml;neminde Mısır&rsquo;da en &ccedil;ok tapılan tanrı olmuştu. Osiris&rsquo;in popularitesi, Mısır tarihinin en son evrelerine kadar s&uuml;rd&uuml;.\r\n\r\nMısır, tarihinin ilk d&ouml;nemlerinde farklı kabilelerden, daha sonra da farklı nomoslardan oluştuğu i&ccedil;in, Mısır panteonu &ccedil;ok sayıda tanrı ile doludur. Osiris ise Geb ve Nutun ilk oğlu yer altı d&uuml;nyasının hakimidir. Geb ve nutun d&ouml;rt &ccedil;ocuğu olmuştur Osiris İsis Seth ve Nepht&#39;tir. Efsaneye g&ouml;re Osiris İsis&#39;e &acirc;şıktır. Yani İsis hem Osirisin eşi hem kardeşidir. Bir g&uuml;n İsis bir plan kurar bu planla eşi Osiris&#39;i kral yapmaktır. Bir gece Ra ( o zamanlar kral Ra idi ) uyurken İsis Ra&#39;nın t&uuml;k&uuml;r&uuml;ğ&uuml;n&uuml; alır ve t&uuml;k&uuml;r&uuml;ğ&uuml; kille karıştırır ve bir yılan yaratır. O gece yılan Ra&#39;yı ısırır, ısırık Ra&#39;yı mahveder, kimse onu iyileştiremez. İsis&#39;de Ra&#39;ya gizli adını s&ouml;ylerse onu iyileştirebileceğini s&ouml;yler. Ra bunu kabul eder ve adını s&ouml;yler, İsis Ra&#39;yı iyileştirir ama onun &uuml;zerinde b&uuml;y&uuml;k bir g&uuml;ce sahip olur. Osiris&#39;in kral olması i&ccedil;in Ra&#39;yı tahtı bırakıp g&ouml;klere &ccedil;ekilmesi i&ccedil;in zorlar, Ra ise bunu kabul etmek zorunda kalır. Ve taht Osiris&#39;e kalır, artık Osiris Tanrıların, insanların ve her şeyin kralıdır.\r\n', '2021-05-26 21:54:41', 4, '', '0', '0', 'osiris'),
(6, '11763464360_kayra.png', 'Kayra Han', 'Kayra Han, Kayır Han&nbsp;ya da&nbsp;Kayrakan&nbsp;-&nbsp;Oğuzlar&#39;da ise&nbsp;Krayir&nbsp;(Altayca:&nbsp;Кайракан&nbsp;&quot;Kayrakan&quot;, Kırgızca:&nbsp;Кайра, Osmanlıca:&nbsp;كايرا), T&uuml;rk ve Altay mitolojisinde Yaratıcı Tanrı. Baş Tanrı. En &ccedil;ok Altay, Tuva, Hakas ve Yakut mitolojilerinde &ouml;n plana &ccedil;ıkar. Babası ilk Tanrı olan&nbsp;G&ouml;k Tengri&#39;dir, annesi yoktur.\r\n\r\nG&ouml;k Tengri&#39;den sonra Tanrıların en b&uuml;y&uuml;ğ&uuml; ve en &ouml;nde gelenidir.&nbsp;G&ouml;k Tengri&nbsp;hari&ccedil; b&uuml;t&uuml;n her şeyin yaratıcısıdır. Mutlak &uuml;st&uuml;nl&uuml;ğ&uuml; vardır. G&ouml;ğ&uuml;n 17. katında oturur.&nbsp;Tengri&nbsp;hari&ccedil; Diğer b&uuml;t&uuml;n Tanrıları da o yaratmıştır. Bu anlamda diğer Tanrıların kendisiyle kıyaslandığında, emirlerini yerine getiren veya verdiği g&ouml;revleri yineleyen birer melek konumunda olduğu yaklaşımı yanlış olmayacaktır. Ancak İslam &ouml;ncesi T&uuml;rk k&uuml;lt&uuml;r&uuml;nde melek veya benzeri bir kavram yer almaz. Bu sonuca yalnızca kıyaslama yapılarak ulaşılabilir. Evrenin yazgısını belirler. İyilik y&ouml;n&uuml; ağır basar. Yery&uuml;z&uuml;n&uuml; yarattıktan sonra dokuz dallı bir ağa&ccedil; (&ccedil;am veya kayın) dikmiştir. Bu ağa&ccedil; yerle g&ouml;ğ&uuml; birbirine bağlayan yaşam ağacı &ldquo;Uluğ Kayın&rdquo;dır. İnsanların atası olan dokuz kişi bu ağacın dallarından t&uuml;remiş ve dokuz boy (dokuz ırk) bu kişilerin soyundan ortaya &ccedil;ıkmıştır.\r\n\r\nTengere Kayra Han,&nbsp;Altaylılar&#39;ın yanı sıra&nbsp;Ostyaklar&nbsp;ve&nbsp;Yakutlar&nbsp;gibi bazı&nbsp;Sibiryalı&nbsp;toplumların&nbsp;mitolojilerinde&nbsp;y&uuml;ksek derecede bir tanrı olarak saygı duyulur.&nbsp;Altayların yaratılış efsanesinde&nbsp;d&uuml;nyanın yaratıcısı olarak g&ouml;sterilir. Kayra Han bu efsanede ayrıca t&uuml;m&nbsp;G&ouml;k Tengricilikte&nbsp;yeraltı aleminin tanrısı olarak tanılan&nbsp;Erlik Han&#39;a ceza olarak yeraltı aleminin tanrısı olma g&ouml;revini verir. Bazen babası&nbsp;G&ouml;k Tengri&nbsp;ile eşdeğer tutulur.\r\n\r\n&Uuml;lgen,&nbsp;Yer Tengri,&nbsp;Mergen&nbsp;ve&nbsp;Kızagan&nbsp;adlı d&ouml;rt oğlu vardır.&nbsp;Eski kaynaklarda verilen bilgilere g&ouml;re &Uuml;lgen, iyilik ve bağışlayıcılığını yani merhametini; Kızagan, intikamını ve cezasını yani &ouml;fkesini;&nbsp;Mergen&nbsp;ise bilgelik ve hikmetini yani aklını temsil ederler. G&ouml;rkemli bir varlığa sahiptir. Somut nitelemeler pek fazla yapılmamış ancak soyut y&ouml;n&uuml; &uuml;zerinde daha &ccedil;ok durulmuştur. Ana ve Ata olarak (hem eril hem dişil, yani n&ouml;tr olarak) tanımlandığı kaynaklar mevcuttur.&nbsp;İnsan bi&ccedil;imli&nbsp;olarak pek fazla tasvir edilmez. Kışı yery&uuml;z&uuml;nde yazı g&ouml;ky&uuml;z&uuml;nde ge&ccedil;irir.&nbsp;Değişik renklerde yıldırım &ccedil;aktırır. Onun yıldırımına &ccedil;arpılan kişi şaman olur. Bazı batılı kaynaklarda&nbsp;Kuara&nbsp;(Kuğara) olarak ge&ccedil;er. Bu takdirde&nbsp;Urartulardaki&nbsp;Kuera&nbsp;ile bağlantılı g&ouml;r&uuml;nmektedir.&nbsp;Bulgarlarda&nbsp;da bu isimle rastlanır. Kuğara (Koğara)&rsquo;nın Kayra Han ile farklı Tanrılar olduğunu &ouml;ne s&uuml;ren g&ouml;r&uuml;şler de vardır.\r\n\r\nAyrıca Kayra Han ile Kara Han aynı kişi olarak nitelense de bu durum ses bilimsel ama yaygın bir yanlışlıktır. &Ccedil;&uuml;nk&uuml; Kara s&ouml;zc&uuml;ğ&uuml; i&ccedil;erisinde daha &ccedil;ok olumsuz anlamlar barındırır. Kara Han farklı bir mitolojik kişiliktir (Oğuz Han&rsquo;ın babasıdır).&nbsp;Kara Han&nbsp;ile karıştırılmamalıdır.\r\n', '2021-05-26 22:07:55', 3, '', '1', '0', 'kayra-han');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorumlar`
--

CREATE TABLE `yorumlar` (
  `yorum_id` int(11) NOT NULL,
  `yorum_ekleyen` varchar(500) NOT NULL,
  `yorum_eposta` varchar(500) NOT NULL,
  `yorum_icerik` text NOT NULL,
  `yorum_tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `yorum_yazi_id` int(11) NOT NULL,
  `yorum_durum` int(11) NOT NULL DEFAULT 0,
  `yorum_ust` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Tablo döküm verisi `yorumlar`
--

INSERT INTO `yorumlar` (`yorum_id`, `yorum_ekleyen`, `yorum_eposta`, `yorum_icerik`, `yorum_tarih`, `yorum_yazi_id`, `yorum_durum`, `yorum_ust`) VALUES
(1, 'Doğukan Dursun', 'dod63y@gmail.com', 'Çok güzel bir konu ', '2021-05-26 20:26:06', 1, 1, 0),
(2, 'Doğukan Dursun', 'dod63y@gmail.com', 'merhaba', '2021-05-26 20:29:26', 2, 1, 0),
(3, 'admin', 'dod63y@gmail.com', 'Merhaba', '2021-05-26 20:32:56', 2, 1, 2);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `ayarlar`
--
ALTER TABLE `ayarlar`
  ADD PRIMARY KEY (`site_id`) USING BTREE;

--
-- Tablo için indeksler `hakkimizda`
--
ALTER TABLE `hakkimizda`
  ADD PRIMARY KEY (`hakkimizda_id`);

--
-- Tablo için indeksler `iletisim`
--
ALTER TABLE `iletisim`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`kategori_id`) USING BTREE;

--
-- Tablo için indeksler `mesajlar`
--
ALTER TABLE `mesajlar`
  ADD PRIMARY KEY (`mesaj_id`);

--
-- Tablo için indeksler `sponsorlar`
--
ALTER TABLE `sponsorlar`
  ADD PRIMARY KEY (`sponsor_id`) USING BTREE;

--
-- Tablo için indeksler `yazilar`
--
ALTER TABLE `yazilar`
  ADD PRIMARY KEY (`yazi_id`) USING BTREE,
  ADD UNIQUE KEY `yazi_id` (`yazi_id`) USING BTREE;

--
-- Tablo için indeksler `yorumlar`
--
ALTER TABLE `yorumlar`
  ADD PRIMARY KEY (`yorum_id`) USING BTREE;

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `ayarlar`
--
ALTER TABLE `ayarlar`
  MODIFY `site_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `hakkimizda`
--
ALTER TABLE `hakkimizda`
  MODIFY `hakkimizda_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `iletisim`
--
ALTER TABLE `iletisim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Tablo için AUTO_INCREMENT değeri `mesajlar`
--
ALTER TABLE `mesajlar`
  MODIFY `mesaj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `sponsorlar`
--
ALTER TABLE `sponsorlar`
  MODIFY `sponsor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `yazilar`
--
ALTER TABLE `yazilar`
  MODIFY `yazi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `yorumlar`
--
ALTER TABLE `yorumlar`
  MODIFY `yorum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
