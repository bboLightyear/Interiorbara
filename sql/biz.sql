CREATE TABLE BIZ_HOME (
	BH_NO number,
	BH_IMG varchar2(300),
	BH_NOTICE varchar2(1000),
	BH_INTRO varchar2(3000),
	BH_NAME varchar2(300),
	BH_LIKE number,
	BH_CONT_CNT number,
	BH_PRO varchar2(50),
	BH_ADDR1 varchar2(200),
	BH_ADDR2 varchar2(300),
	BIZ_IDNO number
);

create sequence biz_home_seq;

insert into biz_home values (biz_home_seq.nextval, 'home_dummy.jpg', '공지: 4/12까지는 맡은 부분 다 끝낼 것', '안녕하세요, 4/5까지를 목표로 두고 만들 겁니다.', '민성김 인테리어', 0, 0, '조명', '경기 안양시 동안구 평촌대로389', '안양 정관장 아레나', biz_home_seq.nextval);
insert into biz_home values (biz_home_seq.nextval, 'home_dummy.jpg', '2222공지공지공지공지2222', '2222안녕하세요, 최선을 다하겠습니다.2222', '2222 인테리어', 0, 0, '도배/페인트', '서울 구로구 시흥대로163길', '주호빌딩 2층 구트', biz_home_seq.nextval);
insert into biz_home values (biz_home_seq.nextval, 'home_dummy.jpg', '3333공지공지공지공지3333', '3333도겸 베텔기우스 커버 좋당3333', '3333 인테리어', 0, 0, '장판/타일', '서울 서대문구 연세로50', '연세대 304 체육관', biz_home_seq.nextval);
insert into biz_home values (biz_home_seq.nextval, 'home_dummy.jpg', '4444공지공지공지공지4444', '4444영케이 렛잇비썸머 너무좋다4444', '4444 인테리어', 0, 0, '주방', '경남 창원시 성산구 원이대로 450', '창원체육관', biz_home_seq.nextval);
insert into biz_home values (biz_home_seq.nextval, 'home_dummy.jpg', '5555공지공지공지공지5555', '5555베텔기우스도 레몬도 한국어로 듣고싶당5555', '5555 인테리어', 0, 0, '욕실', '서울 송파구 올림픽로 25', '잠실실내체육관', biz_home_seq.nextval);

CREATE TABLE BIZ_RV(
	BR_NO number,
	BR_CONTENT varchar2(1000),
	BR_LIKE_CNT number,
	BR_DATE timestamp,
	BR_POINT number,
	BIZ_IDNO number,
	USER_IDNO number
);

create sequence biz_rv_seq;

insert into biz_rv values (biz_rv_seq.nextval, '유튜버 라온 저음이 되게 좋당', 0, systimestamp, 5.0, biz_rv_seq.nextval, 1000);
insert into biz_rv values (biz_rv_seq.nextval, '파묘 또 보고싶어 김고은조아', 0, systimestamp, 4.5, biz_rv_seq.nextval, 2000);
insert into biz_rv values (biz_rv_seq.nextval, '하반기에 퇴마록도 빨리 나왔으면 좋겠당', 0, systimestamp, 4.0, biz_rv_seq.nextval, 3000);
insert into biz_rv values (biz_rv_seq.nextval, '수영장 티켓팅 까먹지 말아야지 이번달엔', 0, systimestamp, 5.0, biz_rv_seq.nextval, 4000);
insert into biz_rv values (biz_rv_seq.nextval, '로또는 안 사지만 로또 됐음 좋겠다 그럼 놀면서 개발할 텐데', 0, systimestamp, 5.0, biz_rv_seq.nextval, 5000);

CREATE TABLE BIZ_RV_IMG (
	BRIMG_NO number,
	BRIMG_OGN varchar2(300),
	BRIMG_CGN varchar2(300),
	BR_NO number
);

create sequence biz_rv_img_seq;

insert into biz_rv_img values(biz_rv_img_seq.nextval, 'orifile.png','chfile.png', biz_rv_img_seq.nextval);
insert into biz_rv_img values(biz_rv_img_seq.nextval, 'orifile.png','chfile.png', biz_rv_img_seq.nextval);
insert into biz_rv_img values(biz_rv_img_seq.nextval, 'orifile.png','chfile.png', biz_rv_img_seq.nextval);
insert into biz_rv_img values(biz_rv_img_seq.nextval, 'orifile.png','chfile.png', biz_rv_img_seq.nextval);
insert into biz_rv_img values(biz_rv_img_seq.nextval, 'orifile.png','chfile.png', biz_rv_img_seq.nextval);

CREATE TABLE BIZ_MGZ (
	BM_NO number,
	BM_TITLE varchar2(100),
	BM_CONTENT varchar2(3000),
	BM_DATE timestamp,
	BM_HIT number,
	USER_IDNO number,
    BM_IMG varchar2(300)
);

create sequence biz_mgz_seq;

insert into biz_mgz values(biz_mgz_seq.nextval, '경기남부 업체별 시공별점 TOP10',
'하늘에 있는 무언가를 바라보고 있으니까, 그건 별이라고 네가 알려 주었어. 마치 그것은 우리들처럼 붙어있어, 그것을 울면서 웃으면서 이어가고 있어. 몇십 번, 몇백 번 서로 부딪쳐서, 몇십 년, 몇백 년 전 옛날의 빛이 별 자신도 잊었을 즈음에 우리들에게 도착해. 우리는 서로 찾아내고, 서로 당기며 같은 하늘을 빛내자고, 둘이 있자고 약속했어. 아득히 먼 끝나지 않는 베텔기우스, 누군가에게 잇는 마법. 우리는 어깨를 나란히 하고 손을 마주잡으며 나가, 힘들 때라고 해도 울지 않겠다고 맹세했잖아. 아득히 먼 끝나지 않는 베텔기우스, 너에게도 보일 거야, 기도가',
'mgz_dummy.png', systimestamp, 0, 1000);
insert into biz_mgz values(biz_mgz_seq.nextval, '2024 S/S 트렌드 <트로피컬 서머 하우스>',
'I know my life can get so crazy but as long as youre right here. None of the gossip, nothing can stop us. I am wanna love you with no fears. We can do this thing together. Close your eyes and take my hand, Cause what we have is something special
Baby let us just take our chance.',
'mgz_dummy.png', systimestamp, 0, 2000);
insert into biz_mgz values(biz_mgz_seq.nextval, '이건 광고입니다. 사주세요',
'비틀비틀 거리다가 떠난 이들의 뒤를 따를 수도 굳이 피를 안 봐도 되는 현실에 감사를, 뒤를 잇는 것이 아닌 그저 잊는 힘을 기른 나는 기를 쓰지 않고 만들어 믿음뿐인 길을. 그리고 지금 나의 비밀을 아는 너는 웃지도 울지도 아리송한 표정을 하고 있군. 검은 줄들의 모양은 다 다르긴 해도 삑소리 나면 우리 모두를 빛으로 비추겠지 eh 난 늪에 빠진 기분이 어떤진 모르겠으나 넌 갈 수 있어 지평선 너머의 미지의 곳으로, 삶이란 흐르는 오케스트라, 우리는 마에스트로 yah',
'mgz_dummy.png', systimestamp, 0, 3000);


CREATE TABLE BIZ_MGZ_IMG (
	BMIMG_NO number,
	BMIMG_OGN varchar2(300),
	BMIMG_CGN varchar2(300),
	BM_NO number
);

create sequence BIZ_MGZ_img_seq;

insert into biz_mgz_img values(biz_mgz_img_seq.nextval, 'orifile.png','chfile.png', biz_mgz_img_seq.nextval);
insert into biz_mgz_img values(biz_mgz_img_seq.nextval, 'orifile.png','chfile.png', biz_mgz_img_seq.nextval);
insert into biz_mgz_img values(biz_mgz_img_seq.nextval, 'orifile.png','chfile.png', biz_mgz_img_seq.nextval);
insert into biz_mgz_img values(biz_mgz_img_seq.nextval, 'orifile.png','chfile.png', biz_mgz_img_seq.nextval);
insert into biz_mgz_img values(biz_mgz_img_seq.nextval, 'orifile.png','chfile.png', biz_mgz_img_seq.nextval);


CREATE TABLE BIZ_ESTI (
	BE_NO number,
	BE_WANTDATE date,
	BE_DATE timestamp,
	BE_CONTENT varchar2(2000),
	BE_TEL varchar2(50),
	BE_ADDR varchar2(200),
	BE_CODE varchar2(30),
	BE_SIZE number,
	BE_TYPE varchar2(30),
	BE_TOTAL_PRICE number,
	BIZ_IDNO number,
	USER_IDNO number,
	BP_NO number
);

insert into biz_esti values(biz_esti_seq.nextval,'2024-04-12', systimestamp,
'견적 내용이 들어가는 파트인데요 그냥 더미데이터니까 하고싶은 말이나 쓰겠습니다 노래 잘하는 사람들이 유튜브로 돈 버는 게 신기하기도 하고 부럽당 부수입 한 달에 월급의 20% 정도 벌 수 있는 일 어디 없을까?',
'010-1111-1111', '경기 안양시 평촌대로389 안양정관장아레나', 'random_number', 33, '프리미엄', 1890000, biz_esti_seq.nextval, 1000, biz_esti_seq.nextval);
insert into biz_esti values(biz_esti_seq.nextval,'2024-04-12', systimestamp,
'선생님께서 세상에 공짜는 없다고 하셨다 / 그러나 공짜는 정말 많다 / 공기 마시는 것 공짜 / 말하는 것 공짜 / 꽃향기 맡는 것 공짜 / 하늘 보는 것 공짜 / 나이 드는 것 공짜 / 바람소리 듣는 것 공짜 / 미소 짓는 것 공짜 / 꿈도 공짜 / 개미 보는 것 공짜',
'010-2222-2222', '경남 창원시 성산구 원이대로 450 창원체육관', 'random_number2', 22, '스탠다드', 560000, biz_esti_seq.nextval, 2000, biz_esti_seq.nextval);
insert into biz_esti values(biz_esti_seq.nextval,'2024-04-26', systimestamp,
'한평생 let it be summer, 눈물마저 얼어버릴 날이 와도 잊지 않게 녹여 버릴 수 있게 계속 간직할게, 오늘의 여름을',
'010-3333-3333', '서울 서대문구 연세로50 연세대학교 체육관', 'random_number3', 50, '프리미엄', 3200000, biz_esti_seq.nextval, 3000, biz_esti_seq.nextval);


CREATE TABLE BIZ_HOME_BMARK (
	BHB_NO number,
	USER_IDNO number,
	BH_NO number
);

create sequence BIZ_HOME_BMARK_seq;

insert into biz_home_bmark values(biz_home_bmark_seq.nextval, 1000, biz_home_bmark_seq.nextval);
insert into biz_home_bmark values(biz_home_bmark_seq.nextval, 2000, biz_home_bmark_seq.nextval);
insert into biz_home_bmark values(biz_home_bmark_seq.nextval, 3000, biz_home_bmark_seq.nextval);

CREATE TABLE BIZ_CASES (
	BC_NO number,
	BC_TITLE varchar2(200),
	BC_CONTENT varchar2(2000),
	BC_THUMB varchar2(300),
	BC_DATE date,
	BC_HIT number,
	BIZ_IDNO number
);

create sequence BIZ_CASES_seq;

insert into biz_cases values(biz_cases_seq.nextval, '1111시공사례입니당1111', '생이란 이 얼마나 허무하고 아름다운가 왜 우린 우리자체로 행복 할수없는가 우린 어디서 와 어디로 가는 중인가 원해 이 모든걸 하나로 아울러주는 답', 'cases_dummy.png', systimestamp, 0, biz_cases_seq.nextval);
insert into biz_cases values(biz_cases_seq.nextval, '2222시공사례입니당2222', '맨날 재고 재서 난 삐뚤하고 싶어 난 미꾸라지처럼 미끄럽고 싶어 싸우긴 싫어도 입 닥치긴 싫어 그래 난 시끄럽게 쥐뿔 없고 싶어 있으려고 그저 가만있기 싫어 있으려고 가만있기 보단 시끄럽게 쥐뿔 없고 싶어 근데 또 재벌이 되고 싶다고', 'cases_dummy.png', systimestamp, 0, biz_cases_seq.nextval);
insert into biz_cases values(biz_cases_seq.nextval, '3333시공사례입니당3333', '늘 새롭지 않아도 괜찮아 나에게 너는 언제나 설렘이야 꿈처럼 포근하게 나를 안아준 떨리는 가슴 가득한 봄이니까', 'cases_dummy.png', systimestamp, 0, biz_cases_seq.nextval);

CREATE TABLE BIZ_CASES_IMG (
	BCIMG_NO number,
	BCIMG_OGN varchar2(300),
	BCIMG_CGN varchar2(300),
	BC_NO number
);

create sequence BIZ_CASES_img_seq;

