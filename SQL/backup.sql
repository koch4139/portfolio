--이하는 admin권한으로 스크립트 실행
/* system 계정에서 실행한다. */
/* 실습의 편의를 위해 ORACLE 12C 이상의 CDB 환경에서 사용, 사용자 이름 c## 추가 */ 
DROP USER c##team CASCADE;
CREATE USER c##team IDENTIFIED BY team;

GRANT CONNECT, RESOURCE TO c##team;
GRANT CREATE VIEW, CREATE SYNONYM TO c##team;
GRANT UNLIMITED TABLESPACE TO c##team;

ALTER USER c##team ACCOUNT UNLOCK;
/* 여기서부터는 마당 계정으로 접속 */
conn c##team/team;
--------------------------------------------------------
--  �뙆�씪�씠 �깮�꽦�맖 - 紐⑹슂�씪-4�썡-01-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BOARD_BNUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TEAM"."BOARD_BNUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence BOARD_CATEGORY_CID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TEAM"."BOARD_CATEGORY_CID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence BOARD_UPLOAD_FILE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TEAM"."BOARD_UPLOAD_FILE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence BOARD_UPLOAD_FILE_SQL
--------------------------------------------------------

   CREATE SEQUENCE  "C##TEAM"."BOARD_UPLOAD_FILE_SQL"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence MATERIAL_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TEAM"."MATERIAL_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence RBOARD_RNUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TEAM"."RBOARD_RNUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence RECIPE_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TEAM"."RECIPE_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence STEP_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TEAM"."STEP_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence STEP_SEQUENCE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TEAM"."STEP_SEQUENCE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."BOARD" 
   (	"BNUM" NUMBER(10,0), 
	"BCATEGORY" NUMBER(10,0), 
	"BTITLE" VARCHAR2(150), 
	"BID" VARCHAR2(40), 
	"BNICKNAME" VARCHAR2(30), 
	"BCDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"BUDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"BHIT" NUMBER(5,0) DEFAULT 0, 
	"BCONTENT" CLOB, 
	"BGROUP" NUMBER(5,0), 
	"BSTEP" NUMBER(5,0), 
	"BINDENT" NUMBER(5,0), 
	"COL1" VARCHAR2(30), 
	"COL2" VARCHAR2(30), 
	"COL3" VARCHAR2(30)
   ) ;

   COMMENT ON COLUMN "C##TEAM"."BOARD"."BNUM" IS '寃뚯떆湲�踰덊샇';
   COMMENT ON COLUMN "C##TEAM"."BOARD"."BCATEGORY" IS '遺꾨쪟移댄뀒怨좊━';
   COMMENT ON COLUMN "C##TEAM"."BOARD"."BTITLE" IS '�젣紐�';
   COMMENT ON COLUMN "C##TEAM"."BOARD"."BID" IS '�옉�꽦�옄ID';
   COMMENT ON COLUMN "C##TEAM"."BOARD"."BNICKNAME" IS '蹂꾩묶';
   COMMENT ON COLUMN "C##TEAM"."BOARD"."BCDATE" IS '�옉�꽦�씪';
   COMMENT ON COLUMN "C##TEAM"."BOARD"."BUDATE" IS '�닔�젙�씪';
   COMMENT ON COLUMN "C##TEAM"."BOARD"."BHIT" IS '議고쉶�닔';
   COMMENT ON COLUMN "C##TEAM"."BOARD"."BCONTENT" IS '蹂몃Ц�궡�슜';
   COMMENT ON COLUMN "C##TEAM"."BOARD"."BGROUP" IS '�떟湲�洹몃９';
   COMMENT ON COLUMN "C##TEAM"."BOARD"."BSTEP" IS '�떟蹂�湲��쓽 �떒怨�';
   COMMENT ON COLUMN "C##TEAM"."BOARD"."BINDENT" IS '�떟蹂�湲��쓽 �뱾�뿬�벐湲�';
   COMMENT ON COLUMN "C##TEAM"."BOARD"."COL1" IS '�엫�떆1';
   COMMENT ON COLUMN "C##TEAM"."BOARD"."COL2" IS '�엫�떆2';
   COMMENT ON COLUMN "C##TEAM"."BOARD"."COL3" IS '�엫�떆3';
--------------------------------------------------------
--  DDL for Table BOARD_CATEGORY
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."BOARD_CATEGORY" 
   (	"CID" NUMBER(10,0), 
	"CNAME" VARCHAR2(60), 
	"USER_YN" CHAR(1), 
	"USE_YN" CHAR(1)
   ) ;

   COMMENT ON COLUMN "C##TEAM"."BOARD_CATEGORY"."CID" IS '遺꾨쪟肄붾뱶';
   COMMENT ON COLUMN "C##TEAM"."BOARD_CATEGORY"."CNAME" IS '遺꾨쪟紐�';
--------------------------------------------------------
--  DDL for Table BOARD_UPLOAD_FILE
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."BOARD_UPLOAD_FILE" 
   (	"FID" NUMBER(10,0), 
	"BNUM" NUMBER(10,0), 
	"FNAME" VARCHAR2(150), 
	"FSIZE" VARCHAR2(45), 
	"FTYPE" VARCHAR2(100), 
	"FDATA" BLOB, 
	"CDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"UDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"COLUMN1" VARCHAR2(20), 
	"COLUMN2" VARCHAR2(20)
   ) ;

   COMMENT ON COLUMN "C##TEAM"."BOARD_UPLOAD_FILE"."FID" IS '�뙆�씪�븘�씠�뵒';
   COMMENT ON COLUMN "C##TEAM"."BOARD_UPLOAD_FILE"."BNUM" IS '寃뚯떆湲�踰덊샇';
   COMMENT ON COLUMN "C##TEAM"."BOARD_UPLOAD_FILE"."FNAME" IS '�뙆�씪紐�';
   COMMENT ON COLUMN "C##TEAM"."BOARD_UPLOAD_FILE"."FSIZE" IS '�뙆�씪�겕湲�';
   COMMENT ON COLUMN "C##TEAM"."BOARD_UPLOAD_FILE"."FTYPE" IS '�뙆�씪�쑀�삎';
   COMMENT ON COLUMN "C##TEAM"."BOARD_UPLOAD_FILE"."FDATA" IS '泥⑤��뙆�씪';
   COMMENT ON COLUMN "C##TEAM"."BOARD_UPLOAD_FILE"."CDATE" IS '�옉�꽦�씪';
   COMMENT ON COLUMN "C##TEAM"."BOARD_UPLOAD_FILE"."UDATE" IS '�닔�젙�씪';
   COMMENT ON COLUMN "C##TEAM"."BOARD_UPLOAD_FILE"."COLUMN1" IS '�엫�떆1';
   COMMENT ON COLUMN "C##TEAM"."BOARD_UPLOAD_FILE"."COLUMN2" IS '�엫�떆2';
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."CART" 
   (	"CART_ID" VARCHAR2(40), 
	"ITEM_ITEM_ID" VARCHAR2(40), 
	"ITEM_QUANTITY" NUMBER(*,0), 
	"SUM_PRICE" CHAR(10), 
	"MEMBER_USER_ID" VARCHAR2(40)
   ) ;
