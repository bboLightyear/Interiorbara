
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


create table cs_qnaboard_reply(
nbno number primary key,
rnbno number,
rnbwriter varchar2(50),
rnbcontent varchar2(50),
rnbstep number,
rnbgroup number,
rnbindent number
);

create SEQUENCE cs_qnaboard_reply_seq;

