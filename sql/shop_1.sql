create sequence seq_shop_product;
create sequence seq_shop_option_set;
create sequence seq_shop_option;
create sequence seq_shop_product_img;
create sequence seq_shop_detail_image;
create sequence seq_shop_attribute;
create sequence seq_shop_qna;
create sequence seq_shop_review;
create sequence seq_shop_user;
create sequence seq_shop_seller;
create sequence seq_shop_basket;
create sequence seq_shop_order;
create sequence seq_shop_order_product;
create sequence seq_shop_user_address;
create sequence seq_shop_orderer_info;


create table shop_product (
    product_id number,
    seller_id number,
    category_id number,
    name varchar2(150),
    rep_price number,
    rep_discounted_price number,
    is_discounted varchar2(1),
    discount_rate number,
    delivery_fee number,
    delivery_type varchar2(52),
    ref_price number,
    option_type varchar2(1),
    option1_set_id number,
    option2_set_id number,
    reg_time date,
    hits number,
    sales number,
    scraps number,
    reviews number
);

create table shop_option_set (
    option_set_id number,
    name varchar2(30)
);

create table shop_option (
    option_id number,
    option_set_id number,
    parent_option_id number,
    name varchar2(52),
    stock number,
    price number,
    discounted_price number
);

create table shop_category (
    category_id number,
    parent_category_id number,
    name varchar2(52)
);

create table shop_product_img (
    product_img_id number,
    product_id number,
    file_src varchar2(100)
);

create table shop_detail_image (
    detail_image_id number,
    product_id number,
    file_src varchar2(100)
);

create table shop_attribute (
    attribute_id number,
    product_id number,
    type varchar2(50),
    value varchar2(50)
);

create table shop_qna (
    qna_id number,
    product_id number,
    user_id number,
    q_reg_time date,
    q_content varchar2(300),
    is_answered varchar2(1),
    a_reg_time date,
    a_content varchar2(300)
);

create table shop_review (
    review_id number,
    product_id number,
    user_id number,
    score number,
    file_src varchar2(100),
    content varchar2(300),
    reg_date date
);

create table shop_user (
    user_id number,
    nickname varchar2(30)
);

create table shop_seller (
    seller_id number,
    nickname varchar2(52),
    introduce varchar2(100)
);

create table shop_basket (
    basket_id number,
    user_id number,
    product_id number,
    option_id number,
    quantity number,
    option_text varchar2(150)
);

create table shop_order (
    order_id number,
    user_id number,
    order_state_id number,
    address_name varchar2(30),
    receiver_name varchar2(30),
    receiver_phone number,
    zipcode number,
    big_address varchar2(100),
    detail_address varchar2(100),
    orderer_name varchar2(30),
    orderer_phone number,
    orderer_email varchar2(100),
    payment_type_id number,
    order_date date,
    total_price number,
    total_delivery_fee number,
    amount number
);

create table shop_order_product (
    order_product_id number,
    order_id number,
    product_id number,
    option_id number,
    name varchar2(150),
    total_price number,
    total_delivery_fee number,
    quantity number,
    option_text varchar2(150)
);

create table shop_order_state (
    order_state_id number,
    state varchar2(15)
);

create table shop_payment_type (
    payment_type_id number,
    name varchar2(30)
);

create table shop_user_address (
    user_address_id number,
    user_id number,
    address_name varchar2(30),
    receiver_name varchar2(30),
    phone number,
    zipcode number,
    big_address varchar2(100),
    detail_address varchar2(100)
);

create table shop_orderer_info (
    orderer_info_id number,
    user_id number,
    name varchar2(30),
    phone number,
    email varchar2(100)
);








insert into shop_category values (10000, null, '가구');

--------------------------------------------------------------------------------
insert into shop_category values (10100, 10000, '침대');
insert into shop_category values (10101, 10100, '침대프레임');
insert into shop_category values (10102, 10100, '침대+매트리스');
insert into shop_category values (10103, 10100, '침대부속가구');

