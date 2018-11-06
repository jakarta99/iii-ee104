DROP TABLE DONATION

CREATE TABLE DONATION (
donation_list_id BIGINT IDENTITY PRIMARY KEY ,
member_id VARCHAR(100),
donate_organization_id  BIGINT,
donate_value   BIGINT,
donate_time datetime
)


INSERT INTO DONATION(member_id,donate_organization_id,donate_value,donate_time) 
VALUES(1,123,10,'2018-11-6')
INSERT INTO DONATION(member_id,donate_organization_id,donate_value,donate_time) 
VALUES(2,1253,15,'2018-05-6')
INSERT INTO DONATION(member_id,donate_organization_id,donate_value,donate_time) 
VALUES(3,1243,3,'2018-10-6')