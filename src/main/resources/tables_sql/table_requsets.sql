use timebank
go


DROP TABLE REQUESTS



CREATE TABLE REQUESTS(
request_List_Id BIGINT IDENTITY PRIMARY KEY,
member_id INT,
job_Title VARCHAR(20),
time_Value INT,
job_Area INT,
term_Type INT,
service_Type INT,
)

INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (1,'中華育幼機構關懷協會',2,1,2,1)
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (1,'中華關懷協會',2,1,2,1)
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (1,'育幼機構協會',2,1,2,1)
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (2,'中華育幼機構關懷協會',2,1,2,1)
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (2,'中華關懷協會',2,1,2,1)
INSERT INTO Requests( member_id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES (2,'育幼協會',2,1,2,1)