--------------------------------------------------------
--  DDL for Table CODE
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."CODE" 
   (	"CODE_ID" CHAR(4), 
	"NAME" VARCHAR2(40), 
	"USE_YN" CHAR(1), 
	"CODETYPE_ID" CHAR(4)
   ) ;
--------------------------------------------------------
--  DDL for Table CODETYPE
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."CODETYPE" 
   (	"CODETYPE_ID" CHAR(4), 
	"NAME" VARCHAR2(40)
   ) ;
--------------------------------------------------------
--  DDL for Table ITEM
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."ITEM" 
   (	"ITEM_ID" VARCHAR2(40), 
	"ITEM_NAME" VARCHAR2(50), 
	"ITEM_CONTENTS" CLOB, 
	"ITEM_PRICE" NUMBER(10,0), 
	"ITEM_STOCK" NUMBER(10,0), 
	"ITEM_C_DATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"ITEM_U_DATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"ITEM_VIEW_COUNT" NUMBER(10,0), 
	"ITEM_SELL_COUNT" NUMBER(10,0), 
	"ITEM_REVIEW_COUNT" NUMBER(10,0), 
	"ITEM_REVIEW_AVERAGE" NUMBER(10,0), 
	"ITEM_UNIT" VARCHAR2(60), 
	"ITEM_WEIGHT" VARCHAR2(60), 
	"ITEM_DELIVERY" VARCHAR2(60), 
	"ITEM_PACKAGE" VARCHAR2(60), 
	"ITEM_MENTION" VARCHAR2(60), 
	"ITEM_COUNTRY" VARCHAR2(60), 
	"ITEM_FILE" BLOB, 
	"ITEM_FSIZE" VARCHAR2(50), 
	"ITEM_FTYPE" VARCHAR2(50), 
	"ITEM_FNAME" VARCHAR2(50), 
	"ITEM_PHOTO" BLOB
   ) ;

   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_ID" IS 'id媛� ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_NAME" IS '�씠由� ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_CONTENTS" IS '臾쇳뭹 媛꾨떒�븳 �꽕紐� ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_PRICE" IS '媛�寃� ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_STOCK" IS '�옱怨� ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_C_DATE" IS '�깮�꽦 �궇吏� ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_U_DATE" IS '�닔�젙�궇吏� ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_VIEW_COUNT" IS '議고쉶�닔 ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_SELL_COUNT" IS '�뙋留ㅻ웾 ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_REVIEW_COUNT" IS '由щ럭 移댁슫�듃 ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_REVIEW_AVERAGE" IS '由щ럭 �룊洹� �젏�닔 ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_UNIT" IS '�뙋留� �떒�쐞 ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_WEIGHT" IS '以묐웾 ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_DELIVERY" IS '諛곗넚 援щ텇 �깮諛곕같�넚/�깉踰� 諛곗넚 �벑 ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_PACKAGE" IS '�룷�옣 ���엯 �깋�룞/醫낆씠�룷�옣 ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_MENTION" IS '�븞�궡 �궗�빆 ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_COUNTRY" IS '�썝�궛吏� ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_FILE" IS ' ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_FSIZE" IS '�궗吏� �궗�씠利� ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_FTYPE" IS '�궗吏� ���엯 ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_FNAME" IS '�궗吏� �씠由� ';
   COMMENT ON COLUMN "C##TEAM"."ITEM"."ITEM_PHOTO" IS '�궗吏� ';
--------------------------------------------------------
--  DDL for Table MATERIAL
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."MATERIAL" 
   (	"MATERIAL_ID" VARCHAR2(40), 
	"MATERIAL_TITLE" VARCHAR2(40), 
	"MATERIAL_CONTENTS" CLOB, 
	"RECIPE_RECIPE_ID" VARCHAR2(40)
   ) ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."MEMBER" 
   (	"USER_ID" VARCHAR2(40), 
	"USER_PW" VARCHAR2(30), 
	"USER_TEL" VARCHAR2(13), 
	"USER_SEQ" VARCHAR2(40), 
	"USER_NICKNAME" VARCHAR2(50), 
	"USER_GENDER" CHAR(6), 
	"USER_ADDRESS" CLOB, 
	"USER_BIRTH" DATE, 
	"USER_CDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"USER_UDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"USER_FILE" BLOB, 
	"USER_FSIZE" VARCHAR2(50), 
	"USER_FTYPE" VARCHAR2(50), 
	"USER_FNAME" VARCHAR2(50), 
	"USER_PHOTO" BLOB, 
	"USER_CONTENTS" CLOB
   ) ;
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."ORDERS" 
   (	"MEMBER_USER_ID" VARCHAR2(40), 
	"ORDER_ID" VARCHAR2(40), 
	"ORDER_DATE" DATE DEFAULT systimestamp, 
	"TOTAL_PRICE" NUMBER(*,0), 
	"ORDER_STATE" VARCHAR2(40)
   ) ;
--------------------------------------------------------
--  DDL for Table ORDER_DETAIL
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."ORDER_DETAIL" 
   (	"ORDER_ORDER_ID" VARCHAR2(40), 
	"ORDER_DETAIL_ID" VARCHAR2(40), 
	"ITEM_ITEM_ID" VARCHAR2(40)
   ) ;
--------------------------------------------------------
--  DDL for Table RBOARD
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."RBOARD" 
   (	"RNUM" NUMBER(10,0), 
	"BNUM" NUMBER(10,0), 
	"RID" VARCHAR2(40), 
	"RNICKNAME" VARCHAR2(30), 
	"RCDATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"RUDATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"RCONTENT" CLOB, 
	"RGOOD" NUMBER(5,0), 
	"RBAD" NUMBER(5,0), 
	"RGROUP" NUMBER(5,0), 
	"RSTEP" NUMBER(5,0), 
	"RINDENT" NUMBER(5,0), 
	"PRNUM" NUMBER(10,0), 
	"PRID" VARCHAR2(40), 
	"PRNICKNAME" VARCHAR2(30), 
	"COLUMN1" VARCHAR2(20), 
	"COLUMN2" VARCHAR2(20), 
	"COLUMN3" VARCHAR2(20)
   ) ;

   COMMENT ON COLUMN "C##TEAM"."RBOARD"."RNUM" IS '�뙎湲�踰덊샇';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."BNUM" IS '理쒖큹�썝湲�';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."RID" IS '�뙎湲��옉�꽦�옄ID';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."RNICKNAME" IS '�뙎湲��옉�꽦�옄蹂꾩묶';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."RCDATE" IS '�옉�꽦�씪�떆';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."RUDATE" IS '�닔�젙�씪�떆';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."RCONTENT" IS '�뙎湲�蹂몃Ц�궡�슜';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."RGOOD" IS '�꽑�샇';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."RBAD" IS '鍮꾩꽑�샇';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."RGROUP" IS '�뙎湲�洹몃９';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."RSTEP" IS '�뙎湲� �떒怨�';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."RINDENT" IS '�뙎湲� �뱾�뿬�벐湲�';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."PRNUM" IS '遺�紐⑤뙎湲�踰덊샇';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."PRID" IS '遺�紐⑤뙎湲��븘�씠�뵒';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."PRNICKNAME" IS '遺����뙎湲��옉�꽦�옄(蹂꾩묶)';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."COLUMN1" IS '�엫�떆1';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."COLUMN2" IS '�엫�떆2';
   COMMENT ON COLUMN "C##TEAM"."RBOARD"."COLUMN3" IS '�엫�떆3';