insert into biz_cases_img values(biz_cases_img_seq.nextval, 'orifile.png','chfile.png', biz_cases_img_seq.nextval);
insert into biz_cases_img values(biz_cases_img_seq.nextval, 'orifile.png','chfile.png', biz_cases_img_seq.nextval);
insert into biz_cases_img values(biz_cases_img_seq.nextval, 'orifile.png','chfile.png', biz_cases_img_seq.nextval);
insert into biz_cases_img values(biz_cases_img_seq.nextval, 'orifile.png','chfile.png', biz_cases_img_seq.nextval);
insert into biz_cases_img values(biz_cases_img_seq.nextval, 'orifile.png','chfile.png', biz_cases_img_seq.nextval);

CREATE TABLE BIZ_RV_LIKE (
	BR_LIKE_NO number,
	USER_IDNO number,
	BR_NO number
);

create sequence BIZ_rv_like_seq;

insert into biz_rv_like values(biz_rv_like_seq.nextval, 1000, biz_rv_like_seq.nextval);
insert into biz_rv_like values(biz_rv_like_seq.nextval, 2000, biz_rv_like_seq.nextval);
insert into biz_rv_like values(biz_rv_like_seq.nextval, 3000, biz_rv_like_seq.nextval);

CREATE TABLE BIZ_PRICE (
	BP_NO number,
	BP_NAME varchar2(100),
	BP_CONTENT varchar2(300),
	BP_PRICE number,
	BP_CATEGORY varchar2(50),
	BP_TYPE varchar2(50),
    BP_IMG varchar2(100),
	BIZ_IDNO number
);


create sequence BIZ_price_seq;


--마루
insert into biz_price values(biz_price_seq.nextval, '[동화자연마루]마루/나투스진 그란데/사하라라이트', '우드앤화이트 인테리어에 어울리는 밝은 라이트 컬러 마루입니다.', 119000, '마루', '프리미엄', '1.png', 1);
insert into biz_price values(biz_price_seq.nextval, '[동화자연마루]마루/나투스진 그란데/이모션 블랑', '스크래치가 나지 않고 찍힘이 강한 따뜻한 색감의 광폭마루입니다.', 99000, '마루', '스탠다드', '2.png', 1);
insert into biz_price values(biz_price_seq.nextval, '[한솔홈데코]마루/sb마루 스톤/그라니텔로 그레이', '차분한 라이트그레이 컬러의 석재 느낌 마루입니다.', 131000, '마루', '프리미엄', '3.png', 2);
insert into biz_price values(biz_price_seq.nextval, '[한솔홈데코]마루/sb스톤/마테라베이지', '깔끔하고 오염이 잘 지워지는 대리석 느낌의 마루입니다.', 75000, '마루', '스탠다드', '4.png', 2);
insert into biz_price values(biz_price_seq.nextval, '[구정마루]마루/프레스티지/오크', '무늬목 특유의 질감과 촉감이 있는 고급 마루입니다.', 178000, '마루', '프리미엄', '5.png', 3);
insert into biz_price values(biz_price_seq.nextval, '[한솔홈데코]마루/sb스톤/무이네화이트', '밝은 색상의 오염이 잘 지워지는 대리석 느낌의 마루입니다.', 75000, '마루', '스탠다드', '6.png', 3);
insert into biz_price values(biz_price_seq.nextval, '[구정마루]마루/강마루/스웨디쉬화이트', '밝고 따뜻한 느낌을 주는 화이트컬러 마루입니다.', 132000, '마루', '프리미엄', '7.png', 4);
insert into biz_price values(biz_price_seq.nextval, '[동화자연마루]마루/나투스진 그란데/콰이엇 웨이브', '밝은 색상의 무늬가 있는 자연마루입니다.', 109000, '마루', '스탠다드', '8.png', 4);
insert into biz_price values(biz_price_seq.nextval, '[구정마루]마루/강마루 텍스쳐/그랜드 스테디', '자연스럽고 따스한 우드색감의 광폭마루입니다.', 141000, '마루', '프리미엄', '9.png', 5);
insert into biz_price values(biz_price_seq.nextval, '[동화자연마루]마루/나투스진 그란데/레이크 그레이', '차분한 느낌의 회색 자연마루입니다.', 109000, '마루', '스탠다드', '10.png', 5);
insert into biz_price values(biz_price_seq.nextval, '[구정마루]마루/강마루/오크 뉴클래식', '노란 기가 적은 원목 느낌의 마루입니다.', 166000, '마루', '프리미엄', '11.png', 6);
insert into biz_price values(biz_price_seq.nextval, '[동화자연마루]마루/나투스진 테라/월넛	', '짙은 월넛 색상의 무늬 있는 자연마루입니다.', 110000, '마루', '스탠다드', '12.png', 6);
insert into biz_price values(biz_price_seq.nextval, '[구정마루]마루/프레스티지/블랙오크', '무게감 있는 검은색의 원목 느낌 마루입니다.', 178000, '마루', '프리미엄', '13.png', 7);
insert into biz_price values(biz_price_seq.nextval, '[동화자연마루]마루/나투스진 그란데/코지 쉐도우', '미드톤의 차분한 자연마루입니다.', 109000, '마루', '스탠다드', '14.png', 7);
insert into biz_price values(biz_price_seq.nextval, '[구정마루]마루/프레스티지/러스틱월넛', '차분하고 고급스러운 느낌의 호두나무색 마루입니다.', 195000, '마루', '프리미엄', '15.png', 8);
insert into biz_price values(biz_price_seq.nextval, '[디앤메종]마루/강마루 Texture2.0/쉐이커그레이', '중간채도의 차분한 우든 그레이 마루입니다.', 124000, '마루', '스탠다드', '16.png', 8);
insert into biz_price values(biz_price_seq.nextval, '[구정마루]마루/헤리티지 오크', '오크나무로 제작된 고급스러운 느낌의 마루입니다.', 294000, '마루', '프리미엄', '17.png', 9);
insert into biz_price values(biz_price_seq.nextval, '[동화자연마루]마루/나투스진 그란데/코지 그레이', '폭이 넓고 차분한 그레이 색상의 마루입니다.', 109000, '마루', '스탠다드', '18.png', 9);
insert into biz_price values(biz_price_seq.nextval, '[구정마루]마루/강마루/허니티크', '짙은 색상의 허니티크로 제작된 강마루입니다.', 166000, '마루', '프리미엄', '19.png', 10);
insert into biz_price values(biz_price_seq.nextval, '[동화자연마루]마루/나투스진 그란데/플레인 그레이', '어둡지 않고 따뜻한 느낌을 주는 밝은 그레이 색상의 자연마루입니다.', 109000, '마루', '스탠다드', '20.png', 10);
insert into biz_price values(biz_price_seq.nextval, '[올고다]마루/Roca/루나 그레이', '강하고 튼튼해서 흠집이 잘 나지 않는 밝은 색상의 마루입니다.', 132000, '마루', '프리미엄', '21.png', 11);
insert into biz_price values(biz_price_seq.nextval, '[동화자연마루]마루/나투스진 그란데/화이트 트라버틴', '노란 기가 적고 화사한 색상의 결감이 느껴지는 마루입니다.', 109000, '마루', '스탠다드', '22.png', 11);
insert into biz_price values(biz_price_seq.nextval, '[LX]마루/강그린/페블라이트', '톱밥을 갈아 만든 제품과 달리 습기에 강하고 튼튼한 마루입니다.', 167000, '마루', '프리미엄', '23.png', 12);
insert into biz_price values(biz_price_seq.nextval, '[동화자연마루]마루/나투스진 그란데/솔트베이지', '차분하면서도 밝은 저채도 베이지 색상의 마루입니다.', 109000, '마루', '스탠다드', '24.png', 12);
insert into biz_price values(biz_price_seq.nextval, '[한솔홈데코]마루/sb스톤/버블화이트', '고급스러운 무늬가 들어간 석재 느낌의 화이트 마루입니다.', 75000, '마루', '프리미엄', '25.png', 13);
insert into biz_price values(biz_price_seq.nextval, '[구정마루]마루/노블래스/소프트애쉬', '목재 결을 살린 자연 우든컬러의 고급 마루입니다.', 296000, '마루', '스탠다드', '26.png', 13);
insert into biz_price values(biz_price_seq.nextval, '[디앤메종]마루/텍스쳐/오크브러쉬', '나무의 텍스쳐를 강조하여 개별 목재의 명도 대조를 살린 오크 마루입니다.', 133000, '마루', '프리미엄', '27.png', 14);
insert into biz_price values(biz_price_seq.nextval, '[동화자연마루]마루/듀오/화이트 오크', '나뭇결이 느껴지는 밝은 톤의 오크나무 자연마루입니다.', 115000, '마루', '스탠다드', '28.png', 14);
insert into biz_price values(biz_price_seq.nextval, '[구정마루]마루/강마루/오크뉴클래식', '디테일한 우든텍스처를 재현한 강마루 타입의 우든 마루입니다.', 132000, '마루', '프리미엄', '29.png', 15);
insert into biz_price values(biz_price_seq.nextval, '[동화자연마루]마루/나투스진 그란데/비안코화이트', '화이트톤 인테리어와 잘 어울리는 밝으면서 저채도의 자연마루입니다.', 109000, '마루', '스탠다드', '30.png', 15);
insert into biz_price values(biz_price_seq.nextval, '[구정마루]마루/프리미엄 텍스쳐/카본 블랙', '밝은 벽과 어울리는 분위기 있는 짙은 톤의 마루입니다.', 138000, '마루', '프리미엄', '31.png', 16);
insert into biz_price values(biz_price_seq.nextval, '[동화자연마루]마루/나투스진/퓨어 시에나', '어떤 색상의 인테리어와도 잘 어울리는 나뭇결의 형태를 담은 마루입니다.', 108000, '마루', '스탠다드', '32.png', 16);
insert into biz_price values(biz_price_seq.nextval, '[구정마루]마루/프라하브러쉬골드/티크러스틱', '헤링본 배열과 잘 어울리는 다크한 우드톤의 마루입니다.', 188000, '마루', '프리미엄', '33.png', 17);
insert into biz_price values(biz_price_seq.nextval, '[LX]마루/강그린와이드+사각 4c/트라버틴베이지', '베이지-아이보리 톤의 인테리어와 어울리는 밝은 색상의 마루입니다.', 153000, '마루', '스탠다드', '34.png', 17);
insert into biz_price values(biz_price_seq.nextval, '[구정마루]마루/헤리티지/다크 월넛', '나무로 세밀하게 짜맞춘 헤리티지 클래스의 다크톤 월넛 마루입니다.', 339000, '마루', '프리미엄', '35.png', 18);
insert into biz_price values(biz_price_seq.nextval, '[동화자연마루]마루/클릭/하임 워시 오크', '깔끔하고 깨끗한 느낌의 밝은 아이보리 색상의 오크 마루입니다.', 85000, '마루', '스탠다드', '36.png', 18);
insert into biz_price values(biz_price_seq.nextval, '[구정마루]마루/강마루/아이보리 화이트', '모던함과 내추럴함을 살린 라이트톤 인테리어에 어울리는 밝은 강마루입니다.', 132000, '마루', '프리미엄', '37.png', 19);
insert into biz_price values(biz_price_seq.nextval, '[한솔홈데코]마루/sb스톤/사멧그레이', '무채색 인테리어에 어울리는 색상의 정사각 플레인 아이보리 마루입니다.', 75000, '마루', '스탠다드', '38.png', 19);
insert into biz_price values(biz_price_seq.nextval, '[디앤메종]마루/다크윈체스터', '모던함과 내추럴함을 살린 다크톤 인테리어에 어울리는 유든마루입니다.', 164000, '마루', '프리미엄', '39.png', 20);
insert into biz_price values(biz_price_seq.nextval, '[한솔홈데코]마루/SB마루 헤링본/다크오크', '나뭇결 느낌을 살린 부드럽고 따뜻한 다크톤의 마루입니다.', 112000, '마루', '스탠다드', '40.png', 20);

