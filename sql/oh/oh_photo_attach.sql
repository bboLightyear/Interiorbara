--------------------------------------------------------------------------------
-- FLASHBACK TABLE 테이블명 TO BEFORE DROP;
PURGE RECYCLEBIN;
COMMIT;
ROLLBACK;
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
-- CONSTRAINT
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'OH_PHOTO_ATTACH';
ALTER TABLE OH_PHOTO_ATTACH DROP CONSTRAINT PA_PB_NO_FK;
--------------------------------------
-- DROP
DROP TABLE OH_PHOTO_ATTACH;
DROP TABLE OH_PHOTO_ATTACH PURGE;
-------------------------------------
-- SEQUENCE-
CREATE SEQUENCE OH_PHOTO_ATTACH_SEQ;
DROP SEQUENCE OH_PHOTO_ATTACH_SEQ;
--------------------------------------
-- INSERT
INSERT INTO OH_PHOTO_ATTACH (PA_NO, PA_ATTACH) VALUES (OH_PHOTO_ATTACH_SEQ.NEXTVAL, '1712807303308_01234567890123456789012345678901234567890123456789');
INSERT INTO OH_PHOTO_ATTACH (PA_NO, PA_ATTACH) VALUES (OH_PHOTO_ATTACH_SEQ.NEXTVAL, '1712807303308_0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789');
INSERT INTO OH_PHOTO_ATTACH (PA_NO, PA_ATTACH) VALUES (OH_PHOTO_ATTACH_SEQ.NEXTVAL, '1712807303308_0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456');
INSERT INTO OH_PHOTO_ATTACH (PA_NO, PA_ATTACH) VALUES (OH_PHOTO_ATTACH_SEQ.NEXTVAL, '1712807303308_0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456as');
INSERT INTO OH_PHOTO_ATTACH (PA_NO, PA_ATTACH) VALUES (OH_PHOTO_ATTACH_SEQ.NEXTVAL, '1712807303308_한글입니다한글입니다한글입니다한글입니다한글입니다한글입니다');
INSERT INTO OH_PHOTO_ATTACH (PA_NO, PA_ATTACH) VALUES (OH_PHOTO_ATTACH_SEQ.NEXTVAL, '1712807303308_한글입니다한글입니다한글입니다한글입니다한글입니다한글입니');
INSERT INTO OH_PHOTO_ATTACH (PA_NO, PA_ATTACH) VALUES (OH_PHOTO_ATTACH_SEQ.NEXTVAL, '1712807303308_한글입니다한글입니다한글입니다한글입니다한글입니다한글입');
INSERT INTO OH_PHOTO_ATTACH (PA_NO, PA_ATTACH) VALUES (OH_PHOTO_ATTACH_SEQ.NEXTVAL, '1712807303308_한글입니다한글입니다한글입니다한글입니다한글입니다한글');
INSERT INTO OH_PHOTO_ATTACH (PA_NO, PA_ATTACH) VALUES (OH_PHOTO_ATTACH_SEQ.NEXTVAL, '1712807303308_한글입니다한글입니다한글입니다한글입니다한글입니다한');
INSERT INTO OH_PHOTO_ATTACH (PA_NO, PA_ATTACH) VALUES (OH_PHOTO_ATTACH_SEQ.NEXTVAL, '1712807303308_한글입니다한글입니다한글입니다한글입니다한글입니다');
--------------------------------------
-- DELETE
DELETE FROM OH_PHOTO_ATTACH;
DELETE FROM OH_PHOTO_ATTACH WHERE PA_NO = 1;
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

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