insert into shop_category values (10104, 10101, '일반침대');
insert into shop_category values (10105, 10101, '수납침대');
insert into shop_category values (10106, 10101, '저상형침대');
insert into shop_category values (10107, 10101, '패밀리침대');
insert into shop_category values (10108, 10101, '이층·벙커침대');
insert into shop_category values (10109, 10101, '하단매트리스·파운데이션');
insert into shop_category values (10110, 10101, '모션베드');
insert into shop_category values (10111, 10101, '돌침대·흙침대');
insert into shop_category values (10112, 10101, '접이식침대');
insert into shop_category values (10113, 10102, '일반침대');
insert into shop_category values (10114, 10102, '수납침대');
insert into shop_category values (10115, 10102, '저상형침대');
insert into shop_category values (10116, 10102, '패밀리침대');
insert into shop_category values (10117, 10102, '이층·벙커침대');
insert into shop_category values (10118, 10102, '투매트리스');
insert into shop_category values (10119, 10102, '모션베드');

--------------------------------------------------------------------------------
insert into shop_category values (10200, 10000, '매트리스·토퍼');
insert into shop_category values (10201, 10200, '매트리스');
insert into shop_category values (10202, 10200, '토퍼');
insert into shop_category values (10203, 10201, '스프링매트리스');
insert into shop_category values (10204, 10201, '라텍스매트리스');
insert into shop_category values (10205, 10201, '폼매트리스');

--------------------------------------------------------------------------------
insert into shop_category values (10300, 10000, '테이블·식탁·책상');

insert into shop_category values (10301, 10300, '거실·소파테이블');
insert into shop_category values (10302, 10300, '사이드테이블');
insert into shop_category values (10303, 10300, '식탁');
insert into shop_category values (10304, 10300, '책상');
insert into shop_category values (10305, 10300, '좌식테이블');

insert into shop_category values (10306, 10303, '식탁·입식테이블');
insert into shop_category values (10307, 10303, '홈바·아일랜드식탁');
insert into shop_category values (10308, 10303, '식탁+의자');

insert into shop_category values (10309, 10304, '일반책상');
insert into shop_category values (10310, 10304, '좌식책상');
insert into shop_category values (10311, 10304, '모션·스탠딩책상');
insert into shop_category values (10312, 10304, '독서실책상');
insert into shop_category values (10313, 10304, '학원·사무용책상');

insert into shop_category values (10314, 10305, '접이식테이블');
insert into shop_category values (10315, 10305, '비접이식테이블');
insert into shop_category values (10316, 10305, '교자상');

--------------------------------------------------------------------------------
insert into shop_category values (10400, 10000, '소파');

insert into shop_category values (10401, 10400, '일반소파');
insert into shop_category values (10402, 10400, '리클라이너');
insert into shop_category values (10403, 10400, '소파베드');
insert into shop_category values (10404, 10400, '좌식소파');
insert into shop_category values (10405, 10400, '소파스툴');

--------------------------------------------------------------------------------
insert into shop_category values (10500, 10000, '서랍·수납장');

insert into shop_category values (10501, 10500, '서랍장');
insert into shop_category values (10502, 10500, '수납장');
insert into shop_category values (10503, 10500, '캐비닛');
insert into shop_category values (10504, 10500, '주방수납장');
insert into shop_category values (10505, 10500, '협탁');

insert into shop_category values (10506, 10504, '렌지대');
insert into shop_category values (10507, 10504, '그릇장');
insert into shop_category values (10508, 10504, '상부장');
insert into shop_category values (10509, 10504, '하부장');
insert into shop_category values (10510, 10504, '키큰장');
insert into shop_category values (10511, 10504, '상부장+하부장');

--------------------------------------------------------------------------------
insert into shop_category values (10600, 10000, '거실장·TV장');

insert into shop_category values (10601, 10600, '일반거실장');
insert into shop_category values (10602, 10600, '높은거실장·사이드보드');
insert into shop_category values (10603, 10600, 'TV스탠드');

--------------------------------------------------------------------------------
insert into shop_category values (10700, 10000, '선반');

insert into shop_category values (10701, 10700, '벽선반');
insert into shop_category values (10702, 10700, '스탠드선반');
insert into shop_category values (10703, 10700, '앵글·조립식선반');

insert into shop_category values (10704, 10701, '무지주선반');
insert into shop_category values (10705, 10701, '지주선반');
insert into shop_category values (10706, 10701, '찬넬선반');

--------------------------------------------------------------------------------
insert into shop_category values (10800, 10000, '진열장·책장');

insert into shop_category values (10801, 10800, '진열장·장식장');
insert into shop_category values (10802, 10800, '책장');
insert into shop_category values (10803, 10800, '매거진랙');

