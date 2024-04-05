
create table cs_noticeboard (
nbno number primary key, --글번호
nbtitle varchar2(50),    --글제목
nbqnadiv varchar2(20),   --글 분류
nbcontent varchar2(300), --글내용
nbwriter varchar2(30),   --작성자
nbhit number,            --조회수
nbdate date,             --작성일
nbgroup number,          --그룹 (답글 구분용)
nbstep number,           --스탭 (답글 구분용)
nbindent number,         --인텐트 (답글 구분용)
nbfilecode varchar2(50)      --첨부파일
);
create sequence cs_noticeboard_seq;

create table cs_noticeboard_img(
nbno number primary key, 
nbfilecode varchar2 (50),
filesrc varchar2(50)
);
create sequence cs_noticeboard_img_seq;


create table cs_noticeboard_reply(
nbno number ,
rnbno number primary key,
rnbwriter varchar2(50),
rnbcontent varchar2(50),
rnbstep number,
rnbgroup number,
rnbindent number
);
create SEQUENCE cs_noticeboard_reply_seq;

---------------------qna

create table cs_qnaboard (
qbno number primary key, --글번호
qbtitle varchar2(50),    --글제목
qbqnadiv varchar2(20),   --글 분류
qbcontent varchar2(300), --글내용
qbwriter varchar2(30),   --작성자
qbhit number,            --조회수
qbdate date,             --작성일
qbgroup number,          --그룹 (답글 구분용)
qbstep number,           --스탭 (답글 구분용)
qbindent number,         --인텐트 (답글 구분용)
qbfilecode varchar2(50)      --첨부파일
);
create sequence cs_qnaboard_seq;

create table cs_qnaboard_img(
qbno number primary key, 
qbfilecode varchar2 (50),
filesrc varchar2(50)
);
create sequence cs_qnaboard_img_seq;

create table cs_qnaboard_reply(
qbno number,
rqbno number primary key,
rqbwriter varchar2(50),
rqbcontent varchar2(50),
rqbstep number,
rqbgroup number,
rqbindent number
);
create SEQUENCE cs_qnaboard_reply_seq;


--------------------
--insert
INSERT INTO
		CS_NOTICEBOARD(NBNO,NBTITLE,NBCONTENT,NBWRITER,NBHIT,NBDATE,NBGROUP,NBSTEP,NBINDENT,NBFILECODE,NBQNADIV)
		VALUES(CS_QNABOARD_SEQ.NEXTVAL,'공지사항입니다5(제목)','공지사항입니다5(내용)','admin',0,SYSDATE,0,0,0,null,'ss');
        
INSERT INTO
		CS_QNABOARD(QBNO,QBTITLE,QBCONTENT,QBWRITER,QBHIT,QBDATE,QBGROUP,QBSTEP,QBINDENT,QBFILECODE,QBQNADIV)
		VALUES(CS_QNABOARD_SEQ.NEXTVAL,'pf','회원정보/로그인','cus',0,SYSDATE,0,0,0,null,'pf');        
        
        commit;
        
        delete from cs_qnaboard;
--------------------
--select
SELECT ROWNUM, n.*
FROM (
    SELECT *
    FROM cs_noticeboard
    ORDER BY nbhit DESC
) n
WHERE ROWNUM <= 5;

	SELECT * FROM CS_NOTICEBOARD
    	ORDER BY NBHIT DESC
    	FETCH FIRST 5 ROWS ONLY;

		SELECT NBTITLE
		FROM (
			SELECT ROWNUM, N.*
			FROM (
		    	SELECT *
		    	FROM CS_NOTICEBOARD
		    	ORDER BY NBHIT DESC
			) N
		)
		WHERE ROWNUM <= 5;

	SELECT ROWNUM, n.nbtitle
		FROM (
		    SELECT *
		    FROM CS_NOTICEBOARD
		    ORDER BY NBHIT DESC
		) N
		WHERE ROWNUM <  =        5;
        
        
        SELECT QBTITLE
		FROM (
			SELECT ROWNUM, N.*
			FROM (
		    	SELECT *
		    	FROM CS_QNABOARD
		    	ORDER BY QBHIT DESC
			) N
		)
		WHERE ROWNUM <= 15 AND QBQNADIV= '';
        
        SELECT QBTITLE,QBNO
		FROM (
			SELECT ROWNUM, N.*
			FROM (
		    	SELECT *
		    	FROM CS_QNABOARD
		    	ORDER BY QBHIT DESC
			) N
		)
		WHERE ROWNUM <= 15 
    
        