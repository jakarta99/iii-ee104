use timebank
go

DROP table PENALTY

create table PENALTY(
penalty_list_id BIGINT IDENTITY PRIMARY KEY,
order_list_id BIGINT NOT NULL,
member_id VARCHAR(100) NOT NULL,
description VARCHAR(50),
status INT NOT NULL,
penalty_time_value INT 
)

INSERT INTO PENALTY (order_list_id, member_id, description, status, penalty_time_value)
VALUES(2, 5, '缺席', 1 , 4)

INSERT INTO PENALTY (order_list_id, member_id, description, status, penalty_time_value)
VALUES(3, 8, '遲到1小時', 2 , 2)

INSERT INTO PENALTY (order_list_id, member_id, description, status, penalty_time_value)
VALUES(4, 9, '服務態度不佳', 3 ,0)
