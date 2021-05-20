SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date` varchar(50) NOT NULL,
  `userId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `category` (`id`, `category`, `description`, `date`, `userId`) VALUES
(1, 'Java Programming', 'qweqweqweqweq', 'Sunday, 14 June 2020', 2),
(2, 'C++ Programming', 'qwe', 'Tuesday, 23 June 2020', 2),
(3, 'Java Programming Language', 'qweqweqwe', 'Tuesday, 23 June 2020', 2),
(4, 'Python Programming', 'qweqweqweq', 'Wednesday, 24 June 2020', 2),
(5, '123', '231', 'Wednesday, 24 June 2020', 2),
(6, '.net', '.net is high level lanuage', 'Wednesday, 15 July 2020', 6),
(7, 'poems', 'Sole poems', 'Saturday, 29 August 2020', 7);

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `postid` bigint(20) NOT NULL,
  `comment` varchar(600) NOT NULL,
  `reply` varchar(600) DEFAULT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `comments` (`id`, `userid`, `postid`, `comment`, `reply`, `date`, `time`) VALUES
(16, 3, 30, 'Nice Work', 'Thank You Very Much', 'Wednesday, 14 October 2020', '09 : 31 : 49 PM'),
(17, 3, 30, 'Good yoou', 'Thanks', 'Wednesday, 14 October 2020', '09 : 32 : 23 PM'),
(18, 3, 30, 'Hello User', 'Hi There', 'Wednesday, 14 October 2020', '09 : 40 : 45 PM'),
(19, 7, 30, 'Khub Valo', 'Thanks', 'Wednesday, 14 October 2020', '09 : 42 : 37 PM'),
(20, 7, 30, 'great write up', 'Thanks', 'Wednesday, 14 October 2020', '09 : 56 : 20 PM'),
(21, 2, 30, 'Hello World', 'Hello World', 'Thursday, 15 October 2020', '10 : 48 : 29 PM'),
(22, 2, 30, '1312312', '123123', 'Thursday, 15 October 2020', '10 : 49 : 06 PM'),
(23, 2, 30, 'qwe123', '2eawdq2', 'Thursday, 15 October 2020', '10 : 50 : 40 PM');

CREATE TABLE `likes` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `postid` bigint(20) DEFAULT NULL,
  `date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `likes` (`id`, `userid`, `postid`, `date`) VALUES
(26, 2, 30, 'Tuesday, 13 October 2020'),
(27, 3, 30, 'Tuesday, 13 October 2020'),
(28, 2, 38, 'Thursday, 15 October 2020'),
(29, 2, 37, 'Thursday, 15 October 2020'),
(30, 2, 40, 'Thursday, 15 October 2020'),
(31, 2, 39, 'Thursday, 15 October 2020'),
(32, 2, 36, 'Thursday, 15 October 2020'),
(33, 2, 35, 'Thursday, 15 October 2020'),
(34, 2, 34, 'Thursday, 15 October 2020'),
(35, 2, 33, 'Thursday, 15 October 2020'),
(36, 2, 32, 'Thursday, 15 October 2020'),
(38, 2, 31, 'Thursday, 15 October 2020');

CREATE TABLE `post` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `subtitle` text NOT NULL,
  `date` varchar(50) NOT NULL,
  `time` varchar(50) NOT NULL,
  `categoryid` bigint(20) DEFAULT NULL,
  `content` text NOT NULL,
  `files` varchar(400) NOT NULL,
  `privacy` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `post` (`id`, `userid`, `name`, `title`, `subtitle`, `date`, `time`, `categoryid`, `content`, `files`, `privacy`) VALUES
(30, 2, 'Hrishav Dhawaj Purkayastha', 'Hrishav Dhawaj Purkayastha', 'Demo Post 1', 'Tuesday, 13 October 2020', '08 : 24 : 21 PM', 1, 'qw<div>eq</div><div>we</div><div>qwe</div><div>qwe</div><div>qw</div><div>eqw</div><div>eq</div><div>we</div><div>qwe</div><div>qw</div><div>eqw</div><div>e</div>', '', 'Private'),
(31, 2, 'Hrishav Dhawaj Purkayastha', 'qe', 'Demo Post 1', 'Tuesday, 13 October 2020', '08 : 24 : 57 PM', 2, 'qewwqweqwe.<div><br></div>', '', 'Protected'),
(32, 2, 'Hrishav Dhawaj Purkayastha', 'Sagari Sen', 'house of Ritu ', 'Tuesday, 13 October 2020', '08 : 25 : 17 PM', 5, '123123123123132', 'attendance.uml', 'Public'),
(33, 7, 'Chitrankana Bhowmik', 'the post', 'posted', 'Wednesday, 14 October 2020', '09 : 59 : 02 PM', 7, 'hi guys!!!!', '', 'Public'),
(34, 7, 'Chitrankana Bhowmik', 'posting', '2nd time', 'Wednesday, 14 October 2020', '10 : 00 : 11 PM', 7, 'hello everyone', '', 'Public'),
(35, 7, 'Chitrankana Bhowmik', 'posted', '3rd time', 'Wednesday, 14 October 2020', '10 : 01 : 14 PM', 7, 'this is private', '', 'Public'),
(36, 2, 'Hrishav Dhawaj Purkayastha', 'qe', 'qwe', 'Wednesday, 14 October 2020', '10 : 16 : 35 PM', 2, 'qwertyul;', '', 'Public'),
(37, 2, 'Hrishav Dhawaj Purkayastha', 'My First Post', 'house of Ritu ', 'Wednesday, 14 October 2020', '10 : 16 : 47 PM', 6, '&nbsp;bngjgrdexguj,.\'', '', 'Public'),
(38, 2, 'Hrishav Dhawaj Purkayastha', 'qe', 'qwe', 'Wednesday, 14 October 2020', '10 : 17 : 00 PM', 2, 'iuyc5s56tcvik', '', 'Public'),
(39, 2, 'Hrishav Dhawaj Purkayastha', 'qe', 'Demo Post 1', 'Wednesday, 14 October 2020', '10 : 17 : 12 PM', 1, '1234567890-=', '', 'Public'),
(40, 2, 'Hrishav Dhawaj Purkayastha', 'Hrishav Dhawaj Purkayastha', 'Demo Post 1', 'Wednesday, 14 October 2020', '10 : 17 : 23 PM', 1, 'qwertyuiop', '', 'Public');

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `about` text NOT NULL,
  `gender` varchar(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `date` varchar(50) NOT NULL,
  `facebook` varchar(400) NOT NULL,
  `instagram` varchar(400) NOT NULL,
  `twitter` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user` (`id`, `name`, `contact`, `email`, `about`, `gender`, `username`, `password`, `date`, `facebook`, `instagram`, `twitter`) VALUES
