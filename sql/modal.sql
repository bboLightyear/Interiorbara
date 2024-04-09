create table modal_check(
m_type varchar2(40),
m_pname varchar2(70),
m_pexp varchar2(100),
m_pprice number
);
--스탠다드커스텀인테리어
insert into modal_check values('standard','철거-마루바닥(평당)','거실 및 방바닥 마루철거',3);
insert into modal_check values('standard','확장-발코니(개소당)','단열/난방배관 포함가',110);
insert into modal_check values('standard','전기-배선공사(평당)','토탈 리모델링 공사시 필수 선택',4);
insert into modal_check values('standard','스위치/콘센트교체(개당)','르그랑제품 기준(인건비포함)',2);
insert into modal_check values('standard','샷시-교체','샷시는 실측 후 별도 요금 안내',null);
insert into modal_check values('standard','에어컨','별도 요금 안내',null);
insert into modal_check values('standard','방문교체(개당)','기본 플랫형(손잡이/경첩 포함)',25);
insert into modal_check values('standard','방문+문틀교체(개당)','플랫도어,브랜드(손잡이/경첩 포함)',40);
insert into modal_check values('standard','중문','기본형 이외 추가비용 발생',100);
insert into modal_check values('standard','도배-합지(평당가)','LX벽지 기준,인건비 포함',4);
insert into modal_check values('standard','도배-실크(평당가)','LX벽지 기준,인건비 포함',8);
insert into modal_check values('standard','바닥-마루(평당가)','스탠다드 강마루(구정마루 기준)',11);
insert into modal_check values('standard','바닥-장판(평당가)','LX장판(3T)기준',5);
insert into modal_check values('standard','욕실-스탠다드(개소당)','기성비제품(도기/슬라이드장/욕실제품/타일공사 포함)',380);
insert into modal_check values('standard','필름-방문(개당)','도어 교체시 선택 금지',12);
insert into modal_check values('standard','필름-현관문내측',null,20);
insert into modal_check values('standard','주방가구-스탠다드(미터당)','상/하부장,기본싱크볼/수전,후드 포함(주방 벽 타일 비포함)',95);
insert into modal_check values('standard','아일랜드(미터당)','기본 인조대리석 상판 포함',75);
insert into modal_check values('standard','신발장/현관장(미터당)','신발장 하부 띄움시 추가 비용 발생',45);
insert into modal_check values('standard','붙박이장(미터당)','기본E0 PET장',35);
insert into modal_check values('standard','탄성코트(개소당)','발코니 오염/곰팡이 방지 페인트',35);
insert into modal_check values('standard','타일공사-발코니(개소당)','기본 국산타일',50);
insert into modal_check values('standard','타일공사-현관바닥','기본 국산타일(인건비 포함)',45);
insert into modal_check values('standard','마감청소(평당가)','기본 입주 청소',1);