--도배/페인트
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/지아 패브릭/페인팅 화이트/T1059-01', '따뜻한 톤과 차가운 톤의 인테리어에 모두 어울리는 페인팅 느낌의 벽지입니다.', 54000, '도배/페인트', '프리미엄', '41.png', 1);
insert into biz_price values(biz_price_seq.nextval, '[개나리벽지]벽지/아트북/화이트/57160-1', '차갑지 않은 크림톤의 페인트 느낌이 아는 벽지입니다.', 36000, '도배/페인트', '스탠다드', '42.png', 1);
insert into biz_price values(biz_price_seq.nextval, '[개나리벽지]벽지/로하스/화이트/54160-1', '화이트모던 인테리어에 어울리는 깔끔한 화이트톤의 텍스쳐 벽지입니다.', 44000, '도배/페인트', '프리미엄', '43.png', 2);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/테라피/새하얀 화이트/7090-01', '퓨어화이트톤의 깔끔한 벽지입니다.', 37000, '도배/페인트', '스탠다드', '44.png', 2);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/디아망/모던회벽 화이트/PR028-01', '차가운 톤과 따뜻한 톤의 화이트 인테리어 모두에 어울리는 회벽느낌의 모던한 벽지입니다.', 73000, '도배/페인트', '프리미엄', '45.png', 3);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/베스띠/내추럴 페인팅 화이트/82483-01', '페인팅 텍스처의 깔끔한 딥화이트 톤의 벽지입니다.', 42000, '도배/페인트', '스탠다드', '46.png', 3);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/방염 테라피/슈가 화이트/F8190-01', '방염 처리된 슈가 화이트 색상의 따뜻한 흰색 벽지입니다.', 75000, '도배/페인트', '프리미엄', '47.png', 4);
insert into biz_price values(biz_price_seq.nextval, '[신한벽지]벽지/스케치/조용한사색 화이트/15053-1', '집안에 조용한 분위기를 더해줄 화이트 색상의 질감이 살아있는 벽지입니다.', 36000, '도배/페인트', '스탠다드', '48.png', 4);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/디아망/회벽 화이트/PR002-01', '은은한 펄감으로 고급스러운 재질의 오염에 강한 회벽 화이트 벽지입니다.', 73000, '도배/페인트', '프리미엄', '49.png', 5);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/테라피/슈가 화이트/8190-1', '깨끗한 슈가 화이트 색상의 텍스처를 살린 벽지입니다.', 37000, '도배/페인트', '스탠다드', '50.png', 5);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/베스띠/리얼 페인팅 화이트/82458-01', '페인팅의 불규칙한 질감을 살린 두터운 리얼페인팅 벽지입니다.', 46000, '도배/페인트', '프리미엄', '51.png', 6);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/테라피/테라피 펄슈가/H8190-01', '펄감이 살아있는 고급스러운 화이트톤 펄슈가 벽지입니다.', 37000, '도배/페인트', '스탠다드', '52.png', 6);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/방염 테라피/슈가/F8190-01', '방염 처리된 슈가 색상의 슈가 색상의 라이트톤 벽지입니다.', 75000, '도배/페인트', '프리미엄', '53.png', 7);
insert into biz_price values(biz_price_seq.nextval, '[개나리벽지]벽지/에비뉴/화이트/77282-1', '어디에나 잘 어울리는 세밀한 텍스처의 화이트 벽지입니다.', 40000, '도배/페인트', '스탠다드', '54.png', 7);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/테라피/완전한 화이트/7053-01', '퍼펙트 화이트톤의 색상을 타지않는 깨끗한 색감의 벽지입니다.', 75000, '도배/페인트', '프리미엄', '55.png', 8);
insert into biz_price values(biz_price_seq.nextval, '[신한벽지]벽지/리빙/던/70227-2', '따뜻한 톤의 크림 화이트 색 리빙공간과 어울리는 벽지입니다.', 41000, '도배/페인트', '스탠다드', '56.png', 8);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/베스띠/테라코타 화이트/82526-01', '구워 만든 도기 질감의 화이트톤 벽지입니다.', 46000, '도배/페인트', '프리미엄', '57.png', 9);
insert into biz_price values(biz_price_seq.nextval, '[개나리벽지]벽지/에비뉴/화이트/77281-1', '천장 시공에 적합한 세밀한 텍스처의 화이트 벽지입니다.', 40000, '도배/페인트', '스탠다드', '58.png', 9);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/베스띠/마카롱 화이트/7071-1', '따뜻한 크림 아이보리 색상의 소프트톤 벽지입니다.', 46000, '도배/페인트', '프리미엄', '59.png', 10);
insert into biz_price values(biz_price_seq.nextval, '[신한벽지]벽지/리빙/던/70227-1', '도장 없이도 페인트 느낌을 낼 수 있는 깔끔한 화이트톤 벽지입니다.', 41000, '도배/페인트', '스탠다드', '60.png', 10);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/베스띠/회벽페인팅 화이트/82390-01', '거친 회벽 질감의 밝은 페인팅 화이트톤 벽지입니다.', 46000, '도배/페인트', '프리미엄', '61.png', 11);
insert into biz_price values(biz_price_seq.nextval, '[개나리벽지]벽지/아트북/화이트/57144-1', '내구성이 강한 깔끔한 화이트 톤 텍스처 벽지입니다.', 36000, '도배/페인트', '스탠다드', '62.png', 11);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/베스띠/빈티지회벽 화이트/82476-01', '빈티지한 붓터치의 거친 회벽 질감을 내는 밝은 페인팅 화이트톤 벽지입니다.', 46000, '도배/페인트', '프리미엄', '63.png', 12);
insert into biz_price values(biz_price_seq.nextval, '[개나리벽지]벽지/아트북/심플화이트/57190-1', '질감처리 없이 심플한 느낌을 주는 화이트톤 벽지입니다.', 36000, '도배/페인트', '스탠다드', '64.png', 12);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/베스띠/리얼 페인팅 화이트/82458-1', '리얼 페인팅 텍스처를 살린 따뜻한 화이트 질감의 벽지입니다.', 46000, '도배/페인트', '프리미엄', '65.png', 13);
insert into biz_price values(biz_price_seq.nextval, '[개나리벽지]벽지/로하스/화이트/87423-1', '차가운 톤의 세밀한 텍스처 화이트 벽지입니다.', 40000, '도배/페인트', '스탠다드', '66.png', 13);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/베스띠/위빙 코튼 화이트/82508-01', '실로 단단히 엮은 질감을 주는 크림색 화이트톤 벽지입니다.', 46000, '도배/페인트', '프리미엄', '67.png', 14);
insert into biz_price values(biz_price_seq.nextval, '[개나리벽지]벽지/아트북/화이트/54150-1', '모던하고 클래식한 따뜻한 느낌의 화이트톤 벽지입니다.', 36000, '도배/페인트', '스탠다드', '68.png', 14);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/베스띠/마일드울 화이트/82479-01', '따뜻한 톤과 차가운 톤의 인테리어에 모두 어울리는 천 느낌의 벽지입니다.', 46000, '도배/페인트', '프리미엄', '69.png', 15);
insert into biz_price values(biz_price_seq.nextval, '[신한벽지]벽지/스케치/고즈넉한 저녁/15085-1', '저녁처럼 잔잔한 화이트 톤의 차분한 벽지입니다.', 36000, '도배/페인트', '스탠다드', '70.png', 15);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/베스띠/매트 페인팅화이트/82516-01	', '실제 페인팅한 질감을 주는 매트한 느낌의 벽지입니다.', 46000, '도배/페인트', '프리미엄', '71.png', 16);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/테라피/심플리 화이트/7097-01', '심플하게 흰색을 이용한 소프트 텍스처 벽지입니다.', 37000, '도배/페인트', '스탠다드', '72.png', 16);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/베스띠/테라코타 라이트 샌드/82526-06', '구워 만든 도기 질감의 모래색 벽지입니다.', 46000, '도배/페인트', '프리미엄', '73.png', 17);
insert into biz_price values(biz_price_seq.nextval, '[신한벽지]벽지/스케치/조용한 사색/15053-1', '밝은 조명과 어두운 조명에 모두 잘 어울리는 차분한 톤의 화이트 벽지입니다.', 36000, '도배/페인트', '스탠다드', '74.png', 17);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/디아망/모던페인팅 화이트/PR027-01', '모던한 인테리어에 어울리는 미세질감 화이트톤 고급형 벽지입니다.', 73000, '도배/페인트', '프리미엄', '75.png', 18);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/지아 패브릭/샌드팝 화이트/502-01', '모래가 섞인 불규칙한 페인팅 질감의 따뜻한 화이트톤 벽지입니다.', 49000, '도배/페인트', '스탠다드', '76.png', 18);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/지아 패브릭/페인팅 아이보리/T1059-11', '화이트보다 따뜻한 아이보리 색감의 페인팅 텍스처 벽지입니다.', 54000, '도배/페인트', '프리미엄', '77.png', 19);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/베스띠/펄스톤 화이트/82125-1', '은은하게 펄이 들어간 고급스러운 화이트톤 벽지입니다.', 42000, '도배/페인트', '스탠다드', '78.png', 19);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/지아 패브릭/매트페인팅 매트화이트/T1085-01', '실제 매트하게 페인팅한 질감을 주는 트루 화이트톤 벽지입니다.', 54000, '도배/페인트', '프리미엄', '79.png', 20);
insert into biz_price values(biz_price_seq.nextval, '[LX]벽지/베스띠/뽀송니트 화이트/82512-01', '실로 성글게 엮은 질감을 주는 크림색 화이트톤 벽지입니다.', 42000, '도배/페인트', '스탠다드', '80.png', 20);

