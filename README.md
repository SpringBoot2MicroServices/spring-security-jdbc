# spring-security-jdbc
In this application we will implement spring security with JDBC - by connecting respective database 

Refer this page# https://docs.spring.io/spring-security/site/docs/current/reference/html5/#features - section - User Schema

<b> <i> This Application implemented with default tables structures - As spring expects </i></b> </br></br>
<b> Excecute below sql script in the respective RDBMS DB </b>


DROP TABLE AUTHORITIES;
DROP TABLE USERS;

DELETE CONSTRAINT AUTHORITIES_UNIQUE;
DELETE CONSTRAINT AUTHORITIES_FK1;

COMMIT;

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

COMMIT;

INSERT INTO USERS (USERNAME, PASSWORD, ENABLED) VALUES ('user', 'password', 'Y');
INSERT INTO USERS (USERNAME, PASSWORD, ENABLED) VALUES ('admin', 'adminpwd', 'Y');

INSERT INTO AUTHORITIES (USERNAME, AUTHORITY) VALUES ('user', 'ROLE_USER');
INSERT INTO AUTHORITIES (USERNAME, AUTHORITY) VALUES ('admin', 'ROLE_ADMIN');

COMMIT;
