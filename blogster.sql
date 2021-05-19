-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2021 at 06:41 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogster`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `s_no` int(11) NOT NULL,
  `body` text NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `post_sno` varchar(25) NOT NULL,
  `author` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`s_no`, `body`, `date`, `post_sno`, `author`) VALUES
(18, 'Wow man what a post\r\n', '2021-02-14 06:58:25', '4', 'Aayush'),
(22, 'I really wana go for a ride one day!', '2021-02-14 07:15:20', '6', 'jacky'),
(23, 'as', '2021-02-14 07:24:21', '4', 'anand'),
(25, 'Hi...good work Aayush', '2021-02-14 11:06:02', '4', 'anmol'),
(31, 'Wow aayush Cool man', '2021-02-24 07:49:59', '4', 'Amritesh'),
(32, 'Here are some of the issues!', '2021-02-24 16:32:21', '5', 'Aayush'),
(33, 'Hey Great', '2021-02-26 12:19:40', '7', 'Anmol'),
(34, 'It was nice to hear it guys', '2021-02-26 12:37:27', '5', 'Aayush'),
(35, 'Nice post', '2021-03-07 18:33:46', '12', 'Aayush'),
(36, 'Great! ', '2021-03-07 19:55:49', '12', 'Nishant'),
(37, 'Great one!', '2021-03-10 06:11:15', '12', 'Aayush'),
(38, 'Helllo', '2021-03-29 14:22:12', '12', 'Aayush');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'first post', '123456789', 'first post', '2021-01-31 11:24:21', 'firstpost@gmail.com'),
(2, 'this', '6565656566', 'fcfcfcvhg', NULL, 'thiws@gmail.com'),
(3, 'this', '6565656566', 'fcfcfcvhg', '2021-01-31 11:55:05', 'thiws@gmail.com'),
(4, 'dcbhbhcb', 'svznjxm', 'rfvsjn', '2021-02-01 11:44:02', 'vzjnc czx'),
(5, 'dcbhbhcb', 'svznjxm', 'rfvsjn', '2021-02-01 11:45:55', 'vzjnc czx'),
(6, 'dcbhbhcb', 'svznjxm', 'rfvsjn', '2021-02-01 11:46:34', 'vzjnc czx'),
(7, 'dcbhbhcb', 'svznjxm', 'rfvsjn', '2021-02-01 11:47:04', 'vzjnc czx'),
(8, 'dcbhbhcb', 'svznjxm', 'rfvsjn', '2021-02-01 11:53:51', 'vzjnc czx'),
(9, 'dcbhbhcb', 'svznjxm', 'rfvsjn', '2021-02-01 11:59:16', 'vzjnc czx'),
(10, 'dcbhbhcb', 'svznjxm', 'rfvsjn', '2021-02-01 11:59:25', 'vzjnc czx'),
(11, 'aanas', '45531351', 'rfvsjn', '2021-02-01 12:00:10', 'mabxsh@gmail.com'),
(12, 'aanas', '45531351', 'rfvsjn', '2021-02-01 12:02:46', 'mabxsh@gmail.com'),
(13, 'aanas', '45531351', 'rfvsjn', '2021-02-01 12:03:49', 'mabxsh@gmail.com'),
(14, 'aanas', '45531351', 'rfvsjn', '2021-02-01 12:08:04', 'mabxsh@gmail.com'),
(15, 'aanas', '45531351', 'rfvsjn', '2021-02-01 12:08:16', 'mabxsh@gmail.com'),
(16, 'aanas', '45531351', 'rfvsjn', '2021-02-01 12:09:13', 'mabxsh@gmail.com'),
(17, 'aanas', '45531351', 'rfvsjn', '2021-02-01 12:25:36', 'mabxsh@gmail.com'),
(18, 'cdb ', 'xzc', 'xcz', '2021-02-07 15:57:45', 'x');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `author` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `author`, `category`, `content`, `img_file`, `date`) VALUES
(4, 'Copy Constructor in C++', 'We have discussed introduction to Constructors in C++. In this post, copy constructor is discussed.', 'new-post1', 'Aayush Kumar Singh', 'Tech', '<p>Cmanstsgvvg</p>', ' about.jpg', '2021-02-08 21:41:57'),
(5, 'Why I travel solo', 'Because I can do things my way', 'new_post2', 'Aayush singh', 'General', '<p>I can wander off. Stay. Go. Change my mind. Follow a whim. I don&rsquo;t have anyone else&rsquo;s preferences, needs or feelings to bear in mind and carefully balance against my own. I can be utterly selfish and not feel bad about it. For most human adults &mdash; typically surrounded by and attuned to the needs of children, parents, friends, colleagues, clients, pets &mdash; this is a strange and wonderful<span style=\"background-color: #f1c40f;\"> luxury.</span></p>', 'img.pmg', '2021-02-09 17:36:53'),
(6, 'How I built a startup while traveling to 20 countries', 'And why I left Silicon Valley', 'new_post3', 'Nishant', '', 'One year ago, I left San Francisco, sold and gave away everything I owned, and moved into a 40 liter backpack.\r\nI traveled to 45 cities in 20 countries, 3 Disneylands, and 1 bunny island.\r\nI also worked 50 hours a week building and launching a startup.\r\nAnd my total costs were less than just the rent in San Francisco.\r\n', 'img1.pmg', '2021-02-09 17:38:14'),
(7, 'Traveling is cheaper than staying at home\r\n', 'These are actual numbers calculated from my personal spending habits. Your mileage may vary.', 'new_post4', 'Admin', '', 'This is my average total monthly spending from one year living in Seattle’s Capitol Hill, one year living in San Francisco’s Upper Haight, one year traveling to 20 countries, and one month at a hotel in Bali. It is much cheaper for me to travel. Since the majority of my costs are from trains and flights, it’s significantly cheaper if I stay in one place.\r\n', 'img.pmg', '2021-02-09 17:40:02'),
(12, 'Travel Blog', 'Sometimes You need to move', 'Travel Blog-1', 'Nishant', 'Travel', '<p id=\"870f\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">Gokarna is an Indian coastal beauty situated on the Arabian sea. It is a small town in Karnataka (state) and is also a place of holy worship for many Hindus. The best part? It is a perfect blend of mountains and sea since it is situated on the Western Ghats of India.</p>\r\n<p id=\"1640\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">The town itself is a small one and has only become popular in recent times due to foreign tourists looking for a silent place to relax, as an alternative for Goa. Goa is another coastal area of India situated 50 km from Gokarna. It becomes very crowded and commercialized, as large crowds visit every New year to attend the infamous parties. Therefore, Gokarna acts as the peaceful version of Goa.</p>\r\n<p id=\"7e74\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">My husband and I visited the place in January for our anniversary after getting cooped up at home for a whole year. Before COVID, we used to go on vacations at least once or twice every quarter, so this trip was a way of releasing our travel frustrations.</p>\r\n<h2 id=\"b03b\" class=\"wl wm rp bi ks wn wo sw wp wq wr sz ws ta wt tc wu td wv tf ww tg wx ti wy rv aq\" data-selectable-paragraph=\"\">To explain to you what the article is about, I have to explain how I was before&hellip;</h2>\r\n<p id=\"d5d9\" class=\"vp vq rp vr b su wz vt vu sx xa vw vx vy xb wa wb wc xc we wf wg xd wi wj wk hh aq\" data-selectable-paragraph=\"\">For as long as I can remember, I was a meticulous planner during traveling. Probably it was ingrained in my brain by my mom, who always said to me, &ldquo;If you just wanted to sleep, you could have done it at home. Why pay so much and come here?!&rdquo;.</p>\r\n<p id=\"3746\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">My family was always particular about not missing out on anything when visiting a place. Also, they never believed in revisiting a place.</p>\r\n<p id=\"d873\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">We used to plan what places to visit and when. We even tried to optimize the travel time after checking out for directions. I cannot deny that I loved the planning and having a system.</p>\r\n<p id=\"3d76\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">This system worked out for me perfectly until I got married. Then came my husband, who brought up the concept of, &ldquo;This is a vacation. You have to chill. If you wanted to have a hectic life, we could have stayed at home, isn&rsquo;t it?&rdquo;. I was so confused! Chilling? Isn&rsquo;t it another name for sitting around all day doing nothing?</p>\r\n<p id=\"3213\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">Poor him. Because of this mentality, I used to drag him around and force him to be a part of my &ldquo;checklist.&rdquo; He hated it, but I didn&rsquo;t want to leave out any of the tourist locations I had planned for. After about a year of getting married, we finally came to the deal where he and I used to plan alternate days.</p>\r\n<p id=\"3e1e\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\"><em class=\"xe\">For all single people out there, please make sure that your travel preferences match before you get into a relationship :-)</em></p>\r\n<h2 id=\"d242\" class=\"wl wm rp bi ks wn wo sw wp wq wr sz ws ta wt tc wu td wv tf ww tg wx ti wy rv aq\" data-selectable-paragraph=\"\">Coming back to the present&hellip;</h2>\r\n<p id=\"2f58\" class=\"vp vq rp vr b su wz vt vu sx xa vw vx vy xb wa wb wc xc we wf wg xd wi wj wk hh aq\" data-selectable-paragraph=\"\">We had booked our beachside resort in Gokarna for 5 days. It was a totally unplanned trip since I booked the bus tickets and hotel only a week or two before the actual trip. Yes, this was &ldquo;unplanned&rdquo; for me since I usually book everything months before.</p>\r\n<p id=\"00a2\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">I was also busy with work commitments. Therefore, I was not able to plan the trip as I wanted to. This became a blessing in disguise.</p>\r\n<p id=\"0d40\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">I went entirely unprepared for the trip. Only after going there did I realize that there are not many touristy places to see. And most of the sightseeing places were pretty far away. The WIFI also was not great. So it was not like I could watch movies all day.</p>\r\n<p id=\"bbed\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">Now, what was I supposed to do for 5 days? I had to &ldquo;Chill&rdquo;!!!</p>\r\n<p id=\"9680\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">We did go out during the day for some time, for the first 2 to 3 days of the trip. I felt so uncomfortable, thinking I am literally not doing anything! It felt like I was wasting time there. I became very restless. I did see many people sitting inside multiple shacks near the resort, just staring at the sea for hours, but I never understood how they did it.</p>\r\n<p id=\"b665\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">The sea was beautiful, mind you, but how much could you stare at it?!</p>\r\n<p id=\"e60c\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">The last 3 days of the trip completely changed my life. I would even say that it was the best trip ever! Why?</p>\r\n<h2 id=\"22a1\" class=\"wl wm rp bi ks wn wo sw wp wq wr sz ws ta wt tc wu td wv tf ww tg wx ti wy rv aq\" data-selectable-paragraph=\"\">Because I calmed down and chilled out :-)</h2>\r\n<p id=\"20a8\" class=\"vp vq rp vr b su wz vt vu sx xa vw vx vy xb wa wb wc xc we wf wg xd wi wj wk hh aq\" data-selectable-paragraph=\"\">I started to see the beauty in everything. The sound of the waves, the beauty of the shells we picked out, the sun&rsquo;s reflection on the water, the gorgeous sunset, the silence, the peace and calm surrounding me, everything.</p>\r\n<p id=\"4bfb\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">I started to live in the present. I realized how to live in the present.</p>\r\n<p id=\"2fe9\" class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">I craved for each of the things mentioned above every day. I yearned to have conversations with different people there, whether tourists, hotel staff, or even our waiter. I found an immense sense of calm when I wrote down my thoughts, listening to the sound of waves.</p>\r\n<p class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" data-selectable-paragraph=\"\">&nbsp;</p>\r\n<p class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" style=\"text-align: right;\" data-selectable-paragraph=\"\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://miro.medium.com/max/387/1*UsIgdNRoalSm2YmDegv9YQ.png\" alt=\"\" width=\"410\" height=\"391\" /></p>\r\n<p class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" style=\"text-align: right;\" data-selectable-paragraph=\"\">&nbsp;</p>\r\n<p id=\"f199\" class=\"kr ks fs kt b gy ku kv kw hb kx ky kz la lb lc ld le lf lg lh li lj lk ll lm fk cf\" data-selectable-paragraph=\"\">Usually, writing down on paper used to make me feel restless. I always preferred typing since I was faster at it. I did face this restlessness initially, but after some time, it was therapeutic, almost like meditation. It was beautiful.</p>\r\n<p id=\"8e55\" class=\"kr ks fs kt b gy ku kv kw hb kx ky kz la lb lc ld le lf lg lh li lj lk ll lm fk cf\" data-selectable-paragraph=\"\">In the 5 days I stayed there, I became more aware of my surroundings. The feel of warm sun on your face while the chilly winds were blowing, birds&rsquo; sounds, the expressions of people when they spoke to others&hellip;I became more conscious of the small things, which we fail to appreciate due to our hectic lives.</p>\r\n<p id=\"5d3a\" class=\"kr ks fs kt b gy ku kv kw hb kx ky kz la lb lc ld le lf lg lh li lj lk ll lm fk cf\" data-selectable-paragraph=\"\">It might seem very philosophical. But, I started to think, what is the point of always running if I do not get the time to sit and just exist? If I am not able to appreciate the things around me?</p>\r\n<h2 id=\"b748\" class=\"ln lo fs at lp lq lr ha ls lt lu hd lv he lw hg lx hh ly hj lz hk ma hm mb fy cf\" data-selectable-paragraph=\"\">What is &ldquo;chilling&rdquo; for me now?</h2>\r\n<p id=\"e34b\" class=\"kr ks fs kt b gy mc kv kw hb md ky kz la me lc ld le mf lg lh li mg lk ll lm fk cf\" data-selectable-paragraph=\"\">It is appreciating the present and not being always held up in your past or future. It is letting life pass as it is without putting any pressure on it to fasten up. It is enjoying and being grateful for what you have instead of continually searching for what you do not have.</p>\r\n<p id=\"33e0\" class=\"kr ks fs kt b gy ku kv kw hb kx ky kz la lb lc ld le lf lg lh li lj lk ll lm fk cf\" data-selectable-paragraph=\"\">This realization probably came because I was put into a corner (figuratively) with nothing else to do. I don&rsquo;t think I would have ever experienced this peace without being forced to not do anything.</p>\r\n<p id=\"4314\" class=\"kr ks fs kt b gy ku kv kw hb kx ky kz la lb lc ld le lf lg lh li lj lk ll lm fk cf\" data-selectable-paragraph=\"\"><strong class=\"kt mk\">What can you do?</strong></p>\r\n<p id=\"ad61\" class=\"kr ks fs kt b gy ku kv kw hb kx ky kz la lb lc ld le lf lg lh li lj lk ll lm fk cf\" data-selectable-paragraph=\"\">Go away to someplace for a minimum of 3 days, where you do not have anything to see. Where you do not have WIFI or access to any gadget. Preferably on the sea or mountains. In between nature.</p>\r\n<p id=\"0a60\" class=\"kr ks fs kt b gy ku kv kw hb kx ky kz la lb lc ld le lf lg lh li lj lk ll lm fk cf\" data-selectable-paragraph=\"\">This will make you appreciate nature and your surroundings more. Instead of pulling out your phone and clicking selfies/photos as an instinctive reaction, you will learn to experience nature more too.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://miro.medium.com/max/387/1*l4MLGh7wKXR7deWUYo3Ssw.png\" alt=\"\" width=\"387\" height=\"407\" /></p>\r\n<p>&nbsp;</p>\r\n<p><strong class=\"kt mk\"><em class=\"mh\">&nbsp; &nbsp;Sign up for our newsletter to stay informed with up-to-date curations from our editors. <img src=\"https://media.wired.com/photos/59273186cefba457b079c5e2/master/pass/LoveEmoji.jpg\" alt=\"\" width=\"50\" height=\"28\" /></em></strong></p>\r\n<p class=\"vp vq rp vr b su vs vt vu sx vv vw vx vy vz wa wb wc wd we wf wg wh wi wj wk hh aq\" style=\"text-align: center; padding-left: 40px;\" data-selectable-paragraph=\"\">&nbsp;</p>', 'Travel.jpeg', '2021-03-07 23:37:40');

-- --------------------------------------------------------

--
-- Table structure for table `reply_comments`
--

CREATE TABLE `reply_comments` (
  `s_no_s` int(11) NOT NULL,
  `body` text NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `path` text DEFAULT NULL,
  `parent_id` varchar(25) NOT NULL,
  `r_author` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reply_comments`