--장판/타일
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/엑스컴포트/텐더 그레이', '두텁고 폭신한 질감의 복원력이 우수한 타일 프린팅 그레이색상 장판입니다.', 127000, '장판/타일', '프리미엄', '81.png', 1);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/지아자연애/소프트 콘크리트', '부드러운 질감의 눌림 현상 적은 소프트 콘크리트 프린팅 장판입니다.', 51000, '장판/타일', '스탠다드', '82.png', 1);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/엑스컴포트/스탠다드 베인', '두텁고 폭신한 질감의 복원력이 우수한 석재 타일 프린팅의 장판입니다.', 127000, '장판/타일', '프리미엄', '83.png', 2);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/지아자연애/베이지 포세린', '부드러운 질감의 눌림 현상 적은 포세린 타일 프린팅 장판입니다.', 51000, '장판/타일', '스탠다드', '84.png', 2);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/엑스컴포트/인피니티오크-스노우화이트', '두텁고 폭신한 질감의 복원력이 우수한 오크나무 마루 프린팅의 백색 장판입니다.', 127000, '장판/타일', '프리미엄', '85.png', 3);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/지아자연애/클래식오크', '부드러운 질감의 눌림 현상 적은 클래식 오크 우든마루 프린팅 장판입니다.', 51000, '장판/타일', '스탠다드', '86.png', 3);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/지아사랑애 3.2/오닉스', '편안한 촉감의 복원력이 우수한 오닉스 타일 프린팅 장판입니다.', 93000, '장판/타일', '프리미엄', '87.png', 4);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/지아자연애/콘크리트 라이트', '부드러운 질감의 눌림 현상 적은 미드톤 콘크리트 프린팅 장판입니다.', 51000, '장판/타일', '스탠다드', '88.png', 4);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/지아사랑애 2.7/오크 브라운', '편안한 촉감의 복원력이 우수한 브라운컬러 오크나무 마루 프린팅 장판입니다.', 81000, '장판/타일', '프리미엄', '89.png', 5);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/지아자연애 스페셜/화이트 마블', '부드러운 질감의 눌림 현상 적은 화이트 대리석 프린팅 장판입니다.', 51000, '장판/타일', '스탠다드', '90.png', 5);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/강그린 수퍼/브러쉬드 모카', '고풍스러운 느낌을 주는 두껍고 강한 탄성의 모카컬러 우든마루 프린팅 장판입니다.', 134000, '장판/타일', '프리미엄', '91.png', 6);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/지아사랑애/틴티드 애쉬/그레이', '편안한 촉감의 복원력이 우수한 밝은 애쉬그레이컬러 우든마루 프린팅 장판입니다.', 85000, '장판/타일', '스탠다드', '92.png', 6);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/엑스컴포트/헤리티지오크/앰버 브라운', '두텁고 폭신한 질감의 복원력이 우수한 브라운컬러 오크/앰버 우든마루 프린팅 장판입니다.', 127000, '장판/타일', '프리미엄', '93.png', 7);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/지아자연애/미스티 오크', '부드러운 질감의 눌림 현상 적은 라이트톤 오크나무 마루 프린팅 장판입니다.', 51000, '장판/타일', '스탠다드', '94.png', 7);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/엑스컴포트/헤리티지오크/애쉬 베이지', '두텁고 폭신한 질감의 복원력이 우수한 베이지 컬러 오크 우든마루 프린팅 장판입니다.', 127000, '장판/타일', '프리미엄', '95.png', 8);
insert into biz_price values(biz_price_seq.nextval, '[LX]장판/지아소리잠 4.5/빈티지오크', '강한 탄성과 실제 우든 패턴을 자연스럽게 구현한 빈티지 오크 우든마루 프린팅 장판입니다.', 102000, '장판/타일', '스탠다드', '96.png', 8);
insert into biz_price values(biz_price_seq.nextval, '[윤현상재]타일/600*600mm/이모션 화이트', '거칠지 않은 무광으로 벽면 사용성이 좋은 무거운 느낌의 화이트컬러 스테디셀러 타일입니다.', 108000, '장판/타일', '프리미엄', '97.png', 9);
insert into biz_price values(biz_price_seq.nextval, '[LX]타일/스타일/화이트 베실리우스', '고급스러운 그레이 컬러 대리석 패턴이 들어간 밝은 화이트톤의 타일입니다.', 63000, '장판/타일', '스탠다드', '98.png', 9);
insert into biz_price values(biz_price_seq.nextval, '[윤현상재]타일/600*600mm/이모션 라이트 그레이', '거칠지 않은 무광으로 벽면 사용성이 좋은 무거운 느낌의 라이트그레이컬러 스테디셀러 타일입니다.', 108000, '장판/타일', '프리미엄', '99.png', 10);
insert into biz_price values(biz_price_seq.nextval, '[하우스톤] 타일/테라코타', '테라코타 벽돌 컬러로 쌓아 직조한 느낌의 타일입니다.', 70000, '장판/타일', '스탠다드', '100.png', 10);
insert into biz_price values(biz_price_seq.nextval, '[HY]타일/600*600mm/ZH6950', '고급스러운 라이트그레이톤의 정사각 석재 타일입니다.', 165000, '장판/타일', '프리미엄', '101.png', 11);
insert into biz_price values(biz_price_seq.nextval, '[토도]타일/600*600mm/테라조', '오염에 강한 플레인 디자인의 잔잔한 테라조 쉐잎 타일입니다.', 108000, '장판/타일', '스탠다드', '102.png', 11);
insert into biz_price values(biz_price_seq.nextval, '[어반테고]타일/테라조 타일/마시멜로우', '불규칙한 테라조 패턴으로 청소가 쉬운 욕실 맞춤형 아이보리컬러 타일입니다.', 117000, '장판/타일', '프리미엄', '103.png', 12);
insert into biz_price values(biz_price_seq.nextval, '[웜세라믹]타일/대리석 바닥타일/비앙코카라라 유,무광', '청소가 편하고 공간을 환하게 만들어주는 대리석 소재 바닥타일입니다.', 110000, '장판/타일', '스탠다드', '104.png', 12);
insert into biz_price values(biz_price_seq.nextval, '[윤현상재]타일/GATSBY/WHITE', '고풍스러운 앤틱 부조가 새겨진 다양한 패턴으로 디자인 포인트를 주기 좋은 타일입니다.', 226000, '장판/타일', '프리미엄', '105.png', 13);
insert into biz_price values(biz_price_seq.nextval, '[승원바스]타일/600*600mm/ZF6622', '어디에나 어울리는 심플한 모던 화이트 타일입니다.', 83000, '장판/타일', '스탠다드', '106.png', 13);
insert into biz_price values(biz_price_seq.nextval, '[대제타일]타일/250*250mm/콘페티 토리노', '콘페티 토리노 패턴의 포인트가 있는 이태리제 수입 타일입니다.', 163000, '장판/타일', '프리미엄', '107.png', 14);
insert into biz_price values(biz_price_seq.nextval, '[토도]타일/600x600/캔디화이트', '큼지막한 테라조 조형의 세라믹 타일입니다.', 115000, '장판/타일', '스탠다드', '108.png', 14);
insert into biz_price values(biz_price_seq.nextval, '[윤현상재]타일/포세린 타일/SS45901', '따뜻한 그레이 컬러감의 석재 무광 포세린 타일입니다.', 141000, '장판/타일', '프리미엄', '109.png', 15);
insert into biz_price values(biz_price_seq.nextval, '[프로방스홈]타일/450x450mm/무광 비앙코카라라', '은은한 그레이컬러의 대리석 느낌 패턴이 들어간 무광 석재 타일입니다.', 86000, '장판/타일', '스탠다드', '110.png', 15);
insert into biz_price values(biz_price_seq.nextval, '[몬스터타일]타일/헤링본/비앙코', '화이트 베이스에 그레이 석재패턴이 들어간 헤링본형식의 타일입니다.', 115000, '장판/타일', '프리미엄', '111.png', 16);
insert into biz_price values(biz_price_seq.nextval, '[시트라인]타일/95*95mm 팔각/화이트+골드', '화이트 컬러의 팔각 타일 모서리에 골드 마름모 포인트의 디자인 타일입니다.', 61000, '장판/타일', '스탠다드', '112.png', 16);
insert into biz_price values(biz_price_seq.nextval, '[101do]타일/200x200mm/DT2573	', '각기 다양한 패턴의 미드웜톤 그레이컬러 타일입니다.', 214000, '장판/타일', '프리미엄', '113.png', 17);
insert into biz_price values(biz_price_seq.nextval, '[토도]타일/600x600mm/테라조', '미드톤 그레이에 따뜻한 느낌이 섞인 잔잔한 테라조 방식 세라믹 타일입니다.', 55000, '장판/타일', '스탠다드', '114.png', 17);
insert into biz_price values(biz_price_seq.nextval, '[101do]타일/100x100mm/DT1300	', '색감이 확실하고 패턴이 다양한 북유럽 스타일 타일입니다.', 214000, '장판/타일', '프리미엄', '115.png', 18);
insert into biz_price values(biz_price_seq.nextval, '[윤현상재]타일/포세린 타일/32 122s', '뉴트럴한 색상의 테트리스 디자인 포세린 타일입니다.', 128000, '장판/타일', '스탠다드', '116.png', 18);
insert into biz_price values(biz_price_seq.nextval, '[101do]북유럽 포인트 타일/98x98mm/DT1002', '따뜻하게 바랜 색감의 패턴이 다양한 북유럽 스타일 타일입니다.', 259000, '장판/타일', '프리미엄', '117.png', 19);
insert into biz_price values(biz_price_seq.nextval, '[윤현상재]타일/300*300mm/ANTICHI AMORI CANOSSA', '자연을 닮은 붉은 테라컬러의 이태리제 수입타일입니다.', 142000, '장판/타일', '스탠다드', '118.png', 19);
insert into biz_price values(biz_price_seq.nextval, '[101do]북유럽 포인트 타일/98x98mm/DT1549', '비비드한 색감의 패턴이 다양한 북유럽 스타일 타일입니다.', 259000, '장판/타일', '프리미엄', '119.png', 20);
insert into biz_price values(biz_price_seq.nextval, '[윤현상재]타일/600*600mm/GROZA01', '모던한 골재 칩 패턴 스타일의 베이지톤 스톤룩 타일입니다.', 85000, '장판/타일', '스탠다드', '120.png', 20);

--욕실
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]양변기/C319500A/C437500T 웨이브 S', '화이트컬러의 스퀘어 웨이브 형태 도기 양변기입니다.', 362000, '욕실', '프리미엄', '121.png', 1);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]양변기/C319500A/C427500T 웨이브 R', '화이트컬러의 라운드 웨이브 형태 도기 양변기입니다.', 288000, '욕실', '스탠다드', '122.png', 1);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]세면대/CCASF516 플랫', '모서리가 각진 플랫형 화이트컬러 세면대입니다.', 209000, '욕실', '프리미엄', '123.png', 2);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]세면대/CCASF516 플랫', '모서리가 각진 플랫형 화이트컬러 세면대입니다.', 209000, '욕실', '스탠다드', '124.png', 2);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]양변기/플랫 비데일체형', '비데 일체형의 세미스퀘어 심플 디자인 도기 양변기입니다.', 1138000, '욕실', '프리미엄', '125.png', 3);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]양변기/C209600C 웨이브 S', '상부가 낮고 미니멀한 디자인의 원피스형 도기 양변기입니다.', 511500, '욕실', '스탠다드', '126.png', 3);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]세면대/C151500L 웨이브 R', '청소가 편하고 곡선이 깔끔한 도기 세면대입니다.', 213000, '욕실', '프리미엄', '127.png', 4);
insert into biz_price values(biz_price_seq.nextval, '[쿠세라]세면대/CC-3000', '작은 욕실에 어울리는 세미라운드 형태의 미니멀한 세면대입니다.', 148000, '욕실', '스탠다드', '128.png', 4);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]양변기/C831500 /C365000C 플랫 ROUND', '고급스러운 디자인의 비데 일체형 도기 양변기입니다.', 1157000, '욕실', '프리미엄', '129.png', 5);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]양변기/C209300C BOSTON', '소리가 조용하고 상부가 낮은 미니멀 디자인의 도기 양변기입니다.', 582000, '욕실', '스탠다드', '130.png', 5);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]양변기/C831000E/C360000B 플랫', '플랫한 스퀘어 형태의 독특한 비데 일체형 도기 양변기입니다.', 1267000, '욕실', '프리미엄', '131.png', 6);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]양변기/스탠리 탱크리스', '탱크리스 디자인의 미니멀한 도기 양변기입니다.', 500000, '욕실', '스탠다드', '132.png', 6);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]양변기/C3380', '탱크리스 디자인의 미니멀한 직수형 도기 양변기입니다.', 540000, '욕실', '프리미엄', '133.png', 7);
insert into biz_price values(biz_price_seq.nextval, '[대림]양변기/CC-280', '넉넉한 크기의 화이트컬러 도기 양변기입니다.', 267000, '욕실', '스탠다드', '134.png', 7);
insert into biz_price values(biz_price_seq.nextval, '[한샘]양변기/WB-9500', '곡선과 직선을 모두 살린 디자인의 화이트톤 도기 양변기입니다.', 233000, '욕실', '프리미엄', '135.png', 8);
insert into biz_price values(biz_price_seq.nextval, '[케이앤씨]양변기/KC-350', '심플한 플랫상판의 투피스형 화이트톤 도기 양변기입니다.', 149000, '욕실', '스탠다드', '136.png', 8);
insert into biz_price values(biz_price_seq.nextval, '[한샘]세면대/LH-097HS', '라운드와 스퀘어 중간 형태를 채용한 깊은 도기 양변기입니다.', 249000, '욕실', '프리미엄', '137.png', 9);
insert into biz_price values(biz_price_seq.nextval, '[이누스]세면대/IL-680E', '반원형의 모서리를 살린 깔끔한 도기 세면대입니다.', 95000, '욕실', '스탠다드', '138.png', 9);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]세면대/C151600L 웨이브 S', '모서리가 둥근 사각형 형태의 깊은 웨이브 화이트톤 도기 세면대입니다.', 217000, '욕실', '프리미엄', '139.png', 10);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]세면대/CCASF522 아카시아 E', '라운드 형태의 독특한 화이트톤 디자인 도기 세면대입니다.', 183000, '욕실', '스탠다드', '140.png', 10);
insert into biz_price values(biz_price_seq.nextval, '[이케아]세면대/HAVSEN', '싱크볼 형태의 상판 세미내장형 도자 세면대입니다.', 312000, '욕실', '프리미엄', '141.png', 11);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]세면대/CCAS0440 액티바', '깔끔한 사각형의 상판 내장형 도기 언더볼 세면대입니다.', 179000, '욕실', '스탠다드', '142.png', 11);
insert into biz_price values(biz_price_seq.nextval, '[대림]양변기/CC-724', '탱크가 얇고 낮아 컴팩트한 형태의 심플 도기 양변기입니다.', 276000, '욕실', '프리미엄', '143.png', 12);
insert into biz_price values(biz_price_seq.nextval, '[케이앤씨]양변기/KC-350', '낮고 심플한 형태의 소형 도기 양변기입니다.', 149000, '욕실', '스탠다드', '144.png', 12);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]양변기/C8330/C3390', '탱크리스형 비데 일체 미니멀 화이트 도기 양변기입니다.', 1010000, '욕실', '프리미엄', '145.png', 13);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]양변기/웨이브 R', '상부가 낮고 미니멀한 디자인의 미니탱크형 도기 양변기입니다.', 308000, '욕실', '스탠다드', '146.png', 13);
insert into biz_price values(biz_price_seq.nextval, '[한샘]세면대/PB-161H', '반원형으로 넓어지는 곡선 강조 디자인의 깔끔한 도기 세면대입니다.', 198000, '욕실', '프리미엄', '147.png', 14);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]세면대/C101400L / C101500L 컨셉 큐브 S', '독특한 큐브 디자인 세면대로 비누 받침이 내장되어 있습니다.', 178000, '욕실', '스탠다드', '148.png', 14);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]세면대/CCASF611 THIN EDGE', '모서리가 얇고 내부가 넓은 디자인의 직사각형 도기 세면대입니다.(수전 미포함)', 172000, '욕실', '프리미엄', '149.png', 15);
insert into biz_price values(biz_price_seq.nextval, '[한샘]세면대/PB-231H', '심플한 디자인의 비누받침이 내장되어 있는 화이트톤 도기 세면대입니다.', 152000, '욕실', '스탠다드', '150.png', 15);
insert into biz_price values(biz_price_seq.nextval, '[한샘]세면대/PB-172', '완만한 곡선을 통해 모던하게 디자인한 세미 스퀘어 형태의 세면대입니다.', 220000, '욕실', '프리미엄', '151.png', 16);
insert into biz_price values(biz_price_seq.nextval, '[HS세라믹]세면대/HSL-607', '모서리가 라운딩 처리된 사각형 모양의 와이드 도기 세면대입니다.', 168000, '욕실', '스탠다드', '152.png', 16);
insert into biz_price values(biz_price_seq.nextval, '[코토세라믹]세면대/세이션 원형 탑볼', '모던한 디자인, 낮은 높이의 무광 원형 탑볼 도기 세면대입니다.', 210000, '욕실', '프리미엄', '153.png', 17);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]세면대/CCASF633 NEO MODERN', '곡선이 있고 수전이 높은 형태의 낮은 높이 네오모던 세면대입니다.', 121000, '욕실', '스탠다드', '154.png', 17);
insert into biz_price values(biz_price_seq.nextval, '[대림]세면대/CL-370', '스퀘어 형태의 모서리를 살린 모던 디자인 도기 세면대입니다.', 124000, '욕실', '프리미엄', '155.png', 18);
insert into biz_price values(biz_price_seq.nextval, '[케이앤씨]세면대/KL-400', '라운드형 슬림 사이즈 화이트컬러의 도기 세면대입니다.', 99000, '욕실', '스탠다드', '156.png', 18);
insert into biz_price values(biz_price_seq.nextval, '[퓨로]양변기/BWC-101A', '탱크리스 형태의 작고 슬림한 직수형 도기 세면대입니다.', 504000, '욕실', '프리미엄', '157.png', 19);
insert into biz_price values(biz_price_seq.nextval, '[대림]양변기/CC-230', '원피스 형태로 관리가 쉬운 플랫 상판의 화이트톤 도기 양변기입니다.', 359000, '욕실', '스탠다드', '158.png', 19);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]양변기/C831700E/C366000B', '넉넉한 크기의 편안한 비데 일체형 직수 양변기입니다.', 1179000, '욕실', '프리미엄', '159.png', 20);
insert into biz_price values(biz_price_seq.nextval, '[아메리칸스탠다드]양변기/C3197C4377', '깔끔하고 심플한 화이트톤의 투피스형 도기 양변기입니다.', 330000, '욕실', '스탠다드', '160.png', 20);

