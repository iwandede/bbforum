CREATE DATABASE bbForumDB;

USE bbForumDB;

/* Writting a user database! Let me know if you have any recommendations! */
CREATE TABLE bb_users(
  `id`              BIGINT NOT NULL AUTO_INCREMENT,
  `username`        VARCHAR(30) NOT NULL,
  `password`        VARCHAR(60) NOT NULL,         /* We are going to use the PHP password API. */
  `email`           VARCHAR(150) NOT NULL,        /* Yes, emails can really be this long. */
  `keyHash`         VARCHAR(60),                  /* Used for account activation or password reset. */
  `confirmedEmail`  TINYINT DEFAULT '0',          /* Did the user confirm the email? */
  `lastIp`          VARCHAR(45),
  `dateRegistered`  TIMESTAMP,
  `active`          TINYINT DEFAULT '0',
  PRIMARY KEY(`id`)
);

/* Minor details about the user or things we can easily cache. */
CREATE TABLE bb_user_profiles(
    `id`                BIGINT NOT NULL AUTO_INCREMENT,
    `user_id`           BIGINT NOT NULL,
    `website`           VARCHAR(100),       /* Just encase the url is very long. ;) */
    `twitterUsername`   VARCHAR(16),        /* IDK how long twitter usernames are atm. Lets just leave it for now. */
    `postCount`         BIGINT DEFAULT 0,   /* Number of posts the user made. Does not count threads created. */
    `threadCount`       BIGINT DEFAULT 0,   /* Number of threads the user made. */
    `lastActivity`      TIMESTAMP,
    `signature`         VARCHAR(140),        /* Signature / Random nonsense people add to every post/thread. */
  
  PRIMARY KEY(`id`),
  FOREIGN KEY (`user_id`) REFERENCES bb_users(`id`)
);

/* Create threads table. */


CREATE TABLE bb_threads(
  `id`              BIGINT NOT NULL AUTO_INCREMENT,
  `user_id`         BIGINT NOT NULL,
  `title`           VARCHAR(30) NOT NULL,           /* Not sure on max length titles should be for SEO. But 30 seems safe. */
  `keywords`        VARCHAR(130) DEFAULT '',
  `description`     TEXT,                           /* Since we want our threads easily searchable. FULLTEXT */
  `postedTimestamp` TIMESTAMP,
  `lastModified`    TIMESTAMP,
  PRIMARY KEY(`id`),
  FOREIGN KEY (`user_id`) REFERENCES bb_users(`id`)
);

/* Posts of threads users post. */
CREATE TABLE bb_posts(
  `id`              BIGINT NOT NULL AUTO_INCREMENT,
  `thread_id`       BIGINT NOT NULL,
  `user_id`         BIGINT NOT NULL,
  `postedTimestamp` TIMESTAMP,
  `lastModified`    TIMESTAMP,
  PRIMARY KEY(`id`),
  FOREIGN KEY (`user_id`) REFERENCES bb_users(`id`),
  FOREIGN KEY (`thread_id`) REFERENCES bb_threads(`id`)
);