--------------------------------------------------------------------------------
insert into shop_category values (10900, 10000, '의자');

insert into shop_category values (10901, 10900, '인테리어의자');
insert into shop_category values (10902, 10900, '스툴·벤치');
insert into shop_category values (10903, 10900, '빈백');
insert into shop_category values (10904, 10900, '안락의자');
insert into shop_category values (10905, 10900, '흔들의자');
insert into shop_category values (10906, 10900, '학생·사무용의자');
insert into shop_category values (10907, 10900, '게이밍의자');
insert into shop_category values (10908, 10900, '좌식의자·자세보정의자');
insert into shop_category values (10909, 10900, '바체어');
insert into shop_category values (10910, 10900, '발받침');

--------------------------------------------------------------------------------
insert into shop_category values (11000, 10000, '행거·옷장');

insert into shop_category values (11001, 11000, '옷장');
insert into shop_category values (11002, 11000, '붙박이장');
insert into shop_category values (11003, 11000, '드레스룸');
insert into shop_category values (11004, 11000, '행거');

insert into shop_category values (11005, 11004, '고정·설치형행거');
insert into shop_category values (11006, 11004, '이동식행거');
insert into shop_category values (11007, 11004, '스탠드행거');
insert into shop_category values (11008, 11004, '스탠드형옷걸이');

--------------------------------------------------------------------------------
insert into shop_category values (11100, 10000, '거울');

insert into shop_category values (11101, 11100, '전신거울');
insert into shop_category values (11102, 11100, '벽거울');
insert into shop_category values (11103, 11100, '탁상거울');

--------------------------------------------------------------------------------
insert into shop_category values (11200, 10000, '화장대·콘솔');

insert into shop_category values (11201, 11200, '일반화장대');
insert into shop_category values (11202, 11200, '수납화장대');
insert into shop_category values (11203, 11200, '좌식·미니화장대');
insert into shop_category values (11204, 11200, '접이식화장대');
insert into shop_category values (11205, 11200, '콘솔');
insert into shop_category values (11206, 11200, '화장대+의자');

--------------------------------------------------------------------------------
insert into shop_category values (11300, 10000, '야외가구');

insert into shop_category values (11301, 11300, '야외테이블');
insert into shop_category values (11302, 11300, '야외테이블+의자');
insert into shop_category values (11303, 11300, '야외의자');
insert into shop_category values (11304, 11300, '창고·파라솔·기타');

--------------------------------------------------------------------------------
insert into shop_category values (11400, 10000, '가벽·파티션');

insert into shop_category values (11401, 11400, '인테리어파티션');
insert into shop_category values (11402, 11400, '사무용파티션');



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
insert into shop_category values (20000, null, '패브릭');

--------------------------------------------------------------------------------
insert into shop_category values (20100, 20000, '커튼·부자재');

insert into shop_category values (20101, 20100, '암막커튼');
insert into shop_category values (20102, 20100, '일반커튼');
insert into shop_category values (20103, 20100, '레이스·속커튼');
insert into shop_category values (20104, 20100, '가리개커튼');
insert into shop_category values (20105, 20100, '바란스·주방커튼');
insert into shop_category values (20106, 20100, '커튼부자재');
insert into shop_category values (20107, 20100, '캐노피');

--------------------------------------------------------------------------------
insert into shop_category values (20200, 20000, '러그·카페트');

insert into shop_category values (20201, 20200, '극세사·단모러그');
insert into shop_category values (20202, 20200, '사이잘룩러그');
insert into shop_category values (20203, 20200, '미니·포인트러그');
insert into shop_category values (20204, 20200, '샤기러그');
insert into shop_category values (20205, 20200, '면·핸드메이드러그');
insert into shop_category values (20206, 20200, '페르시안러그');
insert into shop_category values (20207, 20200, '가죽·양모러그');
insert into shop_category values (20208, 20200, '라탄·수초러그');
insert into shop_category values (20209, 20200, '원목·대자리');
insert into shop_category values (20210, 20200, '기타러그');

--------------------------------------------------------------------------------
insert into shop_category values (20300, 20000, '이불·이불솜');

insert into shop_category values (20301, 20300, '이불');
insert into shop_category values (20302, 20300, '이불솜·구스');