--주방
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크8027 원홀 주방 수전 (색상 4종)', '오랫동안 깔끔하게 사용 가능한 무광 니켈 소재의 원홀 주방수전입니다.', 290000, '주방', '프리미엄', '161.png', 1);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크1257 수입 투홀 주방수전 (색상 3종)', '모던한 디자인의 투홀형 수입산 버튼식 주방수전입니다.', 226000, '주방', '스탠다드', '162.png', 1);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크103 화이트 수입 원홀 주방수전 (색상 6종)', '밝은톤 인테리어에 어울리는 화이트 색상의 주방수전입니다.', 266000, '주방', '프리미엄', '163.png', 2);
insert into biz_price values(biz_price_seq.nextval, '무광 스텐 B타입 스탠 싱크대 주방 수전', '현대적인 디자인의 갈고리형 스탠소재 주방수전입니다.', 41000, '주방', '스탠다드', '164.png', 2);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크291 니켈 수입 원홀 주방수전', '수압이 강한 무광 니켈 소재의 수입산 원홀 주방수전입니다.', 246000, '주방', '프리미엄', '165.png', 3);
insert into biz_price values(biz_price_seq.nextval, '무광 니켈 고급 거위목수전 랜디304 B타입 주방 싱크대 수전', '무광 니켈 소재의 깔끔한 거위목 주방수전입니다.', 59000, '주방', '스탠다드', '166.png', 3);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크8026 원홀 주방 수전 (색상 4종)', '라운드 쉐잎이 주방의 무드를 더하는 거위목 원홀 주방수전입니다.', 290000, '주방', '프리미엄', '167.png', 4);
insert into biz_price values(biz_price_seq.nextval, 'SUS304 무광 니켈 스텐 거위목 수전 3type', '무광 니켈 소재의 깔끔한 거위목 형태 수전으로 3가지 디자인 중 선택이 가능합니다.', 60000, '주방', '스탠다드', '168.png', 4);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크 1257 3종', '목이 길고 얇은 형태의 무광 버튼형 주방수전입니다.', 226000, '주방', '프리미엄', '169.png', 5);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크063 수입 원홀 주방수전 (색상 3종)', '목이 길고 큰 사이즈의 무광 수전으로, 실버/블랙/골드 3가지 중 선택 가능합니다.', 204000, '주방', '스탠다드', '170.png', 5);
insert into biz_price values(biz_price_seq.nextval, '제니스 탑볼 원홀 코브라 주방 싱크대수전 SUS-304 A타입', '은은한 광택이 도는 세련된 디자인의 주방수전입니다.', 50000, '주방', '프리미엄', '171.png', 6);
insert into biz_price values(biz_price_seq.nextval, '무광 니켈 고급 거위목수전 싱크대 수전 SMF700', '고급스럽고 물때가 타지 않는 금속 거위목수전입니다.', 85000, '주방', '스탠다드', '172.png', 6);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크396 수입 투홀 주방수전 (색상 4종)	', '세련된 무광 디자인의 분리형 투홀 주방수전입니다.	', 218000, '주방', '프리미엄', '173.png', 7);
insert into biz_price values(biz_price_seq.nextval, '무광 스텐 C타입 스탠 싱크대 주방 수전', '깔끔한 디자인과 은은한 광택의 은색 스탠 소재 수전입니다.', 45000, '주방', '스탠다드', '174.png', 7);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크701 수입 원홀 주방수전 (색상 6종)', '무광 처리로 오염에 강한 4가지 색상의 주방수전입니다.', 304000, '주방', '프리미엄', '175.png', 8);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크103 수입 원홀 주방수전 (색상 4종)	', '사다리꼴 모양으로 가늘게 뻗는 디자인의 원홀 4색상 주방수전입니다.', 266000, '주방', '스탠다드', '176.png', 8);
insert into biz_price values(biz_price_seq.nextval, '엘라라 1홀 주방수전 TF-K4612U-BN 니켈/국산주방수전/싱크대수전', '깔끔하고 유행타지 않는 디자인의 분사형 원홀 니켈 주방수전입니다.', 298000, '주방', '프리미엄', '177.png', 9);
insert into biz_price values(biz_price_seq.nextval, '무광 니켈 고급 거위목수전 랜디304 C타입 주방 싱크대 수전', '해머 디자인의 무광 니켈 소재 거위목 원홀 수전입니다.', 69000, '주방', '스탠다드', '178.png', 9);
insert into biz_price values(biz_price_seq.nextval, '[해외] 아쿠노 셀렉트 M81 크롬 73837000 주방수전 관부가세포함', '실용적이고 쓰임새가 좋은 동시에 미니멀한 디자인으로 어디에나 어울리는 수입 주방수전입니다.', 929000, '주방', '프리미엄', '179.png', 10);
insert into biz_price values(biz_price_seq.nextval, '[해외] 한스그로헤 주방 싱크대 수전 포커스 31815000', '손잡이가 실용적이고 내구성이 강하며 물줄기가 아름다운 수입 주방수전입니다.', 240000, '주방', '스탠다드', '180.png', 10);
insert into biz_price values(biz_price_seq.nextval, 'FD1810 OSLO 오슬로 거위목 풀다운 주방수전', '깔끔한 디자인과 강한 내구도로 사용이 편리한 거위목 주방수전입니다.', 189000, '주방', '프리미엄', '181.png', 11);
insert into biz_price values(biz_price_seq.nextval, '아메리칸 스탠다드 주방 거위목 원홀 주방 씽크 수전 수도꼭지', '튼튼하고 사용하기 좋은 거위목형 심플 주방수전입니다.', 148000, '주방', '스탠다드', '182.png', 11);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크292 수입 원홀 주방수전 (색상 3종)	', '라운드 역갈고리형의 무채색 무광 니켈 원홀 수입 주방수전입니다.', 278000, '주방', '프리미엄', '183.png', 12);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크1268 수입 투홀 주방수전 (색상 2종)', 'ㄱ자형으로 은은한 광택이 고급스러운 반무광 투홀 수입 주방수전입니다.', 218000, '주방', '스탠다드', '184.png', 12);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크3111 니켈 수입 원홀 주방수전', '무광 니켈 실버컬러의 원홀 목이 가는 라운드형 수입 주방수전입니다.', 343000, '주방', '프리미엄', '185.png', 13);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크8028 원홀 주방수전 (색상4종)', 'ㄱ자형으로 무광 처리된 고급스러운 원홀 수입 주방수전입니다.', 266000, '주방', '스탠다드', '186.png', 13);
insert into biz_price values(biz_price_seq.nextval, 'FD1880 WAVE 웨이브 거위목 풀다운 주방수전', '굵은 거위목의 라운드 웨이브형 풀다운 수입 주방수전입니다.', 223000, '주방', '프리미엄', '187.png', 14);
insert into biz_price values(biz_price_seq.nextval, '국산 토네이도 싱크대 필터헤드수전 DPF-1000 수도꼭지 녹물제거 주방용', '	깔끔한 디자인과 토네이도 방식을 채용한 강한 수압이 특징인 필터헤드 수전입니다.', 32000, '주방', '스탠다드', '188.png', 14);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크390 니켈 수입 원홀 주방수전', '목이 긴 백금색 무광 니켈 소재의 원홀 수입산 주방수전입니다.', 240000, '주방', '프리미엄', '189.png', 15);
insert into biz_price values(biz_price_seq.nextval, '주방수전 싱크대수전 수도꼭지 코브라수전', '설치가 쉽고 간편한 코브라형 주방수전입니다.', 33000, '주방', '스탠다드', '190.png', 15);
insert into biz_price values(biz_price_seq.nextval, '새니터리 헤링 시리즈 주방 싱크대 수전 수도꼭지 원홀 거위목 무광 FD1830	', '라이트톤 주방 인테리어에 잘 어울리면서 실용적인 거위목 형태의 주방수전입니다.', 202000, '주방', '프리미엄', '191.png', 16);
insert into biz_price values(biz_price_seq.nextval, 'JT-A800BK 스탠 벽붙이 싱크대 주방 블랙 수전', '목부분의 블랙처리로 디자인이 세련되고 깔끔한 벽수전입니다.', 68000, '주방', '스탠다드', '192.png', 16);
insert into biz_price values(biz_price_seq.nextval, '무광 스테인리스 원홀 스프레이 싱크대수전 주방수전 VA-120', '무광 스테인리스 재질이며 물자국이 많이 남지 않고 물살 세기가 강한 원홀 주방수전입니다.', 139000, '주방', '프리미엄', '193.png', 17);
insert into biz_price values(biz_price_seq.nextval, 'JT-A200WH 스텐 싱크대 주방 수전', '밝은 화이트톤의 주방에 어울리는 화이트도색 스탠 무광 주방수전입니다.', 73000, '주방', '스탠다드', '194.png', 17);
insert into biz_price values(biz_price_seq.nextval, 'FD1853 VISTOK 비스토K 거위목 풀다운 주방수전', '짧고 굵은 거위목 형태의 유광 풀다운 수입 주방수전입니다.', 224000, '주방', '프리미엄', '195.png', 18);
insert into biz_price values(biz_price_seq.nextval, '무광 스텐 주방수전 싱크대 거위목수전', '고급스러운 디자인과 강한 수압의 거위목형 반무광 스테인리스 주방수전입니다.', 63000, '주방', '스탠다드', '196.png', 18);
insert into biz_price values(biz_price_seq.nextval, '피노 주방 싱크대 수전 수도꼭지 FD1768', '낮은 높이의 유광 실버컬러로 물때가 남지 않아 깨끗하게 유지 가능한 주방수전입니다.', 73000, '주방', '프리미엄', '197.png', 19);
insert into biz_price values(biz_price_seq.nextval, 'KN-1005 1홀 원홀 싱크대 주방 수전', '낮은 높이의 유광 실버컬러 주방수전입니다.', 26000, '주방', '스탠다드', '198.png', 19);
insert into biz_price values(biz_price_seq.nextval, '슈티에싱크391 니켈 수입 원홀 주방수전', '튤립을 닮은 유려한 곡선형 디자인의 무광 니켈 원홀 수입 주방수전입니다.', 240000, '주방', '프리미엄', '199.png', 20);
insert into biz_price values(biz_price_seq.nextval, '새니터리 헤링 시리즈 주방 싱크대 수전 수도꼭지 원홀 거위목 무광 FD1821', '유광으로 청소가 간편하고 실용적인 ㄱ자형 원홀 거위목 주방수전입니다.', 178000, '주방', '스탠다드', '200.png', 20);

