CREATE TABLE user 
(
  id int NOT NULL AUTO_INCREMENT,
  name varchar(45) NOT NULL,
  email varchar(90) NOT NULL,
  password varchar(45) NOT NULL,
  gender varchar(10) NOT NULL,
  about varchar(500) DEFAULT 'I am using your website..!',
  registration_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  profile varchar(200) DEFAULT 'default.png',
  PRIMARY KEY (id),
  UNIQUE KEY email_UNIQUE (email)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE category 
(
  id int NOT NULL AUTO_INCREMENT,
  name varchar(45) NOT NULL,
  description varchar(200) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE liked 
(
  id int NOT NULL AUTO_INCREMENT,
  post_id int NOT NULL,
  user_id int NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id),
  KEY fk_post_id_idx (post_id),
  KEY fk_user_id_idx (user_id),
  CONSTRAINT fk_post_id FOREIGN KEY (post_id) REFERENCES post (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES user (id)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE post 
(
  id int NOT NULL AUTO_INCREMENT,
  title varchar(100) NOT NULL,
  content longtext,
  code longtext,
  pic varchar(100) DEFAULT NULL,
  date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  cat_id int NOT NULL,
  user_id int NOT NULL,
  PRIMARY KEY (id),
  KEY fk_post_cat_id_idx (cat_id),
  KEY fk_post_user_id_idx (user_id),
  CONSTRAINT fk_post_cat_id FOREIGN KEY (cat_id) REFERENCES category (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_post_user_id FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