insert into shop_category values (20303, 20301, '차렵이불');
insert into shop_category values (20304, 20301, '이불커버');
insert into shop_category values (20305, 20301, '홑이불·겹이불');
insert into shop_category values (20306, 20302, '일반솜');
insert into shop_category values (20307, 20302, '거위·오리털솜');

--------------------------------------------------------------------------------
insert into shop_category values (20400, 20000, '베개·베개커버');

insert into shop_category values (20401, 20400, '베개커버');
insert into shop_category values (20402, 20400, '베개솜');
insert into shop_category values (20403, 20400, '라텍스베개');
insert into shop_category values (20404, 20400, '폼베개');
insert into shop_category values (20405, 20400, '자연소재베개');
insert into shop_category values (20406, 20400, '바디필로우·롱쿠션');
insert into shop_category values (20407, 20400, '목침·경침·쿨베개');

--------------------------------------------------------------------------------
insert into shop_category values (20500, 20000, '토퍼·패드');

insert into shop_category values (20501, 20500, '패드·스프레드');
insert into shop_category values (20502, 20500, '요·토퍼');
insert into shop_category values (20503, 20500, '쿨매트');

--------------------------------------------------------------------------------
insert into shop_category values (20600, 20000, '매트리스커버');

--------------------------------------------------------------------------------
insert into shop_category values (20700, 20000, '블라인드·롤스크린');

insert into shop_category values (20701, 20700, '블라인드');
insert into shop_category values (20702, 20700, '롤스크린');
insert into shop_category values (20703, 20700, '버티컬');
insert into shop_category values (20704, 20700, '빔스크린');

--------------------------------------------------------------------------------
insert into shop_category values (20800, 20000, '매트');

insert into shop_category values (20801, 20800, '주방·다용도매트');
insert into shop_category values (20802, 20800, 'PVC·리빙매트');
insert into shop_category values (20803, 20800, '놀이·안전매트');
insert into shop_category values (20804, 20800, '현관·발매트');
insert into shop_category values (20805, 20800, '피크닉매트');

--------------------------------------------------------------------------------
insert into shop_category values (20900, 20000, '쿠션·방석');

insert into shop_category values (20901, 20900, '쿠션');
insert into shop_category values (20902, 20900, '방석·대방석');
insert into shop_category values (20903, 20900, '쿠션·방석솜');

--------------------------------------------------------------------------------
insert into shop_category values (21000, 20000, '소파·생활커버');

insert into shop_category values (21001, 21000, '소파커버');
insert into shop_category values (21002, 21000, '소파패드');
insert into shop_category values (21003, 21000, '선풍기커버');
insert into shop_category values (21004, 21000, '에어컨·제습기커버');
insert into shop_category values (21005, 21000, '의자커버');
insert into shop_category values (21006, 21000, '기타커버');



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
insert into shop_category values (30000, null, '데코·식물');

--------------------------------------------------------------------------------
insert into shop_category values (30100, 30000, '디퓨저·캔들');

insert into shop_category values (30101, 30100, '디퓨져');
insert into shop_category values (30102, 30100, '캔들');
insert into shop_category values (30103, 30100, '캔들홀더·워머');
insert into shop_category values (30104, 30100, '인센스·홀더');
insert into shop_category values (30105, 30100, '홈퍼퓸·사쉐');
insert into shop_category values (30106, 30100, '아로마오일·워머');
insert into shop_category values (30107, 30100, '석고방향제');
insert into shop_category values (30108, 30100, '기타액세서리');

insert into shop_category values (30109, 30101, '디퓨져');
insert into shop_category values (30110, 30101, '리필액·리드스틱');
insert into shop_category values (30111, 30102, '오브제캔들');
insert into shop_category values (30112, 30102, '캔들');
insert into shop_category values (30113, 30102, '티라이트');
insert into shop_category values (30114, 30103, '캔들홀더');
insert into shop_category values (30115, 30103, '캔들워머');
insert into shop_category values (30116, 30104, '인센스·팔로산토');
insert into shop_category values (30117, 30104, '인센스홀더·트레이');

--------------------------------------------------------------------------------
insert into shop_category values (30200, 30000, '플라워·식물');

