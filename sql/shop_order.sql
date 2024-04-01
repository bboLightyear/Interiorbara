create table shop_order_state (
    order_state_id number,
    state varchar2(12)
);

insert into shop_order_state values (1, '주문전');
insert into shop_order_state values (2, '입금대기');
insert into shop_order_state values (3, '결제완료');
insert into shop_order_state values (4, '배송준비');
insert into shop_order_state values (5, '배송중');
insert into shop_order_state values (6, '배송완료');
insert into shop_order_state values (7, '구매확정');


create table shop_payment_type (
    payment_type_id number,
    name varchar2(15)
);

insert into shop_payment_type values (1, '카드');
insert into shop_payment_type values (2, '무통장입금');
insert into shop_payment_type values (3, '카카오페이');
insert into shop_payment_type values (4, '네이버페이');
insert into shop_payment_type values (5, '페이코');
insert into shop_payment_type values (6, '토스');
insert into shop_payment_type values (7, '핸드폰');

create table shop_payment_info (
    payment_info_id number,
    payment_type_id number,
    pay_account varchar2(50),
    card_name varchar2(15)
);

create table shop_user_addr (
    user_addr_id number,
    default_addr number,
    user_id number,
    name varchar2(30),
    receiver_name varchar2(20),
    phone_number number,
    zipcode number,
    addr varchar2(100),
    detail_addr varchar2(50)
);

create table shop_orderer_info (
    orderer_info_id number,
    user_id number,
    name varchar2(30),
    phone_number number,
    email varchar2(100)
);

create table shop_order_product (
    order_product_id number,
    order_id number,
    product_id number,
    option_id number,
    name varchar2(100),
    price number,
    quantity number,
    option_text varchar2(200)
);

create table shop_order (
    order_id number,
    user_id number,
    order_state_id number,
    user_addr_id number,
    orderer_info_id number,
    payment_info_id number,
    order_date date,
    amount number
);

create sequence seq_shop_order;
create sequence seq_order_product;