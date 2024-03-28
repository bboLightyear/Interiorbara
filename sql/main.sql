create table biz_temp(
biz_no number,
biz_name varchar2(300),
biz_addr varchar2(300),
biz_img varchar2(300)
);

create table shop_temp(
shop_no number,
shop_name varchar2(300),
shop_price number,
shop_img varchar2(300)
);

create table oh_temp(
oh_no number,
oh_name varchar2(300),
oh_content varchar2(3000),
oh_img varchar2(300)
);

create table notice_temp(
notice_no number,
notice_title varchar2(300),
notice_writer varchar2(300),
notice_hit number,
notice_date date
);

create table qna_temp(
qna_no number,
qna_title varchar2(300),
qna_writer varchar2(300),
qna_hit number,
qna_date date
);

select * from biz_temp;
create sequence biz_temp_seq;
insert into biz_temp values( biz_temp_seq.nextval, '업체이름1', '서울 구로구 도림천로 477', 'biz_img_01.jpg');
insert into biz_temp values( biz_temp_seq.nextval, '업체이름2', '서울 관악구 신림동 643-1', 'biz_img_02.jpg');
insert into biz_temp values( biz_temp_seq.nextval, '업체이름3', '서울 관악구 남부순환로 1614', 'biz_img_03.jpg');
insert into biz_temp values( biz_temp_seq.nextval, '업체이름4', '서울 관악구 남부순환로 1721', 'biz_img_04.jpg');
insert into biz_temp values( biz_temp_seq.nextval, '업체이름5', '서울 관악구 남부순환로 1822', 'biz_img_05.jpg');
insert into biz_temp values( biz_temp_seq.nextval, '업체이름6', '서울 관악구 남부순환로 1928', 'biz_img_06.jpg');
select * from shop_temp;
create sequence shop_temp_seq;
insert into shop_temp values( shop_temp_seq.nextval, '상품이름1', '10000', 'shop_img_01.jpg');
insert into shop_temp values( shop_temp_seq.nextval, '상품이름2', '20000', 'shop_img_02.jpg');
insert into shop_temp values( shop_temp_seq.nextval, '상품이름3', '30000', 'shop_img_03.jpg');
insert into shop_temp values( shop_temp_seq.nextval, '상품이름4', '40000', 'shop_img_04.jpg');
insert into shop_temp values( shop_temp_seq.nextval, '상품이름5', '50000', 'shop_img_05.jpg');
insert into shop_temp values( shop_temp_seq.nextval, '상품이름6', '60000', 'shop_img_06.jpg');
select * from oh_temp;
create sequence oh_temp_seq;
insert into oh_temp values( oh_temp_seq.nextval, '후기 1', '안녕하세요. 아이 3명과 남편을 키우고 있는,
톤온톤의 베이지와 버터 색감의 감성을 좋아하며 단정하고 심플한 집 꾸미기를 추구하는 결혼 14년 차 살림하는 주부 @butter_home입니다.', 'oh_img_01.jpg');
insert into oh_temp values( oh_temp_seq.nextval, '후기 2', '2007년도 완공되어 넓은 전실을 가지고 있는 판상형 구조로 된 50평 아파트입니다.
방 3개와 거실은 4베이 구조로 되어 있고요. 안방을 제외한 방 3개가 확장되어 있어 넓은 공간이 있지만,
중간중간 내력벽이 있어 수납 공간을 만들어 원하는 수납장을 많이 배치하였습니다.', 'oh_img_02.jpg');
insert into oh_temp values( oh_temp_seq.nextval, '후기 3', '안녕하세요! 저는 후암동에서 살고 있는 직장인입니다.
서울의 다양한 동네들을 전전하다, 지금의 남편을 만나 후암동에 자리를 잡게 되었습니다. (당시에는) 회사와 도보로 다니기 편한 동네를 찾다가
발견한 곳인데요. 5년이 넘게 이 곳에 직접 살아보니 생각보다 훨씬 더 낭만적이고 아름다운 동네라는 것을 알게 되었습니다.', 'oh_img_03.jpg');
insert into oh_temp values( oh_temp_seq.nextval, '후기 4', '이 집에서 지낸 5년이 넘는 시간 동안 좋아하는 색깔의 것들을 직접 만들거나 장만해왔는데요.
남들이 보기엔 조금 정신없고, 지저분(?)할 순 있으나, 저희가 보았을 때 마음이 즐겁고 편안해지는 분위기를 만드는 데에 집중했어요.', 'oh_img_04.jpg');
insert into oh_temp values( oh_temp_seq.nextval, '후기 5', '저희 집 도면입니다. 거실이 넓은 아파트와 달리 거실이 자그마한 구조를 가지고 있습니다.
현관을 들어서면 가장 먼저 작은 주방이 보이고, 거실과 안방 그리고 각자의 방이 하나씩 있습니다.
결혼 전부터 각자의 방은 꼭 있었으면 좋겠다는 생각이 반영된 구조입니다!', 'oh_img_05.jpg');
insert into oh_temp values( oh_temp_seq.nextval, '후기 6', '거실 벽엔 철마다 좋아하는 것들을 잔뜩 붙이곤 합니다.
어떤 달엔 잡지에서 본 멋진 레이아웃의 페이지를 찢어 붙이거나, 마음에 드는 작가의 포스터를 구매하거나, 혹은 남편의 그림을 붙이기도 합니다.
중간중간엔 활기를 더할 수 있도록 키우고 있는 화분들을 올려줬어요.', 'oh_img_06.jpg');
select * from notice_temp;
create sequence notice_temp_seq;
insert into notice_temp values( notice_temp_seq.nextval, '공지사항1', 'admin', '0',sysdate);
insert into notice_temp values( notice_temp_seq.nextval, '공지사항2', 'admin', '0',sysdate);
insert into notice_temp values( notice_temp_seq.nextval, '공지사항3', 'admin', '0',sysdate);
insert into notice_temp values( notice_temp_seq.nextval, '공지사항4', 'admin', '0',sysdate);
insert into notice_temp values( notice_temp_seq.nextval, '공지사항5', 'admin', '0',sysdate);
insert into notice_temp values( notice_temp_seq.nextval, '공지사항6', 'admin', '0',sysdate);
select * from qna_temp;
create sequence qna_temp_seq;
insert into qna_temp values( qna_temp_seq.nextval, 'QnA 1', 'admin', '0',sysdate);
insert into qna_temp values( qna_temp_seq.nextval, 'QnA 2', 'admin', '0',sysdate);
insert into qna_temp values( qna_temp_seq.nextval, 'QnA 3', 'admin', '0',sysdate);
insert into qna_temp values( qna_temp_seq.nextval, 'QnA 4', 'admin', '0',sysdate);
insert into qna_temp values( qna_temp_seq.nextval, 'QnA 5', 'admin', '0',sysdate);
insert into qna_temp values( qna_temp_seq.nextval, 'QnA 6', 'admin', '0',sysdate);

commit;

select * from (select * from biz_temp order by biz_no desc) where rownum <=4;