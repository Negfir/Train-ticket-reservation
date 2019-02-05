-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 14, 2018 at 04:27 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `train_reserve`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `a_id` int(11) NOT NULL,
  `a_name` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `ex_date` timestamp NULL DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `agent`
--
DELIMITER $$
CREATE TRIGGER `delete` BEFORE DELETE ON `agent` FOR EACH ROW BEGIN
	  INSERT INTO agent_log(action,a_id,a_name,phone,ex_date,create_date,modify_date)
	  VALUES('delete',OLD.a_id,OLD.a_name,OLD.phone,OLD.a_id,OLD.ex_date,OLD.create_date,OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_agent` AFTER INSERT ON `agent` FOR EACH ROW BEGIN
	  INSERT INTO agent_log(action,a_id,a_name,phone,ex_date,create_date,modify_date)
	  VALUES('insert',NEW.a_id,NEW.a_name,NEW.phone,NEW.a_id,NEW.ex_date,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_agent` AFTER UPDATE ON `agent` FOR EACH ROW BEGIN
	  INSERT INTO agent_log(action,a_id,a_name,phone,ex_date,create_date,modify_date)
	  VALUES('update',NEW.a_id,NEW.a_name,NEW.phone,NEW.a_id,NEW.ex_date,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `agent_log`
--

CREATE TABLE `agent_log` (
  `action` varchar(20) NOT NULL,
  `a_id` int(11) NOT NULL,
  `a_name` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `ex_date` timestamp NULL DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `book_c`
--

CREATE TABLE `book_c` (
  `ref_num` int(11) NOT NULL,
  `cuser_id` int(11) NOT NULL,
  `P_id` int(11) NOT NULL,
  `Train_id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `price` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `book_c`
--
DELIMITER $$
CREATE TRIGGER `delete_book_c` BEFORE DELETE ON `book_c` FOR EACH ROW BEGIN
	  INSERT INTO book_c_log(action,ref_num,cuser_id,P_id, Train_id, Date, price, create_date, modify_date)
	  VALUES('delete',OLD.ref_num,OLD.cuser_id,OLD.P_id,OLD.Train_id,OLD.Date,OLD.price,OLD.create_date, OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_book_c` AFTER INSERT ON `book_c` FOR EACH ROW BEGIN
	  INSERT INTO book_c_log(action,ref_num,cuser_id,P_id, Train_id, Date, price, create_date, modify_date)
	  VALUES('insert',NEW.ref_num,NEW.cuser_id,NEW.P_id,NEW.Train_id,NEW.Date,NEW.price,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_book_c` AFTER UPDATE ON `book_c` FOR EACH ROW BEGIN
	  INSERT INTO book_c_log(action,ref_num,cuser_id,P_id, Train_id, Date, price, create_date, modify_date)
	  VALUES('update',NEW.ref_num,NEW.cuser_id,NEW.P_id,NEW.Train_id,NEW.Date,NEW.price,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `book_c_log`
--

CREATE TABLE `book_c_log` (
  `action` varchar(20) NOT NULL,
  `ref_num` int(11) NOT NULL,
  `cuser_id` int(11) NOT NULL,
  `P_id` int(11) NOT NULL,
  `Train_id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `price` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `book_u`
--

CREATE TABLE `book_u` (
  `ref_num` int(11) NOT NULL,
  `P_id` int(11) NOT NULL,
  `Train_id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Date` date NOT NULL,
  `price` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `book_u`
--
DELIMITER $$
CREATE TRIGGER `delete_book_u` BEFORE DELETE ON `book_u` FOR EACH ROW BEGIN
	  INSERT INTO book_u_log(action,	ref_num, P_id, Train_id, User_id, Date, price, create_date, modify_date)
	  VALUES('delete',OLD.ref_num,OLD.P_id,OLD.Train_id,OLD.User_id,OLD.Date,OLD.price,OLD.create_date, OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_book_u` AFTER INSERT ON `book_u` FOR EACH ROW BEGIN
	  INSERT INTO book_u_log(action,	ref_num, P_id, Train_id, User_id, Date, price, create_date, modify_date)
	  VALUES('insert',NEW.ref_num,NEW.P_id,NEW.Train_id,NEW.User_id,NEW.Date,NEW.price,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_book_u` AFTER UPDATE ON `book_u` FOR EACH ROW BEGIN
	  INSERT INTO book_u_log(action, ref_num, P_id, Train_id, User_id, Date, price, create_date, modify_date)
	  VALUES('update',NEW.ref_num,NEW.P_id,NEW.Train_id,NEW.User_id,NEW.Date,NEW.price,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `book_u_log`
--

CREATE TABLE `book_u_log` (
  `action` varchar(20) NOT NULL,
  `ref_num` int(11) NOT NULL,
  `P_id` int(11) NOT NULL,
  `Train_id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Date` date NOT NULL,
  `price` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `C_name` varchar(50) NOT NULL,
  `Register_no` int(11) NOT NULL,
  `Income` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `zip` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`C_name`, `Register_no`, `Income`, `city`, `street`, `zip`, `create_date`, `modify_date`) VALUES
('apple', 63528, 100000000, 'cupertino', 'erere', 3423, '2018-07-13 11:18:19', '0000-00-00 00:00:00');

--
-- Triggers `company`
--
DELIMITER $$
CREATE TRIGGER `company_delete` BEFORE DELETE ON `company` FOR EACH ROW BEGIN
	  INSERT INTO company_log(action, C_name, Register_no, Income, city, street, zip, create_date, modify_date )
	  VALUES('delete',OLD.C_name,OLD.Register_no,OLD.Income,OLD.city,OLD.street,OLD.zip,OLD.create_date, OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `company_insert` AFTER INSERT ON `company` FOR EACH ROW BEGIN
	  INSERT INTO company_log(action, C_name, Register_no, Income, city, street, zip, create_date, modify_date )
	  VALUES('insert',NEW.C_name,NEW.Register_no,NEW.Income,NEW.city,NEW.street,NEW.zip,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `company_update` AFTER UPDATE ON `company` FOR EACH ROW BEGIN
	  INSERT INTO company_log(action, C_name, Register_no, Income, city, street, zip, create_date, modify_date )
	  VALUES('update',NEW.C_name,NEW.Register_no,NEW.Income,NEW.city,NEW.street,NEW.zip,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `company_log`
--

CREATE TABLE `company_log` (
  `action` varchar(20) NOT NULL,
  `C_name` varchar(50) NOT NULL,
  `Register_no` int(11) NOT NULL,
  `Income` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `zip` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `complain_c`
--

CREATE TABLE `complain_c` (
  `cc_id` int(11) NOT NULL,
  `support_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  `E_id` int(11) NOT NULL,
  `c_name` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `duration` time NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `complain_c`
--
DELIMITER $$
CREATE TRIGGER `delete_complain_c` BEFORE DELETE ON `complain_c` FOR EACH ROW BEGIN
	  INSERT INTO complain_c_log(action, 	cc_id, 	support_id, 	a_id, 	E_id, 	c_name, 	content, 	duration, 	create_date, 	modify_date  )
	  VALUES('delete',OLD.cc_id,OLD.support_id,OLD.a_id,OLD.E_id,OLD.c_name,OLD.content,OLD.duration,OLD.create_date, OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_complain_c` AFTER INSERT ON `complain_c` FOR EACH ROW BEGIN
	  INSERT INTO complain_c_log(action, 	cc_id, 	support_id, 	a_id, 	E_id, 	c_name, 	content, 	duration, 	create_date, 	modify_date  )
	  VALUES('insert',NEW.cc_id,NEW.support_id,NEW.a_id,NEW.E_id,NEW.c_name,NEW.content,NEW.duration,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_complain_c` AFTER UPDATE ON `complain_c` FOR EACH ROW BEGIN
	  INSERT INTO complain_c_log(action, 	cc_id, 	support_id, 	a_id, 	E_id, 	c_name, 	content, 	duration, 	create_date, 	modify_date  )
	  VALUES('update',NEW.cc_id,NEW.support_id,NEW.a_id,NEW.E_id,NEW.c_name,NEW.content,NEW.duration,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `complain_c_log`
--

CREATE TABLE `complain_c_log` (
  `action` varchar(20) NOT NULL,
  `cc_id` int(11) NOT NULL,
  `support_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  `E_id` int(11) NOT NULL,
  `c_name` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `duration` time NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `complain_u`
--

CREATE TABLE `complain_u` (
  `uc_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `support_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `duration` time NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `complain_u`
--
DELIMITER $$
CREATE TRIGGER `delete_complain_u` BEFORE DELETE ON `complain_u` FOR EACH ROW BEGIN
	  INSERT INTO complain_u_log(action, 		uc_id, 	user_id, 	support_id, 	content, 	duration, 	create_date, 	modify_date)
	  VALUES('delete',OLD.uc_id,OLD.user_id,OLD.support_id,OLD.content,OLD.duration,OLD.create_date, OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_complain_u` AFTER INSERT ON `complain_u` FOR EACH ROW BEGIN
	  INSERT INTO complain_u_log(action, 		uc_id, 	user_id, 	support_id, 	content, 	duration, 	create_date, 	modify_date)
	  VALUES('insert',NEW.uc_id,NEW.user_id,NEW.support_id,NEW.content,NEW.duration,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_complain_u` AFTER UPDATE ON `complain_u` FOR EACH ROW BEGIN
	  INSERT INTO complain_u_log(action, 		uc_id, 	user_id, 	support_id, 	content, 	duration, 	create_date, 	modify_date)
	  VALUES('update',NEW.uc_id,NEW.user_id,NEW.support_id,NEW.content,NEW.duration,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `complain_u_log`
--

CREATE TABLE `complain_u_log` (
  `action` varchar(20) NOT NULL,
  `uc_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `support_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `duration` time NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cuser`
--

CREATE TABLE `cuser` (
  `cuser_id` int(11) NOT NULL,
  `e_id` int(11) NOT NULL,
  `c_name` varchar(50) NOT NULL,
  `a_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuser`
--

INSERT INTO `cuser` (`cuser_id`, `e_id`, `c_name`, `a_id`, `create_date`, `modify_date`) VALUES
(86874, 323778, 'apple', 74789, '2018-07-13 11:16:50', '2018-07-13 11:19:07');

--
-- Triggers `cuser`
--
DELIMITER $$
CREATE TRIGGER `delete_cuser` BEFORE DELETE ON `cuser` FOR EACH ROW BEGIN
	  INSERT INTO cuser_log(action, cuser_id, 	e_id, 	c_name, 	a_id, 	create_date, 	modify_date )
	  VALUES('delete',OLD.cuser_id,OLD.e_id,OLD.c_name,OLD.a_id,OLD.create_date, OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_cuser` AFTER INSERT ON `cuser` FOR EACH ROW BEGIN
	  INSERT INTO cuser_log(action, cuser_id, 	e_id, 	c_name, 	a_id, 	create_date, 	modify_date )
	  VALUES('insert',NEW.cuser_id,NEW.e_id,NEW.c_name,NEW.a_id,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_cuser` AFTER UPDATE ON `cuser` FOR EACH ROW BEGIN
	  INSERT INTO cuser_log(action, cuser_id, 	e_id, 	c_name, 	a_id, 	create_date, 	modify_date )
	  VALUES('update',NEW.cuser_id,NEW.e_id,NEW.c_name,NEW.a_id,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cuser_log`
--

CREATE TABLE `cuser_log` (
  `action` varchar(20) NOT NULL,
  `cuser_id` int(11) NOT NULL,
  `e_id` int(11) NOT NULL,
  `c_name` varchar(50) NOT NULL,
  `a_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `c_phone`
--

CREATE TABLE `c_phone` (
  `C_name` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `c_phone`
--
DELIMITER $$
CREATE TRIGGER `delete_c_phone` BEFORE DELETE ON `c_phone` FOR EACH ROW BEGIN
	  INSERT INTO c_phone_log(action, 
	C_name, 	phone, 	create_date, 	modify_date )
	  VALUES('delete',OLD.C_name,OLD.phone,OLD.create_date, OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inser_c_phone` AFTER INSERT ON `c_phone` FOR EACH ROW BEGIN
	  INSERT INTO c_phone_log(action, 
	C_name, 	phone, 	create_date, 	modify_date )
	  VALUES('insert',NEW.C_name,NEW.phone,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_c_phone` AFTER UPDATE ON `c_phone` FOR EACH ROW BEGIN
	  INSERT INTO c_phone_log(action, 
	C_name, 	phone, 	create_date, 	modify_date )
	  VALUES('update',NEW.C_name,NEW.phone,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `c_phone_log`
--

CREATE TABLE `c_phone_log` (
  `action` varchar(20) NOT NULL,
  `C_name` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `D_id` int(11) NOT NULL,
  `d_name` varchar(50) NOT NULL,
  `ID_num` int(11) NOT NULL,
  `Drive_lic` int(11) NOT NULL,
  `Fathers_name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `zip` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `acount_no` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `driver`
--
DELIMITER $$
CREATE TRIGGER `delete_driver` BEFORE DELETE ON `driver` FOR EACH ROW BEGIN
	  INSERT INTO driver_log(action, 
	d_name, 	ID_num, 	Drive_lic, 	Fathers_name, 	city, 	street, 	zip, 	balance, 	status, 	acount_no, 	create_date, 	modify_date )
	  VALUES('delete',OLD.d_name,OLD.ID_num,OLD.Drive_lic,OLD.Fathers_name,OLD.city,OLD.street,OLD.balance,OLD.status,OLD.acount_no,OLD.create_date, OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_driver` AFTER INSERT ON `driver` FOR EACH ROW BEGIN
	  INSERT INTO driver_log(action, 
	d_name, 	ID_num, 	Drive_lic, 	Fathers_name, 	city, 	street, 	zip, 	balance, 	status, 	acount_no, 	create_date, 	modify_date )
	  VALUES('insert',NEW.d_name,NEW.ID_num,NEW.Drive_lic,NEW.Fathers_name,NEW.city,NEW.street,NEW.balance,NEW.status,NEW.acount_no,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_driver` AFTER UPDATE ON `driver` FOR EACH ROW BEGIN
	  INSERT INTO driver_log(action, 
	d_name, 	ID_num, 	Drive_lic, 	Fathers_name, 	city, 	street, 	zip, 	balance, 	status, 	acount_no, 	create_date, 	modify_date )
	  VALUES('update',NEW.d_name,NEW.ID_num,NEW.Drive_lic,NEW.Fathers_name,NEW.city,NEW.street,NEW.balance,NEW.status,NEW.acount_no,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `driver_log`
--

CREATE TABLE `driver_log` (
  `action` varchar(20) NOT NULL,
  `D_id` int(11) NOT NULL,
  `d_name` varchar(50) NOT NULL,
  `ID_num` int(11) NOT NULL,
  `Drive_lic` int(11) NOT NULL,
  `Fathers_name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `zip` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `acount_no` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `d_phone`
--

CREATE TABLE `d_phone` (
  `D_id` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `d_phone`
--
DELIMITER $$
CREATE TRIGGER `delete_d_phone` BEFORE DELETE ON `d_phone` FOR EACH ROW BEGIN
	  INSERT INTO d_phone_log(action, 
	d_id, 	phone, 	create_date, 	modify_date )
	  VALUES('delete',OLD.d_id,OLD.phone,OLD.create_date, OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_d_phone` AFTER INSERT ON `d_phone` FOR EACH ROW BEGIN
	  INSERT INTO d_phone_log(action, 
	d_id, 	phone, 	create_date, 	modify_date )
	  VALUES('insert',NEW.d_id,NEW.phone,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_d_phone` AFTER UPDATE ON `d_phone` FOR EACH ROW BEGIN
	  INSERT INTO d_phone_log(action, 
	d_id, 	phone, 	create_date, 	modify_date )
	  VALUES('update',NEW.d_id,NEW.phone,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `d_phone_log`
--

CREATE TABLE `d_phone_log` (
  `action` varchar(20) NOT NULL,
  `D_id` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `E_id` int(11) NOT NULL,
  `e_name` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`E_id`, `e_name`, `status`, `create_date`, `modify_date`) VALUES
(323778, 'gholi gholizadeh', 'verified', '2018-07-13 11:21:07', '0000-00-00 00:00:00'),
(549795, 'john ford', 'verified', '2018-07-25 19:30:00', '2018-07-14 16:25:18');

--
-- Triggers `employee`
--
DELIMITER $$
CREATE TRIGGER `delete_employee` BEFORE DELETE ON `employee` FOR EACH ROW BEGIN
	  INSERT INTO employee_log(action, 
	E_id, 	e_name, 	status, 	create_date, 	modify_date  )
	  VALUES('delete',OLD.E_id,OLD.e_name,OLD.status,OLD.create_date, OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_employee` AFTER INSERT ON `employee` FOR EACH ROW BEGIN
	  INSERT INTO employee_log(action, 
	E_id, 	e_name, 	status, 	create_date, 	modify_date  )
	  VALUES('insert',NEW.E_id,NEW.e_name,NEW.status,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_employee` AFTER UPDATE ON `employee` FOR EACH ROW BEGIN
	  INSERT INTO employee_log(action, 
	E_id, 	e_name, 	status, 	create_date, 	modify_date  )
	  VALUES('update',NEW.E_id,NEW.e_name,NEW.status,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_log`
--

CREATE TABLE `employee_log` (
  `action` varchar(20) NOT NULL,
  `E_id` int(11) NOT NULL,
  `e_name` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_log`
--

INSERT INTO `employee_log` (`action`, `E_id`, `e_name`, `status`, `create_date`, `modify_date`) VALUES
('insert', 549765, 'john kane', 'verified', '2018-07-25 19:30:00', '0000-00-00 00:00:00'),
('update', 549795, 'john ford', 'verified', '2018-07-25 19:30:00', '2018-07-14 16:25:18');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `P_id` int(11) NOT NULL,
  `Source` varchar(50) NOT NULL,
  `Dest` varchar(50) NOT NULL,
  `P_name` varchar(50) NOT NULL,
  `ID_num` int(11) NOT NULL,
  `Reserve_stat` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `passenger`
--
DELIMITER $$
CREATE TRIGGER `delete_passenger` BEFORE DELETE ON `passenger` FOR EACH ROW BEGIN
	  INSERT INTO passenger_log(action, 
		P_id, 	Source, 	Dest, 	P_name, 	ID_num, 	Reserve_stat, 	create_date, 	modify_date )
	  VALUES('delete',OLD.P_id,OLD.Source,OLD.Dest,OLD.P_name,OLD.ID_num,OLD.Reserve_stat,OLD.create_date,OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_passenger` AFTER INSERT ON `passenger` FOR EACH ROW BEGIN
	  INSERT INTO passenger_log(action, 
		P_id, 	Source, 	Dest, 	P_name, 	ID_num, 	Reserve_stat, 	create_date, 	modify_date )
	  VALUES('insert',NEW.P_id,NEW.Source,NEW.Dest,NEW.P_name,NEW.ID_num,NEW.Reserve_stat,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_passenger` AFTER UPDATE ON `passenger` FOR EACH ROW BEGIN
	  INSERT INTO passenger_log(action, 
		P_id, 	Source, 	Dest, 	P_name, 	ID_num, 	Reserve_stat, 	create_date, 	modify_date )
	  VALUES('update',NEW.P_id,NEW.Source,NEW.Dest,NEW.P_name,NEW.ID_num,NEW.Reserve_stat,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `passenger_log`
--

CREATE TABLE `passenger_log` (
  `action` varchar(20) NOT NULL,
  `P_id` int(11) NOT NULL,
  `Source` varchar(50) NOT NULL,
  `Dest` varchar(50) NOT NULL,
  `P_name` varchar(50) NOT NULL,
  `ID_num` int(11) NOT NULL,
  `Reserve_stat` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `Train_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `arival_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `departure_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`Train_id`, `station_id`, `arival_time`, `departure_time`, `create_date`, `modify_date`) VALUES
(876869, 22, '2018-07-18 01:30:00', '0000-00-00 00:00:00', '2018-07-13 12:08:42', '0000-00-00 00:00:00'),
(876869, 23, '2018-07-19 02:30:00', '0000-00-00 00:00:00', '2018-07-13 12:09:05', '0000-00-00 00:00:00'),
(876869, 24, '2018-07-17 01:30:00', '0000-00-00 00:00:00', '2018-07-13 12:08:42', '0000-00-00 00:00:00');

--
-- Triggers `route`
--
DELIMITER $$
CREATE TRIGGER `delete_route` BEFORE DELETE ON `route` FOR EACH ROW BEGIN
	  INSERT INTO route_log(action, 
		 Train_id, 	station_id, 	arival_time, 	departure_time, 	create_date, 	modify_date )
	  VALUES('delete',OLD.Train_id,OLD.station_id,OLD.arival_time,OLD.departure_time,OLD.create_date,OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_route` AFTER INSERT ON `route` FOR EACH ROW BEGIN
	  INSERT INTO route_log(action, 
		 Train_id, 	station_id, 	arival_time, 	departure_time, 	create_date, 	modify_date )
	  VALUES('insert',NEW.Train_id,NEW.station_id,NEW.arival_time,NEW.departure_time,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_route` AFTER UPDATE ON `route` FOR EACH ROW BEGIN
	  INSERT INTO route_log(action, 
		 Train_id, 	station_id, 	arival_time, 	departure_time, 	create_date, 	modify_date )
	  VALUES('update',NEW.Train_id,NEW.station_id,NEW.arival_time,NEW.departure_time,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `route_log`
--

CREATE TABLE `route_log` (
  `action` varchar(20) NOT NULL,
  `Train_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `arival_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `departure_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `Station_id` int(11) NOT NULL,
  `s_name` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`Station_id`, `s_name`, `create_date`, `modify_date`) VALUES
(22, 'neyshabour', '2018-07-13 11:57:51', '0000-00-00 00:00:00'),
(23, 'emamreza', '2018-07-13 11:57:19', '0000-00-00 00:00:00'),
(24, 'sadeghie', '2018-07-13 11:57:19', '0000-00-00 00:00:00');

--
-- Triggers `station`
--
DELIMITER $$
CREATE TRIGGER `delete_station` BEFORE DELETE ON `station` FOR EACH ROW BEGIN
	  INSERT INTO station_log(action, 
		  Station_id, 	s_name, 	create_date, 	modify_date)
	  VALUES('delete',OLD.Station_id,OLD.s_name,OLD.create_date,OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_station` AFTER INSERT ON `station` FOR EACH ROW BEGIN
	  INSERT INTO station_log(action, 
		  Station_id, 	s_name, 	create_date, 	modify_date)
	  VALUES('insert',NEW.Station_id,NEW.s_name,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_station` AFTER UPDATE ON `station` FOR EACH ROW BEGIN
	  INSERT INTO station_log(action, 
		  Station_id, 	s_name, 	create_date, 	modify_date)
	  VALUES('update',NEW.Station_id,NEW.s_name,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `station_log`
--

CREATE TABLE `station_log` (
  `action` varchar(20) NOT NULL,
  `Station_id` int(11) NOT NULL,
  `s_name` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supporter`
--

CREATE TABLE `supporter` (
  `Support_id` int(11) NOT NULL,
  `support_name` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `last_online` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `supporter`
--
DELIMITER $$
CREATE TRIGGER `delete_supporter` BEFORE DELETE ON `supporter` FOR EACH ROW BEGIN
	  INSERT INTO supporter_log(action, 
		  Support_id, 	support_name, 	status, 	last_online, 	create_date, 	modify_date)
	  VALUES('delete',OLD.Support_id,OLD.support_name,OLD.status,OLD.last_online,OLD.create_date,OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_supporter` AFTER INSERT ON `supporter` FOR EACH ROW BEGIN
	  INSERT INTO supporter_log(action, 
		  Support_id, 	support_name, 	status, 	last_online, 	create_date, 	modify_date)
	  VALUES('insert',NEW.Support_id,NEW.support_name,NEW.status,NEW.last_online,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_supporter` AFTER UPDATE ON `supporter` FOR EACH ROW BEGIN
	  INSERT INTO supporter_log(action, 
		  Support_id, 	support_name, 	status, 	last_online, 	create_date, 	modify_date)
	  VALUES('update',NEW.Support_id,NEW.support_name,NEW.status,NEW.last_online,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supporter_log`
--

CREATE TABLE `supporter_log` (
  `action` varchar(20) NOT NULL,
  `Support_id` int(11) NOT NULL,
  `support_name` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `last_online` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `Train_id` int(11) NOT NULL,
  `D_id` int(11) NOT NULL,
  `start` varchar(50) NOT NULL,
  `end` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`Train_id`, `D_id`, `start`, `end`, `create_date`, `modify_date`) VALUES
(876869, 323, 'sadeghie', 'emamreza', '2018-07-13 11:56:38', '0000-00-00 00:00:00');

--
-- Triggers `train`
--
DELIMITER $$
CREATE TRIGGER `delete_train` BEFORE DELETE ON `train` FOR EACH ROW BEGIN
	  INSERT INTO train_log(action, 
	Train_id, 	D_id, 	start, 	end ,	create_date, 	modify_date )
	  VALUES('delete',OLD.Train_id,OLD.D_id,OLD.start,OLD.end,OLD.create_date,OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_train` AFTER INSERT ON `train` FOR EACH ROW BEGIN
	  INSERT INTO train_log(action, 
	Train_id, 	D_id, 	start, 	end ,	create_date, 	modify_date )
	  VALUES('insert',NEW.Train_id,NEW.D_id,NEW.start,NEW.end,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_train` AFTER UPDATE ON `train` FOR EACH ROW BEGIN
	  INSERT INTO train_log(action, 
	Train_id, 	D_id, 	start, 	end ,	create_date, 	modify_date )
	  VALUES('update',NEW.Train_id,NEW.D_id,NEW.start,NEW.end,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `train_log`
--

CREATE TABLE `train_log` (
  `action` varchar(20) NOT NULL,
  `Train_id` int(11) NOT NULL,
  `D_id` int(11) NOT NULL,
  `start` varchar(50) NOT NULL,
  `end` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `follow_id` int(11) NOT NULL,
  `support_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `transfer`
--
DELIMITER $$
CREATE TRIGGER `delete_transfer` BEFORE DELETE ON `transfer` FOR EACH ROW BEGIN
	  INSERT INTO transfer_log(action, 
	follow_id, 	support_id, 	d_id, 	date, 	amount, 	create_date, 	modify_date )
	  VALUES('delete',OLD.follow_id,OLD.support_id,OLD.d_id,OLD.date,OLD.amount,OLD.create_date,OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_transfer` AFTER INSERT ON `transfer` FOR EACH ROW BEGIN
	  INSERT INTO transfer_log(action, 
	follow_id, 	support_id, 	d_id, 	date, 	amount, 	create_date, 	modify_date )
	  VALUES('insert',NEW.follow_id,NEW.support_id,NEW.d_id,NEW.date,NEW.amount,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_transfer` AFTER UPDATE ON `transfer` FOR EACH ROW BEGIN
	  INSERT INTO transfer_log(action, 
	follow_id, 	support_id, 	d_id, 	date, 	amount, 	create_date, 	modify_date )
	  VALUES('update',NEW.follow_id,NEW.support_id,NEW.d_id,NEW.date,NEW.amount,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_log`
--

CREATE TABLE `transfer_log` (
  `action` varchar(20) NOT NULL,
  `follow_id` int(11) NOT NULL,
  `support_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_id` int(11) NOT NULL,
  `Balance` int(11) NOT NULL,
  `U_name` varchar(50) NOT NULL,
  `ID_num` int(11) NOT NULL,
  `Fathers_name` varchar(50) NOT NULL,
  `P_birth` varchar(50) NOT NULL,
  `D_birth` date NOT NULL,
  `acount_num` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `zip` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_id`, `Balance`, `U_name`, `ID_num`, `Fathers_name`, `P_birth`, `D_birth`, `acount_num`, `city`, `street`, `zip`, `create_date`, `modify_date`) VALUES
(8548, 25000, 'jack jackson', 340971846, 'john', 'london', '1968-02-19', 973419432, 'tehran', 'valiasr', 3242, '2018-07-13 11:11:50', '0000-00-00 00:00:00');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `delete_user` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
	  INSERT INTO user_log(action, 
	User_id, 	Balance, 	U_name, 	ID_num, 	Fathers_name, 	P_birth, 	D_birth, 	acount_num, 	city, 	street, 	zip, 	create_date, 	modify_date  )
	  VALUES('delete',OLD.User_id,OLD.Balance,OLD.U_name,OLD.ID_num,OLD.Fathers_name,OLD.P_birth
             ,OLD.acount_num,OLD.city,OLD.street,OLD.zip,OLD.create_date,OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_user` AFTER INSERT ON `user` FOR EACH ROW BEGIN
	  INSERT INTO user_log(action, 
	User_id, 	Balance, 	U_name, 	ID_num, 	Fathers_name, 	P_birth, 	D_birth, 	acount_num, 	city, 	street, 	zip, 	create_date, 	modify_date  )
	  VALUES('insert',NEW.User_id,NEW.Balance,NEW.U_name,NEW.ID_num,NEW.Fathers_name,NEW.P_birth
             ,NEW.acount_num,NEW.city,NEW.street,NEW.zip,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_user` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
	  INSERT INTO user_log(action, 
	User_id, 	Balance, 	U_name, 	ID_num, 	Fathers_name, 	P_birth, 	D_birth, 	acount_num, 	city, 	street, 	zip, 	create_date, 	modify_date  )
	  VALUES('update',NEW.User_id,NEW.Balance,NEW.U_name,NEW.ID_num,NEW.Fathers_name,NEW.P_birth
             ,NEW.acount_num,NEW.city,NEW.street,NEW.zip,NEW.create_date,NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `action` varchar(20) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Balance` int(11) NOT NULL,
  `U_name` varchar(50) NOT NULL,
  `ID_num` int(11) NOT NULL,
  `Fathers_name` varchar(50) NOT NULL,
  `P_birth` varchar(50) NOT NULL,
  `D_birth` date NOT NULL,
  `acount_num` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `zip` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `u_phone`
--

CREATE TABLE `u_phone` (
  `user_id` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `u_phone`
--
DELIMITER $$
CREATE TRIGGER `delete_u_phone` BEFORE DELETE ON `u_phone` FOR EACH ROW BEGIN
	  INSERT INTO u_phone_log(action, 
	user_id, 	phone, 	create_date, 	modify_date )
	  VALUES('delete',OLD.user_id,OLD.phone,OLD.create_date, OLD.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_u_phone` AFTER INSERT ON `u_phone` FOR EACH ROW BEGIN
	  INSERT INTO u_phone_log(action, 
	user_id, 	phone, 	create_date, 	modify_date )
	  VALUES('insert',NEW.user_id,NEW.phone,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_u_phone` AFTER UPDATE ON `u_phone` FOR EACH ROW BEGIN
	  INSERT INTO u_phone_log(action, 
	user_id, 	phone, 	create_date, 	modify_date )
	  VALUES('update',NEW.user_id,NEW.phone,NEW.create_date, NEW.modify_date);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `u_phone_log`
--

CREATE TABLE `u_phone_log` (
  `action` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `book_c`
--
ALTER TABLE `book_c`
  ADD PRIMARY KEY (`ref_num`);

--
-- Indexes for table `book_u`
--
ALTER TABLE `book_u`
  ADD PRIMARY KEY (`ref_num`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`C_name`);

--
-- Indexes for table `complain_c`
--
ALTER TABLE `complain_c`
  ADD PRIMARY KEY (`cc_id`);

--
-- Indexes for table `complain_u`
--
ALTER TABLE `complain_u`
  ADD PRIMARY KEY (`uc_id`);

--
-- Indexes for table `cuser`
--
ALTER TABLE `cuser`
  ADD PRIMARY KEY (`cuser_id`);

--
-- Indexes for table `c_phone`
--
ALTER TABLE `c_phone`
  ADD PRIMARY KEY (`C_name`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`D_id`);

--
-- Indexes for table `d_phone`
--
ALTER TABLE `d_phone`
  ADD PRIMARY KEY (`D_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`E_id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`P_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`Train_id`,`station_id`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`Station_id`);

--
-- Indexes for table `supporter`
--
ALTER TABLE `supporter`
  ADD PRIMARY KEY (`Support_id`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`Train_id`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`follow_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`);

--
-- Indexes for table `u_phone`
--
ALTER TABLE `u_phone`
  ADD PRIMARY KEY (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
