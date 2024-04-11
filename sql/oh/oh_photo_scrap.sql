--------------------------------------------------------------------------------
-- FLASHBACK TABLE 테이블명 TO BEFORE DROP;
PURGE RECYCLEBIN;
COMMIT;
ROLLBACK;
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_SCRAP
--------------------------------------
-- CREATE
CREATE TABLE OH_PHOTO_SCRAP (
    PS_NO             NUMBER PRIMARY KEY,     -- 번호
    MEMNO	          NUMBER,                 -- 사용자_번호
                                              -- TABLE: my_member_info, COLUMN: memno
    NICKNAME          VARCHAR2(50),           -- 사용자_닉네임
                                              -- TABLE: my_member_info, COLUMN: nickname
    PS_DATE           DATE DEFAULT SYSDATE,   -- 날짜
    PB_NO             NUMBER CONSTRAINT       -- 번호(OH_PHOTO_BOARD)     
                                PS_PB_NO_FK
                             REFERENCES 
                                OH_PHOTO_BOARD(PB_NO) 
                             ON DELETE CASCADE 
);
--------------------------------------
-- DROP
DROP TABLE OH_PHOTO_SCRAP;
DROP TABLE OH_PHOTO_SCRAP PURGE;
--------------------------------------
-- CONSTRAINT
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'OH_PHOTO_SCRAP';
ALTER TABLE OH_PHOTO_SCRAP DROP CONSTRAINT PS_PB_NO_FK;
--------------------------------------
-- SEQUENCE
CREATE SEQUENCE OH_PHOTO_SCRAP_SEQ;
DROP SEQUENCE OH_PHOTO_SCRAP_SEQ;
--------------------------------------
-- SELECT
SELECT * FROM OH_PHOTO_SCRAP;
SELECT COUNT(*) FROM OH_PHOTO_SCRAP WHERE PS_USER = '김경태';
--------------------------------------
-- INSERT
INSERT INTO 
    OH_PHOTO_SCRAP (PS_NO, PS_USER, PS_DATE) 
VALUES (
    OH_PHOTO_SCRAP_SEQ.NEXTVAL, '홍길동', SYSDATE
);
--------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------