--프리미엄커스텀인테리어
insert into modal_check values('premium','철거-내부전체(평당)','타일,붙박이장,주방가구,몰딩,도어(날개벽 철거 비포함)',7);
insert into modal_check values('premium','철거-마루바닥(평당)','거실 및 방바닥 마루철거',3);
insert into modal_check values('premium','확장-발코니(개소당)','단열/난방배관 포함가',110);
insert into modal_check values('premium','전기-배선공사(평당)','토탈 리모델링 공사시 필수 선택',4);
insert into modal_check values('premium','스위치/콘센트교체(개당)','르그랑제품 기준(인건비포함)',2);
insert into modal_check values('premium','샷시-교체','샷시는 실측 후 별도 요금 안내',null);
insert into modal_check values('premium','조명-천장매입등 시공(평당)','LED 2/3인치 포함(인건비 포함)',3);
insert into modal_check values('premium','에어컨','별도 요금 안내',null);
insert into modal_check values('premium','방문교체(개당)','브랜드(손잡이/경첩 포함)',28);
insert into modal_check values('premium','방문+문틀교체(개당)','플랫도어,브랜드(손잡이/경첩 포함)',40);
insert into modal_check values('premium','방문교체(히든도어/개당)','브랜드(손잡이/경첩 포함)',55);
insert into modal_check values('premium','중문-프리미엄','브랜드 중문',130);
insert into modal_check values('premium','도배-실크(평당가)','LX벽지 기준,인건비 포함',8);
insert into modal_check values('premium','바닥-마루(평당가)','프리미엄 강마루(구정마루 기준)',13);
insert into modal_check values('premium','욕실-프리미엄(개소당)','브랜드제품(도기/슬라이드장/욕실제품/타일공사 포함)',480);
insert into modal_check values('premium','필름-방문(개당)','도어 교체시 선택 금지',12);
insert into modal_check values('premium','필름-현관문내측',null,20);
insert into modal_check values('premium','주방가구-스탠다드(미터당)','상/하부장,기본싱크볼/수전,후드 포함(주방 벽 타일 비포함)',95);
insert into modal_check values('premium','주방가구-프리미엄(미터당)','상/하부장,브랜드싱크볼/수전,후드 포함(주방 벽 타일 비포함)',125);
insert into modal_check values('premium','아일랜드(미터당)','기본 인조대리석 상판 포함',75);
insert into modal_check values('premium','신발장/현관장(미터당)','신발장 하부 띄움시 추가 비용 발생',45);
insert into modal_check values('premium','붙박이장(미터당)','제로조인트 PET장',65);
insert into modal_check values('premium','탄성코트(개소당)','발코니 오염/곰팡이 방지 페인트',35);
insert into modal_check values('premium','타일공사-발코니(개소당)','기본 국산타일',50);
insert into modal_check values('premium','타일공사-현관바닥','기본 국산타일(인건비 포함)',45);
insert into modal_check values('premium','마감청소(평당가)','기본 입주 청소',1);

--주방인테리어
insert into modal_check values('kitchen','상부장(미터당)','EO(PET)제로조인트(높이600),블룸경첩,푸시도어',50);
insert into modal_check values('kitchen','하부장(미터당)','EO(PET)제로조인트(높이850),블룸경첩,푸시도어',60);
insert into modal_check values('kitchen','냉장고장(미터당)','EO(PET)기준',50);
insert into modal_check values('kitchen','아일랜드(미터당)','EO(PET)기준(높이850)',65);
insert into modal_check values('kitchen','인조대리석 상판(미터당)','상/하부장 길이 입력, LX 하이막스(12T/폭90cm기준)',35);
insert into modal_check values('kitchen','대리석 상판(미터당)','상/하부장 길이 입력(12T/폭90cm기준)',55);
insert into modal_check values('kitchen','싱크수전-기본','하츠 수전 FC-US 100',9);
insert into modal_check values('kitchen','싱크수전-프리미엄','슈티에 수전',25);
insert into modal_check values('kitchen','싱크볼','백조싱크볼 780',38);
insert into modal_check values('kitchen','벽타일 변경(미터당)','국산타일(300/600각 선택/인건비포함)',25);
insert into modal_check values('kitchen','후드','하이드 빌트인 후드(배관설치 포함)',30);

--욕실인테리어
insert into modal_check values('bath','욕실-전체철거','타일포함 전체 철거',75);
insert into modal_check values('bath','욕실-일부철거','도기/수전/욕조/천장 철거',55);
insert into modal_check values('bath','욕실방수','도막방수/전체철거 선택시 필수체크',30);
insert into modal_check values('bath','욕실타일-덧방','타일선택 후 시공(욕실크기 1500*2300기준)',80);
insert into modal_check values('bath','욕실타일-전체시공','타일선택 후 시공(욕실크기 1500*2300기준)',110);
insert into modal_check values('bath','양변기','아메리칸스탠다드 원피스(타 제품 선택 가능)',55);
insert into modal_check values('bath','양변기비데일체형','아메리칸스탠다드 플랫(타 제품 선택 가능)',110);
insert into modal_check values('bath','세면대 수전','아메리칸스탠다드 기준(타 제품 선택 가능)',15);
insert into modal_check values('bath','샤워기 수전','아메리칸스탠다드 기준(타 제품 선택 가능)',25);
insert into modal_check values('bath','세면대','아메리칸스탠다드 기준(타 제품 선택 가능)',25);
insert into modal_check values('bath','욕실악세사리','5품세트(비누대/옷걸이/컵,컵대/휴지걸이/수건걸이)',20);
insert into modal_check values('bath','욕조','기본 플랫 욕조(1500*700)',35);
insert into modal_check values('bath','샤워부스','일반 유리 샤워부스',50);
insert into modal_check values('bath','거울슬라이드장','수건 수납 등(500*1000 기준)',30);
insert into modal_check values('bath','욕실천장','일자형/SMC타입(욕실크기 1500*2300기준)',40);