--------------------------------------------------------
--  DDL for Table RBOARD_VOTE
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."RBOARD_VOTE" 
   (	"RNUM" NUMBER(10,0), 
	"BNUM" NUMBER(10,0), 
	"RID" VARCHAR2(40), 
	"VOTE" VARCHAR2(10), 
	"CDATE" DATE DEFAULT SYSTIMESTAMP, 
	"UDATE" DATE DEFAULT SYSTIMESTAMP, 
	"COLUMN1" VARCHAR2(20)
   ) ;

   COMMENT ON COLUMN "C##TEAM"."RBOARD_VOTE"."RNUM" IS '�뙎湲�踰덊샇';
   COMMENT ON COLUMN "C##TEAM"."RBOARD_VOTE"."BNUM" IS '理쒖큹�썝湲�';
   COMMENT ON COLUMN "C##TEAM"."RBOARD_VOTE"."RID" IS '�뙎湲��븘�씠�뵒';
   COMMENT ON COLUMN "C##TEAM"."RBOARD_VOTE"."VOTE" IS 'GOOD:�샇媛�''BAD'':鍮꾪샇媛�';
   COMMENT ON COLUMN "C##TEAM"."RBOARD_VOTE"."CDATE" IS '�닾�몴�씪�떆';
   COMMENT ON COLUMN "C##TEAM"."RBOARD_VOTE"."UDATE" IS '�닾�몴�씪�떆';
   COMMENT ON COLUMN "C##TEAM"."RBOARD_VOTE"."COLUMN1" IS '�엫�떆1';
--------------------------------------------------------
--  DDL for Table RECIPE
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."RECIPE" 
   (	"RECIPE_ID" VARCHAR2(40), 
	"MEMBER_USER_ID" VARCHAR2(40), 
	"RECIPE_NAME" VARCHAR2(40), 
	"RECIPE_CONTENTS" CLOB, 
	"RECIPE_VIEW_COUNT" NUMBER(*,0), 
	"RECIPE_LIKE_COUNT" NUMBER(*,0), 
	"RECIPE_C_DATE" DATE DEFAULT systimestamp, 
	"RECIPE_U_DATE" DATE DEFAULT systimestamp, 
	"RECIPE_CATEGORY" VARCHAR2(50), 
	"RECIPE_WHAT_SITUATION" VARCHAR2(50), 
	"RECIPE_METHOD" VARCHAR2(50), 
	"RECIPE_MATERIAL" VARCHAR2(50), 
	"RECIPE_HOW_MANY" VARCHAR2(50), 
	"RECIPE_HOW_LONG" VARCHAR2(50), 
	"RECIPE_DIFFICULTY" VARCHAR2(50), 
	"RECIPE_TAG" VARCHAR2(200)
   ) ;
--------------------------------------------------------
--  DDL for Table RECIPE_LIKE
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."RECIPE_LIKE" 
   (	"RECIPE_LIKE_ID" VARCHAR2(45), 
	"RECIPE_RECIPE_ID" VARCHAR2(45), 
	"MEMBER_USER_ID" VARCHAR2(40)
   ) ;
--------------------------------------------------------
--  DDL for Table RECIPE_RBOARD
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."RECIPE_RBOARD" 
   (	"RNUM" NUMBER(10,0), 
	"RECIPENUM" VARCHAR2(40), 
	"MEMBERID" VARCHAR2(40), 
	"RNICKNAME" VARCHAR2(30), 
	"RCDATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"RUDATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"RCONTENT" CLOB, 
	"RGOOD" NUMBER(5,0), 
	"RBAD" NUMBER(5,0), 
	"RGROUP" NUMBER(5,0), 
	"RSTEP" NUMBER(5,0), 
	"RINDENT" NUMBER(5,0), 
	"PRNUM" NUMBER(10,0), 
	"PRID" VARCHAR2(40), 
	"PRNICKNAME" VARCHAR2(30), 
	"COLUMN1" VARCHAR2(20), 
	"COLUMN2" VARCHAR2(20), 
	"COLUMN3" VARCHAR2(20)
   ) ;

   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."RNUM" IS '�뙎湲�踰덊샇';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."RECIPENUM" IS '理쒖큹�썝湲�';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."MEMBERID" IS '�뙎湲��옉�꽦�옄ID';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."RNICKNAME" IS '�뙎湲��옉�꽦�옄蹂꾩묶';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."RCDATE" IS '�옉�꽦�씪�떆';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."RUDATE" IS '�닔�젙�씪�떆';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."RCONTENT" IS '�뙎湲�蹂몃Ц�궡�슜';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."RGOOD" IS '�꽑�샇';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."RBAD" IS '鍮꾩꽑�샇';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."RGROUP" IS '�뙎湲�洹몃９';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."RSTEP" IS '�뙎湲� �떒怨�';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."RINDENT" IS '�뙎湲� �뱾�뿬�벐湲�';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."PRNUM" IS '遺�紐⑤뙎湲�踰덊샇';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."PRID" IS '遺�紐⑤뙎湲��븘�씠�뵒';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."PRNICKNAME" IS '遺����뙎湲��옉�꽦�옄(蹂꾩묶)';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."COLUMN1" IS '�엫�떆1';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."COLUMN2" IS '�엫�떆2';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD"."COLUMN3" IS '�엫�떆3';
--------------------------------------------------------
--  DDL for Table RECIPE_RBOARD_VOTE
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."RECIPE_RBOARD_VOTE" 
   (	"RNUM" NUMBER(10,0), 
	"RECIPENUM" NUMBER(10,0), 
	"MEMBERID" VARCHAR2(40), 
	"VOTE" VARCHAR2(10), 
	"CDATE" DATE DEFAULT SYSTIMESTAMP, 
	"UDATE" DATE DEFAULT SYSTIMESTAMP, 
	"COLUMN1" VARCHAR2(20)
   ) ;

   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD_VOTE"."RNUM" IS '�뙎湲�踰덊샇';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD_VOTE"."RECIPENUM" IS '理쒖큹�썝湲�';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD_VOTE"."MEMBERID" IS '�뙎湲��븘�씠�뵒';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD_VOTE"."VOTE" IS 'GOOD:�샇媛�''BAD'':鍮꾪샇媛�';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD_VOTE"."CDATE" IS '�닾�몴�씪�떆';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD_VOTE"."UDATE" IS '�닾�몴�씪�떆';
   COMMENT ON COLUMN "C##TEAM"."RECIPE_RBOARD_VOTE"."COLUMN1" IS '�엫�떆1';
