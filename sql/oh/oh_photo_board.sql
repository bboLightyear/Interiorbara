--------------------------------------------------------------------------------
-- FLASHBACK TABLE 테이블명 TO BEFORE DROP;
PURGE RECYCLEBIN;
COMMIT;
ROLLBACK;
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_BOARD
--------------------------------------
-- CREATE
CREATE TABLE OH_PHOTO_BOARD (
    PB_NO		      NUMBER PRIMARY KEY,   -- 번호
    MEMNO	          NUMBER,               -- 사용자_번호
                                            -- TABLE: my_member_info, COLUMN: memno
                                            -- TABLE: my_member_info, COLUMN: nickname
    PB_TITLE	      VARCHAR2(100),         -- 제목
    PB_CONTENT	      VARCHAR2(650),        -- 내용
    PB_DATE		      DATE DEFAULT SYSDATE, -- 날짜
    PB_LIKE		      NUMBER DEFAULT 0,     -- 좋아요수
    PB_SCRAP	      NUMBER DEFAULT 0,     -- 스크랩수
    PB_REPLY	      NUMBER DEFAULT 0,     -- 댓글수
    PB_LINK		      NUMBER DEFAULT 0,     -- 공유수
    PB_HIT		      NUMBER DEFAULT 0,     -- 조회수
    PB_CATEGORY	      VARCHAR2(50),         -- #카테고리
    PB_RESIDENCE      VARCHAR2(50),         -- 주거형태
    PB_ROOM		      VARCHAR2(50),         -- 공간
    PB_STYLE		  VARCHAR2(50),         -- 스타일
    PB_SKILL		  VARCHAR2(50)          -- 셀프/전문가
);
--------------------------------------
-- DROP
DROP TABLE OH_PHOTO_BOARD;
DROP TABLE OH_PHOTO_BOARD PURGE;
--------------------------------------
-- SEQUENCE
CREATE SEQUENCE OH_PHOTO_BOARD_SEQ;
DROP SEQUENCE OH_PHOTO_BOARD_SEQ;
--------------------------------------
-- SELECT
SELECT * FROM OH_PHOTO_BOARD;
SELECT * FROM OH_PHOTO_BOARD ORDER BY PB_NO DESC;
SELECT MAX(PB_NO) FROM OH_PHOTO_BOARD;
--------------------------------------
-- DELETE
DELETE FROM OH_PHOTO_BOARD;
--------------------------------------
-- INSERT
INSERT INTO OH_PHOTO_BOARD VALUES (OH_PHOTO_BOARD_SEQ.NEXTVAL, '1', '제목입니다.', '내용입니다....', SYSDATE, 
                                   0, 0, 0, 0, 0, '#그냥', '아파트', '거실', '빈티지', '셀프');
INSERT INTO OH_PHOTO_BOARD VALUES (OH_PHOTO_BOARD_SEQ.NEXTVAL, '2', '제목입니다.', '내용입니다....', SYSDATE, 
                                   0, 0, 0, 0, 0, '#그냥', '아파트', '거실', '빈티지', '셀프');
INSERT INTO OH_PHOTO_BOARD VALUES (OH_PHOTO_BOARD_SEQ.NEXTVAL, '3', '제목입니다.', '내용입니다....', SYSDATE, 
                                   0, 0, 0, 0, 0, '#그냥', '아파트', '거실', '빈티지', '셀프');
INSERT INTO OH_PHOTO_BOARD VALUES (OH_PHOTO_BOARD_SEQ.NEXTVAL, '4', '제목입니다.', '내용입니다....', SYSDATE, 
                                   0, 0, 0, 0, 0, '#그냥', '아파트', '거실', '빈티지', '셀프');
INSERT INTO OH_PHOTO_BOARD VALUES (OH_PHOTO_BOARD_SEQ.NEXTVAL, '1', '제목입니다.', '내용입니다....', SYSDATE, 
                                   0, 0, 0, 0, 0, '#그냥', '아파트', '거실', '빈티지', '셀프');
INSERT INTO OH_PHOTO_BOARD VALUES (OH_PHOTO_BOARD_SEQ.NEXTVAL, '2', '제목입니다.', '내용입니다....', SYSDATE, 
                                   0, 0, 0, 0, 0, '#그냥', '아파트', '거실', '빈티지', '셀프');
INSERT INTO OH_PHOTO_BOARD VALUES (OH_PHOTO_BOARD_SEQ.NEXTVAL, '3', '제목입니다.', '내용입니다....', SYSDATE, 
                                   0, 0, 0, 0, 0, '#그냥', '아파트', '거실', '빈티지', '셀프');
INSERT INTO OH_PHOTO_BOARD VALUES (OH_PHOTO_BOARD_SEQ.NEXTVAL, '4', '제목입니다.', '내용입니다....', SYSDATE, 
                                   0, 0, 0, 0, 0, '#그냥', '아파트', '거실', '빈티지', '셀프');                                   
--------------------------------------
-- UPDATE
UPDATE
    OH_PHOTO_BOARD
SET
    PB_HIT = PB_HIT + 1
WHERE
    PB_NO = 50;
--------------------------------------


    SELECT
        ROWNUM, N.*
    FROM
        (SELECT 
             OH1.*, OH2.PA_NO, OH2.PA_ATTACH 
         FROM 
             OH_PHOTO_BOARD OH1 
         LEFT OUTER JOIN 
             (SELECT 
                  * 
              FROM 
                  OH_PHOTO_ATTACH 
              WHERE 
                  PA_NO IN (
                            SELECT 
                                MIN(PA_NO) 
                            FROM 
                                OH_PHOTO_ATTACH 
                            GROUP BY 
                                PB_NO
                           ) 
              ORDER BY 
                  PA_NO
             ) OH2
         ON
             OH1.PB_NO = OH2.PB_NO
         ORDER BY
            OH1.PB_NO DESC
        ) N
    WHERE
        ROWNUM BETWEEN 1 AND 4
;

--------------------------------------

SELECT
    ROWNUM, N.*
FROM (
    SELECT 
        OH1.*, OH2.PA_NO, OH2.PA_ATTACH 
    FROM (
        SELECT
            OHA.NICKNAME, OHB.*
        FROM 
            MY_MEMBER_INFO OHA
        INNER JOIN
            OH_PHOTO_BOARD OHB
        ON 
            OHA.MEMNO = OHB.MEMNO
        ) OH1 
    LEFT OUTER JOIN (
        SELECT 
            * 
        FROM 
            OH_PHOTO_ATTACH 
        WHERE 
            PA_NO IN (
                SELECT 
                    MIN(PA_NO) 
                FROM 
                    OH_PHOTO_ATTACH 
                GROUP BY 
                    PB_NO
                )
        ) OH2
    ON
        OH1.PB_NO = OH2.PB_NO
    ORDER BY
        OH1.PB_NO DESC
    ) N
WHERE
    ROWNUM BETWEEN 1 AND 4
;            
                       
--------------------------------------
--------------------------------------
--------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
