--------------------------------------------------------------------------------
-- FLASHBACK TABLE 테이블명 TO BEFORE DROP;
PURGE RECYCLEBIN;
COMMIT;
ROLLBACK;
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_REPLY_LIKE
--------------------------------------
-- CREATE
CREATE TABLE OH_PHOTO_REPLY_LIKE (
    PRL_NO             NUMBER PRIMARY KEY,     -- 번호
    
    MEMNO	           NUMBER,                 -- 사용자_번호, FOREIGN KEY
                                               -- TABLE: my_member_info, COLUMN: memno

    PRL_DATE           DATE DEFAULT SYSDATE,   -- 날짜
    PR_NO              NUMBER CONSTRAINT       -- 번호(OH_PHOTO_REPLY)
                                PRL_PR_NO_FK
                              REFERENCES
                                OH_PHOTO_REPLY(PR_NO)
                              ON DELETE CASCADE
);
--------------------------------------
-- CONSTRAINT
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'OH_PHOTO_REPLY_LIKE';
ALTER TABLE OH_PHOTO_REPLY_LIKE DROP CONSTRAINT PRL_PR_NO_FK;
--------------------------------------
-- DROP
DROP TABLE OH_PHOTO_REPLY_LIKE;
DROP TABLE OH_PHOTO_REPLY_LIKE PURGE;
--------------------------------------
-- SEQUENCE
CREATE SEQUENCE OH_PHOTO_REPLY_LIKE_SEQ;
DROP SEQUENCE OH_PHOTO_REPLY_LIKE_SEQ;
--------------------------------------
-- INSERT
INSERT INTO OH_PHOTO_REPLY_LIKE (PRL_NO, MEMNO, PRL_DATE) VALUES (OH_PHOTO_REPLY_LIKE_SEQ.NEXTVAL, 3, SYSDATE);
--------------------------------------
-- SELECT
SELECT * FROM OH_PHOTO_REPLY_LIKE;
--------------------------------------
--------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------