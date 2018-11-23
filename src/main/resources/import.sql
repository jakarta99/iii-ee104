INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (1,'中華育幼機構關懷協會',2,1,2,1);
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (1,'中華關懷協會',2,1,2,1);
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (1,'育幼機構協會',2,1,2,1);
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (2,'中華育幼機構關懷協會',2,1,2,1);
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (2,'中華關懷協會',2,1,2,1);
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (2,'育幼協會',2,1,2,1);


INSERT INTO ORDER_LIST(REQUEST_LIST_ID,SUPPLIER_ID,REQUESTER_ID,SUPPLIER_ACCEPTION,SERVICE_CONFIRMATION, STATUS) 
VALUES(1, 1, 4, 'N', 'N', 3);

INSERT INTO ORDER_LIST(REQUEST_LIST_ID,SUPPLIER_ID,REQUESTER_ID,SUPPLIER_ACCEPTION,SERVICE_CONFIRMATION, STATUS) 
VALUES(2, 2, 3, 'N', 'N', 3);

INSERT INTO ORDER_LIST(REQUEST_LIST_ID,SUPPLIER_ID,REQUESTER_ID,SUPPLIER_ACCEPTION,SERVICE_CONFIRMATION, STATUS) 
VALUES(3, 2, 5, 'N', 'N', 3);

--time_ledger
INSERT INTO TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,WITHDRAWAL_VALUE,BALANCE_VALUE,DESCRIPTION)
VALUES(1, '2018-11-11',100,0,100,'deposit');

INSERT INTO TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,WITHDRAWAL_VALUE,BALANCE_VALUE,DESCRIPTION)
VALUES(1, '2018-11-11',50,150,0,'deposit');

INSERT INTO TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,WITHDRAWAL_VALUE,BALANCE_VALUE,DESCRIPTION)
VALUES(2, '2018-11-11', 500, 500,0,'deposit');



--member
INSERT INTO MEMBER ( LOGIN_ACCOUNT, PASSWORD, NAME, TYPE, EMAIL, CITY)
VALUES('sheila1112','asdf','sheila', 'P', 'sheila000@gmail.com', 1);

INSERT INTO MEMBER (LOGIN_ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, CITY)
VALUES('anchor1112','asdf','anchor', 'P', 'anchor001@gmail.com', 2);

INSERT INTO MEMBER (LOGIN_ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, CITY, FOUNDER, CEO)
VALUES('jasmine1112','asdf','jasmine', 'O', 'jasmine002@gmail.com', 3, 'Tom老師', '鄭正');

--AREA
INSERT INTO AREA VALUES (1, '基隆市');
INSERT INTO AREA VALUES (2, '台北市');
INSERT INTO AREA VALUES (3, '新北市');
INSERT INTO AREA VALUES (4, '桃園市');
INSERT INTO AREA VALUES (5, '新竹市');
INSERT INTO AREA VALUES (6, '新竹縣');
