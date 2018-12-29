--SERVICETYPE
INSERT INTO SERVICE_TYPE VALUES ('婦幼關懷');
INSERT INTO SERVICE_TYPE VALUES ('身心障礙');
INSERT INTO SERVICE_TYPE VALUES ('老人服務');
INSERT INTO SERVICE_TYPE VALUES ('社會服務');
INSERT INTO SERVICE_TYPE VALUES ('動物保護');
INSERT INTO SERVICE_TYPE VALUES ('國際救援');
INSERT INTO SERVICE_TYPE VALUES ('環境保護');
INSERT INTO SERVICE_TYPE VALUES ('文教藝術');
INSERT INTO SERVICE_TYPE VALUES ('醫療服務');
INSERT INTO SERVICE_TYPE VALUES ('宗教信仰');




--Role
INSERT INTO ROLE (ROLE_NAME) VALUES  ('ADMIN');
INSERT INTO ROLE (ROLE_NAME) VALUES  ('USER');
INSERT INTO ROLE (ROLE_NAME) VALUES  ('ORG_USER');

--member
INSERT INTO MEMBER ( ACCOUNT, PASSWORD, NAME, TYPE, EMAIL,CERTIFICATE_ID_NUMBER, BIRTH_DATE,TEL, MOBILE, COUNTY, DISTRICT, ADDRESS, EMAIL_VERTIFICATION, SIGN_UP_DATE)
VALUES('sheila1112','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','sheila', 'P', 'sheila000@gmail.com','A123456789', '1970/5/15','25644433', '0912356278','台北市','大安區','復興南路一段390號15樓', 'Y','2015/5/13');

INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, CERTIFICATE_ID_NUMBER ,BIRTH_DATE, TEL, MOBILE, COUNTY, DISTRICT, ADDRESS, EMAIL_VERTIFICATION, SIGN_UP_DATE)
VALUES('anchor1112','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','anchor', 'P', 'anchor001@gmail.com','B298766553','1985/3/6','25644433', '0912356278','台南市','安南區','大眾路360號', 'N','2015/2/23');

INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, CERTIFICATE_ID_NUMBER, BIRTH_DATE, ORG_FOUNDER, ORG_CEO,TEL, MOBILE, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_MOBILE, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK)
VALUES('jasmine1112','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','jasmine', 'O', 'jasmine002@gmail.com','F123456223','1990/12/27','Tom老師', '鄭正','25644433', '0912356278','台中市','東區','大勇街28號', 'N','2015/6/8','N','陳玉華','0925343233','25643772','','');

INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, CERTIFICATE_ID_NUMBER ,BIRTH_DATE, TEL, MOBILE, COUNTY, DISTRICT, ADDRESS, EMAIL_VERTIFICATION, SIGN_UP_DATE)
VALUES('12345678','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','louis', 'P', 'anchor001@gmail.com','B298766553','1985/3/6','25644433', '0912356278','台南市','安南區','大眾路360號', 'N','2015/8/23');

INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, CERTIFICATE_ID_NUMBER, BIRTH_DATE, ORG_FOUNDER, ORG_CEO,TEL, MOBILE, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_MOBILE, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK)
VALUES('jack1112','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','jasmine', 'O', 'jasmine002@gmail.com','F123456223','1990/12/27','Tom老師', '鄭正','25644433', '0912356278','台中市','東區','大勇街28號', 'N','2015/6/8','N','陳玉華','0925343233','25643772','','');

INSERT INTO MEMBER ( ACCOUNT, PASSWORD, NAME, TYPE, EMAIL,CERTIFICATE_ID_NUMBER, BIRTH_DATE,TEL, MOBILE, COUNTY, DISTRICT, ADDRESS, EMAIL_VERTIFICATION, SIGN_UP_DATE)
VALUES('Louse1112','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','Louse1112', 'P', 'Louse1112000@gmail.com','A123456789', '1970/5/15','25644433', '0912356278','台北市','大安區','復興南路一段390號15樓', 'Y','2015/5/13');


