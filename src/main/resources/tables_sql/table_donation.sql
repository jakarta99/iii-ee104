DROP TABLE DONATION

CREATE TABLE DONATION (
ID BIGINT IDENTITY PRIMARY KEY,
DONATION_LIST_ID BIGINT,
MEMBER_ID VARCHAR(100),
DONATE_ORGANIZATION_ID  BIGINT,
DONATE_VALUE   BIGINT,
DONATE_TIME datetime
)


INSERT INTO DONATION(donation_list_id,member_id,donate_organization_id,donate_value,donate_time) 
VALUES(1,1,123,10,'2018-11-6')
INSERT INTO DONATION(donation_list_id,member_id,donate_organization_id,donate_value,donate_time) 
VALUES(2,2,1253,15,'2018-05-6')
INSERT INTO DONATION(donation_list_id,member_id,donate_organization_id,donate_value,donate_time) 
VALUES(3,3,1243,3,'2018-10-6')