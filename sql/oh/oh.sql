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
    PB_USER_EMAIL	  VARCHAR2(50),         -- 사용자_이메일
    PB_USER_NICKNAME  VARCHAR2(50),         -- 사용자_별명
    PB_TITLE	      VARCHAR2(50),         -- 제목
    PB_CONTENT	      VARCHAR2(200),        -- 내용
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
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_ATTACH
--------------------------------------
-- CREATE 
CREATE TABLE OH_PHOTO_ATTACH (
    PA_NO       NUMBER PRIMARY KEY,   -- 번호
    PA_ATTACH   VARCHAR2(100),        -- 사진첨부
    PB_NO       NUMBER CONSTRAINT     -- 번호(OH_PHOTO_BOARD)     
                           PA_PB_NO_FK
                       REFERENCES 
                           OH_PHOTO_BOARD(PB_NO) 
                       ON DELETE CASCADE 
);
--------------------------------------
-- DROP
DROP TABLE OH_PHOTO_ATTACH;
DROP TABLE OH_PHOTO_ATTACH PURGE;
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_LIKE
--------------------------------------
-- CREATE
CREATE TABLE OH_PHOTO_LIKE (
    PL_NO             NUMBER PRIMARY KEY,    -- 번호
    PL_USER_EMAIL	  VARCHAR2(50),          -- 사용자_이메일
    PL_USER_NICKNAME  VARCHAR2(50),          -- 사용자_별명
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
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_SCRAP
--------------------------------------
-- CREATE
CREATE TABLE OH_PHOTO_SCRAP (
    PS_NO             NUMBER PRIMARY KEY,     -- 번호
    PS_USER_EMAIL	  VARCHAR2(50),           -- 사용자_이메일
    PS_USER_NICKNAME  VARCHAR2(50),           -- 사용자_별명
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
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_REPLY
--------------------------------------
-- CREATE
CREATE TABLE OH_PHOTO_REPLY (
    PR_NO              NUMBER PRIMARY KEY,    -- 번호
    PR_USER_EMAIL	   VARCHAR2(50),          -- 사용자_이메일
    PR_USER_NICKNAME   VARCHAR2(50),          -- 사용자_별명
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
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_REPLY_LIKE
--------------------------------------
-- CREATE
CREATE TABLE OH_PHOTO_REPLY_LIKE (
    PRL_NO             NUMBER PRIMARY KEY,    -- 번호
    PRL_USER_EMAIL     VARCHAR2(50),          -- 사용자_이메일
    PRL_USER_NICKNAME  VARCHAR2(50),          -- 사용자_별명
    PRL_DATE           DATE DEFAULT SYSDATE,  -- 날짜
    PR_NO              NUMBER CONSTRAINT      -- 번호(OH_PHOTO_REPLY)
                                PRL_PR_NO_FK
                              REFERENCES
                                OH_PHOTO_REPLY(PR_NO)
                              ON DELETE CASCADE
);
--------------------------------------
-- DROP
DROP TABLE OH_PHOTO_REPLY_LIKE;
DROP TABLE OH_PHOTO_REPLY_LIKE PURGE;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_BOARD
--------------------------------------
-- SELECT
SELECT * FROM OH_PHOTO_BOARD;
SELECT MAX(PB_NO) FROM OH_PHOTO_BOARD;
--------------------------------------
-- DELETE
DELETE FROM OH_PHOTO_BOARD;
--------------------------------------
-- SEQUENCE
CREATE SEQUENCE OH_PHOTO_BOARD_SEQ;
DROP SEQUENCE OH_PHOTO_BOARD_SEQ;
--------------------------------------
-- INSERT
INSERT INTO 
    OH_PHOTO_BOARD
VALUES (
    OH_PHOTO_BOARD_SEQ.NEXTVAL, '홍길동', '길동이 집자랑', '안녕하세요.. 홍길동입니다...', SYSDATE, 
    0, 0, 0, 0, 0, 
    '#그냥', '아파트', '거실', '빈티지', '셀프'
);
--------------------------------------
-- UPDATE
UPDATE
    OH_PHOTO_BOARD
SET
    PB_HIT = PB_HIT + 1
WHERE
    PB_NO = 50;
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_ATTACH
--------------------------------------
-- SEQUENCE
CREATE SEQUENCE OH_PHOTO_ATTACH_SEQ;
DROP SEQUENCE OH_PHOTO_ATTACH_SEQ;
--------------------------------------
-- CONSTRAINT
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'OH_PHOTO_ATTACH';
ALTER TABLE OH_PHOTO_ATTACH DROP CONSTRAINT PA_PB_NO_FK;
--------------------------------------
-- SELECT
SELECT * FROM OH_PHOTO_ATTACH;
--------------------------------------
-- 게시물로 그룹, 첫번째 이미지 번호조회
SELECT MIN(PA_NO) FROM OH_PHOTO_ATTACH GROUP BY PB_NO;
--------------------------------------
-- 각각 게시물의 첫번째 이미지 조회
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
ORDER BY 
    PA_NO
;
--------------------------------------
-- 위 결과, LEFT OUTER JOIN WITH OH_PHOTO_BOARD
--------------------------------------
-- ORACLE
SELECT 
    * 
FROM 
    OH_PHOTO_BOARD OH1, (SELECT 
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
WHERE 
    OH1.PB_NO = OH2.PB_NO(+)
ORDER BY
    PB_DATE DESC
;
--------------------------------------
-- ANSI
SELECT 
    * 
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
    PB_DATE DESC    
;
--------------------------------------
-- version 2
SELECT
    ROWNUM, N.*
FROM
    (SELECT 
         * 
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
        PB_DATE DESC
    ) N
WHERE
    ROWNUM BETWEEN 1 AND 3
;	
--------------------------------------
SELECT
    *
FROM
    (SELECT
         ROWNUM NO, N.*
     FROM
         (SELECT 
              * 
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
              PB_DATE DESC              
         ) N
     WHERE
        PB_TITLE LIKE '%부기%'   
    )    
WHERE
    NO BETWEEN 1 AND 3
;	
--------------------------------------
SELECT
    *
FROM
    (SELECT
         ROWNUM NO, N.*
     FROM
         (SELECT 
              * 
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
         ) N
     WHERE
        PB_TITLE LIKE '%부기%'   
    )    
WHERE
    NO BETWEEN 1 AND 3
ORDER BY
    PB_DATE DESC
;	
--------------------------------------
-- INSERT
INSERT INTO 
    OH_PHOTO_ATTACH (PA_NO, PA_ATTACH) 
VALUES (
    OH_PHOTO_ATTACH_SEQ.NEXTVAL, '파일이름'
);
--------------------------------------
-- DELETE
DELETE FROM OH_PHOTO_ATTACH;
DELETE FROM OH_PHOTO_ATTACH WHERE PA_NO = 1;
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_LIKE
--------------------------------------
-- SEQUENCE
CREATE SEQUENCE OH_PHOTO_LIKE_SEQ;
DROP SEQUENCE OH_PHOTO_LIKE_SEQ;
--------------------------------------
-- SELECT
SELECT * FROM OH_PHOTO_LIKE;
SELECT COUNT(*) FROM OH_PHOTO_LIKE WHERE PL_USER = '김경태';
--------------------------------------
-- INSERT
INSERT INTO 
    OH_PHOTO_LIKE (PL_NO, PL_USER, PL_DATE) 
VALUES (
    OH_PHOTO_LIKE_SEQ.NEXTVAL, '홍길동', SYSDATE
);
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_SCRAP
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
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_REPLY
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
--------------------------------------------------------------------------------
-- TABLE: OH_PHOTO_REPLY_LIKE
--------------------------------------
-- SEQUENCE
CREATE SEQUENCE OH_PHOTO_REPLY_LIKE_SEQ;
DROP SEQUENCE OH_PHOTO_REPLY_LIKE_SEQ;
--------------------------------------
-- SELECT
SELECT * FROM OH_PHOTO_REPLY_LIKE;
--------------------------------------
-- INSERT
INSERT INTO 
    OH_PHOTO_REPLY_LIKE (PRL_NO, PRL_USER_EMAIL, PRL_USER_NICKNAME, 
                         PRL_DATE, PR_NO
                        ) 
VALUES (
    
);



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------