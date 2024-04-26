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

    MEMNO	           NUMBER,                -- 사용자_번호, FOREIGN KEY
                                              -- TABLE: my_member_info, COLUMN: memno

    PR_CONTENT         VARCHAR2(200),         -- 내용
    PR_LIKE            NUMBER DEFAULT 0,     -- 좋아요수
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
-- CONSTRAINT
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'OH_PHOTO_REPLY';
ALTER TABLE OH_PHOTO_REPLY DROP CONSTRAINT PR_PB_NO_FK;
--------------------------------------
-- DROP
DROP TABLE OH_PHOTO_REPLY;
DROP TABLE OH_PHOTO_REPLY PURGE;
--------------------------------------
-- SEQUENCE
CREATE SEQUENCE OH_PHOTO_REPLY_SEQ;
DROP SEQUENCE OH_PHOTO_REPLY_SEQ;
--------------------------------------
-- INSERT
INSERT INTO OH_PHOTO_REPLY (PR_NO, MEMNO, PR_CONTENT, PR_DATE, PR_GROUP, PR_STEP, PR_INDENT, PB_NO) VALUES (OH_PHOTO_REPLY_SEQ.NEXTVAL, 1, '댓글내용', SYSDATE, 0, 0, 0, 118);
--------------------------------------
-- SELECT
SELECT * FROM OH_PHOTO_REPLY;

SELECT
    PR_NO, MEMNO, PR_CONTENT, PR_LIKE,
    TO_CHAR(PR_DATE, 'YYYY.MM.DD') AS PR_DATE,
    PR_GROUP, PR_STEP, PR_INDENT, PB_NO
FROM
    OH_PHOTO_REPLY
;

SELECT
    OHA.NICKNAME, OHA.PROFILEIMG, OHB.*
FROM 
    MY_MEMBER_INFO OHA
INNER JOIN
    (SELECT
        PR_NO, MEMNO, PR_CONTENT, 
        TO_CHAR(PR_DATE, 'YYYY.MM.DD') AS PR_DATE,
        PR_GROUP, PR_INDENT, PB_NO
    FROM
        OH_PHOTO_REPLY
    ) OHB
ON 
    OHA.MEMNO = OHB.MEMNO
WHERE
    PB_NO = 127    
ORDER BY
    PR_NO DESC
;

SELECT
    OHA.NICKNAME, OHA.PROFILEIMG, OHB.*
FROM 
    MY_MEMBER_INFO OHA
INNER JOIN
    OH_PHOTO_BOARD OHB
ON 
    OHA.MEMNO = OHB.MEMNO
WHERE
    PB_NO = 127    
;



--------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------