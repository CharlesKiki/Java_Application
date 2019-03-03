
#
# Table structure for table d_d_book
#

DROP TABLE IF EXISTS d_d_book;
CREATE TABLE d_d_book (
  id int(12) NOT NULL,
  author varchar(200) NOT NULL,
  publishing varchar(200) NOT NULL,
  publish_time bigint(20) NOT NULL,
  word_number varchar(15) default NULL,
  which_edtion varchar(15) default NULL,
  total_page varchar(15) default NULL,
  print_time bigint(20) default NULL,
  folio varchar(15) default NULL,
  print_number varchar(15) default NULL,
  isbn varchar(25) default NULL,
  author_summary text NOT NULL,
  catalogue text NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table d_d_book
#


#
# Table structure for table d_d_category
#

DROP TABLE IF EXISTS d_d_category;
CREATE TABLE d_d_category (
  id int(12) NOT NULL auto_increment,
  turn int(3) default '10',
  en_name varchar(50) NOT NULL,
  cn_name varchar(50) NOT NULL,
  abridge_name varchar(20) default NULL,
  parent_id int(12) NOT NULL default '0',
  category_value varchar(200) default NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY en_name (en_name),
  UNIQUE KEY category_value (category_value)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table d_d_category
#

#
# Table structure for table d_d_comment
#


#
# Table structure for table d_d_product
#

DROP TABLE IF EXISTS d_d_product;
CREATE TABLE d_d_product (
  id int(12) NOT NULL auto_increment,
  category_id int(12) NOT NULL,
  product_name varchar(100) NOT NULL,
  description varchar(100) default NULL,
  add_time bigint(20) default NULL,
  fixed_price double NOT NULL,
  dang_price double NOT NULL,
  keywords varchar(200) default NULL,
  has_deleted int(1) NOT NULL default '0',
  product_pic varchar(200) default NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table d_d_product
#



DROP TABLE IF EXISTS d_d_comment;
CREATE TABLE d_d_comment (
  id int(12) NOT NULL auto_increment,
  product_id int(12) unsigned NOT NULL,
  user_id int(10) unsigned NOT NULL,
  comment_title varchar(25) NOT NULL,
  comment_content varchar(3000) NOT NULL,
  comment_time bigint(20) NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table d_d_comment
#


#
# Table structure for table d_d_comment_reply
#

DROP TABLE IF EXISTS d_d_comment_reply;
CREATE TABLE d_d_comment_reply (
  id int(12) unsigned NOT NULL auto_increment,
  comment_id int(12) unsigned NOT NULL,
  user_id int(12) unsigned NOT NULL,
  reply_time bigint(20) default NULL,
  reply_content varchar(3000) NOT NULL,
  turn int(11) default NULL, 
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=REDUNDANT;

#
# Dumping data for table d_d_comment_reply
#


#
# Table structure for table d_d_item
#

DROP TABLE IF EXISTS d_d_item;
CREATE TABLE d_d_item (
  id int(12) NOT NULL auto_increment,
  order_id int(10) unsigned NOT NULL,
  product_id int(10) unsigned NOT NULL,
  product_name varchar(30),
  dang_price double NOT NULL,
  product_num int(10) unsigned NOT NULL default '1',
  amount double NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table d_d_item
#


#
# Table structure for table d_d_order
#

DROP TABLE IF EXISTS d_d_order;
CREATE TABLE d_d_order (
  id int(10) unsigned NOT NULL auto_increment,
  user_id int(10) unsigned NOT NULL,
  status int(10) unsigned NOT NULL,
  order_time bigint(20) NOT NULL,
  order_desc varchar(100) default NULL,
  total_price double NOT NULL,
  
  send_fee double NOT NULL,
  send_id int(12) default NULL,
  
  order_price double NOT NULL,
  send_time bigint(20) default NULL,
  is_delete int(1) default 0,
  
  receive_id int(10) unsigned NOT NULL,
  receive_name varchar(100) default NULL,
  full_address varchar(200) default NULL,
  postal_code varchar(8) default NULL,
  mobile varchar(20) default NULL,
  phone varchar(20) default NULL,
  
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=REDUNDANT;

#
# Dumping data for table d_d_order
#



#
# Table structure for table d_d_receive_address
#

DROP TABLE IF EXISTS d_d_receive_address;
CREATE TABLE d_d_receive_address (
  id int(12) NOT NULL auto_increment,
  user_id int(11) NOT NULL,
  receive_name varchar(20) NOT NULL,
  full_address varchar(200) NOT NULL,
  postal_code varchar(8) NOT NULL,
  mobile varchar(15) NOT NULL,
  phone varchar(20) default NULL,
  is_default int(1) default '0',
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=REDUNDANT;

#
# Dumping data for table d_d_receive_address
#


#
# Table structure for table d_d_send_way
#

DROP TABLE IF EXISTS d_d_send_way;
CREATE TABLE d_d_send_way (
  id int(11) NOT NULL auto_increment,
  is_close bit(1) default '\0',
  send_way varchar(30) NOT NULL,
  send_desc varchar(100) default NULL,
  send_fee double NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into d_d_send_way value(1,0,'Car','by car',220.0);
insert into d_d_send_way value(2,0,'Boat','by boat',220.0);
insert into d_d_send_way value(3,0,'Train','by train',220.0);
#
# Dumping data for table d_d_send_way
#


#
# Table structure for table d_d_user
#

DROP TABLE IF EXISTS d_d_user;
CREATE TABLE d_d_user (
  id int(12) NOT NULL auto_increment,
  email varchar(50) NOT NULL,
  nickname varchar(50) default NULL,
  password varchar(50) NOT NULL,
  user_integral int(12) NOT NULL default '0',
  is_email_verify int(1) default '0',
  email_verify_code varchar(50) default NULL,
  last_login_time bigint(20) default NULL,
  last_login_ip varchar(15) default NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY email (email),
  UNIQUE KEY nickname (nickname)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table d_d_user
#

INSERT INTO d_d_user VALUES (1,'','','1B2M2Y8AsgTpgAmY7PhCfg==',0,0,'E1524274-6268-4920-AFBF-2B71491D4816',0,NULL);
INSERT INTO d_d_user VALUES (2,'whatisjava@163.com','java','k/cloHQj/hyIn0SLM9IfRg==',0,0,'3B81C845-CFBF-4874-853A-3379FEE356B7',0,NULL);
INSERT INTO d_d_user VALUES (3,'steven_le2003@hotmail.com','javajavajava','BJSeMjLsT4ewrSAmLy3lNQ==',0,0,'C5FD2D2C-99C0-4EA3-A52A-E7A7D748B6AD',0,NULL);
INSERT INTO d_d_user VALUES (4,'memory','memory','zWm0lX8GzYGNe/PWGYDikQ==',0,0,'F8EC58B8-87BA-4400-86AC-2713BD9CA76B',0,NULL);
INSERT INTO d_d_user VALUES (5,'aaaaa','aaaaa','WU+AOzgKQTlu1j3KOVA1Qg==',0,0,'619ACD6C-EB71-4A9E-B702-AD37B9FC09C1',0,NULL);
INSERT INTO d_d_user VALUES (6,'bbb','bbb','CPjgJgxkQYUQzvsrBu7lzQ==',0,1,'38F73B4A-5F1C-4DD6-A262-524626CCB1F8',0,NULL);
INSERT INTO d_d_user VALUES (7,'ccc','ccc','nfYuaTmI604eFETs4FeFeQ==',0,1,'E10BCB47-80A6-4D3C-88B8-A04E9D2DA032',0,NULL);
INSERT INTO d_d_user VALUES (8,'excellent','excellent','ejr2BOUuJXez9bd+lvPgHQ==',0,1,'DF313416-E6CF-492D-BD4C-794B18DF4053',0,NULL);
INSERT INTO d_d_user VALUES (9,'cccccc','ccccc','Z8diJ2vO0J7k3w7VN9Fk6g==',0,1,'30B5DCF4-0C5B-4208-B4FD-40F07DE52B75',0,NULL);
INSERT INTO d_d_user VALUES (10,'sp','sp','GVKgGJgHPR5WG5tPLkLL1w==',0,1,'543F46B4-BF94-48A2-8AB6-3EB26BD40C01',0,NULL);





#
#  Foreign keys for table d_d_book
#

ALTER TABLE d_d_book
  ADD FOREIGN KEY (id) REFERENCES d_d_product (id) ON UPDATE CASCADE;

DROP TABLE IF EXISTS d_d_rhn;
CREATE TABLE d_d_rhn (
  id int(12) NOT NULL auto_increment,
  product_id int(12) NOT NULL,
  	product_type varchar(12) NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO d_d_rhn VALUES(1,49,'rec');
INSERT INTO d_d_rhn VALUES(2,45,'tejia');
INSERT INTO d_d_rhn VALUES(3,46,'tejia');
INSERT INTO d_d_rhn VALUES(4,47,'tejia');
INSERT INTO d_d_rhn VALUES(5,48,'tejia');
INSERT INTO d_d_rhn VALUES(6,40,'new');
INSERT INTO d_d_rhn VALUES(7,41,'new');
INSERT INTO d_d_rhn VALUES(8,42,'new');
INSERT INTO d_d_rhn VALUES(9,43,'new');
