use timebank
go

DROP table PENALTY

create table PENALTY(
ID BIGINT IDENTITY PRIMARY KEY,
ORDER_LIST_ID BIGINT NOT NULL,
MEMBER_ID VARCHAR(100) NOT NULL,
DESCRIPTION VARCHAR(50),
STATUS INT NOT NULL,
PENALTY_TIME_VALUE INT 
)

INSERT INTO PENALTY (order_list_id, member_id, description, status, penalty_time_value)
VALUES(2, 5, '缺席', 1 , 4)

INSERT INTO PENALTY (order_list_id, member_id, description, status, penalty_time_value)
VALUES(3, 8, '遲到1小時', 2 , 2)

INSERT INTO PENALTY (order_list_id, member_id, description, status, penalty_time_value)
VALUES(4, 9, '服務態度不佳', 3 ,0)