insert into shop_category values (30201, 30200, '식물');
insert into shop_category values (30202, 30200, '조화');
insert into shop_category values (30203, 30200, '생화');
insert into shop_category values (30204, 30200, '드라이플라워');
insert into shop_category values (30205, 30200, '꽃다발·플라워박스');
insert into shop_category values (30206, 30200, '화병·화분');
insert into shop_category values (30207, 30200, '리스·가랜드');
insert into shop_category values (30208, 30200, '부케·화관·웨딩');
insert into shop_category values (30209, 30200, '가드닝용품');

insert into shop_category values (30210, 30201, '수경재배식물');
insert into shop_category values (30211, 30201, '다육식물');
insert into shop_category values (30212, 30201, '중대형식물');
insert into shop_category values (30213, 30201, '소형식물');
insert into shop_category values (30214, 30201, '선인장');
insert into shop_category values (30215, 30201, '행잉식물');
insert into shop_category values (30216, 30201, '난·분재');
insert into shop_category values (30217, 30201, '모종');
insert into shop_category values (30218, 30201, '씨앗·구근');
insert into shop_category values (30219, 30202, '조화꽃');
insert into shop_category values (30220, 30202, '조화가지');
insert into shop_category values (30221, 30202, '조화·화병세트');
insert into shop_category values (30222, 30202, '조화식물');
insert into shop_category values (30223, 30202, '조화행잉플랜트');
insert into shop_category values (30224, 30202, '조화꽃바구니');
insert into shop_category values (30225, 30202, '조화꽃다발');
insert into shop_category values (30226, 30203, '절화');
insert into shop_category values (30227, 30203, '꽃다발');
insert into shop_category values (30228, 30205, '꽃다발');
insert into shop_category values (30229, 30205, '꽃바구니');
insert into shop_category values (30230, 30205, '플라워박스');
insert into shop_category values (30231, 30206, '화병');
insert into shop_category values (30232, 30206, '화분');
insert into shop_category values (30233, 30206, '화분받침대');
insert into shop_category values (30234, 30209, '원예도구');
insert into shop_category values (30235, 30209, '흙·비료·자갈');
insert into shop_category values (30236, 30209, '식물재배기');
insert into shop_category values (30237, 30209, '식물생장등');

--------------------------------------------------------------------------------
insert into shop_category values (30300, 30000, '홈갤러리');

insert into shop_category values (30301, 30300, '패브릭포스터');
insert into shop_category values (30302, 30300, '그림·사진');
insert into shop_category values (30303, 30300, '액자');
insert into shop_category values (30304, 30300, '판화 에디션');

insert into shop_category values (30305, 30301, '일러스트·드로잉');
insert into shop_category values (30306, 30301, '명화');
insert into shop_category values (30307, 30301, '식물·꽃');
insert into shop_category values (30308, 30301, '풍경·자연');
insert into shop_category values (30309, 30301, '패턴');
insert into shop_category values (30310, 30301, '레터링');
insert into shop_category values (30311, 30301, '주문제작');
insert into shop_category values (30312, 30302, '일러스트·드로잉');
insert into shop_category values (30313, 30302, '추상화');
insert into shop_category values (30314, 30302, '명화');
insert into shop_category values (30315, 30302, '풍경·자연');
insert into shop_category values (30316, 30302, '식물·꽃');
insert into shop_category values (30317, 30302, '패턴');
insert into shop_category values (30318, 30302, '레터링');
insert into shop_category values (30319, 30302, '팝아트·빈티지');
insert into shop_category values (30320, 30302, '주문제작');

--------------------------------------------------------------------------------
insert into shop_category values (30400, 30000, '인테리어소품');

insert into shop_category values (30401, 30400, '트레이·보석함');
insert into shop_category values (30402, 30400, '모빌·가랜드');
insert into shop_category values (30403, 30400, '장식소품');
insert into shop_category values (30404, 30400, '마그넷·도어벨');
insert into shop_category values (30405, 30400, '워터볼');
insert into shop_category values (30406, 30400, '오르골');
insert into shop_category values (30407, 30400, '도어사인');
insert into shop_category values (30408, 30400, '피규어·프라모델');
insert into shop_category values (30409, 30400, '기타장식용품');
insert into shop_category values (30410, 30400, '인테리어 분수');

--------------------------------------------------------------------------------
insert into shop_category values (30500, 30000, '시계');