--문/샷시
insert into biz_price values(biz_price_seq.nextval, '엘리세 양개 아치 중문 시공 (기본 강화유리)', '아치형 곡선 타공디자인으로 공간을 한층 부드럽게 만들어주는 다양한 컬러의 아치 중문입니다.', 1081000, '문/샷시', '프리미엄', '201.png', 1);
insert into biz_price values(biz_price_seq.nextval, '프렌치 양개도어 중문 시공', '노출형 경칩이 아닌 상하 잡아주는 매립형 베어링힌지를 사용해 소음 발생을 최소화한 빈틈없는 라운드바 구조의 양면개방식 중문입니다.', 679000, '문/샷시', '스탠다드', '202.png', 1);
insert into biz_price values(biz_price_seq.nextval, '우드루바 원슬라이딩 중문', '알루미늄에 리얼 우드 랩핑으로 뒤틀림현상을 보완하여 변형없이 오래 사용가능한 원목 중문입니다.', 1490000, '문/샷시', '프리미엄', '203.png', 2);
insert into biz_price values(biz_price_seq.nextval, '슬림3연동 도어 중문', '자체 개발 2중 유리 몰딩과 2중 모헤어로 냄새와 소음 등 차단효과를 높여주며, 도어 개폐시 부드럽고 안정적인 구동감을 주는 세련된 핸들리스 디자인의 3연동 중문입니다.', 469000, '문/샷시', '스탠다드', '204.png', 2);
insert into biz_price values(biz_price_seq.nextval, '우디 원슬라이딩 중문 800~1300(투명/스타일/망입유리)', '자연을 닮은 듯 차분한 컬러감과 시선을 끄는 널찍한 원도어 디자인의 우디 중문입니다.', 1524000, '문/샷시', '프리미엄', '205.png', 3);
insert into biz_price values(biz_price_seq.nextval, '원슬라이딩 도어 중문 아파트 현관 중문', '핸드커버랩핑, 전창형 디자인으로 7가지 색상과 10가지 유리 스타일 중 선택가능한 견고한 알루미늄 소재 전창형 원슬라이딩 도어입니다.', 466000, '문/샷시', '스탠다드', '206.png', 3);
insert into biz_price values(biz_price_seq.nextval, '더홈 G2 브론즈유리 비대칭 스윙 중문 1000-1300', '양방향 오픈, 클로징이 가능한 구조로 턱이 없는 레일리스 스윙도어형 화이트톤 중문입니다.', 904000, '문/샷시', '프리미엄', '207.png', 4);
insert into biz_price values(biz_price_seq.nextval, '프렌치 원도어 고시형 중문', '노출형 경칩이 아닌 상하 잡아주는 매립형 베어링힌지를 사용해 소음 발생을 최소화한 빈틈없는 라운드바 구조의 원도어 고시형 중문입니다.', 577000, '문/샷시', '스탠다드', '208.png', 4);
insert into biz_price values(biz_price_seq.nextval, '알파 원슬라이딩 중문', '문틀까지 고급 알루미늄 소재로 이루어져 견고한 4바퀴 댐핑 시스템 도어입니다.', 996000, '문/샷시', '프리미엄', '209.png', 5);
insert into biz_price values(biz_price_seq.nextval, '프렌치 원도어 오픈형 중문 시공', '노출형 경칩이 아닌 상하 잡아주는 매립형 베어링힌지를 사용해 소음 발생을 최소화한 빈틈없는 라운드바 구조의 원도어 오픈형 중문입니다.', 567000, '문/샷시', '스탠다드', '210.png', 5);
insert into biz_price values(biz_price_seq.nextval, '우디 3연동 중문 1300~1500(-자,오픈형,고시형)', '실내에 내추럴 무드를 더해주는 부드러운 3연동 형식의 우디 중문입니다,', 1085000, '문/샷시', '프리미엄', '211.png', 6);
insert into biz_price values(biz_price_seq.nextval, '현관중문 3연동중문', '알루미늄 소재로 가볍고 견고하며 변형이 없는 맞춤제작 3연동 현관 중문입니다.', 648000, '문/샷시', '스탠다드', '212.png', 6);
insert into biz_price values(biz_price_seq.nextval, '리버서블도어 현관중문', '좁은 공간을 더 효율적으로 활용가능한 180도 양방향 회전 개폐형의 40mm 슬림 알루미늄 프레임 개방도어입니다.', 1120000, '문/샷시', '프리미엄', '213.png', 7);
insert into biz_price values(biz_price_seq.nextval, '원슬라이딩 도어 중문 시공(유리7종/디바이딩7종)', '자체 개발 2중 유리 몰딩과 2중 모헤어로 냄새와 소음 등 차단효과를 높여주며, 안전성과 심미성을 갖춘 매립형 유리로 제작한 견고한 원슬라이딩형 중문입니다.', 684000, '문/샷시', '스탠다드', '214.png', 7);
insert into biz_price values(biz_price_seq.nextval, '오리엔탈 간살 3연동 도어 중문', '깔끔한 일체형 하부호차와 촘촘한 2중 구조 모헤어로 차단효과를 더욱 높여주는 오리엔탈 무드의 간살 구조 우든 중문입니다.', 999000, '문/샷시', '프리미엄', '215.png', 8);
insert into biz_price values(biz_price_seq.nextval, '초슬림 3연동 중문 컬러 도어', '깔끔한 일체형 하부호차와 촘촘한 2중 구조 모헤어로 차단효과를 더욱 높여주는 견고한 알루미늄 및 금속 소재의 튼튼한 초슬림형 중문입니다.', 679000, '문/샷시', '스탠다드', '216.png', 8);
insert into biz_price values(biz_price_seq.nextval, '스윙도어 여닫이 2.8 비대칭 양개형 현관 중문(초슬림, 양방향, 오토댐퍼)', '180도 양방향으로 열리고 닫히며 현관 너비의 95% 사용이 가능하여 넓은 개방감을 주는 초슬림 스윙도어 2.8 여닫이 중문입니다.', 890000, '문/샷시', '프리미엄', '217.png', 9);
insert into biz_price values(biz_price_seq.nextval, '아파트 현관 비대칭 양개 스윙 중문', '앞뒤로 밀고 당길 수 있는 180도 양면 개방형 중문입니다. 프레임 컬러, 손잡이, 쫄대, 유리 변경과 같은 커스텀이 가능합니다.', 750000, '문/샷시', '스탠다드', '218.png', 9);
insert into biz_price values(biz_price_seq.nextval, '폴드 스윙도어 현관중문', '하부레일 없이 깔끔하게 편리한 반자동 180도 양방향 회전 개폐가 가능한 40mm 슬림 알루미늄 프레임 폴드스윙도어입니다.', 1180000, '문/샷시', '프리미엄', '219.png', 10);
insert into biz_price values(biz_price_seq.nextval, '더홈 G2 브론즈유리 외도어 스윙 중문 800-999', '보다 슬림해진 슬림바 도어를 적용하여 앞뒤로 자유롭게 오픈 클로징이 가능한 외도어 유리 중문입니다.', 766000, '문/샷시', '스탠다드', '220.png', 10);
insert into biz_price values(biz_price_seq.nextval, '알파 3연동 중문 1150~1500(-자)', '초슬림 프레임으로 개방감을 주는 탄탄한 내구성과 심플하고 모던한 알루미늄 강화유리 3연동 중문입니다.', 899000, '문/샷시', '프리미엄', '221.png', 11);
insert into biz_price values(biz_price_seq.nextval, '원슬라이딩 도어 현관중문 아파트중문', '모던하고 심플한 디자인으로 변색, 변형 없는 반영구 불소도장을 적용하고 일체형 양댐퍼를 사용한 손잡이 일체형 강화유리 20mm 초슬림프레임 원슬라이딩 롤러형 중문입니다.', 767000, '문/샷시', '스탠다드', '222.png', 11);
insert into biz_price values(biz_price_seq.nextval, '더홈 G2 망입유리 비대칭 스윙 중문 1000-1300', '보다 슬림해진 슬림바 도어를 적용하여 앞뒤로 자유롭게 오픈 클로징이 가능한 레일리스 중문입니다.', 963000, '문/샷시', '프리미엄', '223.png', 12);
insert into biz_price values(biz_price_seq.nextval, '현관중문 원슬라이딩 초슬림 2.8 레인보우+아쿠아유리 15mm 복층유리', '국내 최초로 행거도어 하드웨어에 복층페어 유리를 적용해서 문턱 없이 부드럽게 열리는 완벽한 슬라이딩 초슬림 배젤 중문입니다.', 750000, '문/샷시', '스탠다드', '224.png', 12);
insert into biz_price values(biz_price_seq.nextval, '더홈 G1 브론즈유리 초슬림 3연동 중문 1050-1400', '공간을 최소화할 수 있는 3중 도어형으로 롤러바퀴, 4면 모헤어를 적용한 초슬림 배젤의 중문입니다.', 890000, '문/샷시', '프리미엄', '225.png', 13);
insert into biz_price values(biz_price_seq.nextval, '싱글스윙 비대칭스윙 도어 중문 아파트', '필름 랩핑 대신 불소도장을 활용한 슬림 프레임, 문 오픈 시 부딪힘을 방지하는 안전 손잡이, 안정감 있는 댐퍼와 강화유리를 활용한 비대칭 스윙형 중문입니다.', 754000, '문/샷시', '스탠다드', '226.png', 13);
insert into biz_price values(biz_price_seq.nextval, '초슬림 원슬라이딩 중문 아파트중문', '최고급 알루미늄 원자재를 아노다이징 표면처리 하고 내충격 강도가 높은 완전강화 유리를 함께 사용한 초슬림 슬라이딩형 중문입니다.', 1130000, '문/샷시', '프리미엄', '227.png', 14);
insert into biz_price values(biz_price_seq.nextval, '레오 3연동 ㅡ자형/ㄱ자형 슬림 중문', '50mm 얇은 도어 프레임을 적용하여 시원한 개방감과 모던하고 감각적인 공간 연출을 돕는 다양한 컬러감/유리 타입의 중문입니다.', 799000, '문/샷시', '스탠다드', '228.png', 14);
insert into biz_price values(biz_price_seq.nextval, '모루 유리 반자동 중문 (W1200)', '180도 회전하는 피봇방식, 내구성을 강화한 알루미늄 프레임으로 공간에 딱 맞는 맞춤 주문제작이 가느한 세미오토 도어형 중문입니다.', 1475000, '문/샷시', '프리미엄', '229.png', 15);
insert into biz_price values(biz_price_seq.nextval, '더홈 G3 브론즈유리 원슬라이딩 중문 800-1000', '부드럽고 안전한 개폐가 가능하도록 스토퍼가 적용된 댐핑레일, 환경친화적인 불소도장, 플랫한 디자인의 손잡이와 강화유리가 적용된 슬라이딩형 중문입니다.', 766000, '문/샷시', '스탠다드', '230.png', 15);
insert into biz_price values(biz_price_seq.nextval, '자동 중문 2.8 초슬림 3연동 슬라이딩', '특수 기어드모터를 사용해 소음을 최소화하며 정/역방향이 부드럽게 제어되는 초슬림 2.8 자동중문입니다.', 1220000, '문/샷시', '프리미엄', '231.png', 16);
insert into biz_price values(biz_price_seq.nextval, '스윙도어 여닫이 2.8 싱글형 현관 중문 시공(초슬림, 양방향, 오토댐퍼)', '큰 힘을 가하지 않아도 부드럽게 닫히는 상단 유압힌지와 상하부 모헤어, 심플한 디자인의 가스켓과 손잡이를 활용한 다양한 색상의 안전접합유리 여닫이식 외도어 중문입니다.', 790000, '문/샷시', '스탠다드', '232.png', 16);
insert into biz_price values(biz_price_seq.nextval, '우디 여닫이 중문 외도어형(투명/스타일/망입유리)', '깔끔한 문선 마감과 마그네틱 도어 캐처로 가볍게 밀고 들어가는 90도 개폐 방식의 여닫이식 목재 중문입니다.', 989000, '문/샷시', '프리미엄', '233.png', 17);
insert into biz_price values(biz_price_seq.nextval, '초슬림 2.8 3연동 중문 아파트 현관 인테리어 도어', 'PC 친환경 분체 도장으로 인체에 무해한 최고급 알루미늄 프레임과 강화유리를 사용한 원스탑 시스템 자체생산 초슬림 2.8 3연동 개폐 중문입니다.', 726000, '문/샷시', '스탠다드', '234.png', 17);
insert into biz_price values(biz_price_seq.nextval, '초슬림 원슬라이딩 현관 아파트 중문 / 아치+유리섞임', '최고급 알루미늄 원자재를 아노다이징 표면처리 하고 내충격 강도가 높은 완전강화 유리를 함께 사용한 초슬림 슬라이딩형 중문입니다.', 1295000, '문/샷시', '프리미엄', '235.png', 18);
insert into biz_price values(biz_price_seq.nextval, '원슬라이딩 레일형 초슬림 2.8 미닫이 중문(투명/브론즈)', '국내 최초로 행거도어 하드웨어에 복층페어 유리를 적용해서 부드럽게 밀리고 닫히는 레일형 미닫이 투명 중문입니다.', 720000, '문/샷시', '스탠다드', '236.png', 18);
insert into biz_price values(biz_price_seq.nextval, '싱글 원슬라이딩 중문 (강화유리기본 / 블랙,화이트,골드)', '아노다이징 마감된 20mm의 슬림 알루미늄 프레임과 취향대로 고르는 유리 디자인 21종으로 우리집에 딱 맞는 댐핑 시스템 도어형 중문입니다.', 1093000, '문/샷시', '프리미엄', '237.png', 19);
insert into biz_price values(biz_price_seq.nextval, '원슬라이딩 도어 투명 강화 유리 현관중문 아파트중문', '모던하고 심플한 디자인으로 변색, 변형 없는 반영구 불소도장을 적용하고 일체형 양댐퍼를 사용한 손잡이 일체형 강화유리 20mm 초슬림프레임 원슬라이딩 롤러형 중문입니다.', 767000, '문/샷시', '스탠다드', '238.png', 19);
insert into biz_price values(biz_price_seq.nextval, '투명유리 프렌치 아치형 비대칭 여닫이 스윙 중문', 'IPC 친환경 분체 도장으로 인체에 무해한 최고급 알루미늄 프레임과 강화유리를 사용한 원스탑 시스템 자체생산 180도 피봇방식 세미오토 여닫이 도어입니다.', 1720000, '문/샷시', '프리미엄', '239.png', 20);
insert into biz_price values(biz_price_seq.nextval, '3연동 울트라 초슬림 1.4 현관 중문 시공 친환경 슬라이딩 도어', '더욱 슬림한 14mm 도어프레임으로 넓은 개방감 연출이 가능하고, KS 인증받은 호차바퀴와 다양한 디자인의 일체형 손잡이, 복강 모헤어,  초경량 고급 알루미늄 도어 프레임으로 견고함을 추구한 3연동 현관 중문입니다.', 790000, '문/샷시', '스탠다드', '240.png', 20);


