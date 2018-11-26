INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (1,'中華育幼機構關懷協會',2,1,2,1);
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (1,'中華關懷協會',2,1,2,1);
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (1,'育幼機構協會',2,1,2,1);
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (2,'中華育幼機構關懷協會',2,2,2,2);
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (3,'中華關懷協會',2,3,2,3);
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (4,'育幼協會',2,4,2,4);


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

--penalty

INSERT INTO PENALTY (order_list_id, member_id, update_date, description, status, penalty_time_value)
VALUES(2, 1, '2018-11-10', '缺席', 1 , 4);

INSERT INTO PENALTY (order_list_id, member_id, update_date, description, status, penalty_time_value)
VALUES(3, 2, '2018-11-10', '遲到1小時', 2 , 2);

INSERT INTO PENALTY (order_list_id, member_id, update_date, description, status, penalty_time_value)
VALUES(1, 3, '2018-11-10', '服務態度不佳', 3 ,0);