--user_role
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (1, 1)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (1, 2)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (1, 3)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (2, 1)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (2, 2)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (2, 3)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (3, 1)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (3, 2)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (3, 3)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (4, 1)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (4, 2)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (4, 3)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (5, 2)





--mission
INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧老人',2,'L',3,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','大安區','復興南路一段390號15樓','A_New','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧小孩',2,'S',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','板橋區','復興南路一段390號15樓','A_New','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧動物',2,'L',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','信義區','復興南路一段390號15樓','A_New','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧老人2',3,'S',3,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','樹林區','復興南路一段390號15樓','A_VolunteerApproved','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧老人3',3,'S',3,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','台北市','信義區','復興南路一段390號15樓','A_VolunteerApproved','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧老人4',3,'S',3,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','A_VolunteerApproved','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧老人5',3,'S',3,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','樹林區','復興南路一段390號15樓','A_VolunteerApproved','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧小孩2',3,'L',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','大安區','復興南路一段390號15樓','B_AccountsPayable','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧小孩3',3,'L',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','信義區','復興南路一段390號15樓','B_AccountsPayable','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧小孩4',3,'L',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','大安區','復興南路一段390號15樓','B_AccountsPayable','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧小孩5',3,'L',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','信義區','復興南路一段390號15樓','B_AccountsPayable','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧小孩6',3,'L',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','大安區','復興南路一段390號15樓','B_AccountsPayable','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧動物2',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','C_Finish','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧動物3',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','C_Finish','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧動物4',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','樹林區','復興南路一段390號15樓','C_Finish','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧動物5',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','C_Finish','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧動物5',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','C_Cancel','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧動物5',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','C_Cancel','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧動物5',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','C_Cancel','2018/12/31',0);

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY) 
VALUES (1,'一起照顧動物5',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','C_Cancel','2018/12/31',0);

--ORDER_LIST
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(8, 1,  'ServiceFinishNotPay', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(8, 2,  'ServiceFinishNotPay', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(8, 3,  'VolunteerApply', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(8, 4,  'ServiceFinishNotPay', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(8, 5,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterAcceptService', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterRefuceServiceMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'ServiceFinishNotPay', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'ServiceFinishPayMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterCancleActivityPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerCancleActivityPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterAcceptService', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterRefuceServiceMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'ServiceFinishNotPay', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'ServiceFinishPayMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterCancleActivityPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerCancleActivityPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterAcceptService', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterRefuceServiceMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'ServiceFinishNotPay', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'ServiceFinishPayMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterCancleActivityPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerCancleActivityPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterAcceptService', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterRefuceServiceMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'ServiceFinishNotPay', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'ServiceFinishPayMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'RequesterCancleActivityPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(1, 4,  'VolunteerCancleActivityPunishMatchSuccess', '2018/10/11 17:00');



INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID,  ORDER_STATUS, VOLUNTEER_APPLY_TIME, ORDER_ACCEPT_TIME) 
VALUES(1, 1,  'RequesterRefuceServiceMatchFail', '2018/10/11 17:00', '2018/10/13 17:00' );

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME, ORDER_ACCEPT_TIME) 
VALUES(2, 2,  'RequesterRefuceServiceMatchFail', '2018/10/12 17:00', '2018/10/15 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID,  ORDER_STATUS, VOLUNTEER_APPLY_TIME, ORDER_ACCEPT_TIME) 
VALUES(2, 3,  'RequesterRefuceServiceMatchFail', '2018/11/10 17:00', '2018/11/14 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID,  ORDER_STATUS, VOLUNTEER_APPLY_TIME, ORDER_ACCEPT_TIME) 
VALUES(3, 1,  'RequesterRefuceServiceMatchFail', '2018/11/11 17:00', '2018/11/14 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID,  ORDER_STATUS, VOLUNTEER_APPLY_TIME, ORDER_ACCEPT_TIME) 
VALUES(4, 4,  'RequesterRefuceServiceMatchFail', '2018/11/20 17:00', '2018/11/21 17:00');

--time_ledger
INSERT INTO TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,WITHDRAWAL_VALUE,BALANCE_VALUE,DESCRIPTION)
VALUES(1, '2018/11/11',100,0,100,'deposit');

INSERT INTO TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,WITHDRAWAL_VALUE,BALANCE_VALUE,DESCRIPTION)
VALUES(1, '2018/11/11',50,150,0,'deposit');

INSERT INTO TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,WITHDRAWAL_VALUE,BALANCE_VALUE,DESCRIPTION)
VALUES(2, '2018/11/11', 500, 500,0,'deposit');

INSERT INTO TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,WITHDRAWAL_VALUE,BALANCE_VALUE,DESCRIPTION)
VALUES(3, '2018/12/10',300,0,300,'deposit');

INSERT INTO TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,WITHDRAWAL_VALUE,BALANCE_VALUE,DESCRIPTION)
VALUES(3, '2018/12/10', 150, 0,450,'deposit');

INSERT INTO TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,WITHDRAWAL_VALUE,BALANCE_VALUE,DESCRIPTION)
VALUES(4, '2018/12/10',300,0,300,'deposit');

INSERT INTO TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,WITHDRAWAL_VALUE,BALANCE_VALUE,DESCRIPTION)
VALUES(3, '2018/12/11', 50, 0,500,'deposit');