select * from modal_check;
delete from modal_check;
drop table modal_check;
commit;
---------------------------------------------------------

create table modal_complete(
estino varchar2(100) primary key,
m_date DATE DEFAULT SYSDATE,
m_addr varchar2(100),
phone varchar2(100),
m_content varchar2(1000),
m_size varchar2(100),
m_request varchar2(300),
m_price varchar2(100),
m_wanttime varchar2(30),
m_wantdate varchar2(50),
m_circs varchar2(100),
m_place varchar2(100),
m_type varchar2(100),
m_contentprice varchar2(1000)
);

INSERT INTO modal_complete
VALUES (
    'M' || 
    TO_CHAR(SYSDATE, 'YYYYMMDD') ||
    LPAD(COALESCE(TO_NUMBER((SELECT MAX(SUBSTR(estino, 10, 4)) FROM my_nonmember WHERE TRUNC(m_date) = TRUNC(SYSDATE))), 0) + 1, 4, '0') ||
    LPAD(FLOOR(DBMS_RANDOM.VALUE(0, 100)), 2, '0'),
    SYSDATE,
    '안산시 상록구 수암동',
    '010-9544-9544',
    '자재상품내용 블라블라블라블라',
    '평수',
    '추가내용',
    '총합가격',
    '희망상담시간',
    '희망시공일자',
    '시공환경',
    '시공공간종류',
    '프리미엄 인테리어',
    '추가내용과가격'
);


select * from modal_complete;
delete from modal_complete;
drop table modal_complete;

--------------------------------

CREATE TABLE my_nonmember (
    name VARCHAR2(30),
    email VARCHAR2(100),
    phone VARCHAR2(30),
    pw VARCHAR2(20)
);

select * from my_nonmember;
--drop table my_nonmember;
delete from my_nonmember;
drop table my_nonmember;

select * from modal_complete;

commit;
----트리거--------------
--CREATE OR REPLACE TRIGGER my_nonmember_insert_trigger
--AFTER INSERT ON my_nonmember
--FOR EACH ROW
--BEGIN
--    INSERT INTO modal_complete (estino)
--    VALUES (:NEW.estino);
--END;
--/
--INSERT INTO my_nonmember (estino, name, phone, email, pw, created_at)
--VALUES (
--    'M' || TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD(COALESCE(TO_NUMBER((SELECT MAX(SUBSTR(estino, 10, 4)) FROM my_nonmember WHERE TRUNC(created_at) = TRUNC(SYSDATE))), 0) + 1, 4, '0') || LPAD(FLOOR(DBMS_RANDOM.VALUE(0, 100)), 2, '0'),
--    '홍길동',
--    '010-1234-5678',
--    'test@example.com',
--    'password',
--    SYSDATE
--);

------------------------
select * from modal_complete;
select * from my_nonmember;
delete from my_nonmember;
delete from modal_complete;
rollback;

--select c.estino
--from modal_complete c inner join my_nonmember m
--on c.phone=m.phone
--where m.phone = 'tq';
--	

---join view
CREATE VIEW nonmember_complete_view AS
SELECT
    mn.name,
    mn.email,
    mn.phone,
    mc.estino,
    mc.m_date,
    mc.m_addr,
    mc.m_content,
    mc.m_size,
    mc.m_request,
    mc.m_price,
    mc.m_wanttime,
    mc.m_wantdate,
    mc.m_circs,
    mc.m_place,
    mc.m_type,
    mc.m_contentprice
FROM
    my_nonmember mn
    INNER JOIN modal_complete mc ON mn.phone = mc.phone;
    
    SELECT * FROM nonmember_complete_view;