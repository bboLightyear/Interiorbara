create table my_member_info(
memno number,
nickname varchar2(50),
shpwd varchar2(90),
bcpwd varchar2(90),
email varchar2(50),
mailcheck number,
birth varchar2(8),
gender varchar(10),
phone varchar(15),
joindate timestamp,
memtype varchar2(15),
profileimg varchar2(300));

create sequence memno_seq;

select * from my_member_info;

commit;
