use timebank
go


DROP TABLE REQUESTS



CREATE TABLE REQUESTS(
request_List_Id BIGINT IDENTITY PRIMARY KEY,
id VARCHAR(100),
job_Title VARCHAR(20),
time_Value INT,
job_Area INT,
term_Type INT,
service_Type INT,
)

INSERT INTO Requests( Id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type) 
VALUES ('中華育幼機構關懷協會', '假日活動志工',2,1,2,1)
INSERT INTO Requests(Id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type)
VALUES ('新北市老人長期照顧中心', '平日活動志工',2,3,2,4)
INSERT INTO Requests(Id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type)
VALUES ('台灣展翅協會', '活動現場志工',3,4,1,4)
INSERT INTO Requests(Id, JOB_TITLE, TIME_VALUE, job_Area, term_Type, service_Type)
VALUES ('財團法人弘道老人福利基金會', '長輩陪伴志工',4,5,1,5)