--

INSERT INTO `reply_comments` (`s_no_s`, `body`, `date`, `path`, `parent_id`, `r_author`) VALUES
(19, 'Great Man', '2021-02-24 14:30:25', NULL, '31', 'nishant'),
(20, 'Kudos', '2021-02-24 14:33:49', NULL, '21', 'aayush'),
(21, 'Did it man did it!', '2021-02-24 14:44:24', NULL, '31', 'king slayer'),
(22, 'Finally it completed', '2021-02-24 16:30:13', NULL, '31', 'geeker'),
(23, 'Naah ! it\'s fine', '2021-02-24 16:32:38', NULL, '32', '@hero'),
(24, 'Thanks Anmol', '2021-02-24 16:33:35', NULL, '25', 'yup'),
(25, 'Yeah Definitly', '2021-02-26 12:19:57', NULL, '33', 'Lezend'),
(26, 'Yeah good one!', '2021-03-07 18:34:05', NULL, '35', 'Aayush'),
(27, 'Nice One!', '2021-03-10 05:55:04', NULL, '36', 'Aayush');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `reply_comments`
--
ALTER TABLE `reply_comments`
  ADD PRIMARY KEY (`s_no_s`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `reply_comments`
--
ALTER TABLE `reply_comments`
  MODIFY `s_no_s` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
