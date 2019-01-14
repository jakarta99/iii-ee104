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
VALUES('jasmine1112','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','小潔', 'P', 'jasmine002@gmail.com','A129516346','1990/12/27','阿湯哥', '鄭正','02-25644433', '0912-356-278','台中市','東區','大勇街28號', 'N','2015/6/8','N','陳玉華','0925-343-233','02-25643772','','',0,0,0,'lalabear.jpg');


INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, CERTIFICATE_ID_NUMBER ,BIRTH_DATE, TEL, MOBILE, COUNTY, DISTRICT, ADDRESS, EMAIL_VERTIFICATION, SIGN_UP_DATE,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
VALUES('12345678','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','阿安', 'P', 'anchor001@gmail.com','A129516346','1985/3/6','02-25644433', '0912-356-278','台南市','安南區','大眾路360號', 'N','2015/8/23',0,0,0,'lalabear.jpg');


INSERT INTO MEMBER (ACCOUNT, PASSWORD,NAME, TYPE, EMAIL, CERTIFICATE_ID_NUMBER, BIRTH_DATE, ORG_FOUNDER, ORG_CEO,TEL, MOBILE, COUNTY, DISTRICT, ADDRESS,EMAIL_VERTIFICATION, SIGN_UP_DATE, ORG_IDENTITY_CONFIRMATION, ORG_CONTACT_PERSON, ORG_CONTACT_PERSON_MOBILE, ORG_CONTACT_PERSON_TEL , ORG_FOUND_PURPOSE, ORG_WEBSITE_LINK,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
VALUES('jack1112','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','小潔', 'P', 'jasmine002@gmail.com','A129516346','1990/12/27','阿湯老師', '鄭正','02-25644433', '0912-356-278','台中市','東區','大勇街28號', 'N','2015/6/8','N','陳玉華','0925-343-233','02-25643772','','',0,0,0,'lalabear.jpg');

--ADMIN ACCOUNT
INSERT INTO MEMBER ( ACCOUNT, PASSWORD, NAME ,PICTURE)
VALUES ('royadmin1112', '$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG', 'TimeBank管理人','admin_pic.png')


--INSERT INTO MEMBER ( ACCOUNT, PASSWORD, NAME, TYPE, EMAIL,CERTIFICATE_ID_NUMBER, BIRTH_DATE,TEL, MOBILE, COUNTY, DISTRICT, ADDRESS, EMAIL_VERTIFICATION, SIGN_UP_DATE,SUM_SCORE,SCORED_TIMES,AVERAGE_SCORE,PICTURE)
--VALUES('Louse1112','$2a$10$GQn5XIqeZU9PDIcuJNOE3ertKltshuwA98pfQQmNvvwdOKDmdVZBG','安哥', 'P', 'Louse1112000@gmail.com','A129516346', '1970/5/15','02-25644433', '0912-356-278','台北市','大安區','復興南路一段390號15樓', 'Y','2015/5/13',0,0,0,'lalabear.jpg');


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
--個人會員發布的任務
INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (5,'[個人5]陪伴家中長者就醫',3,'S',3,'2019/1/9','2019/2/13 14:00','2019/2/13 17:00',1,'曾小潔','0912456789','jasmine@gmail.com','我的母親高齡75歲，行動不便(拄柺杖)且住在五層樓高的無電梯公寓。2019/2/13下午需要去仁愛醫院回診檢查糖尿病，但當天家人都需要工作，無法抽身，因此需要女性志工陪同回診檢查慢性病(包含協助下樓、交通、完成醫療診斷程序後陪同返家、上樓)。','臺北市','大安區','復興南路一段390號15樓','A_New','2019/2/19',0,'old-man.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (5,'[個人5]協助獨居身心障礙者年節前大掃除',6,'S',2,'2019/1/12','2019/2/1 10:00','2019/2/1 17:00',1,'趙技安','0912456789','jasmine@gmail.com','我患有帕金森氏症，無法獨力負擔粗重的打掃工作，農曆年前希望能徵得好心人協助我進行大掃除工作(包含幫忙回收大型家具、換燈泡等較粗重或需要爬高的項目)。','臺北市','南港區','愛心路一段390號15樓','A_New','2019/1/31',0,'kitchen-clean.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (1,'[個人1]協助在過年期間餵食流浪貓',6,'L',5,'2019/1/9','2019/2/4 19:00','2019/2/9 19:00',1,'陳大德','0912456789','brian@gmail.com','我平常每天晚上七點左右會在淡水街頭固定餵食大約8~9隻流浪貓，但過年期間共有5天要回南部老家，實在找不到人幫忙。希望能找到過年期間可以幫忙餵貓和收拾飼料盆的朋友，我會把飼料寄放在附近店家，也會先找一天帶您熟悉放置貓飼料的位置。','新北市','淡水區','貓奴路一段390號15樓','A_New','2019/1/31',0,'canned-food.jpg');

--機構會員發布的任務
INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (7,'[機構7]臺灣國際淨灘行動',3,'S',7,'2019/1/2','2019/4/27 14:00','2019/4/27 17:00',10,'劉先生','0912456789','brian@gmail.com','全球海灘上塑膠垃圾的密度是海底的29倍，更是大海表面的兩千倍。海岸線像一台不用插電的吸塵器，透過潮汐與波浪的日夜推移，讓漂浮的垃圾不斷堆積在沙灘上。<br>原來我們不一定要辛苦航行到太平洋中心打撈稀薄的塑膠碎片，與海底與海面相比，海岸是人類最容易到達的海洋環境，讓「淨灘」成為每個地球人守護海洋最直接的行動。<br>誠摯地邀請您與我們及全世界愛海的朋友一齊來加入淨灘的行列。','新北市','八里區','挖仔尾海灘','A_New','2019/4/10',0,'beach.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (12,'[機構12]愛愛院-社區照顧關懷據點志工 ',3,'L',3,'2019/1/2','2019/3/1 14:00','2019/7/31 17:00',8,'陳小姐','02-28828899','aiaiai@gmail.com','如果您想要豐富退休的生活，如果您想要好好充實自己的生活；<br>如果您對於老人服務充滿熱忱，如果您想要投入公益服務；<br>那麼愛愛院期待您的加入。<br>愛愛院急徵有志一同的志工夥伴們一起加入『愛』的行列。<br>愛愛院的志工項目：<br>☆ 關懷陪談<br>☆ 電話問安<br>☆ 活動支援<br>☆ 庶務機動<br>☆ 居家訪視<br>','台北市','萬華區','大理街175巷27號','A_New','2019/6/30',0,'aiai.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (13,'[機構13]伊甸基金會-偏鄉暑期陪讀志工 ',8,'S',1,'2019/7/7','2019/8/24 09:00','2019/7/31 17:00',4,'廖先生','03-28828899','eedian@gmail.com','在偏鄉社區中，許多孩子有著不同的天賦，如音樂、舞蹈等，卻因為城鄉差距、貧富落差的關係，失去了發展的機會；或是沒有經費可以栽培孩子、或是地處偏僻比較缺乏老師願意來教，對許多偏鄉弱勢的孩子來說，才藝學習是遥不可及的夢想，冀望能夠透過音樂教學相關才藝課程，給予多元刺激適性發展，偏鄉孩子一樣能，同時我們深信「教育」是提高人口素質的根本方法：唯有「教育」能幫助人脫離貧困和愚昧。所以我們很願意協助更多的偏鄉兒童、原住民學子，努力求學、奮發向上、發揮偏鄉兒童、原住民的才華，找到每個人的一片天空。<br>希望徵求兩名志工，陪伴孩子、豐富孩子的暑假。','台東縣','東河鄉','泰源村泰源書屋','A_New','2019/6/10',0,'readwithchild.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (13,'[機構13]伊甸基金會-為家漆上愛志工 ',8,'S',4,'2019/1/3','2019/1/5 09:00','2019/1/5 17:00',15,'曹小姐','03-28828899','eedian@gmail.com','伊甸基金會與特力屋士林店招募羅賴把志工，一起聯手打造友善安居家庭日，訂於107年12月30日(六)至特力屋士林店受訓後，於108年1月5日(六)至弱勢家庭家中刷油漆，一起為家漆上愛。','台北市','文山區','萬和街6號4樓之2','B_AccountsPayable','2019/1/5',0,'paint.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (13,'[機構13]伊甸基金會-視障重建中心導盲志工 ',3,'L',2,'2019/1/8','2019/3/1 09:00','2019/12/31 17:00',5,'董小姐','08-28828899','eedian@gmail.com','你是充滿熱忱、有滿腔愛心的人嗎？是否遇過視障者需要協助時，卻不知該怎麼幫忙呢？竭誠邀請您一同參與導盲志工培訓招募，完成培訓後可排班協助視障者外出購物、休閒活動及陪同參與社區化活動。歡迎您一同加入我們的行列，協助視障者參與社會。','台北市','松山區','光復北路60巷19-6號B1樓','A_New','2019/12/31',0,'blindvol.jpg');

INSERT INTO mission( member_Id, title, time_Value, term_Type, service_Type, publish_Date ,start_Date ,end_Date ,people_Needed ,contact_Person ,contact_Phone ,contact_Email ,discription ,county ,district ,address,mission_status,DEADLINE,APPROVED_QUANTITY,MISSION_PIC_NAME) 
VALUES (11,'[機構11]失智者照顧協會-失智關懷志工 ',4,'L',2,'2019/1/8','2019/3/1 09:00','2019/12/31 17:00',20,'魏先生','08-28828899','shichih@gmail.com','有鑑於失智症罹患率逐年增加，及其為家庭、社會帶來的衝擊與壓力，本會與臺北市立聯合醫院團隊一直致力於失智整合照護服務的建構與發展，成立失智症醫療照護聯盟，凝聚社區力量、提升社區對失智者的認同與支持，達到失智友善社區的願景。<br>而這願景的實現需要團隊的共識，更需志工的投入和參與。 因此我們預計在108年度辦理失智關懷志工招募，並予以一連串的專業訓練培養所需識能，協助臺北市立聯合醫院各院區日照、據點、篩檢、記憶門診…等，予以失智症患者與家屬更專業用心的陪伴，共同走過漫長醫療與照護的無助歷程。竭誠邀請您一同加入!','台北市','松山區','光復北路60巷19-6號B1樓','A_New','2019/12/31',0,'dementia.jpg');




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
VALUES(6, 1,  'VolunteerApply', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(6, 2,  'VolunteerApply', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(6, 3,  'VolunteerApply', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(6, 4,  'VolunteerApply', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(6, 5,  'VolunteerApply', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME)
VALUES(7, 2,  'ServiceFinishNotPay', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME)
VALUES(7, 3,  'ServiceFinishNotPay', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME)
VALUES(7, 4,  'ServiceFinishNotPay', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME)
VALUES(7, 5,  'ServiceFinishNotPay', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME)
VALUES(7, 1,  'ServiceFinishNotPay', '2018/10/11 17:00');
INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 1,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 2,  'VolunteerApply', '2018/10/11 17:00');

INSERT INTO ORDER_LIST(MISSION, VOLUNTEER_ID, ORDER_STATUS, VOLUNTEER_APPLY_TIME) 
VALUES(4, 3,  'VolunteerApply', '2018/10/11 17:00');

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
VALUES(13, '2018/11/11',1000,0,1000,'deposit');

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
VALUES(3, 5, 2, '2018/11/12', '服務態度不佳', 2 ,0);

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


INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ACCOUNT,MEMBER_ACCOUNT,PENALTY_ID)
VALUES('Penalty','2018/8/15 21:35','您被懲罰了!!!!','N','anchor1112','anchor1112',3);

INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ACCOUNT,MEMBER_ACCOUNT)
VALUES('GetTimeValue','2018/9/21 10:00','加值禮包來囉!!打開送您100點','N','anchor1112','anchor1112');

INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ACCOUNT,MEMBER_ACCOUNT)
VALUES('GetTimeValue','2018/8/15 17:00','加值禮包來囉!!打開送您100點','N','anchor1112','sheila1112');

INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ACCOUNT,MEMBER_ACCOUNT)
VALUES('GetTimeValue','2018/9/21 10:00','加值禮包來囉!!打開送您100點','N','anchor1112','sheila1112');

INSERT INTO SYSTEM_MESSAGE(MESSAGE_TYPE,RELEASE_TIME,[MESSAGE],READ_STATUS,SENDER_ACCOUNT,MEMBER_ACCOUNT)
VALUES('GetTimeValue','2018/8/15 17:00','加值禮包來囉!!打開送您100點','N','anchor1112','anchor1112');