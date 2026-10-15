CREATE DATABASE IF NOT EXISTS `course_db` CHARACTER SET utf8mb4;
USE `course_db`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `course_name` VARCHAR(120) NOT NULL,
  `duration` VARCHAR(60) NOT NULL,
  `fees` DECIMAL(12,2) NOT NULL CHECK (`fees` >= 0),
  `course_description` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
