--------------------------------------------------------------------------------
-- FLASHBACK TABLE 테이블명 TO BEFORE DROP;
PURGE RECYCLEBIN;
COMMIT;
ROLLBACK;
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_REPLY
--------------------------------------
-- CREATE
CREATE TABLE OH_PHOTO_REPLY (
    PR_NO              NUMBER PRIMARY KEY,    -- 번호
    MEMNO	           NUMBER,                -- 사용자_번호
                                              -- TABLE: my_member_info, COLUMN: memno
    NICKNAME           VARCHAR2(50),          -- 사용자_닉네임
                                              -- TABLE: my_member_info, COLUMN: nickname
    PR_CONTENT         VARCHAR2(200),         -- 내용
    PR_DATE            DATE DEFAULT SYSDATE,  -- 날짜
    PR_GROUP           NUMBER,                -- GROUP
    PR_STEP            NUMBER,                -- STEP
    PR_INDENT          NUMBER,                -- INDENT
    PB_NO              NUMBER CONSTRAINT      -- 번호(OH_PHOTO_BOARD)     
                                PR_PB_NO_FK
                              REFERENCES 
                                OH_PHOTO_BOARD(PB_NO) 
                              ON DELETE CASCADE 
);
--------------------------------------
-- DROP
DROP TABLE OH_PHOTO_REPLY;
DROP TABLE OH_PHOTO_REPLY PURGE;
--------------------------------------
-- CONSTRAINT
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'OH_PHOTO_REPLY';
ALTER TABLE OH_PHOTO_REPLY DROP CONSTRAINT PR_PB_NO_FK;
--------------------------------------
-- SEQUENCE
CREATE SEQUENCE OH_PHOTO_REPLY_SEQ;
DROP SEQUENCE OH_PHOTO_REPLY_SEQ;
--------------------------------------
-- SELECT
SELECT * FROM OH_PHOTO_REPLY;
--------------------------------------
-- INSERT
INSERT INTO 
    OH_PHOTO_REPLY (PR_NO, PR_USER, PR_CONTENT, PR_DATE,
                    PR_GROUP, PR_STEP, PR_INDENT, PB_NO
                   ) 
VALUES (
    OH_PHOTO_REPLY_SEQ.NEXTVAL, '꼬부기', '댓글내용', SYSDATE,
    0, 0, 0, 118
);
--------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------