use timebank
go

DROP table penalty

create table penalty(
penalty_list_id BIGINT primary key,
order_list_id BIGINT NOT NULL,
member_id BIGINT NOT NULL,
description VARCHAR(50),
status INT NOT NULL,
penalty_time_value INT 
)

INSERT INTO PENALTY (penalty_list_id, order_list_id, member_id, description, status, penalty_time_value)
VALUES(1, 2, 5, '�ʮu', 1 , 4)

INSERT INTO PENALTY (penalty_list_id, order_list_id, member_id, description, status, penalty_time_value)
VALUES(2, 3, 8, '���1�p��', 2 , 2)

INSERT INTO PENALTY (penalty_list_id, order_list_id, member_id, description, status, penalty_time_value)
VALUES(3, 4, 9, '�A�ȺA�פ���', 3 , 0)