--------------------------------------------------------
--  DDL for Table STEP
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."STEP" 
   (	"STEP_ID" VARCHAR2(40), 
	"STEP_SEQUENCE" CHAR(4), 
	"STEP_CONTENTS" CLOB, 
	"STEP_PICTURE" BLOB, 
	"RECIPE_RECIPE_ID" VARCHAR2(40)
   ) ;
--------------------------------------------------------
--  DDL for Table TIMELINE
--------------------------------------------------------

  CREATE TABLE "C##TEAM"."TIMELINE" 
   (	"TIMELINE_ID" NUMBER(*,0), 
	"MEMBER_USER_ID" VARCHAR2(40)
   ) ;
REM INSERTING into C##TEAM.BOARD
SET DEFINE OFF;
Insert into C##TEAM.BOARD (BNUM,BCATEGORY,BTITLE,BID,BNICKNAME,BCDATE,BUDATE,BHIT,BGROUP,BSTEP,BINDENT,COL1,COL2,COL3) values (1,1000,'qweqwe','test1@test.com','�슂�븣紐�',to_timestamp('2021/03/30 16:27:10.431000000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2021/03/30 16:27:10.431000000','RRRR/MM/DD HH24:MI:SSXFF'),0,1,0,0,null,null,null);
Insert into C##TEAM.BOARD (BNUM,BCATEGORY,BTITLE,BID,BNICKNAME,BCDATE,BUDATE,BHIT,BGROUP,BSTEP,BINDENT,COL1,COL2,COL3) values (2,1020,'qweqw','test1@test.com','�슂�븣紐�',to_timestamp('2021/03/30 16:27:18.516000000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2021/03/30 16:27:18.516000000','RRRR/MM/DD HH24:MI:SSXFF'),0,2,0,0,null,null,null);
Insert into C##TEAM.BOARD (BNUM,BCATEGORY,BTITLE,BID,BNICKNAME,BCDATE,BUDATE,BHIT,BGROUP,BSTEP,BINDENT,COL1,COL2,COL3) values (3,1020,'aaaqwe','test1@test.com','�슂�븣紐�',to_timestamp('2021/03/30 16:30:38.548000000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2021/03/30 16:30:38.548000000','RRRR/MM/DD HH24:MI:SSXFF'),0,3,0,0,null,null,null);
REM INSERTING into C##TEAM.BOARD_CATEGORY
SET DEFINE OFF;
Insert into C##TEAM.BOARD_CATEGORY (CID,CNAME,USER_YN,USE_YN) values (1000,'�젅�떆�뵾 怨듭쑀寃뚯떆�뙋',null,'y');
Insert into C##TEAM.BOARD_CATEGORY (CID,CNAME,USER_YN,USE_YN) values (1010,'�옱猷뚭쾶�떆�뙋',null,'y');
Insert into C##TEAM.BOARD_CATEGORY (CID,CNAME,USER_YN,USE_YN) values (1020,'�옄�쑀寃뚯떆�뙋',null,'y');
Insert into C##TEAM.BOARD_CATEGORY (CID,CNAME,USER_YN,USE_YN) values (1030,'�옄�옉寃뚯떆�뙋',null,'y');
REM INSERTING into C##TEAM.BOARD_UPLOAD_FILE
SET DEFINE OFF;
REM INSERTING into C##TEAM.CART
SET DEFINE OFF;
Insert into C##TEAM.CART (CART_ID,ITEM_ITEM_ID,ITEM_QUANTITY,SUM_PRICE,MEMBER_USER_ID) values ('cart_001','item_001',11,'110,000   ','test1@test.com');
Insert into C##TEAM.CART (CART_ID,ITEM_ITEM_ID,ITEM_QUANTITY,SUM_PRICE,MEMBER_USER_ID) values ('cart_002','item_002',3,'24,000    ','test1@test.com');
Insert into C##TEAM.CART (CART_ID,ITEM_ITEM_ID,ITEM_QUANTITY,SUM_PRICE,MEMBER_USER_ID) values ('cart_003','item_003',5,'50,000    ','test1@test.com');
Insert into C##TEAM.CART (CART_ID,ITEM_ITEM_ID,ITEM_QUANTITY,SUM_PRICE,MEMBER_USER_ID) values ('cart_004','item_005',5,'85,000    ','test2@test.com');
Insert into C##TEAM.CART (CART_ID,ITEM_ITEM_ID,ITEM_QUANTITY,SUM_PRICE,MEMBER_USER_ID) values ('cart_005','item_006',5,'49,000    ','test2@test.com');
Insert into C##TEAM.CART (CART_ID,ITEM_ITEM_ID,ITEM_QUANTITY,SUM_PRICE,MEMBER_USER_ID) values ('cart_006','item_001',10,'80,000    ','test2@test.com');
Insert into C##TEAM.CART (CART_ID,ITEM_ITEM_ID,ITEM_QUANTITY,SUM_PRICE,MEMBER_USER_ID) values ('cart_007','item_002',11,'88,000    ','test3@test.com');
Insert into C##TEAM.CART (CART_ID,ITEM_ITEM_ID,ITEM_QUANTITY,SUM_PRICE,MEMBER_USER_ID) values ('cart_008','item_005',10,'170,000   ','test3@test.com');
REM INSERTING into C##TEAM.CODE
SET DEFINE OFF;
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('1   ','諛묐컲李�','y','1000');
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('2   ','諛묐컲李�','y','1000');
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('3   ','硫�','y','1000');
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('4   ','�빞�떇','y','1010');
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('5   ','媛꾩떇','y','1010');
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('6   ','蹂띠쓬','y','1020');
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('7   ','��源�','y','1020');
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('8   ','�냼怨좉린','y','1030');
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('9   ','�빞梨�','y','1030');
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('10  ','1�씤遺�','y','1040');
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('11  ','2�씤遺�','y','1040');
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('12  ','10遺�','y','1050');
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('13  ','30遺�','y','1050');
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('14  ','珥덈낫�옄','y','1060');
Insert into C##TEAM.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('15  ','以묎툒�옄','y','1060');
REM INSERTING into C##TEAM.CODETYPE
SET DEFINE OFF;
Insert into C##TEAM.CODETYPE (CODETYPE_ID,NAME) values ('1000','醫낅쪟蹂�');
Insert into C##TEAM.CODETYPE (CODETYPE_ID,NAME) values ('1010','�긽�솴蹂�');
Insert into C##TEAM.CODETYPE (CODETYPE_ID,NAME) values ('1020','諛⑸쾿蹂�');
Insert into C##TEAM.CODETYPE (CODETYPE_ID,NAME) values ('1030','�옱猷뚮퀎');
Insert into C##TEAM.CODETYPE (CODETYPE_ID,NAME) values ('1040','�씤�썝');
Insert into C##TEAM.CODETYPE (CODETYPE_ID,NAME) values ('1050','�떆媛�');
Insert into C##TEAM.CODETYPE (CODETYPE_ID,NAME) values ('1060','�궃�씠�룄');
REM INSERTING into C##TEAM.ITEM
SET DEFINE OFF;
Insert into C##TEAM.ITEM (ITEM_ID,ITEM_NAME,ITEM_PRICE,ITEM_STOCK,ITEM_C_DATE,ITEM_U_DATE,ITEM_VIEW_COUNT,ITEM_SELL_COUNT,ITEM_REVIEW_COUNT,ITEM_REVIEW_AVERAGE,ITEM_UNIT,ITEM_WEIGHT,ITEM_DELIVERY,ITEM_PACKAGE,ITEM_MENTION,ITEM_COUNTRY,ITEM_FSIZE,ITEM_FTYPE,ITEM_FNAME) values ('item_001','源�移섏컡媛�',8000,100,to_timestamp('2020/07/15 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2020/10/11 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),1050,50,280,5,null,null,null,null,null,null,null,null,null);
Insert into C##TEAM.ITEM (ITEM_ID,ITEM_NAME,ITEM_PRICE,ITEM_STOCK,ITEM_C_DATE,ITEM_U_DATE,ITEM_VIEW_COUNT,ITEM_SELL_COUNT,ITEM_REVIEW_COUNT,ITEM_REVIEW_AVERAGE,ITEM_UNIT,ITEM_WEIGHT,ITEM_DELIVERY,ITEM_PACKAGE,ITEM_MENTION,ITEM_COUNTRY,ITEM_FSIZE,ITEM_FTYPE,ITEM_FNAME) values ('item_002','�맂�옣李뚭컻',8000,100,to_timestamp('2020/06/10 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2020/11/15 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),900,70,150,4,null,null,null,null,null,null,null,null,null);
Insert into C##TEAM.ITEM (ITEM_ID,ITEM_NAME,ITEM_PRICE,ITEM_STOCK,ITEM_C_DATE,ITEM_U_DATE,ITEM_VIEW_COUNT,ITEM_SELL_COUNT,ITEM_REVIEW_COUNT,ITEM_REVIEW_AVERAGE,ITEM_UNIT,ITEM_WEIGHT,ITEM_DELIVERY,ITEM_PACKAGE,ITEM_MENTION,ITEM_COUNTRY,ITEM_FSIZE,ITEM_FTYPE,ITEM_FNAME) values ('item_003','�꽕�쟻�깢',10000,100,to_timestamp('2020/11/15 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2021/01/05 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),350,85,50,3,null,null,null,null,null,null,null,null,null);
Insert into C##TEAM.ITEM (ITEM_ID,ITEM_NAME,ITEM_PRICE,ITEM_STOCK,ITEM_C_DATE,ITEM_U_DATE,ITEM_VIEW_COUNT,ITEM_SELL_COUNT,ITEM_REVIEW_COUNT,ITEM_REVIEW_AVERAGE,ITEM_UNIT,ITEM_WEIGHT,ITEM_DELIVERY,ITEM_PACKAGE,ITEM_MENTION,ITEM_COUNTRY,ITEM_FSIZE,ITEM_FTYPE,ITEM_FNAME) values ('item_004','�빂�룄洹�',3500,200,to_timestamp('2020/10/30 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2020/11/30 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),100,87,100,4,null,null,null,null,null,null,null,null,null);
Insert into C##TEAM.ITEM (ITEM_ID,ITEM_NAME,ITEM_PRICE,ITEM_STOCK,ITEM_C_DATE,ITEM_U_DATE,ITEM_VIEW_COUNT,ITEM_SELL_COUNT,ITEM_REVIEW_COUNT,ITEM_REVIEW_AVERAGE,ITEM_UNIT,ITEM_WEIGHT,ITEM_DELIVERY,ITEM_PACKAGE,ITEM_MENTION,ITEM_COUNTRY,ITEM_FSIZE,ITEM_FTYPE,ITEM_FNAME) values ('item_005','�솗媛덈퉬',17000,150,to_timestamp('2021/01/28 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2020/02/08 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),250,50,70,4,null,null,null,null,null,null,null,null,null);
Insert into C##TEAM.ITEM (ITEM_ID,ITEM_NAME,ITEM_PRICE,ITEM_STOCK,ITEM_C_DATE,ITEM_U_DATE,ITEM_VIEW_COUNT,ITEM_SELL_COUNT,ITEM_REVIEW_COUNT,ITEM_REVIEW_AVERAGE,ITEM_UNIT,ITEM_WEIGHT,ITEM_DELIVERY,ITEM_PACKAGE,ITEM_MENTION,ITEM_COUNTRY,ITEM_FSIZE,ITEM_FTYPE,ITEM_FNAME) values ('item_006','源�移�',7000,300,to_timestamp('2020/07/18 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2020/08/07 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),1200,100,350,5,null,null,null,null,null,null,null,null,null);
REM INSERTING into C##TEAM.MATERIAL
SET DEFINE OFF;
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('001','�씪硫�','1');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('002','�뼇�뙆','1');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('003','���뙆','1');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('004','怨좎텛','1');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('005','�떎吏꾨쭏�뒛','1');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('006','怨꾨�','1');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('007','珥덈갈','2');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('008','愿묒뼱�쉶','2');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('009','�뿰�뼱�쉶','2');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('010','�썕�젣�뿰�뼱','2');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('011','�냼湲�','2');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('012','�꽕�깢','2');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('013','�떇珥�','2');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('014','�젅紐�','2');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('015','諛�','2');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('016','���궗鍮�','2');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('017','源�諛�','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('018','源�','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('019','議곕�멸�','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('020','留쏆냼湲�','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('021','�떇珥�','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('022','�젅紐�','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('023','諛�','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('024','怨꾨�','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('025','留덉슂�꽕利�','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('026','源살옂','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('027','李멸린由�','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('028','李멸묠','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('029','�냼怨좉린','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('030','�떗怨좉린','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('031','�떆湲덉튂','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('032','留쏆궡','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('033','�겕�옒誘�','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('034','�떦洹�','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('035','鍮꾩뿏�굹','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('036','�꽕�깢','3');
Insert into C##TEAM.MATERIAL (MATERIAL_ID,MATERIAL_TITLE,RECIPE_RECIPE_ID) values ('037','媛꾩옣','3');
REM INSERTING into C##TEAM.MEMBER
SET DEFINE OFF;
Insert into C##TEAM.MEMBER (USER_ID,USER_PW,USER_TEL,USER_SEQ,USER_NICKNAME,USER_GENDER,USER_BIRTH,USER_CDATE,USER_UDATE,USER_FSIZE,USER_FTYPE,USER_FNAME) values ('test1@test.com','cook1234','010-5678-9876','1','�슂�븣紐�','�뿬   ',to_date('1990/03/03','RRRR/MM/DD'),to_timestamp('2020/08/08 20:10:15.000000000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2020/09/09 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),null,null,null);
Insert into C##TEAM.MEMBER (USER_ID,USER_PW,USER_TEL,USER_SEQ,USER_NICKNAME,USER_GENDER,USER_BIRTH,USER_CDATE,USER_UDATE,USER_FSIZE,USER_FTYPE,USER_FNAME) values ('test2@test.com','chef!@34','010-3210-4567','2','�씪瑜섏＜諛⑹옣','�궓   ',to_date('1958/08/15','RRRR/MM/DD'),to_timestamp('2019/12/31 20:33:55.000000000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2020/03/05 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),null,null,null);
Insert into C##TEAM.MEMBER (USER_ID,USER_PW,USER_TEL,USER_SEQ,USER_NICKNAME,USER_GENDER,USER_BIRTH,USER_CDATE,USER_UDATE,USER_FSIZE,USER_FTYPE,USER_FNAME) values ('test3@test.com','alongdark','010-3210-4567','3','癒밸뒗寃� �궓�뒗嫄�','�뿬   ',to_date('1980/06/06','RRRR/MM/DD'),to_timestamp('2021/01/01 15:45:12.000000000','RRRR/MM/DD HH24:MI:SSXFF'),to_timestamp('2021/01/20 00:00:00.000000000','RRRR/MM/DD HH24:MI:SSXFF'),null,null,null);
REM INSERTING into C##TEAM.ORDERS
SET DEFINE OFF;
REM INSERTING into C##TEAM.ORDER_DETAIL
SET DEFINE OFF;
REM INSERTING into C##TEAM.RBOARD
SET DEFINE OFF;
REM INSERTING into C##TEAM.RBOARD_VOTE
SET DEFINE OFF;
REM INSERTING into C##TEAM.RECIPE
SET DEFINE OFF;
Insert into C##TEAM.RECIPE (RECIPE_ID,MEMBER_USER_ID,RECIPE_NAME,RECIPE_VIEW_COUNT,RECIPE_LIKE_COUNT,RECIPE_C_DATE,RECIPE_U_DATE,RECIPE_CATEGORY,RECIPE_WHAT_SITUATION,RECIPE_METHOD,RECIPE_MATERIAL,RECIPE_HOW_MANY,RECIPE_HOW_LONG,RECIPE_DIFFICULTY,RECIPE_TAG) values ('1','test1@test.com','�빞梨꾨벉肉� �씪硫�',891,50,to_date('2020/09/19','RRRR/MM/DD'),null,'硫�','異쒖텧�븷�븣 �궓�뒗 �빞梨꾧� �엳�쓣�븣',null,null,'1~2紐�','10遺�','�돩��','#�씪硫�#�뒪�룓�뀥�씪硫�#�빞梨꾨씪硫�#�빞�떇');
Insert into C##TEAM.RECIPE (RECIPE_ID,MEMBER_USER_ID,RECIPE_NAME,RECIPE_VIEW_COUNT,RECIPE_LIKE_COUNT,RECIPE_C_DATE,RECIPE_U_DATE,RECIPE_CATEGORY,RECIPE_WHAT_SITUATION,RECIPE_METHOD,RECIPE_MATERIAL,RECIPE_HOW_MANY,RECIPE_HOW_LONG,RECIPE_DIFFICULTY,RECIPE_TAG) values ('2','test2@test.com','珥덈갈',1221,124,to_date('2020/02/01','RRRR/MM/DD'),to_date('2020/02/03','RRRR/MM/DD'),'諛�','�쉶 癒뱀쓣�븣 肄붿뒪�듃肄� �뿰�뼱瑜� �궗�솕�쓣 �븣',null,null,'1~4紐�','30~40遺�','蹂댄넻','#�씪�떇#珥덈갈#�뒪�떆');
Insert into C##TEAM.RECIPE (RECIPE_ID,MEMBER_USER_ID,RECIPE_NAME,RECIPE_VIEW_COUNT,RECIPE_LIKE_COUNT,RECIPE_C_DATE,RECIPE_U_DATE,RECIPE_CATEGORY,RECIPE_WHAT_SITUATION,RECIPE_METHOD,RECIPE_MATERIAL,RECIPE_HOW_MANY,RECIPE_HOW_LONG,RECIPE_DIFFICULTY,RECIPE_TAG) values ('3','test3@test.com','源�諛�',3321,958,to_date('2021/01/15','RRRR/MM/DD'),null,'諛�','諛섏갔�닾�젙�븯�뒗 �븘�씠�뱾�쓣 �쐞�빐',null,null,'1~4紐�','30~40遺�','蹂댄넻','#源�諛�#�븘�씠�쓬�떇#吏묐갈#�룄�떆�씫');
Insert into C##TEAM.RECIPE (RECIPE_ID,MEMBER_USER_ID,RECIPE_NAME,RECIPE_VIEW_COUNT,RECIPE_LIKE_COUNT,RECIPE_C_DATE,RECIPE_U_DATE,RECIPE_CATEGORY,RECIPE_WHAT_SITUATION,RECIPE_METHOD,RECIPE_MATERIAL,RECIPE_HOW_MANY,RECIPE_HOW_LONG,RECIPE_DIFFICULTY,RECIPE_TAG) values ('4','test3@test.com','源�諛�',3321,958,to_date('2021/01/15','RRRR/MM/DD'),to_date('2021/03/30','RRRR/MM/DD'),'諛�','諛섏갔�닾�젙�븯�뒗 �븘�씠�뱾�쓣 �쐞�빐',null,null,'1~4紐�','30~40遺�','蹂댄넻','#源�諛�#�븘�씠�쓬�떇#吏묐갈#�룄�떆�씫');
Insert into C##TEAM.RECIPE (RECIPE_ID,MEMBER_USER_ID,RECIPE_NAME,RECIPE_VIEW_COUNT,RECIPE_LIKE_COUNT,RECIPE_C_DATE,RECIPE_U_DATE,RECIPE_CATEGORY,RECIPE_WHAT_SITUATION,RECIPE_METHOD,RECIPE_MATERIAL,RECIPE_HOW_MANY,RECIPE_HOW_LONG,RECIPE_DIFFICULTY,RECIPE_TAG) values ('5','test3@test.com','源�諛�',3321,958,to_date('2021/01/15','RRRR/MM/DD'),to_date('2021/03/30','RRRR/MM/DD'),'諛�','諛섏갔�닾�젙�븯�뒗 �븘�씠�뱾�쓣 �쐞�빐',null,null,'1~4紐�','30~40遺�','蹂댄넻','#源�諛�#�븘�씠�쓬�떇#吏묐갈#�룄�떆�씫');
REM INSERTING into C##TEAM.RECIPE_LIKE
SET DEFINE OFF;
REM INSERTING into C##TEAM.RECIPE_RBOARD
SET DEFINE OFF;
REM INSERTING into C##TEAM.RECIPE_RBOARD_VOTE
SET DEFINE OFF;
REM INSERTING into C##TEAM.STEP
SET DEFINE OFF;
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_01','1   ','1');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_02','2   ','1');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_03','3   ','1');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_04','4   ','1');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_05','5   ','1');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_06','6   ','1');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_07','7   ','1');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_08','8   ','1');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_09','9   ','1');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_10','1   ','2');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_11','2   ','2');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_12','3   ','2');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_13','4   ','2');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_14','5   ','2');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_15','6   ','2');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_16','7   ','2');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_17','1   ','3');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_18','2   ','3');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_19','3   ','3');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_20','4   ','3');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_21','5   ','3');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_22','6   ','3');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_23','7   ','3');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_24','8   ','3');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_25','9   ','3');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_26','10  ','3');
Insert into C##TEAM.STEP (STEP_ID,STEP_SEQUENCE,RECIPE_RECIPE_ID) values ('step_27','11  ','3');
REM INSERTING into C##TEAM.TIMELINE
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index CODETYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."CODETYPE_PK" ON "C##TEAM"."CODETYPE" ("CODETYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CODE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."CODE_PK" ON "C##TEAM"."CODE" ("CODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."MEMBER_PK" ON "C##TEAM"."MEMBER" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index RBOARD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."RBOARD_PK" ON "C##TEAM"."RECIPE_RBOARD" ("RNUM") 
  ;
--------------------------------------------------------
--  DDL for Index TIMELINE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."TIMELINE_PK" ON "C##TEAM"."TIMELINE" ("TIMELINE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index RECIPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."RECIPE_PK" ON "C##TEAM"."RECIPE" ("RECIPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ITEM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."ITEM_PK" ON "C##TEAM"."ITEM" ("ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BOARD_CATEGORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."BOARD_CATEGORY_PK" ON "C##TEAM"."BOARD_CATEGORY" ("CID") 
  ;
--------------------------------------------------------
--  DDL for Index BOARD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."BOARD_PK" ON "C##TEAM"."BOARD" ("BNUM") 
  ;
--------------------------------------------------------
--  DDL for Index RECIPE_LIKE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."RECIPE_LIKE_PK" ON "C##TEAM"."RECIPE_LIKE" ("RECIPE_LIKE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index RECIPE_RBOARD_VOTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."RECIPE_RBOARD_VOTE_PK" ON "C##TEAM"."RECIPE_RBOARD_VOTE" ("RNUM", "RECIPENUM", "MEMBERID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."ORDER_PK" ON "C##TEAM"."ORDERS" ("ORDER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BOARD_UPLOADE_FILE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."BOARD_UPLOADE_FILE_PK" ON "C##TEAM"."BOARD_UPLOAD_FILE" ("FID") 
  ;
--------------------------------------------------------
--  DDL for Index TIMELINE__IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."TIMELINE__IDX" ON "C##TEAM"."TIMELINE" ("MEMBER_USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MATERIAL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."MATERIAL_PK" ON "C##TEAM"."MATERIAL" ("MATERIAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STEP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."STEP_PK" ON "C##TEAM"."STEP" ("STEP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CART_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."CART_PK" ON "C##TEAM"."CART" ("CART_ID") 
  ;
--------------------------------------------------------
--  DDL for Index RBOARD_VOTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM"."RBOARD_VOTE_PK" ON "C##TEAM"."RBOARD_VOTE" ("RNUM", "BNUM", "RID") 
  ;
--------------------------------------------------------
--  Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."CART" MODIFY ("CART_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."CART" MODIFY ("ITEM_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."CART" MODIFY ("MEMBER_USER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."CART" ADD CONSTRAINT "CART_PK" PRIMARY KEY ("CART_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table ITEM
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."ITEM" MODIFY ("ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."ITEM" ADD CONSTRAINT "ITEM_PK" PRIMARY KEY ("ITEM_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table RECIPE_RBOARD
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."RECIPE_RBOARD" ADD CONSTRAINT "RBOARD_PK" PRIMARY KEY ("RNUM")
  USING INDEX  ENABLE;
  ALTER TABLE "C##TEAM"."RECIPE_RBOARD" MODIFY ("RNUM" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RECIPE_RBOARD" MODIFY ("RECIPENUM" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RECIPE_RBOARD" MODIFY ("MEMBERID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RECIPE_RBOARD" MODIFY ("RCDATE" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RECIPE_RBOARD" MODIFY ("RCONTENT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RBOARD_VOTE
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."RBOARD_VOTE" ADD CONSTRAINT "RBOARD_VOTE_PK" PRIMARY KEY ("RNUM", "BNUM", "RID")
  USING INDEX  ENABLE;
  ALTER TABLE "C##TEAM"."RBOARD_VOTE" MODIFY ("RNUM" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RBOARD_VOTE" MODIFY ("BNUM" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RBOARD_VOTE" MODIFY ("RID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RBOARD_VOTE" MODIFY ("VOTE" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RBOARD_VOTE" MODIFY ("CDATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."ORDERS" MODIFY ("MEMBER_USER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."ORDERS" MODIFY ("ORDER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."ORDERS" ADD CONSTRAINT "ORDER_PK" PRIMARY KEY ("ORDER_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table TIMELINE
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."TIMELINE" MODIFY ("TIMELINE_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."TIMELINE" MODIFY ("MEMBER_USER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."TIMELINE" ADD CONSTRAINT "TIMELINE_PK" PRIMARY KEY ("TIMELINE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table RECIPE
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."RECIPE" MODIFY ("RECIPE_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RECIPE" MODIFY ("MEMBER_USER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RECIPE" MODIFY ("RECIPE_NAME" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RECIPE" ADD CONSTRAINT "RECIPE_PK" PRIMARY KEY ("RECIPE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."BOARD" ADD CONSTRAINT "BOARD_PK" PRIMARY KEY ("BNUM")
  USING INDEX  ENABLE;
  ALTER TABLE "C##TEAM"."BOARD" MODIFY ("BNUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STEP
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."STEP" MODIFY ("STEP_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."STEP" MODIFY ("RECIPE_RECIPE_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."STEP" ADD CONSTRAINT "STEP_PK" PRIMARY KEY ("STEP_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table RECIPE_RBOARD_VOTE
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."RECIPE_RBOARD_VOTE" ADD CONSTRAINT "RECIPE_RBOARD_VOTE_PK" PRIMARY KEY ("RNUM", "RECIPENUM", "MEMBERID")
  USING INDEX  ENABLE;
  ALTER TABLE "C##TEAM"."RECIPE_RBOARD_VOTE" MODIFY ("RNUM" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RECIPE_RBOARD_VOTE" MODIFY ("RECIPENUM" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RECIPE_RBOARD_VOTE" MODIFY ("MEMBERID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RECIPE_RBOARD_VOTE" MODIFY ("VOTE" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RECIPE_RBOARD_VOTE" MODIFY ("CDATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_UPLOAD_FILE
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."BOARD_UPLOAD_FILE" ADD CONSTRAINT "BOARD_UPLOADE_FILE_PK" PRIMARY KEY ("FID")
  USING INDEX  ENABLE;
  ALTER TABLE "C##TEAM"."BOARD_UPLOAD_FILE" MODIFY ("FID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDER_DETAIL
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."ORDER_DETAIL" MODIFY ("ORDER_ORDER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."ORDER_DETAIL" MODIFY ("ITEM_ITEM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MATERIAL
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."MATERIAL" MODIFY ("MATERIAL_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."MATERIAL" MODIFY ("RECIPE_RECIPE_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."MATERIAL" ADD CONSTRAINT "MATERIAL_PK" PRIMARY KEY ("MATERIAL_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table RECIPE_LIKE
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."RECIPE_LIKE" MODIFY ("RECIPE_LIKE_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RECIPE_LIKE" MODIFY ("RECIPE_RECIPE_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RECIPE_LIKE" MODIFY ("MEMBER_USER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."RECIPE_LIKE" ADD CONSTRAINT "RECIPE_LIKE_PK" PRIMARY KEY ("RECIPE_LIKE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CODETYPE
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."CODETYPE" MODIFY ("CODETYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."CODETYPE" ADD CONSTRAINT "CODETYPE_PK" PRIMARY KEY ("CODETYPE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CODE
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."CODE" MODIFY ("CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."CODE" MODIFY ("CODETYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."CODE" ADD CONSTRAINT "CODE_PK" PRIMARY KEY ("CODE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARD_CATEGORY
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."BOARD_CATEGORY" ADD CONSTRAINT "BOARD_CATEGORY_PK" PRIMARY KEY ("CID")
  USING INDEX  ENABLE;
  ALTER TABLE "C##TEAM"."BOARD_CATEGORY" MODIFY ("CID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."BOARD_CATEGORY" MODIFY ("CNAME" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."BOARD_CATEGORY" ADD UNIQUE ("CNAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."MEMBER" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM"."MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("USER_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."BOARD" ADD CONSTRAINT "BOARD_FK1" FOREIGN KEY ("BID")
	  REFERENCES "C##TEAM"."MEMBER" ("USER_ID") ENABLE;
  ALTER TABLE "C##TEAM"."BOARD" ADD CONSTRAINT "BOARD_FK2" FOREIGN KEY ("BCATEGORY")
	  REFERENCES "C##TEAM"."BOARD_CATEGORY" ("CID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_UPLOAD_FILE
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."BOARD_UPLOAD_FILE" ADD CONSTRAINT "BOARD_UPLOADE_FILE_FK1" FOREIGN KEY ("BNUM")
	  REFERENCES "C##TEAM"."BOARD" ("BNUM") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."CART" ADD CONSTRAINT "CART_ITEM_FK" FOREIGN KEY ("ITEM_ITEM_ID")
	  REFERENCES "C##TEAM"."ITEM" ("ITEM_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "C##TEAM"."CART" ADD CONSTRAINT "CART_MEMBER_FK" FOREIGN KEY ("MEMBER_USER_ID")
	  REFERENCES "C##TEAM"."MEMBER" ("USER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MATERIAL
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."MATERIAL" ADD CONSTRAINT "MATERIAL_RECIPE_FK" FOREIGN KEY ("RECIPE_RECIPE_ID")
	  REFERENCES "C##TEAM"."RECIPE" ("RECIPE_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."ORDERS" ADD CONSTRAINT "ORDER_MEMBER_FK" FOREIGN KEY ("MEMBER_USER_ID")
	  REFERENCES "C##TEAM"."MEMBER" ("USER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDER_DETAIL
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."ORDER_DETAIL" ADD CONSTRAINT "ORDER_DETAIL_ITEM_FK" FOREIGN KEY ("ITEM_ITEM_ID")
	  REFERENCES "C##TEAM"."ITEM" ("ITEM_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "C##TEAM"."ORDER_DETAIL" ADD CONSTRAINT "ORDER_DETAIL_ORDER_FK" FOREIGN KEY ("ORDER_ORDER_ID")
	  REFERENCES "C##TEAM"."ORDERS" ("ORDER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RBOARD
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."RBOARD" ADD CONSTRAINT "RBOARD_FK1" FOREIGN KEY ("BNUM")
	  REFERENCES "C##TEAM"."BOARD" ("BNUM") ENABLE;
  ALTER TABLE "C##TEAM"."RBOARD" ADD CONSTRAINT "RBOARD_FK2" FOREIGN KEY ("RID")
	  REFERENCES "C##TEAM"."MEMBER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RECIPE
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."RECIPE" ADD CONSTRAINT "RECIPE_MEMBER_FK" FOREIGN KEY ("MEMBER_USER_ID")
	  REFERENCES "C##TEAM"."MEMBER" ("USER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RECIPE_LIKE
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."RECIPE_LIKE" ADD CONSTRAINT "RECIPE_LIKE_FK1" FOREIGN KEY ("MEMBER_USER_ID")
	  REFERENCES "C##TEAM"."MEMBER" ("USER_ID") ENABLE;
  ALTER TABLE "C##TEAM"."RECIPE_LIKE" ADD CONSTRAINT "RECIPE_LIKE_FK2" FOREIGN KEY ("RECIPE_RECIPE_ID")
	  REFERENCES "C##TEAM"."RECIPE" ("RECIPE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RECIPE_RBOARD
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."RECIPE_RBOARD" ADD CONSTRAINT "RECIPE_RBOARD_FK1" FOREIGN KEY ("RECIPENUM")
	  REFERENCES "C##TEAM"."RECIPE" ("RECIPE_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "C##TEAM"."RECIPE_RBOARD" ADD CONSTRAINT "RECIPE_RBOARD_FK2" FOREIGN KEY ("MEMBERID")
	  REFERENCES "C##TEAM"."MEMBER" ("USER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RECIPE_RBOARD_VOTE
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."RECIPE_RBOARD_VOTE" ADD CONSTRAINT "RECIPE_RBOARD_VOTE_FK1" FOREIGN KEY ("RNUM")
	  REFERENCES "C##TEAM"."RECIPE_RBOARD" ("RNUM") ON DELETE CASCADE ENABLE;
  ALTER TABLE "C##TEAM"."RECIPE_RBOARD_VOTE" ADD CONSTRAINT "RECIPE_RBOARD_VOTE_FK2" FOREIGN KEY ("MEMBERID")
	  REFERENCES "C##TEAM"."MEMBER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STEP
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."STEP" ADD CONSTRAINT "STEP_RECIPE_FK" FOREIGN KEY ("RECIPE_RECIPE_ID")
	  REFERENCES "C##TEAM"."RECIPE" ("RECIPE_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TIMELINE
--------------------------------------------------------

  ALTER TABLE "C##TEAM"."TIMELINE" ADD CONSTRAINT "TIMELINE_MEMBER_FK" FOREIGN KEY ("MEMBER_USER_ID")
	  REFERENCES "C##TEAM"."MEMBER" ("USER_ID") ON DELETE CASCADE ENABLE;
