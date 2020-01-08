-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- picaboodb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `picaboodb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `picaboodb`;

-- 테이블 picaboodb.address 구조 내보내기
CREATE TABLE IF NOT EXISTS `address` (
  `address_no` int(11) NOT NULL AUTO_INCREMENT,
  `road_address` varchar(500) NOT NULL COMMENT '도로명 주소',
  `jibun_address` varchar(500) NOT NULL COMMENT '지번 주소',
  `detail_address` varchar(500) NOT NULL COMMENT '상세주소',
  `postcode` varchar(500) NOT NULL COMMENT '우편번호',
  PRIMARY KEY (`address_no`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.address:~3 rows (대략적) 내보내기
DELETE FROM `address`;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;

-- 테이블 picaboodb.admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin` (
  `admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.admin:~0 rows (대략적) 내보내기
DELETE FROM `admin`;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 테이블 picaboodb.cancel_food_reservation 구조 내보내기
CREATE TABLE IF NOT EXISTS `cancel_food_reservation` (
  `food_no` int(11) NOT NULL,
  `reservation_count` int(11) NOT NULL,
  `reservation_date` datetime NOT NULL,
  `customer_no` int(11) DEFAULT NULL,
  `customer_name` int(11) DEFAULT NULL,
  PRIMARY KEY (`food_no`),
  CONSTRAINT `FK_food_reservation_food` FOREIGN KEY (`food_no`) REFERENCES `food` (`food_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.cancel_food_reservation:~0 rows (대략적) 내보내기
DELETE FROM `cancel_food_reservation`;
/*!40000 ALTER TABLE `cancel_food_reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancel_food_reservation` ENABLE KEYS */;

-- 테이블 picaboodb.cancel_seat_reservation 구조 내보내기
CREATE TABLE IF NOT EXISTS `cancel_seat_reservation` (
  `franchisee_no` varchar(50) NOT NULL,
  `seat_no` varchar(50) NOT NULL,
  `customer_no` varchar(50) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `reservation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 picaboodb.cancel_seat_reservation:~0 rows (대략적) 내보내기
DELETE FROM `cancel_seat_reservation`;
/*!40000 ALTER TABLE `cancel_seat_reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancel_seat_reservation` ENABLE KEYS */;

-- 테이블 picaboodb.customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_no` varchar(50) NOT NULL,
  `address_no` int(11) NOT NULL,
  `customer_id` varchar(50) NOT NULL,
  `customer_pw` varchar(50) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_birth` varchar(50) NOT NULL,
  `customer_gender` enum('M','F') DEFAULT NULL,
  `customer_email` varchar(50) DEFAULT NULL,
  `customer_phone` varchar(50) DEFAULT NULL,
  `customer_type` enum('C','O') NOT NULL,
  PRIMARY KEY (`customer_no`),
  KEY `FK_customer_address` (`address_no`),
  CONSTRAINT `FK_customer_address` FOREIGN KEY (`address_no`) REFERENCES `address` (`address_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.customer:~2 rows (대략적) 내보내기
DELETE FROM `customer`;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- 테이블 picaboodb.customer_qna 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer_qna` (
  `qna_no` int(11) NOT NULL AUTO_INCREMENT,
  `customer_no` varchar(50) NOT NULL,
  `qna_type` varchar(50) NOT NULL,
  `qna_title` varchar(50) NOT NULL,
  `qna_question` varchar(500) NOT NULL,
  `qna_answer` varchar(500) DEFAULT NULL,
  `qna_date` datetime DEFAULT NULL,
  `customer_mail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`qna_no`),
  KEY `FK_franchisee_qna_customer` (`customer_no`),
  CONSTRAINT `customer_qna_ibfk_1` FOREIGN KEY (`customer_no`) REFERENCES `customer` (`customer_no`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 picaboodb.customer_qna:~0 rows (대략적) 내보내기
DELETE FROM `customer_qna`;
/*!40000 ALTER TABLE `customer_qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_qna` ENABLE KEYS */;

-- 테이블 picaboodb.customer_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer_seq` (
  `seq_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.customer_seq:~1 rows (대략적) 내보내기
DELETE FROM `customer_seq`;
/*!40000 ALTER TABLE `customer_seq` DISABLE KEYS */;
INSERT INTO `customer_seq` (`seq_no`) VALUES
	('0000000');
/*!40000 ALTER TABLE `customer_seq` ENABLE KEYS */;

-- 테이블 picaboodb.del_customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `del_customer` (
  `customer_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.del_customer:~1 rows (대략적) 내보내기
DELETE FROM `del_customer`;
/*!40000 ALTER TABLE `del_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `del_customer` ENABLE KEYS */;

-- 테이블 picaboodb.del_customer_qna 구조 내보내기
CREATE TABLE IF NOT EXISTS `del_customer_qna` (
  `qna_no` int(11) NOT NULL AUTO_INCREMENT,
  `customer_no` varchar(50) NOT NULL,
  `qna_type` varchar(50) NOT NULL,
  `qna_title` varchar(50) NOT NULL,
  `qna_question` varchar(500) NOT NULL,
  `qna_answer` varchar(500) DEFAULT NULL,
  `qna_date` datetime DEFAULT NULL,
  PRIMARY KEY (`qna_no`),
  KEY `FK_franchisee_qna_customer` (`customer_no`),
  CONSTRAINT `del_customer_qna_ibfk_1` FOREIGN KEY (`customer_no`) REFERENCES `customer` (`customer_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 picaboodb.del_customer_qna:~0 rows (대략적) 내보내기
DELETE FROM `del_customer_qna`;
/*!40000 ALTER TABLE `del_customer_qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `del_customer_qna` ENABLE KEYS */;

-- 테이블 picaboodb.del_food_reservation 구조 내보내기
CREATE TABLE IF NOT EXISTS `del_food_reservation` (
  `food_reservation_no` int(11) NOT NULL AUTO_INCREMENT,
  `food_no` int(11) NOT NULL,
  `reservation_count` int(11) NOT NULL,
  `reservation_date` datetime NOT NULL,
  `customer_no` varchar(50) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL COMMENT 'naver name',
  PRIMARY KEY (`food_reservation_no`),
  KEY `FK` (`food_no`),
  CONSTRAINT `del_food_reservation_ibfk_1` FOREIGN KEY (`food_no`) REFERENCES `food` (`food_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 picaboodb.del_food_reservation:~0 rows (대략적) 내보내기
DELETE FROM `del_food_reservation`;
/*!40000 ALTER TABLE `del_food_reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `del_food_reservation` ENABLE KEYS */;

-- 테이블 picaboodb.del_franchisee_qna 구조 내보내기
CREATE TABLE IF NOT EXISTS `del_franchisee_qna` (
  `qna_no` int(11) NOT NULL AUTO_INCREMENT,
  `customer_no` varchar(50) NOT NULL,
  `qna_type` varchar(50) NOT NULL,
  `qna_title` varchar(50) NOT NULL,
  `qna_question` varchar(500) NOT NULL,
  `qna_answer` varchar(500) DEFAULT NULL,
  `qna_date` datetime DEFAULT NULL,
  PRIMARY KEY (`qna_no`),
  KEY `FK_franchisee_qna_customer` (`customer_no`),
  CONSTRAINT `del_franchisee_qna_ibfk_1` FOREIGN KEY (`customer_no`) REFERENCES `customer` (`customer_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 picaboodb.del_franchisee_qna:~0 rows (대략적) 내보내기
DELETE FROM `del_franchisee_qna`;
/*!40000 ALTER TABLE `del_franchisee_qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `del_franchisee_qna` ENABLE KEYS */;

-- 테이블 picaboodb.del_seat_reservation 구조 내보내기
CREATE TABLE IF NOT EXISTS `del_seat_reservation` (
  `seat_reservation_no` int(11) NOT NULL,
  `franchisee_no` varchar(50) NOT NULL,
  `seat_no` varchar(50) NOT NULL,
  `customer_no` varchar(50) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `reservation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 picaboodb.del_seat_reservation:~0 rows (대략적) 내보내기
DELETE FROM `del_seat_reservation`;
/*!40000 ALTER TABLE `del_seat_reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `del_seat_reservation` ENABLE KEYS */;

-- 테이블 picaboodb.food 구조 내보내기
CREATE TABLE IF NOT EXISTS `food` (
  `food_no` int(11) NOT NULL AUTO_INCREMENT,
  `franchisee_no` varchar(50) NOT NULL,
  `food_name` varchar(50) NOT NULL,
  `food_category` enum('Snack','Drink','Dessert','Noodle','Meal') NOT NULL,
  `food_price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`food_no`),
  KEY `FK_food_franchisee` (`franchisee_no`),
  CONSTRAINT `FK_food_franchisee` FOREIGN KEY (`franchisee_no`) REFERENCES `franchisee` (`franchisee_no`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.food:~0 rows (대략적) 내보내기
DELETE FROM `food`;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
/*!40000 ALTER TABLE `food` ENABLE KEYS */;

-- 테이블 picaboodb.food_pic 구조 내보내기
CREATE TABLE IF NOT EXISTS `food_pic` (
  `food_no` int(11) NOT NULL DEFAULT 0,
  `file_name` varchar(500) NOT NULL,
  `extension` varchar(50) NOT NULL,
  `content_type` varchar(500) NOT NULL,
  `size` bigint(20) NOT NULL,
  `origin_name` varchar(500) NOT NULL,
  PRIMARY KEY (`food_no`),
  CONSTRAINT `FK_franchisee_pic_copy_food` FOREIGN KEY (`food_no`) REFERENCES `food` (`food_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 picaboodb.food_pic:~0 rows (대략적) 내보내기
DELETE FROM `food_pic`;
/*!40000 ALTER TABLE `food_pic` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_pic` ENABLE KEYS */;

-- 테이블 picaboodb.food_reservation 구조 내보내기
CREATE TABLE IF NOT EXISTS `food_reservation` (
  `food_reservation_no` int(11) NOT NULL AUTO_INCREMENT,
  `food_no` int(11) NOT NULL,
  `reservation_count` int(11) NOT NULL,
  `reservation_date` datetime NOT NULL,
  `customer_no` varchar(50) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`food_reservation_no`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 picaboodb.food_reservation:~0 rows (대략적) 내보내기
DELETE FROM `food_reservation`;
/*!40000 ALTER TABLE `food_reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_reservation` ENABLE KEYS */;

-- 테이블 picaboodb.franchisee 구조 내보내기
CREATE TABLE IF NOT EXISTS `franchisee` (
  `franchisee_no` varchar(50) NOT NULL,
  `address_no` int(11) DEFAULT NULL,
  `franchisee_crn` varchar(50) DEFAULT NULL COMMENT '사업자 등록증',
  `franchisee_name` varchar(50) DEFAULT NULL COMMENT '상호명',
  `franchisee_phone` varchar(50) DEFAULT NULL,
  `owner_no` varchar(50) NOT NULL COMMENT '가맹점주, O로 시작',
  PRIMARY KEY (`franchisee_no`),
  KEY `FK_franchisee_customer` (`owner_no`),
  KEY `FK_franchisee_address` (`address_no`),
  CONSTRAINT `FK_franchisee_address` FOREIGN KEY (`address_no`) REFERENCES `address` (`address_no`),
  CONSTRAINT `FK_franchisee_customer` FOREIGN KEY (`owner_no`) REFERENCES `customer` (`customer_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.franchisee:~1 rows (대략적) 내보내기
DELETE FROM `franchisee`;
/*!40000 ALTER TABLE `franchisee` DISABLE KEYS */;
/*!40000 ALTER TABLE `franchisee` ENABLE KEYS */;

-- 테이블 picaboodb.franchisee_faq 구조 내보내기
CREATE TABLE IF NOT EXISTS `franchisee_faq` (
  `faq_no` int(11) NOT NULL AUTO_INCREMENT,
  `faq_title` varchar(50) DEFAULT NULL,
  `faq_content` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`faq_no`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.franchisee_faq:~37 rows (대략적) 내보내기
DELETE FROM `franchisee_faq`;
/*!40000 ALTER TABLE `franchisee_faq` DISABLE KEYS */;
INSERT INTO `franchisee_faq` (`faq_no`, `faq_title`, `faq_content`) VALUES
	(11, '본인인증은 어떻게 할 수 있나요?', '간편 회원가입하셨다면 본인인증이 필요한 기능(PC방 로그인, 게임대회 참여 등)을 사용하실 때 본인인증 절차에 따라서 진행하실 수 있습니다. '),
	(12, '2개 이상 PC방 연동 시 잔여정액은 어떻게 되나요?', '2개 이상 PC방 연동 시 각각 매장에서 사용중이던 잔여정액 시간이 피카플레이 계정 하나에 모두 저장되어 PC방 별로 잔여정액 시간을 확인할 수 있고 사용할 수 있습니다. '),
	(13, 'PC방에 직접 문의하려면 어떻게 해야 하나요?', '문의하고 싶은 매장 상세페이지에서 전화연결을 통해 해당 매장에 직접 문의할 수 있습니다. '),
	(14, '신고는 어떻게 하나요?', '매장 리뷰나 게시물 댓글에 이용 목적과 부합하지 않는 내용은 리뷰, 댓글 내용 오른쪽에 신고 기능을 이용하여 신고할 수 있습니다. '),
	(15, '매장 리뷰는 어떻게 작성할 수 있나요?', '피카플레이 아이디를 이용해서 PC방 이용 후 해당 매장의 상세 페이지에서 작성할 수 있습니다. '),
	(16, '미성년자도 사용할 수 있나요?', '피카플레이 앱은 미성년자도 사용이 가능합니다. 단 밤 10시 이후 PC방 예약, 스마트로그인 등의 기능은 사용할 수 없습니다. '),
	(17, '피카플레이를 사용할 수 없는 매장은 뭔가요?', '피카플레이 앱은 가맹이 된 매장에서만 사용이 가능합니다. 미 가맹 매장의 경우 피카플레이 서비스를 이용할 수 없습니다. '),
	(18, '최신 버전 업데이트가 되지 않아요', '피카플레이가 지원하는 버전 OS는 Android 4.4.2 이상, iOS 8 이상으로 기준 OS 이하의 단말기의 경우 업데이트가 불가합니다. OS를 업데이트 후 이용 부탁 드립니다. '),
	(19, 'PC방 연동이 뭔가요?', '자주 방문하는 PC방에 방문하여 피카플레이 앱과 PC방을 연결하여 이후 해당 매장에서 스마트로그인, PC방 좌석 예약 기능을 사용할 수 있습니다. '),
	(20, '자주가는 PC방을 등록할 수 있나요?', '자주가는 PC방의 상세페이지에서 즐겨찾기(☆) 아이콘을 이용하여 즐겨 찾는 PC방으로 등록할 수 있습니다. 즐겨 찾기 등록한 PC방은 [즐겨 찾기 매장] 에서 확인할 수 있습니다. '),
	(21, '어제까지 검색되었던 PC방이 사라졌어요', 'PC방의 사정으로 인해 가맹이 종료되었을 경우 해당 매장의 정보가 확인되지 않습니다. 재 가맹 시 PC방 정보 확인이 가능합니다. '),
	(22, 'PC방 정보가 사실과 달라요', '피카플레이의 PC방 정보는 해당 PC방에서 제공한 정보로만 등록이되며 해당 PC방의 사정에 따라서 사전 고지 없이 변경 될 수 있음을 알려드립니다. 잘못된 정보는 1:1문의 또는 해당 매장의 정보수정 요청란으로 알려주시면 확인 후 수정하도록 하겠습니다. '),
	(23, '피카플레이는 어떤 서비스인가요?', '피카플레이는 전국의 피카 PC방을 앱 하나로 편리하게 찾고 정보를 얻고 예약까지 할 수 있는 PC방 플랫폼 서비스 입니다. 사용자 주변 검색, 키워드 검색 가능하며 PC방의 게임대회 참여도 앱을 통해 쉽고 간편하게 할 수 있습니다. 이제 PC방을 이용할 땐 피카플레이와 함께하세요. '),
	(24, '#피카플레이 아이디로 로그인이 되지 않아요.', '기존의 #로그인 방식에서 피카플레이 탭 선택 후 로그인하는 방식으로 개선되었습니다. 손님PC 잠김화면에서 피카플레이 선택 후 #없이 피카플레이 아이디/비밀번호 입력하여 로그인이 가능합니다. '),
	(25, '탈퇴 후 동일한 아이디로 재가입이 가능한가요?', '아니요. 회원탈퇴 후 동일한 아이디로 가입할 수 없는 점 유의하시기 바랍니다. '),
	(27, '본인명의의 휴대폰이 없으면 인증회원이 될 수 없나요?', '통신사 본인인증을 통해 인증된 아이디로 전환이 되기 때문에 본인명의의 휴대폰이 없다면 인증회원이 될 수 없습니다. '),
	(28, '여러 개의 아이디를 만들 수 있나요?', '전화번호 인증이 가능하다면 여러 개의 아이디를 생성할 순 있지만 인증된 아이디는 하나만 생성이 가능합니다'),
	(29, 'SNS 간편 로그인은 왜 회원정보를 받나요?', 'SNS 간편 로그인이라 하더라도 앱의 주요 기능인 PC방 예약 및 피카플레이 아이디로 PC방 로그인 시 게임대회 참여 시 회원정보가 필요하기 때문입니다. '),
	(30, '앱을 이용한 스마트 로그인이 안되요', '사용하실 PC의 인증번호 및 QR코드를 이용한 로그인이 되지 않을 경우 1:1문의 및 고객센터로 연락해 주시면 확인 후 수정하겠습니다. 급하게 PC를 이용해야 한다면 체크박스 선택 후 로그인하여 PC를 사용하거나 기존의 매장 아이디로 로그인하여 PC를 사용할 수 있습니다. '),
	(31, '피카플레이 아이디로 PC방에서 로그인이 안되요', 'PC방 좌석에서 로그인 시 체크박스 선택 후  피카플레이 아이디로 로그인을 해보세요. 이후에도 되지 않는다면 1:1문의나 고객센터로 문의해 주세요. '),
	(32, '스마트 로그인이 뭔가요?', '피카플레이 앱과 연동된 PC방에 한해서 인증번호 로그인, QR코드 로그인을 할 수 있는 기능 입니다. '),
	(33, '예약한 PC를 다른 사람이 이용할 수 있나요?', '아니요. 앱을 통해 PC를 예약 시 바로 사용시작이 되더라도 예약 잠김화면으로 전환되어 예약자가 직접 방문하여 로그인 후 정상적으로 PC사용이 가능합니다. '),
	(34, '예약 시간을 정할 수 있나요?', '아니요. PC방 특성상 예약 시간을 정하여 예약할 수 없으며 앱을 통한 예약 시도 시 예약 완료 즉시 PC방 사용이 시작됩니다. '),
	(35, 'PC방 예약은 어떻게 하나요?', '자주 방문하는 PC방을 방문하여 앱과 PC방을 연동한 후 앱에서 간편하게 좌석을 예약하여 사용할 수 있습니다'),
	(36, '직접 위치를 설정해서 PC방을 찾을 수 있나요?', '내 주변 위치가 아니더라도 지역별, 지하철 역 별로 검색이 가능하며, 이외의 지역은 지도 검색을 이용하여 원하는 위치를 설정 후 검색이 가능합니다. '),
	(37, '휴대폰 번호를 변경하고 싶어요', '[내정보 -> 회원정보 수정]에서 통신사 본인인증 후 변경이 가능합니다. '),
	(38, '닉네임은 왜 설정하는 건가요?', '닉네임으로 매장 리뷰 및 영상 댓글 서비스를 이용할 수 있으며 닉네임은 회원정보 수정에서 변경이 가능합니다'),
	(39, '회원탈퇴는 어떻게 하나요?', '오른쪽 상단의 [내정보 -> 회원정보 수정 -> 회원탈퇴]에서 기존 비밀번호 입력 및 유의사항 동의 후 회원탈퇴를 할 수 있습니다. '),
	(40, '비밀번호를 바꾸고 싶어요', '오른쪽 상단의 [내정보 -> 회원정보 수정 -> 비밀번호 변경]에서 기존 비밀번호와 새 비밀번호 입력 후 변경이 가능합니다. '),
	(41, '당첨자 발표는 어디서 확인할 수 있나요?', '종료된 이벤트에서 당첨자에 대해서 확인할 수 있으며 간혹 공지사항을 통해서 당첨자 발표를 진행할 수 있습니다. '),
	(42, '이벤트는 어떻게 참여하나요?', '피카플레이 앱의 경우 오른쪽 상단의 [메뉴 -> 이벤트]에서 웹의 경우 [고객센터 -> 이벤트] 에서 참여하고 싶은 이벤트를 살펴 본 후 이벤트 상세 페이지 안내에 따라서 참여할 수 있습니다. '),
	(43, '당일날 대회에 참가하지 못하면 어떻게 되나요?', '게임대회 운영 정책에 따라 패널티가 주어집니다. '),
	(44, '같은 대회 중복 참여는 안되나요?', '게임대회 운영 정책 상 같은대회 중복 참여는 불가능합니다. '),
	(45, '공개팀과 비공개 팀의 차이가 뭔가요?', '공개팀의 경우는 팀장의 승인 없이 팀에 참여가 가능합니다. 비공개 팀은 참가신청 후 팀장이 승인하여야 팀에 참여가 가능합니다. '),
	(46, '대회 참가 신청 후 참가취소는 어떻게 하나요?', '대회 참가 신청 후 참가취소는 할 수 없으며 부득이한 상황으로 불참할 시 미리 해당 매장에 연락을 부탁 드립니다. '),
	(47, '대진표를 확인할 수 없어요', '대회 대진표는 게임대회 참가 신청 후 확인이 가능하며 해당 대회 주최 매장의 설정에 따라 대진표가 표시되지 않을 수 있습니다. '),
	(48, '게임대회 참여는 어떻게 하나요?', '참여하고 싶은 대회를 선택하여 팀 참가 및 생성 후 대회에 참여할 수 있습니다. ');
/*!40000 ALTER TABLE `franchisee_faq` ENABLE KEYS */;

-- 테이블 picaboodb.franchisee_pic 구조 내보내기
CREATE TABLE IF NOT EXISTS `franchisee_pic` (
  `pic_no` int(50) NOT NULL AUTO_INCREMENT,
  `franchisee_no` varchar(50) NOT NULL,
  `file_name` varchar(500) NOT NULL,
  `extension` varchar(50) NOT NULL,
  `content_type` varchar(500) NOT NULL,
  `size` bigint(20) NOT NULL,
  `origin_name` varchar(500) NOT NULL,
  PRIMARY KEY (`pic_no`,`franchisee_no`),
  KEY `FK_franchisee_pic_franchisee` (`franchisee_no`),
  CONSTRAINT `FK_franchisee_pic_franchisee` FOREIGN KEY (`franchisee_no`) REFERENCES `franchisee` (`franchisee_no`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.franchisee_pic:~0 rows (대략적) 내보내기
DELETE FROM `franchisee_pic`;
/*!40000 ALTER TABLE `franchisee_pic` DISABLE KEYS */;
/*!40000 ALTER TABLE `franchisee_pic` ENABLE KEYS */;

-- 테이블 picaboodb.franchisee_qna 구조 내보내기
CREATE TABLE IF NOT EXISTS `franchisee_qna` (
  `qna_no` int(11) NOT NULL AUTO_INCREMENT,
  `customer_no` varchar(50) NOT NULL,
  `qna_type` varchar(50) NOT NULL,
  `qna_title` varchar(50) NOT NULL,
  `qna_question` varchar(500) NOT NULL,
  `qna_answer` varchar(500) DEFAULT NULL,
  `qna_date` datetime DEFAULT NULL,
  `customer_mail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`qna_no`),
  KEY `FK_franchisee_qna_customer` (`customer_no`),
  CONSTRAINT `FK_franchisee_qna_customer` FOREIGN KEY (`customer_no`) REFERENCES `customer` (`customer_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.franchisee_qna:~0 rows (대략적) 내보내기
DELETE FROM `franchisee_qna`;
/*!40000 ALTER TABLE `franchisee_qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `franchisee_qna` ENABLE KEYS */;

-- 테이블 picaboodb.franchisee_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `franchisee_seq` (
  `seq_no` varchar(50) NOT NULL DEFAULT 'F0000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.franchisee_seq:~1 rows (대략적) 내보내기
DELETE FROM `franchisee_seq`;
/*!40000 ALTER TABLE `franchisee_seq` DISABLE KEYS */;
INSERT INTO `franchisee_seq` (`seq_no`) VALUES
	('F0000000');
/*!40000 ALTER TABLE `franchisee_seq` ENABLE KEYS */;

-- 테이블 picaboodb.franchisee_spec 구조 내보내기
CREATE TABLE IF NOT EXISTS `franchisee_spec` (
  `franchisee_no` varchar(50) NOT NULL,
  `cpu` varchar(50) DEFAULT NULL,
  `vga` varchar(50) DEFAULT NULL,
  `ram` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`franchisee_no`),
  CONSTRAINT `FK_franchisee_spec_franchisee` FOREIGN KEY (`franchisee_no`) REFERENCES `franchisee` (`franchisee_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.franchisee_spec:~0 rows (대략적) 내보내기
DELETE FROM `franchisee_spec`;
/*!40000 ALTER TABLE `franchisee_spec` DISABLE KEYS */;
/*!40000 ALTER TABLE `franchisee_spec` ENABLE KEYS */;

-- 테이블 picaboodb.seat 구조 내보내기
CREATE TABLE IF NOT EXISTS `seat` (
  `franchisee_no` varchar(50) NOT NULL,
  `seat_no` int(11) NOT NULL,
  `seat_row` int(11) DEFAULT NULL,
  `seat_cols` int(11) DEFAULT NULL,
  `seat_use` enum('Y','N','R') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`franchisee_no`,`seat_no`),
  CONSTRAINT `FK_seat_franchisee` FOREIGN KEY (`franchisee_no`) REFERENCES `franchisee` (`franchisee_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.seat:~0 rows (대략적) 내보내기
DELETE FROM `seat`;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;

-- 테이블 picaboodb.seat_reservation 구조 내보내기
CREATE TABLE IF NOT EXISTS `seat_reservation` (
  `franchisee_no` varchar(50) NOT NULL,
  `seat_no` varchar(50) NOT NULL,
  `customer_no` varchar(50) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `reservation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.seat_reservation:~0 rows (대략적) 내보내기
DELETE FROM `seat_reservation`;
/*!40000 ALTER TABLE `seat_reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat_reservation` ENABLE KEYS */;

-- 테이블 picaboodb.spec 구조 내보내기
CREATE TABLE IF NOT EXISTS `spec` (
  `spec_no` int(11) NOT NULL AUTO_INCREMENT,
  `spec_type` enum('C','V','R') NOT NULL COMMENT 'CPU,VGA,RAM',
  `spec_name` varchar(50) NOT NULL,
  PRIMARY KEY (`spec_no`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- 테이블 데이터 picaboodb.spec:~81 rows (대략적) 내보내기
DELETE FROM `spec`;
/*!40000 ALTER TABLE `spec` DISABLE KEYS */;
INSERT INTO `spec` (`spec_no`, `spec_type`, `spec_name`) VALUES
	(1, 'C', 'i9-9900K'),
	(3, 'C', 'i7-9700K'),
	(4, 'C', 'i7-9700'),
	(5, 'C', 'i5-9600K'),
	(6, 'C', 'i5-9600'),
	(7, 'C', 'i5-9500'),
	(8, 'C', 'i5-9400'),
	(9, 'C', 'i3-9350K'),
	(10, 'C', 'i3-9300'),
	(11, 'C', 'Ryzen 7 1700'),
	(12, 'C', 'Ryzen 7 1700X'),
	(13, 'C', 'Ryzen 7 1800X'),
	(14, 'C', 'Ryzen 5 1600'),
	(15, 'C', 'Ryzen 5 1600X'),
	(16, 'C', 'Ryzen 7 2700X'),
	(17, 'C', 'Ryzen 7 2700'),
	(18, 'C', 'Ryzen 5 2600X'),
	(19, 'C', 'Ryzen 5 2600'),
	(20, 'C', 'Ryzen 5 2500X'),
	(21, 'C', 'Ryzen 9 3900X'),
	(22, 'C', 'Ryzen 7 3800X\r\n'),
	(23, 'C', 'Ryzen 7 3700X'),
	(24, 'C', 'Ryzen 5 3600X'),
	(25, 'C', 'Ryzen 5 3600'),
	(26, 'C', 'i7-8700K'),
	(27, 'C', 'i7-8700'),
	(28, 'C', 'i5-8600K'),
	(29, 'C', 'i5-8600'),
	(30, 'C', 'i5-8500'),
	(31, 'C', 'i5-8400'),
	(32, 'C', 'i7-7700K'),
	(33, 'C', 'i7-7700'),
	(34, 'C', 'i5-7600K'),
	(35, 'C', 'i5-7600'),
	(36, 'C', 'i5-7500'),
	(37, 'C', 'i5-7400'),
	(38, 'C', 'i7-6700K'),
	(39, 'C', 'i7-6700'),
	(40, 'C', 'i5-6600K'),
	(41, 'C', 'i5-6600'),
	(42, 'C', 'i5-6500'),
	(43, 'C', 'i5-6400'),
	(44, 'C', 'i7-9700KF'),
	(45, 'C', 'i5-9400F'),
	(46, 'V', 'GTX980Ti'),
	(47, 'V', 'GTX980'),
	(48, 'V', 'GTX970'),
	(49, 'V', 'GTX960'),
	(50, 'V', 'GTX950'),
	(51, 'V', 'GTX780Ti'),
	(52, 'V', 'GTX780'),
	(53, 'V', 'GTX770\r\n'),
	(54, 'V', 'GTX760'),
	(55, 'V', 'GTX750Ti'),
	(56, 'V', 'GTX-TITAN'),
	(57, 'V', 'GTX1080Ti'),
	(58, 'V', 'GTX1080'),
	(59, 'V', 'GTX1070Ti'),
	(60, 'V', 'GTX1070'),
	(61, 'V', 'GTX1060'),
	(62, 'V', 'GTX1050Ti'),
	(63, 'V', 'GTX 1050'),
	(64, 'V', 'GTX1660Ti'),
	(65, 'V', 'GTX1660SUPER'),
	(66, 'V', 'GTX1660'),
	(67, 'V', 'GTX1650SUPER'),
	(68, 'V', 'GTX1650'),
	(69, 'V', 'RTX2080Ti'),
	(70, 'V', 'RTX2080SUPER'),
	(71, 'V', 'RTX2080'),
	(72, 'V', 'RTX2070SUPER'),
	(73, 'V', 'RTX2070'),
	(74, 'V', 'RTX2060SUPER'),
	(75, 'V', 'RTX2060'),
	(76, 'V', 'RX590'),
	(77, 'V', 'RX570'),
	(78, 'V', 'RX580'),
	(79, 'R', '32G'),
	(80, 'R', '16G'),
	(81, 'R', '8G'),
	(82, 'R', '4G');
/*!40000 ALTER TABLE `spec` ENABLE KEYS */;

-- 테이블 picaboodb.unverified_franchisee 구조 내보내기
CREATE TABLE IF NOT EXISTS `unverified_franchisee` (
  `franchisee_no` varchar(50) NOT NULL,
  `address_no` int(11) DEFAULT NULL,
  `franchisee_crn` varchar(50) DEFAULT NULL COMMENT '사업자 등록증',
  `franchisee_name` varchar(50) DEFAULT NULL COMMENT '상호명',
  `franchisee_phone` varchar(50) DEFAULT NULL,
  `owner_no` varchar(50) NOT NULL COMMENT '가맹점주, O로 시작',
  KEY `FK_franchisee_customer` (`owner_no`),
  KEY `FK_unverified_franchisee_address` (`address_no`),
  CONSTRAINT `FK_unverified_franchisee_address` FOREIGN KEY (`address_no`) REFERENCES `address` (`address_no`),
  CONSTRAINT `unverified_franchisee_ibfk_1` FOREIGN KEY (`owner_no`) REFERENCES `customer` (`customer_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 picaboodb.unverified_franchisee:~0 rows (대략적) 내보내기
DELETE FROM `unverified_franchisee`;
/*!40000 ALTER TABLE `unverified_franchisee` DISABLE KEYS */;
/*!40000 ALTER TABLE `unverified_franchisee` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
