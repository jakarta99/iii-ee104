use timebank
go

DROP table PENALTY

create table PENALTY(
ID BIGINT IDENTITY PRIMARY KEY,
ORDER_LIST_ID BIGINT NOT NULL,
MEMBER_ID VARCHAR(100) NOT NULL,
UPDATE_DATE DATETIME NOT NULL,
DESCRIPTION VARCHAR(50),
STATUS INT NOT NULL,
PENALTY_TIME_VALUE INT 
)

INSERT INTO PENALTY (order_list_id, member_id, update_date, description, status, penalty_time_value)
VALUES(2, 1, '2018-11-10', '缺席', 1 , 4)

INSERT INTO PENALTY (order_list_id, member_id, update_date, description, status, penalty_time_value)
VALUES(3, 8, '2018-11-10', '遲到1小時', 2 , 2)

INSERT INTO PENALTY (order_list_id, member_id, update_date, description, status, penalty_time_value)
VALUES(4, 9, '2018-11-10', '服務態度不佳', 3 ,0)
