-- create table users(
--                       username varchar_ignorecase(50) not null primary key,
--                       password varchar_ignorecase(500) not null,
--                       enabled boolean not null
-- );
--
-- create table authorities (
--                              username varchar_ignorecase(50) not null,
--                              authority varchar_ignorecase(50) not null,
--                              constraint fk_authorities_users foreign key(username) references users(username)
-- );
-- create unique index ix_auth_username on authorities (username,authority);

-- DEFAULT SCHEMA FOR ORACLE DATA BASE

CREATE TABLE USERS (
                       USERNAME NVARCHAR2(128) PRIMARY KEY,
                       PASSWORD NVARCHAR2(128) NOT NULL,
                       ENABLED CHAR(1) CHECK (ENABLED IN ('Y','N') ) NOT NULL
);


CREATE TABLE AUTHORITIES (
                             USERNAME NVARCHAR2(128) NOT NULL,
                             AUTHORITY NVARCHAR2(128) NOT NULL
);
ALTER TABLE AUTHORITIES ADD CONSTRAINT AUTHORITIES_UNIQUE UNIQUE (USERNAME, AUTHORITY);
ALTER TABLE AUTHORITIES ADD CONSTRAINT AUTHORITIES_FK1 FOREIGN KEY (USERNAME) REFERENCES USERS (USERNAME) ENABLE;