INSERT INTO TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,WITHDRAWAL_VALUE,BALANCE_VALUE,DESCRIPTION)
VALUES(1, '2018/12/11',300,0,300,'deposit');

INSERT INTO TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,WITHDRAWAL_VALUE,BALANCE_VALUE,DESCRIPTION)
VALUES(1, '2018/12/11', 150, 0,450,'deposit');

INSERT INTO TIME_LEDGER (MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,WITHDRAWAL_VALUE,BALANCE_VALUE,DESCRIPTION)
VALUES(4, '2018/12/12',0,300,0,'deposit');

--penalty

INSERT INTO PENALTY (ORDER_LIST, accuser_id, defendant_id, update_date, description, status, penalty_time_value)
VALUES(1, 1, 4,'2018/11/10', '缺席', 1 , 4);

INSERT INTO PENALTY (ORDER_LIST, accuser_id, defendant_id, update_date, description, status, penalty_time_value)
VALUES(2, 2, 3,'2018/11/11', '遲到1小時', 2 , 2);

INSERT INTO PENALTY (ORDER_LIST, accuser_id, defendant_id, update_date, description, status, penalty_time_value)
VALUES(3, 5, 2, '2018/11/12', '服務態度不佳', 3 ,0);

INSERT INTO PENALTY (ORDER_LIST, accuser_id, defendant_id, update_date, description, status, penalty_time_value)
VALUES(4, 1, 3, '2018/11/13', '缺席', 1 , 4);



--donation


INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(1,3,10,'2018/11/6');

INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(2,3,15,'2018/05/6');

INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(3,3,3,'2018/10/6');

INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(1,3,10,'2018/11/6');

INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(2,5,15,'2018/05/6');

INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(3,5,3,'2018/10/6');

INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(3,5,140,'2013/11/6');

INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(1,5,102,'2015/11/6');

INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(1,5,210,'2018/1/6');

INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(4,5,102,'2015/11/6');

INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(4,3,210,'2018/1/6');

INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(4,3,102,'2015/11/6');

INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(1,3,210,'2018/1/6');

INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(2,3,102,'2015/11/6');

INSERT INTO DONATION(DONATOR_ID,ORG_DONEE_ID,DONATE_VALUE,donate_time) 
VALUES(1,5,210,'2018/1/6');

--Complaint
INSERT INTO COMPLAINT(ORDER_ID,MEMBER_ID,COMPLAINTTIME,COMPLAINTTYPE,DESCRIPTION)
VALUES(1,1,'2018/12/11','ORDER','不滿');

INSERT INTO COMPLAINT(ORDER_ID,MEMBER_ID,COMPLAINTTIME,COMPLAINTTYPE,DESCRIPTION)
VALUES(2,3,'2018/12/13','PENALTY','處罰太重');