insert into shop_category values (30501, 30500, '벽시계');
insert into shop_category values (30502, 30500, '알람·탁상시계');
insert into shop_category values (30503, 30500, '욕실방수시계');
insert into shop_category values (30504, 30500, '타이머·스탑워치');

--------------------------------------------------------------------------------
insert into shop_category values (30600, 30000, '월데코·장식');

insert into shop_category values (30601, 30600, '데코스티커');
insert into shop_category values (30602, 30600, '마크라메');
insert into shop_category values (30603, 30600, '드림·썬캐쳐');
insert into shop_category values (30604, 30600, '기타');

insert into shop_category values (30605, 30601, '레터링·메시지');
insert into shop_category values (30606, 30601, '도어·스위치');
insert into shop_category values (30607, 30601, '입체');
insert into shop_category values (30608, 30601, '식물·꽃');
insert into shop_category values (30609, 30601, '사물·동물');
insert into shop_category values (30610, 30601, '패턴');
insert into shop_category values (30611, 30601, '키재기');

--------------------------------------------------------------------------------
insert into shop_category values (30700, 30000, '데스크·디자인문구');

insert into shop_category values (30701, 30700, '디자인문구');
insert into shop_category values (30702, 30700, '데스크테리어');
insert into shop_category values (30703, 30700, '기타디자인용품');

insert into shop_category values (30704, 30701, '달력');
insert into shop_category values (30705, 30701, '다이어리·플래너');
insert into shop_category values (30706, 30701, '노트·메모지');
insert into shop_category values (30707, 30701, '마스킹테이프');
insert into shop_category values (30708, 30701, '스티커');
insert into shop_category values (30709, 30701, '카드·포스터');
insert into shop_category values (30710, 30701, '포토앨범');
insert into shop_category values (30711, 30701, '학용품·미술도구');
insert into shop_category values (30712, 30701, '복사용지·지류');
insert into shop_category values (30713, 30702, '타공판·보드');
insert into shop_category values (30714, 30702, '모니터받침대');
insert into shop_category values (30715, 30702, '데스크매트·마우스패드');
insert into shop_category values (30716, 30702, '데스크수납·정리');
insert into shop_category values (30717, 30702, '모니터암·거치대');
insert into shop_category values (30718, 30703, '파우치·지갑');
insert into shop_category values (30719, 30703, '에코백');
insert into shop_category values (30720, 30703, '기타디자인용품');



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
insert into shop_category values (40000, null, '조명');

--------------------------------------------------------------------------------
insert into shop_category values (40100, 40000, '천장등');

insert into shop_category values (40101, 40100, '직부조명');
insert into shop_category values (40102, 40100, '펜던트조명');
insert into shop_category values (40103, 40100, '센서등');
insert into shop_category values (40104, 40100, '레일조명');
insert into shop_category values (40105, 40100, '매입등');
insert into shop_category values (40106, 40100, '샹들리에');
insert into shop_category values (40107, 40100, '키즈조명');
insert into shop_category values (40108, 40100, '실링팬');

--------------------------------------------------------------------------------
insert into shop_category values (40200, 40000, '장스탠드');

--------------------------------------------------------------------------------
insert into shop_category values (40300, 40000, '단스탠드');

--------------------------------------------------------------------------------
insert into shop_category values (40400, 40000, '무드등·장식조명');

insert into shop_category values (40401, 40400, '무드등·수유등');
insert into shop_category values (40402, 40400, '줄조명');
insert into shop_category values (40403, 40400, '컬러·네온조명');
insert into shop_category values (40404, 40400, '간접조명');
insert into shop_category values (40405, 40400, '센서무드등');

--------------------------------------------------------------------------------
insert into shop_category values (40500, 40000, 'LED등');

insert into shop_category values (40501, 40500, 'LED거실등');
insert into shop_category values (40502, 40500, 'LED방등');
insert into shop_category values (40503, 40500, 'LED주방등');
insert into shop_category values (40504, 40500, 'LED욕실등');
insert into shop_category values (40505, 40500, 'LED현관·베란다등');
insert into shop_category values (40506, 40500, '평형별세트');

--------------------------------------------------------------------------------
insert into shop_category values (40600, 40000, '데스크스탠드');

--------------------------------------------------------------------------------
insert into shop_category values (40700, 40000, '벽조명');

--------------------------------------------------------------------------------
insert into shop_category values (40800, 40000, '센서등');

