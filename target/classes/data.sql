INSERT INTO USERS (USERNAME, PASSWORD, ENABLED) VALUES ('user', 'password', true);

INSERT INTO USERS (USERNAME, PASSWORD, ENABLED) VALUES ('admin', 'adminpwd', true);

INSERT INTO AUTHORITIES (USERNAME, AUTHORITY) VALUES ('user', 'ROLE_USER');
INSERT INTO AUTHORITIES (USERNAME, AUTHORITY) VALUES ('admin', 'ROLE_ADMIN');