(1, 'HD Soft Owner', '8876245833', 'programmerhrishav1234@gmail.com', 'I am a pro java Programmer\r\nI love java\r\nI love Adv. Java', 'Male', 'hrishav', '123', 'Saturday, 30 May 2020', 'aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbQ==', 'aHR0cHM6Ly93d3cueW91dHViZS5jb20=', 'aHR0cHM6Ly93d3cuZ21haWwuY29t'),
(2, 'Hrishav Dhawaj Purkayastha', '8876245833', 'hrishav232000@gmail.com', 'I am a pro java Programmer\r\nI love java\r\nI love adv. Java\r\nI love Spring ', 'Male', 'hrishav123', '123', 'Saturday, 30 May 2020', 'aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbQ==', 'aHR0cHM6Ly93d3cueW91dHViZS5jb20=', 'aHR0cHM6Ly93d3cuZ21haWwuY29t'),
(3, 'Sagari Sen', '9101002649', 'programmerhrishav1234@gmai.com', 'I love Java', 'Male', 'sagari', 'sagari', 'Saturday, 30 May 2020', '', '', ''),
(4, 'affas', '45453', 'sfsf@adadfa.fdsddf', 'sfsdfsdf', 'Male', 'bikash', 'bikash', 'Saturday, 30 May 2020', '', '', ''),
(5, 'Me', '545456', 'me@me.com', 'Hii Me', 'Female', 'me', 'me', 'Sunday, 31 May 2020', '', '', ''),
(6, 'aa', '999999999', 'aa@gmail.com', 'hahahss', 'Male', 'kk', 'bb', 'Wednesday, 15 July 2020', '', '', ''),
(7, 'Chitrankana Bhowmik', '9101635801', 'titibhowmik413@gmail.com', 'video editor, writer, actor', 'Female', 'Titi', 'Titi', 'Saturday, 29 August 2020', '', '', '');


ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `USER_CATEGORY` (`userId`);

ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `USERID` (`userid`),
  ADD KEY `POSTID` (`postid`);

ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `POST` (`postid`),
  ADD KEY `USER` (`userid`);

ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `POST_USER` (`userid`),
  ADD KEY `POST_CATEGORY` (`categoryid`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

ALTER TABLE `likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

ALTER TABLE `post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


ALTER TABLE `category`
  ADD CONSTRAINT `USER_CATEGORY` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `comments`
  ADD CONSTRAINT `POSTID` FOREIGN KEY (`postid`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `USERID` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `likes`
  ADD CONSTRAINT `POST` FOREIGN KEY (`postid`) REFERENCES `post` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `USER` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

ALTER TABLE `post`
  ADD CONSTRAINT `POST_CATEGORY` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `POST_USER` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