insert into shop_category values (40801, 40800, '직부형센서등');
insert into shop_category values (40802, 40800, '부착형센서등');

--------------------------------------------------------------------------------
insert into shop_category values (40900, 40000, '형광등·조명부속품');

insert into shop_category values (40901, 40900, '전구·형광등');
insert into shop_category values (40902, 40900, '스위치·콘센트·부속품');
insert into shop_category values (40903, 40900, '후렌치·소켓·기타부속품');


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
insert into shop_category values (50000, null, '공구·DIY');

--------------------------------------------------------------------------------
insert into shop_category values (50100, 50000, '공구');

insert into shop_category values (50101, 50100, '공구세트·공구함');
insert into shop_category values (50102, 50100, '전동공구');
insert into shop_category values (50103, 50100, '나사·못');
insert into shop_category values (50104, 50100, '경첩·꺽쇠');
insert into shop_category values (50105, 50100, '드라이버');
insert into shop_category values (50106, 50100, '망치·스패너');
insert into shop_category values (50107, 50100, '톱·니퍼');
insert into shop_category values (50108, 50100, '사다리');
insert into shop_category values (50109, 50100, '카트');
insert into shop_category values (50110, 50100, '기타공구');
insert into shop_category values (50111, 50102, '전동드릴');
insert into shop_category values (50112, 50102, '전기톱');
insert into shop_category values (50113, 50102, '기타전동공구');

--------------------------------------------------------------------------------
insert into shop_category values (50200, 50000, '전기');

insert into shop_category values (50201, 50200, '멀티탭·전기코드');
insert into shop_category values (50202, 50200, '도어락·인터폰');
insert into shop_category values (50203, 50200, '스위치·콘센트');

--------------------------------------------------------------------------------
insert into shop_category values (50300, 50000, '건전지·배터리');

--------------------------------------------------------------------------------
insert into shop_category values (50400, 50000, '수도');

insert into shop_category values (50401, 50400, '양변기');
insert into shop_category values (50402, 50400, '세면대');
insert into shop_category values (50403, 50400, '주방수전');
insert into shop_category values (50404, 50400, '욕실샤워수전');
insert into shop_category values (50405, 50400, '수도꼭지필터');

--------------------------------------------------------------------------------
insert into shop_category values (50500, 50000, '벽지·시트지');

insert into shop_category values (50501, 50500, '벽지·도배용품');
insert into shop_category values (50502, 50500, '시트지·필름지');

--------------------------------------------------------------------------------
insert into shop_category values (50600, 50000, '바닥재');

insert into shop_category values (50601, 50600, '데코타일');
insert into shop_category values (50602, 50600, '데크·마루타일');
insert into shop_category values (50603, 50600, '타일카페트');
insert into shop_category values (50604, 50600, '롤카페트');
insert into shop_category values (50605, 50600, '코일매트');
insert into shop_category values (50606, 50600, '잔디매트');
insert into shop_category values (50607, 50600, '기타매트');
insert into shop_category values (50608, 50600, '장판');

--------------------------------------------------------------------------------
insert into shop_category values (50700, 50000, '타일·파벽돌');

--------------------------------------------------------------------------------
insert into shop_category values (50800, 50000, '목재');

--------------------------------------------------------------------------------
insert into shop_category values (50900, 50000, '페인트·부자재');

insert into shop_category values (50901, 51000, '페인트');
insert into shop_category values (50902, 51000, '페인트보조제');
insert into shop_category values (50903, 51000, '페인트용품');

--------------------------------------------------------------------------------
insert into shop_category values (51000, 50000, '몰딩·걸레받이');

--------------------------------------------------------------------------------
insert into shop_category values (51100, 50000, '가구부속품');

--------------------------------------------------------------------------------
insert into shop_category values (51200, 50000, '손잡이·방문·유리');

--------------------------------------------------------------------------------
insert into shop_category values (51300, 50000, '접착제·보수용품');

--------------------------------------------------------------------------------
insert into shop_category values (51400, 50000, '안전·방범용품');

insert into shop_category values (51401, 51400, '잠금고정·방범용품');
insert into shop_category values (51402, 51400, '안전가드·안전테이프');
insert into shop_category values (51403, 51400, '소화기·재난용품');

insert into shop_seller values (1, '침대전문가', '침대사세요');


commit;