--조명
insert into biz_price values(biz_price_seq.nextval, 'LED COB 실린더 매입기구 10W_2colors', '심플한 디자인과 자유로운 회전이 가능한 매입형 조명입니다.', 70000, '조명', '프리미엄', '241.png', 1);
insert into biz_price values(biz_price_seq.nextval, '투투 업라이트 LED 반매입등 10W 조명_2colors_2type', '새로운 빛의 형태, 빛이 아래에서 위를 향하는 간접등 스타일로 제작되어 무드가 느껴지는 부드러운 공간을 만들어주는 매입등입니다.', 14000, '조명', '스탠다드', '242.png', 1);
insert into biz_price values(biz_price_seq.nextval, '프리사 원통 실린더 COB 매입등', '심플하고 세련된 디자인과 자유로운 각도조절로 다양한 연출이 가능한 원통형 매입등입니다.', 49000, '조명', '프리미엄', '243.png', 2);
insert into biz_price values(biz_price_seq.nextval, 'LED 다운라이트 에코 7W 매입등 플리커프리 매립등기구', '눈이 편안한 플리커 프리형의 유백 확산형 LED 3인치 다운라이트 매입등입니다.', 4100, '조명', '스탠다드', '244.png', 2);
insert into biz_price values(biz_price_seq.nextval, '텐디오 2등 직부/센서(전구 포함)', '직부/센서 겸용 타입으로 세밀유리공정을 거쳐 고급스러운 골드 도색을 활용, 부식이 덜한 조명입니다.', 56000, '조명', '프리미엄', '245.png', 3);
insert into biz_price values(biz_price_seq.nextval, 'LED 프리미엄 3인치 다운라이트 COB 직회전 8W_3colors', '견고한 스틸 바디와 방열판, 각도 조절로 다양한 연출이 가능한 직회전 COB 타입의 플리커프리 3인치 프리미엄 다운라이트입니다.', 5000, '조명', '스탠다드', '246.png', 3);
insert into biz_price values(biz_price_seq.nextval, 'LED 스텝 센서 매입등 2W 사각 발목 센서등 풋조명 복도 조명', '모던한 심플 사각 바디의 센서 기능이 추가된 스텝등으로, 설치가 간편하고 국내에서 생산된 제품입니다.', 48000, '조명', '프리미엄', '247.png', 4);
insert into biz_price values(biz_price_seq.nextval, 'LED 다운라이트 에코어반 슬림테 플리커프리 움푹 매입등_3size', 'KS인증 제품으로 3가지 색온도의 컷오프 바디로 눈부심 없이 고급스러운 빛을 연출하는 매입등입니다.', 5500, '조명', '스탠다드', '248.png', 4);
insert into biz_price values(biz_price_seq.nextval, 'IOT 삼색변환 디밍 마그네틱조명 멀티라이트 사각매입등 5구', '자유로운 색변환과 디밍이 가능하고 플리커프리로 눈이 편한한 리모컨 사용가능 COB 집중형 매입조명입니다.', 63000, '조명', '프리미엄', '249.png', 5);
insert into biz_price values(biz_price_seq.nextval, '다이즈 COB LED 매입등 조명 10W', '인테리어를 해치지 않는 화이트톤의 깔끔한 디자인으로 허전한 공간에 포인트를 줄 수 있는 색온도 변경 가능 매입등입니다.', 15000, '조명', '스탠다드', '250.png', 5);
insert into biz_price values(biz_price_seq.nextval, '코티브 LED 매입등', '각도 조절이 가능하고 전구를 바꾸어 색온도를 변경할 수 있으며, 360도 회전이 가능한 밝고 산뜻한 매입등입니다.', 50000, '조명', '프리미엄', '251.png', 6);
insert into biz_price values(biz_price_seq.nextval, 'LED 다운라이트 삼성칩 매입등_3size', '심플하고 모던한 모양의 타공사이즈 75파이 대체용 3인치 다운라이트입니다.', 2000, '조명', '스탠다드', '252.png', 6);
insert into biz_price values(biz_price_seq.nextval, '3인치 줌 매입등 라인 원통 매립등', '다른 원통형 매입등보다 긴 220mm 매입등입니다.', 48000, '조명', '프리미엄', '253.png', 7);
insert into biz_price values(biz_price_seq.nextval, 'LED 방습 다운라이트 매립등 생활방수_3size', '습도가 높은 곳에서도 사용가능한 KS인증 3인치 생활방습 다운라이트입니다.', 4000, '조명', '스탠다드', '254.png', 7);
insert into biz_price values(biz_price_seq.nextval, '마그네틱조명 슬림사각 멀티매입등 직사각 COB 다운라이트 15구', '슬림한 디자인과 눈부심 방지 구조로 천장 일체형 마그네틱 레일 조명 느낌을 연출할 수 있는 멀티 매입등입니다.', 60000, '조명', '프리미엄', '255.png', 8);
insert into biz_price values(biz_price_seq.nextval, '크레이터 LED 다운라이트 매입등 (2 sizes) - 3000K/4000K', '바깥부터 안쪽으로 점점 좁아지는 곡선형 디자인이 돋보이는 유니크한 다운라이트입니다.', 18000, '조명', '스탠다드', '256.png', 8);
insert into biz_price values(biz_price_seq.nextval, 'IOT 삼색변환 디밍 마그네틱조명 멀티라이트 사각매입등 10구', '자유로운 색변환과 디밍이 가능하고 플리커프리로 눈이 편한한 리모컨 사용가능 COB 집중형 매입조명입니다.', 95000, '조명', '프리미엄', '257.png', 9);
insert into biz_price values(biz_price_seq.nextval, '크레이터 LED 다운라이트 매입등 (2 sizes) - 3000K/4000K', '주백색 컬러의 KS인증을 받은 유백 확산형 AC 직결타입 LED 3인치 다운라이트입니다.', 2700, '조명', '스탠다드', '258.png', 9);
insert into biz_price values(biz_price_seq.nextval, '텐비 COB 실린더 매입등 LED 다운라이트 10W', '다양한 각도, 길이, 3가지 불빛 색사의 조절이 가능하며 눈이 편안한 플리커 프리 매입식 조명입니다.', 47000, '조명', '프리미엄', '259.png', 10);
insert into biz_price values(biz_price_seq.nextval, 'LED 6인치 다운라이트 방습 매입등 욕실용 국내산_2type', '습도가 높은 곳에서도 사용가능한 KS인증 6인치 방습 다운라이트입니다.', 3900, '조명', '스탠다드', '260.png', 10);
insert into biz_price values(biz_price_seq.nextval, 'LED 매입형 다락방 매립 방등 5mm', '다락방이나 복층처럼 천장이 낮은 곳에 꼭 필요한 LED매입조명입니다.', 45000, '조명', '프리미엄', '261.png', 11);
insert into biz_price values(biz_price_seq.nextval, '라이노 T라인 LED 직부', '다양한 사이즈의 유닛을 조합하는 모듈형 조명으로, 공간 규모에 맞게 조절하거나 라이프스타일에 맞게 선택이 가능합니다.', 21000, '조명', '스탠다드', '262.png', 11);
insert into biz_price values(biz_price_seq.nextval, '스피니 15구 매입등 LED 20W 주백색 다운라이트', 'KS인증으로 안심할 수 있는 국내 제작 주백색 오스람칩 플리커프리 매입등입니다.', 112000, '조명', '프리미엄', '263.png', 12);
insert into biz_price values(biz_price_seq.nextval, 'LED 스포트 매입등 COB 플리커프리', 'KS인증으로 안심할 수 있는 플리커프리 포스라이트 매입등입니다.', 38000, '조명', '스탠다드', '264.png', 12);
insert into biz_price values(biz_price_seq.nextval, '필립스 HUE 원형매입등 가니아 51107 7W 스마트조명', '휴 화이트 앰비언스 기술이 적용되어 스마트기기로 밝기 및 색온도 조절이 가능한 스마트 조명입니다.', 58000, '조명', '프리미엄', '265.png', 13);
insert into biz_price values(biz_price_seq.nextval, '무슈 LED 매입등 조명 3인치 / 4인치', '깔끔한 다운라이트 매입등으로, 3/4/6인치 타입으로 다양한 공간에 활용할 수 있는 무슈 LED 매입등입니다.', 5000, '조명', '스탠다드', '266.png', 13);
insert into biz_price values(biz_price_seq.nextval, '칼리스타 COB 매입등_2 colors 10구', '눈부심이 적은 플리커프리 제품으로 고급스러운 분위기가 연출 가능한 COB 매입등입니다.', 48000, '조명', '프리미엄', '267.png', 14);
insert into biz_price values(biz_price_seq.nextval, '뉴트릭 LED 라인조명 카페 침실 매입', '돌출 없는 깔끔한 인테리어로 기존 라인조명과 달리 끊김없이 일자/기역자 연결이 가능한, 돌출되지 않는 매입형 디자인의 깔끔하고 화사한 연출이 가능한 조명입니다.', 22000, '조명', '스탠다드', '268.png', 14);
insert into biz_price values(biz_price_seq.nextval, '레스 실린더 3인치 COB 매입등 LED 7W 롱타입', '벽을 따라 조성된 천장 간접조명을 통해 아늑한 분위기를 채울 수 있는 고급스러운 COB 조명입니다.', 59000, '조명', '프리미엄', '269.png', 15);
insert into biz_price values(biz_price_seq.nextval, '3인치 캐리어 COB LED 매입등 10W_2 colors', '심플한 미니멀리즘 디자인으로 다양한 공간에 화룡 가능한 3가지 사이즈 블랙/화이트 매입등입니다.', 18000, '조명', '스탠다드', '270.png', 15);
insert into biz_price values(biz_price_seq.nextval, '휴(HUE) 3인치 매입등 블루투스 색상변환 (주광/전구)', '휴 화이트 앰비언스 기술이 적용되어 스마트기기로 밝기 및 색온도 조절이 가능한 스마트 조명입니다.', 45000, '조명', '프리미엄', '271.png', 16);
insert into biz_price values(biz_price_seq.nextval, '3인치 다운라이트 V3 COB타입 3W, 6W, 8W 매입등', '20도를 기울일 수 있는 3만 시간 장수명, 클래식하고 간단한 ID 디자인의 최적화된 광학적 설계를 제공하는 액센트 조명 매입등입니다.', 8500, '조명', '스탠다드', '272.png', 16);
insert into biz_price values(biz_price_seq.nextval, '제이 멀티 2구 매입등 화이트 LED 20w COB타입', '벽을 따라 조성된 천장 간접조명을 통해 아늑한 분위기를 채울 수 있는 고급스러운 COB 조명입니다.', 55000, '조명', '프리미엄', '273.png', 17);
insert into biz_price values(biz_price_seq.nextval, 'LED 다운라이트 4인치 10W 매입등', '눈이 편안한 플리커 프리형의 유백 확산형 LED 4인치 다운라이트 매입등입니다.', 4700, '조명', '스탠다드', '274.png', 17);
insert into biz_price values(biz_price_seq.nextval, '아루 LED 다운라이트 매입등 (4인치, 6인치 / 리모콘 밝기조절, 색온도조절)', '장소와 분위기에 따라 빛 밝기를 조절하여 감성적인 인테리어 효과를 누릴 수 있는 리모트 컨트롤 가능 매입등입니다.', 65000, '조명', '프리미엄', '275.png', 18);
insert into biz_price values(biz_price_seq.nextval, '메이슨 3인치 4인치 5인치 6인치 7인치 8인치 LED 다운라이트(전원단자포함)', '블루라이트도, 플리커 현상도 걱정없는 안전성 평가 최고 등급의 필립스 메이슨 아이컴포트 기능이 있는 다운라이트 매입등입니다.', 5000, '조명', '스탠다드', '276.png', 18);
insert into biz_price values(biz_price_seq.nextval, 'LED 타로스 10구 15W 사각 매입등 인테리어 천장 조명 매립등', '따뜻한 빛과 일관된 광원으로 인테리어에 신속하게 활력과 분위기를 불어넣어주는 주백색 매입등입니다.', 85000, '조명', '프리미엄', '277.png', 19);
insert into biz_price values(biz_price_seq.nextval, 'LED 다운라이트 3인치 8W 확산형 오스람 레드밴스 매입등 플리커프리 매립등', '오스람 브랜드의 신뢰할 수 있는 품질로 눈부심 없는 플리커프리 슬림 매입등입니다.', 3250, '조명', '스탠다드', '278.png', 19);
insert into biz_price values(biz_price_seq.nextval, '에코 LED 루보스 COB 매입등 10W', '작은 보드 위에 많은 LED를 부착하여 높은 출력을 낼 수 있는 광원으로 부피와 무게는 줄이고 효율을 높인 고출력 방식의 COB 매입등입니다.', 52000, '조명', '프리미엄', '279.png', 20);
insert into biz_price values(biz_price_seq.nextval, 'LED 다운라이트 오닉스 슬림 매입등_4size', '동급 대비 높은 광효율로 밝은 빛을 내는 안정기 일체형, AC직결형 KC인증 자체제작 다운라이트 매입등입니다.', 1900, '조명', '스탠다드', '280.png', 20);


