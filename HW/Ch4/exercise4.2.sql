CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(64) NOT NULL,
    `password` VARCHAR(64) NOT NULL,
    `nickname` VARCHAR(64) NOT NULL,
    `profile_link` VARCHAR(128) NOT NULL,
    `profile_message` VARCHAR(128) NOT NULL,
    `drop_out` TINYINT(1) NOT NULL DEFAULT 0,
    `membership_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `who_created_channel` INT NOT NULL,
    `channel_link` VARCHAR(128) NOT NULL,
    `maximun_capacity` INT NOT NULL,
    `dorp_out` TINYINT(1) NOT NULL DEFAULT 0,
    `creation_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`who_created_channel`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `chatting_message` TEXT NOT NULL,
    `who_created_chat` INT NOT NULL,
    `chatting_channel` INT NOT NULL,
    `creation_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`who_created_chat`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`chatting_channel`) REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `creation_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `blocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `who_blocking` INT NOT NULL,
    `who_blocked` INT NOT NULL,
    `creation_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`who_blocking`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`who_blocked`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8;