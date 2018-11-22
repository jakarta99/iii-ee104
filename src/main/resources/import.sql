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