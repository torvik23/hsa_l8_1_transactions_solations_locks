-- if your $DATA_PATH_HOST/mysql is exists and you do not want to delete it, you can run by manual execution:
-- mysql -u root -p < /docker-entrypoint-initdb.d/createdb.sql
-- docker-compose exec mysql bash

CREATE TABLE `note` (
    `id` INT(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
    `title` VARCHAR (100) NOT NULL COMMENT 'Note Title',
    `content` TEXT DEFAULT NULL COMMENT 'Note Content',
    `watch_number` INT(10) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `note` (`title`, `content`, `watch_number`) VALUES ('note 1', 'The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.', 0);
INSERT INTO `note` (`title`, `content`, `watch_number`) VALUES ('note 2', 'One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin.', 7);
INSERT INTO `note` (`title`, `content`, `watch_number`) VALUES ('note 3', 'Li Europan lingues es membres del sam familie.', 1);
INSERT INTO `note` (`title`, `content`, `watch_number`) VALUES ('note 4', 'Lor separat existentie es un myth.', 5);
INSERT INTO `note` (`title`, `content`, `watch_number`) VALUES ('note 5', 'Por scientie, musica, sport etc, litot', 0);
