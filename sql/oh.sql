--------------------------------------------------------------------------------
-- FLASHBACK TABLE 테이블명 TO BEFORE DROP;

PURGE RECYCLEBIN;

COMMIT;

ROLLBACK;

--------------------------------------------------------------------------------
-- TABLE
-- OH_PHOTO_BOARD
-- CREATE
CREATE TABLE OH_PHOTO_BOARD (
    PB_NO		    NUMBER PRIMARY KEY,   -- 번호
    PB_USER		    VARCHAR2(30),         -- 사용자
    PB_TITLE	    VARCHAR2(50),         -- 제목
    PB_CONTENT	    VARCHAR2(200),        -- 내용
    PB_DATE		    DATE DEFAULT SYSDATE, -- 날짜
    PB_LIKE		    NUMBER DEFAULT 0,     -- 좋아요수
    PB_SCRAP	    NUMBER DEFAULT 0,     -- 스크랩수
    PB_REPLY	    NUMBER DEFAULT 0,     -- 댓글수
    PB_LINK		    NUMBER DEFAULT 0,     -- 공유수
    PB_HIT		    NUMBER DEFAULT 0,     -- 조회수
    PB_CATEGORY	    VARCHAR2(50),         -- #카테고리
    PB_RESIDENCE    VARCHAR2(30),         -- 주거형태
    PB_ROOM		    VARCHAR2(30),         -- 공간
    PB_STYLE		VARCHAR2(30),         -- 스타일
    PB_SKILL		VARCHAR2(30)          -- 셀프/전문가
);

DROP TABLE OH_PHOTO_BOARD;

DROP TABLE OH_PHOTO_BOARD PURGE;

-- SELECT

SELECT * FROM OH_PHOTO_BOARD;

SELECT MAX(PB_NO) FROM OH_PHOTO_BOARD;

-- SEQUENCE

CREATE SEQUENCE OH_PHOTO_BOARD_SEQ;

DROP SEQUENCE OH_PHOTO_BOARD_SEQ;

-- INSERT

INSERT INTO 
    OH_PHOTO_BOARD
VALUES (
    OH_PHOTO_BOARD_SEQ.NEXTVAL, '홍길동', '길동이 집자랑', '안녕하세요.. 홍길동입니다...', SYSDATE, 
    0, 0, 0, 0, 0, 
    '#그냥', '아파트', '거실', '빈티지', '셀프'
);



     
--------------------------------------------------------------------------------
-- TABLE
-- OH_PHOTO_ATTACH
-- CREATE
CREATE TABLE OH_PHOTO_ATTACH (
    PA_NO       NUMBER PRIMARY KEY, -- 번호
    PA_ATTACH   VARCHAR2(50),       -- 사진첨부
    PB_NO       NUMBER CONSTRAINT   -- 번호(OH_PHOTO_BOARD)     
                           PA_PB_NO_FK
                       REFERENCES 
                           OH_PHOTO_BOARD(PB_NO) 
                       ON DELETE CASCADE 
);
-- DROP
DROP TABLE OH_PHOTO_ATTACH;
-- DROP PURGE
DROP TABLE OH_PHOTO_ATTACH PURGE;

-- SEQUENCE
-- CREATE
CREATE SEQUENCE OH_PHOTO_ATTACH_SEQ;
-- DROP
DROP SEQUENCE OH_PHOTO_ATTACH_SEQ;

-- CONSTRAINT
-- 조회
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'OH_PHOTO_ATTACH';
-- 삭제
ALTER TABLE OH_PHOTO_ATTACH DROP CONSTRAINT PA_PB_NO_FK;

-- SELECT
-- 테이블 전체 조회
SELECT * FROM OH_PHOTO_ATTACH;
-- 게시물로 그룹, 첫번째 이미지 번호조회
SELECT MIN(PA_NO) FROM OH_PHOTO_ATTACH GROUP BY PB_NO;
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
-- 위 결과, LEFT OUTER JOIN WITH OH_PHOTO_BOARD
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
;


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
			OH1.PB_NO = OH2.PB_NO;	










-- INSERT
INSERT INTO 
    OH_PHOTO_ATTACH (PA_NO, PA_ATTACH) 
VALUES (
    OH_PHOTO_ATTACH_SEQ.NEXTVAL, '파일이름'
);
-- DELETE
DELETE FROM OH_PHOTO_ATTACH WHERE PA_NO = 1;





PURGE RECYCLEBIN;

COMMIT;

ROLLBACK;



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------