--시트/필름
insert into biz_price values(biz_price_seq.nextval, '[레놀릿]필름/S-490364/샌드링햄 오크 그레이', '원목 패턴을 재현한 시트지로 비치지 않으며 고품질의 인테리어필름입니다.', 24000, '시트/필름', '프리미엄', '281.png', 1);
insert into biz_price values(biz_price_seq.nextval, '[영림]필름/PS010/중백색', '영림 스테디셀러 인테리어 필름으로 안정적이고 자연스러운 재질이며 완전한 화이트톤 연출이 가능합니다.', 12000, '시트/필름', '스탠다드', '282.png', 1);
insert into biz_price values(biz_price_seq.nextval, '[레놀릿]필름/세레나/오크내추럴', '두께감과 내구성이 우수하고 점착력과 안전성을 높인 풍부한 색감과 디자인의 원목 패턴 인테리어필름입니다.', 21000, '시트/필름', '프리미엄', '283.png', 2);
insert into biz_price values(biz_price_seq.nextval, '[영림]필름/PS120/도장백색', '생활방수가 되며 손쉽게 닦아낼 수 있어 청결함을 유지할 수 있는 내습성, 내한성 화이트톤 인테리어필름입니다.', 12000, '시트/필름', '스탠다드', '284.png', 2);
insert into biz_price values(biz_price_seq.nextval, '[인쇼스토어]필름/INSHOW Film/종합컬러', '두께감과 내구성이 우수하고 색감과 질감이 다양한 우드톤 인테리어필름입니다.', 23000, '시트/필름', '프리미엄', '285.png', 3);
insert into biz_price values(biz_price_seq.nextval, '[영림]필름/PS130/크림백색	영림 스테디셀러', '인테리어 필름으로 고급스러운 크림백색 색상입니다.', 12000, '시트/필름', '스탠다드', '286.png', 3);
insert into biz_price values(biz_price_seq.nextval, '[한샘]pp보드/스토리보드/도브화이트SM', '두께감과 내구성이 우수하고 점착력과 안전성을 높인 도브화이트컬러 인테리어필름입니다.', 26000, '시트/필름', '프리미엄', '287.png', 4);
insert into biz_price values(biz_price_seq.nextval, '[LX지인]필름/RS130/화이트', '화이트톤 인테리어에 잘 어울리는 쿨한 색감의 백색 인테리어필름입니다.', 10000, '시트/필름', '스탠다드', '288.png', 4);
insert into biz_price values(biz_price_seq.nextval, '[한화홈데코]PP보드/스토리보드/시에라오크', '우드 패턴을 세밀하게 구현하여 자연스러운 질감과 0.6mm의 두께로 내구성이 아주 강한 제품입니다.', 27000, '시트/필름', '프리미엄', '289.png', 5);
insert into biz_price values(biz_price_seq.nextval, '[LX지인]필름/ES171/화이트', '화이트톤 인테리어에 잘 어울리는 웜한 색감의 백색 인테리어필름입니다.', 11000, '시트/필름', '스탠다드', '290.png', 5);
insert into biz_price values(biz_price_seq.nextval, '[LX지인]필름/프리미엄우드/NW100/월넛', '나무 질감을 표현한 제품으로 잘 닦여 청소가 쉬우며 실내에 내추럴 무드를 줄 수 있는 방수 인테리어필름입니다.', 23000, '시트/필름', '프리미엄', '291.png', 6);
insert into biz_price values(biz_price_seq.nextval, '[영림]필름/PS035/베이지', '두께 0.24 이상으로 내구성이 우수해 실내 어떤 공간이든 부착이 가능한 베이지색상 인테리어필름입니다.', 11000, '시트/필름', '스탠다드', '292.png', 6);
insert into biz_price values(biz_price_seq.nextval, '[영림]필름/영림109/PW835/우드', '두께감과 내구성이 우수하고 점착력과 안전성을 높인 우든 패턴 디자인의 원목질감 인테리어필름입니다.', 18000, '시트/필름', '프리미엄', '293.png', 7);
insert into biz_price values(biz_price_seq.nextval, '[LX지인]필름/ES160/샌드화이트', '친환경 건축자재 최우수등급을 획득한 제품으로 인체에 유해한 프탈레이트계 가소제 및 납, 수은, 카드뮴과 같은 중금속이 검출되지 않으며, 방염필증을 획득한 샌드화이트톤 방염필름입니다.', 12000, '시트/필름', '스탠다드', '294.png', 7);
insert into biz_price values(biz_price_seq.nextval, '[영림]필름/영림177/PX449-2/발렌 포그', '대리석 패턴으로 일반 시트지에 비해 스크래치에 강하고 재질이 두꺼운 특수인쇄 화이트톤 인테리어필름입니다.', 27000, '시트/필름', '프리미엄', '295.png', 8);
insert into biz_price values(biz_price_seq.nextval, '[한솔홈데코]pp보드/스토리보드/포그그레이SM', '흔하지 않은 포그그레이 컬러의 다용도 방염 처리 인테리어필름입니다.', 11000, '시트/필름', '스탠다드', '296.png', 8);
insert into biz_price values(biz_price_seq.nextval, '[레놀릿] 필름/S-490466/콘크리트화이트(2type)', '콘크리트 벽의 질감을 그대로 표현한 화이트톤의 고급 인테리어필름입니다.', 24000, '시트/필름', '프리미엄', '297.png', 9);
insert into biz_price values(biz_price_seq.nextval, '[LX지인]필름/ES124/화이트', '따뜻함이 가미된 화이트톤으로 방수가 가능하며 이물질이 묻어도 손쉽게 닦아낼 수 있어 관리가 용이한 인테리어필름입니다.', 14000, '시트/필름', '스탠다드', '298.png', 9);
insert into biz_price values(biz_price_seq.nextval, '[레놀릿] 필름/트로이/오크 내츄럴', '원목의 옹이와 결을 진짜처럼 잘 살려 만들어 고가의 원목시공이 부담스러운 공간에 잘 어우러지는 인테리어필름입니다.', 26000, '시트/필름', '프리미엄', '299.png', 10);
insert into biz_price values(biz_price_seq.nextval, '[LG하우시스]필름/ES86/RS86/화이트', '표면 특수코팅을 통한 Non-Scratch 기능과 Painting 기법을 통해 단색의 편안함을 극대화한 화이트톤의 프리미엄 인테리어필름입니다.', 19000, '시트/필름', '스탠다드', '300.png', 10);
insert into biz_price values(biz_price_seq.nextval, '[레놀릿]필름/S-490364/샌드링햄 오크 그레이', '원목 패턴을 재현한 시트지로 비치지 않으며 고품질의 인테리어필름입니다.', 24000, '시트/필름', '프리미엄', '301.png', 11);
insert into biz_price values(biz_price_seq.nextval, '[영림]필름/PS010/중백색', '영림 스테디셀러 인테리어 필름으로 안정적이고 자연스러운 재질이며 완전한 화이트톤 연출이 가능합니다.', 12000, '시트/필름', '스탠다드', '302.png', 11);
insert into biz_price values(biz_price_seq.nextval, '[레놀릿]필름/세레나/오크내추럴', '두께감과 내구성이 우수하고 점착력과 안전성을 높인 풍부한 색감과 디자인의 원목 패턴 인테리어필름입니다.', 21000, '시트/필름', '프리미엄', '303.png', 12);
insert into biz_price values(biz_price_seq.nextval, '[영림]필름/PS120/도장백색', '생활방수가 되며 손쉽게 닦아낼 수 있어 청결함을 유지할 수 있는 내습성, 내한성 화이트톤 인테리어필름입니다.', 12000, '시트/필름', '스탠다드', '304.png', 12);
insert into biz_price values(biz_price_seq.nextval, '[인쇼스토어]필름/INSHOW Film/종합컬러', '두께감과 내구성이 우수하고 색감과 질감이 다양한 우드톤 인테리어필름입니다.', 23000, '시트/필름', '프리미엄', '305.png', 13);
insert into biz_price values(biz_price_seq.nextval, '[영림]필름/PS130/크림백색', '영림 스테디셀러 인테리어 필름으로 고급스러운 크림백색 색상입니다.', 12000, '시트/필름', '스탠다드', '306.png', 13);
insert into biz_price values(biz_price_seq.nextval, '[한샘]pp보드/스토리보드/도브화이트SM', '두께감과 내구성이 우수하고 점착력과 안전성을 높인 도브화이트컬러 인테리어필름입니다.', 26000, '시트/필름', '프리미엄', '307.png', 14);
insert into biz_price values(biz_price_seq.nextval, '[LX지인]필름/RS130/화이트', '화이트톤 인테리어에 잘 어울리는 쿨한 색감의 백색 인테리어필름입니다.', 10000, '시트/필름', '스탠다드', '308.png', 14);
insert into biz_price values(biz_price_seq.nextval, '[한화홈데코]PP보드/스토리보드/시에라오크', '우드 패턴을 세밀하게 구현하여 자연스러운 질감과 0.6mm의 두께로 내구성이 아주 강한 제품입니다.', 27000, '시트/필름', '프리미엄', '309.png', 15);
insert into biz_price values(biz_price_seq.nextval, '[LX지인]필름/ES171/화이트', '화이트톤 인테리어에 잘 어울리는 웜한 색감의 백색 인테리어필름입니다.', 11000, '시트/필름', '스탠다드', '310.png', 15);
insert into biz_price values(biz_price_seq.nextval, '[LX지인]필름/프리미엄우드/NW100/월넛', '나무 질감을 표현한 제품으로 잘 닦여 청소가 쉬우며 실내에 내추럴 무드를 줄 수 있는 방수 인테리어필름입니다.', 23000, '시트/필름', '프리미엄', '311.png', 16);
insert into biz_price values(biz_price_seq.nextval, '[영림]필름/PS035/베이지', '두께 0.24 이상으로 내구성이 우수해 실내 어떤 공간이든 부착이 가능한 베이지색상 인테리어필름입니다.', 11000, '시트/필름', '스탠다드', '312.png', 16);
insert into biz_price values(biz_price_seq.nextval, '[영림]필름/영림109/PW835/우드', '두께감과 내구성이 우수하고 점착력과 안전성을 높인 우든 패턴 디자인의 원목질감 인테리어필름입니다.', 18000, '시트/필름', '프리미엄', '313.png', 17);
insert into biz_price values(biz_price_seq.nextval, '[LX지인]필름/ES160/샌드화이트', '친환경 건축자재 최우수등급을 획득한 제품으로 인체에 유해한 프탈레이트계 가소제 및 납, 수은, 카드뮴과 같은 중금속이 검출되지 않으며, 방염필증을 획득한 샌드화이트톤 방염필름입니다.', 12000, '시트/필름', '스탠다드', '314.png', 17);
insert into biz_price values(biz_price_seq.nextval, '[영림]필름/영림177/PX449-2/발렌 포그', '대리석 패턴으로 일반 시트지에 비해 스크래치에 강하고 재질이 두꺼운 특수인쇄 화이트톤 인테리어필름입니다.', 27000, '시트/필름', '프리미엄', '315.png', 18);
insert into biz_price values(biz_price_seq.nextval, '[한솔홈데코]pp보드/스토리보드/포그그레이SM', '흔하지 않은 포그그레이 컬러의 다용도 방염 처리 인테리어필름입니다.', 11000, '시트/필름', '스탠다드', '316.png', 18);
insert into biz_price values(biz_price_seq.nextval, '[레놀릿] 필름/S-490466/콘크리트화이트(2type)', '콘크리트 벽의 질감을 그대로 표현한 화이트톤의 고급 인테리어필름입니다.', 24000, '시트/필름', '프리미엄', '317.png', 19);
insert into biz_price values(biz_price_seq.nextval, '[LX지인]필름/ES124/화이트', '따뜻함이 가미된 화이트톤으로 방수가 가능하며 이물질이 묻어도 손쉽게 닦아낼 수 있어 관리가 용이한 인테리어필름입니다.', 14000, '시트/필름', '스탠다드', '318.png', 19);
insert into biz_price values(biz_price_seq.nextval, '[레놀릿] 필름/트로이/오크 내츄럴', '원목의 옹이와 결을 진짜처럼 잘 살려 만들어 고가의 원목시공이 부담스러운 공간에 잘 어우러지는 인테리어필름입니다.', 26000, '시트/필름', '프리미엄', '319.png', 20);
insert into biz_price values(biz_price_seq.nextval, '[LG하우시스]필름/ES86/RS86/화이트', '표면 특수코팅을 통한 Non-Scratch 기능과 Painting 기법을 통해 단색의 편안함을 극대화한 화이트톤의 프리미엄 인테리어필름입니다.', 19000, '시트/필름', '스탠다드', '320.png', 20);


commit;