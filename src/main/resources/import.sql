use timebank
go

DROP TABLE T_MEMBER

CREATE TABLE T_MEMBER(
ID BIGINT IDENTITY PRIMARY KEY,
NAME VARCHAR(40) NOT NULL, 
TYPE VARCHAR(20),
EMAIL VARCHAR(50),
TEL VARCHAR(10),
MOBILE VARCHAR(10)
)

INSERT INTO T_MEMBER (NAME, TYPE, EMAIL)VALUES('sheila', '一般志工', 'sheila000@gmail.com')
INSERT INTO T_MEMBER (NAME, TYPE, EMAIL)VALUES('anchor', '一般志工', 'anchor001@gmail.com')
INSERT INTO T_MEMBER (NAME, TYPE, EMAIL)VALUES('jasmine', '一般志工', 'jasmine002@gmail.com')


DROP TABLE T_TIME_LEDGER

CREATE TABLE T_TIME_LEDGER(
ID BIGINT IDENTITY PRIMARY KEY,
MEMBER_ID BIGINT,
TRANSACTION_TIME DATETIME,
DEPOSIT_VALUE INT,
WITHDRAWAL_VALUE INT,
BALANCE_VALUE INT,
DISCRIPTION VARCHAR(30)
)

INSERT INTO T_TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,BALANCE_VALUE)
VALUES(1, 2018-10-10,100,100)

INSERT INTO T_TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,BALANCE_VALUE)
VALUES(1, 2018-10-11,50,150)

INSERT INTO T_TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,BALANCE_VALUE)
VALUES(2, 2018-9-10, 500, 500)


DROP TABLE T_JOB_LIST

CREATE TABLE T_JOB_LIST(
LIST_ID BIGINT IDENTITY PRIMARY KEY,
MEMBER_ID BIGINT,
INSTITUTE_NAME VARCHAR(100),
JOB_TITLE VARCHAR(20)
)

INSERT INTO T_JOB_LIST(MEMBER_ID, INSTITUTE_NAME, JOB_TITLE) 
VALUES (1, '中華育幼機構關懷協會', '假日活動志工')
INSERT INTO T_JOB_LIST(MEMBER_ID, INSTITUTE_NAME, JOB_TITLE) 
VALUES (1, '新北市老人長期照顧中心', '平日活動志工')
INSERT INTO T_JOB_LIST(MEMBER_ID, INSTITUTE_NAME, JOB_TITLE) 
VALUES (2, '台灣展翅協會', '假日活動志工')
INSERT INTO T_JOB_LIST(MEMBER_ID, INSTITUTE_NAME, JOB_TITLE) 
VALUES (2, '中華育幼機構關懷協會', '假日活動志工')

