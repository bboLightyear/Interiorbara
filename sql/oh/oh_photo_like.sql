--------------------------------------------------------------------------------
-- FLASHBACK TABLE 테이블명 TO BEFORE DROP;
PURGE RECYCLEBIN;
COMMIT;
ROLLBACK;
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_LIKE
--------------------------------------
-- CREATE
CREATE TABLE OH_PHOTO_LIKE (
    PL_NO             NUMBER PRIMARY KEY,    -- 번호
    MEMNO	          NUMBER,                -- 사용자_번호
                                             -- TABLE: my_member_info, COLUMN: memno
                                             -- TABLE: my_member_info, COLUMN: nickname
    PL_DATE           DATE DEFAULT SYSDATE,  -- 날짜
    PB_NO             NUMBER CONSTRAINT      -- 번호(OH_PHOTO_BOARD)     
                                PL_PB_NO_FK
                             REFERENCES 
                                OH_PHOTO_BOARD(PB_NO) 
                             ON DELETE CASCADE 
);
--------------------------------------
-- DROP
DROP TABLE OH_PHOTO_LIKE;
DROP TABLE OH_PHOTO_LIKE PURGE;
--------------------------------------
-- CONSTRAINT
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'OH_PHOTO_LIKE';
ALTER TABLE OH_PHOTO_LIKE DROP CONSTRAINT PL_PB_NO_FK;
--------------------------------------
-- SEQUENCE
CREATE SEQUENCE OH_PHOTO_LIKE_SEQ;
DROP SEQUENCE OH_PHOTO_LIKE_SEQ;
--------------------------------------
-- SELECT
SELECT * FROM OH_PHOTO_LIKE;
SELECT COUNT(*) FROM OH_PHOTO_LIKE WHERE PL_USER = '김경태';
--------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------