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
INSERT INTO MEMBER ( ACCOUNT, PASSWORD, NAME, TYPE, EMAIL,CERTIFICATE_ID_NUMBER, BIRTH_DATE,TEL, MOBILE, COUNTY, DISTRICT, ADDRESS, EMAIL_VERTIFICATION, SIGN_UP_DATE,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
VALUES('sheila1112','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','小萱', 'P', 'sheila000@gmail.com','A129516346', '1970/5/15','02-25644433', '0912-356-278','台北市','大安區','復興南路一段390號15樓', 'Y','2015/5/13',0,0,0,'lalabear.jpg');

INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, CERTIFICATE_ID_NUMBER ,BIRTH_DATE, TEL, MOBILE, COUNTY, DISTRICT, ADDRESS, EMAIL_VERTIFICATION, SIGN_UP_DATE,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
VALUES('anchor1112','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','阿家', 'P', 'anchor001@gmail.com','A129516346','1985/3/6','02-25644433', '0912-356-278','台南市','安南區','大眾路360號', 'N','2015/2/23',0,0,0,'lalabear.jpg');


INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, CERTIFICATE_ID_NUMBER, BIRTH_DATE, ORG_FOUNDER, ORG_CEO,TEL, MOBILE, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_MOBILE, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
VALUES('jasmine1112','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','小潔', 'P', 'jasmine002@gmail.com','22099131','1990/12/27','阿湯哥', '鄭正','02-25644433', '0912-356-278','台中市','東區','大勇街28號', 'N','2015/6/8','N','陳玉華','0925-343-233','02-25643772','','',0,0,0,'lalabear.jpg');


INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, CERTIFICATE_ID_NUMBER ,BIRTH_DATE, TEL, MOBILE, COUNTY, DISTRICT, ADDRESS, EMAIL_VERTIFICATION, SIGN_UP_DATE,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
VALUES('12345678','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','阿安', 'P', 'anchor001@gmail.com','A129516346','1985/3/6','02-25644433', '0912-356-278','台南市','安南區','大眾路360號', 'N','2015/8/23',0,0,0,'lalabear.jpg');


INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, CERTIFICATE_ID_NUMBER, BIRTH_DATE, ORG_FOUNDER, ORG_CEO,TEL, MOBILE, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_MOBILE, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
VALUES('jack1112','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','小潔', 'P', 'jasmine002@gmail.com','84149358','1990/12/27','阿湯老師', '鄭正','02-25644433', '0912-356-278','台中市','東區','大勇街28號', 'N','2015/6/8','N','陳玉華','0925-343-233','02-25643772','','',0,0,0,'lalabear.jpg');


INSERT INTO MEMBER ( ACCOUNT, PASSWORD, NAME, TYPE, EMAIL,CERTIFICATE_ID_NUMBER, BIRTH_DATE,TEL, MOBILE, COUNTY, DISTRICT, ADDRESS, EMAIL_VERTIFICATION, SIGN_UP_DATE,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
VALUES('Louse1112','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','安哥', 'P', 'Louse1112000@gmail.com','A129516346', '1970/5/15','02-25644433', '0912-356-278','台北市','大安區','復興南路一段390號15樓', 'Y','2015/5/13',0,0,0,'lalabear.jpg');


INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, TEL, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
values('sowtaiwan','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','荒野保護協會','O','sowtaiwan@gmail.com', '02-23071568', '台北市', '中正區', '詔安街204號', 'Y', '2019/1/8', 'Y' ,'何芝迎', '02-23071568分機22' , '', 'https://www.sow.org.tw/', 0, 0, 0, 'memberpic7.jpg')

INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, TEL, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
values('aa0710f','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','臺南市重症兒童關懷協會','O', 'aa0710f@yahoo.com.tw', '06-2338685', '台南市', '歸仁區', '大廟六街30之10號', 'Y', '2019/1/8', 'Y' , '蔡雅惠', '02-23071568分機22' , '', 'https://www.facebook.com/pages/%E8%87%BA%E5%8D%97%E5%B8%82%E9%87%8D%E7%97%87%E5%85%92%E7%AB%A5%E9%97', 0, 0, 0, 'memberpic8.jpg')

INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, TEL, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
values('twtulipmov','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','台灣鬱金香動作障礙關懷協會','O','twtulipmov@gmail.com', '03-8576526', '花蓮縣' ,'花蓮市', '中央路三段707號', 'Y', '2019/1/8', 'Y' ,'楊小姐', '03-8576526' , '', 'http://www.twtulipmov.com.tw/', 0, 0, 0, 'memberpic9.jpg')

INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, TEL, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
values('amyho','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','千禧之愛健康基金會','O','amyho@mail.pec.com.tw', '02-87860996', '台北市', '信義區', '松高路9號23樓', 'Y', '2019/1/8', 'Y' ,'何明穎', '02-87860996' , '', 'http://www.1000-love.org.tw/', 0, 0, 0, 'memberpic10.jpg')

INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, TEL, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
values('inworldlife','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','社團法人中華民國失智者照顧協會','O','inworldlife@livemail.tw', '04-23028528', '台中市', '西區', '忠明南路203號3樓', 'Y', '2019/1/8', 'Y' ,'施茗棋', '04-23028528分機324' , '', 'https://www.cdca.org.tw/', 0, 0, 0, 'memberpic11.jpg')

INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, TEL, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
values('sw1','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','財團法人臺北市私立愛愛院','O','sw1@aiai.org.tw', '02-23060493', '台北市', '萬華區', '大理街175巷27號', 'Y', '2019/1/8', 'Y' ,'謝蕙如', '02-23060493分機2300' , '', 'http://aiai.org.tw', 0, 0, 0, 'memberpic12.jpg')

INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, TEL, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
values('dep138','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','財團法人伊甸社會福利基金會','O','dep138@gmail.com', '02-22307715', '台北市', '文山區', '台北市文山區萬和街6號4樓之2', 'Y', '2019/1/8', 'Y' ,'李先生', '02-22307715分機5104' , '', 'http://www.eden.org.tw', 0, 0, 0, 'memberpic13.jpg')

INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, TEL, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
values('good119','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','社團法人中華民國恩友愛心協會','O','good119.org@gmail.com', '02-27515345', '台北市', '大安區', '忠孝東路三段248巷19弄36號', 'Y', '2019/1/8', 'Y' ,'詹熒熒', '02-27515345' , '', 'http://good119.org', 0, 0, 0, 'memberpic14.jpg')

INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, TEL, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
values('brain016','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','精神健康基金會','O','brain016@mhf.org.tw', '02-23279938', '台北市', '中正區', '羅斯福路一段24號9樓', 'Y', '2019/1/8', 'Y' ,'陳小姐', '02-23279938分機16' , '', 'http://www.mhf.org.tw', 0, 0, 0, 'memberpic15.jpg')

INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, TEL, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
values('xinaibt','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','台灣盲人重建院','O','xin@ibt.org.tw', '02-29985588', '新北市', '新莊區', '中正路384號', 'Y', '2019/1/8', 'Y' ,'梁小姐', '02-29985588分機320' , '', 'http://www.ibt.org.tw', 0, 0, 0, 'memberpic16.jpg')

--user_role
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (1, 1)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (1, 2)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (2, 1)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (2, 2)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (3, 1)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (3, 2)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (4, 1)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (4, 2)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (5, 2)


INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (6, 3)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (7, 3)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (8, 3)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (9, 3)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (10, 3)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (11, 3)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (12, 3)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (13, 3)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (14, 3)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (15, 3)
INSERT INTO USER_ROLE (USER_ID, ROLE_ID) VALUES (16, 3)




--mission
INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (2,'一起照顧老人',2,'L',3,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','大安區','復興南路一段390號15樓','A_New','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (2,'一起照顧小孩',2,'S',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','板橋區','復興南路一段390號15樓','A_New','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (2,'一起照顧動物',2,'L',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','信義區','復興南路一段390號15樓','A_New','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧老人10',2,'L',3,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','大安區','復興南路一段390號15樓','A_New','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧小孩10',2,'S',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','板橋區','復興南路一段390號15樓','A_New','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧動物10',2,'L',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','信義區','復興南路一段390號15樓','A_New','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧老人11',2,'L',3,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','大安區','復興南路一段390號15樓','A_New','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧小孩11',2,'S',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','板橋區','復興南路一段390號15樓','A_New','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧動物11',2,'L',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','信義區','復興南路一段390號15樓','A_New','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧老人12',2,'L',3,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','大安區','復興南路一段390號15樓','A_New','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧小孩12',2,'S',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','板橋區','復興南路一段390號15樓','A_New','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧動物12',2,'L',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','信義區','復興南路一段390號15樓','A_New','2018/12/31',0,'detailsquare.jpg');


INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧老人2',3,'S',3,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','樹林區','復興南路一段390號15樓','A_VolunteerApproved','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧老人3',3,'S',3,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','台北市','信義區','復興南路一段390號15樓','A_VolunteerApproved','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧老人4',3,'S',3,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','A_VolunteerApproved','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧老人5',3,'S',3,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','樹林區','復興南路一段390號15樓','A_VolunteerApproved','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧小孩2',3,'L',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','大安區','復興南路一段390號15樓','B_AccountsPayable','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧小孩3',3,'L',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','信義區','復興南路一段390號15樓','B_AccountsPayable','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧小孩4',3,'L',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','大安區','復興南路一段390號15樓','B_AccountsPayable','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧小孩5',3,'L',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','信義區','復興南路一段390號15樓','B_AccountsPayable','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'一起照顧小孩6',3,'L',1,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Brian','0912456789','brian@gmail.com','這是一份好工作喔','台北市','大安區','復興南路一段390號15樓','B_AccountsPayable','2018/12/31',0,'detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,FINISH_DATE,MISSION_PIC_NAME) 
VALUES (1,'一起照顧動物2',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','C_Finish','2018/12/31',0,'2019/01/01','detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,FINISH_DATE,MISSION_PIC_NAME) 
VALUES (1,'一起照顧動物3',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','C_Finish','2018/12/31',0,'2019/01/01','detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,FINISH_DATE,MISSION_PIC_NAME) 
VALUES (1,'一起照顧動物4',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','樹林區','復興南路一段390號15樓','C_Finish','2018/12/31',0,'2019/01/01','detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,FINISH_DATE,MISSION_PIC_NAME) 
VALUES (1,'一起照顧動物5',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','C_Finish','2018/12/31',0,'2019/01/01','detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,FINISH_DATE,MISSION_PIC_NAME) 
VALUES (1,'一起照顧動物5',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','C_Cancel','2018/12/31',0,'2019/01/01','detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,FINISH_DATE,MISSION_PIC_NAME) 
VALUES (1,'一起照顧動物5',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','C_Cancel','2018/12/31',0,'2019/01/01','detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,FINISH_DATE,MISSION_PIC_NAME) 
VALUES (1,'一起照顧動物5',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','C_Cancel','2018/12/31',0,'2019/01/01','detailsquare.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,FINISH_DATE,MISSION_PIC_NAME) 
VALUES (2,'一起照顧動物5',3,'S',5,'1970/5/15','2018/11/11 17:00','2018/12/31 17:00',5,'Kevin','0912456789','brian@gmail.com','這是一份好工作喔','新北市','土城區','復興南路一段390號15樓','C_Cancel','2018/12/31',0,'2019/01/01','detailsquare.jpg');

--ORDER_LIST
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(17, 1,  'ServiceFinishNotPay', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(17, 2,  'ServiceFinishNotPay', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(17, 3,  'ServiceFinishNotPay', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(17, 4,  'ServiceFinishNotPay', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(17, 5,  'ServiceFinishNotPay', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 1,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 2,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 3,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterAcceptService', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterRefuceServiceMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'ServiceFinishNotPay', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'ServiceFinishPayMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterCancleActivityPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerCancleActivityPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterAcceptService', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterRefuceServiceMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'ServiceFinishNotPay', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'ServiceFinishPayMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterCancleActivityPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerCancleActivityPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterAcceptService', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterRefuceServiceMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'ServiceFinishNotPay', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'ServiceFinishPayMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterCancleActivityPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerCancleActivityPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterAcceptService', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterRefuceServiceMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerCancleTransactionMatchFail', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'ServiceFinishNotPay', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'ServiceFinishPayMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'RequesterCancleActivityPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerCancleActivityNoPunishMatchSuccess', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 4,  'VolunteerCancleActivityPunishMatchSuccess', '2018/10/11 17:00');



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

--SYSTEM_MESSAGE
INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ID,MEMBER_ID)
VALUES('GetTimeValue','2018/8/15 17:00','加值禮包來囉!!打開送您100點','N',2,1);

INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ID,MEMBER_ID)
VALUES('Penalty','2018/8/15 21:35','您被懲罰了!!!!','N',2,1);

INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ID,MEMBER_ID)
VALUES('GetTimeValue','2018/9/21 10:00','加值禮包來囉!!打開送您100點','N',2,1);

INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ID,MEMBER_ID)
VALUES('Penalty','2018/10/18 14:20','您被懲罰了!!!!','N',2,1);

INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ID,MEMBER_ID)
VALUES('Penalty','2019/10/18 14:20','您被懲罰了!!!!','Y',2,1);

INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ID,MEMBER_ID)
VALUES('GetTimeValue','2018/8/15 17:00','加值禮包來囉!!打開送您100點','N',2,2);

INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ID,MEMBER_ID)
VALUES('Penalty','2018/8/15 21:35','您被懲罰了!!!!','N',2,2);

INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ID,MEMBER_ID)
VALUES('GetTimeValue','2018/9/21 10:00','加值禮包來囉!!打開送您100點','N',2,2);

INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ID,MEMBER_ID)
VALUES('Penalty','2018/10/18 14:20','您被懲罰了!!!!','N',2,2);

INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ID,MEMBER_ID)
VALUES('Penalty','2019/10/18 14:20','您被懲罰了!!!!','Y',2,2);