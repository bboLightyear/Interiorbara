-- shop_product table
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
-- shop_product sequence
create sequence seq_shop_product;
-- shop_category table
create table shop_category (
    category_id number,
    parent_category_id number,
    name varchar2(52)
);
-- shop_seller table
create table shop_seller (
    seller_id number,
    nickname varchar2(52),
    introduce varchar2(100)
);
-- shop_seller sequence
create sequence seq_shop_seller;
-- shop_option table
create table shop_option (
    option_id number,
    option_set_id number,
    parent_option_id number,
    name varchar2(52),
    stock number,
    price number,
    discounted_price number
);
-- shop_option sequence
create sequence seq_shop_option;
-- shop_option_set table
create table shop_option_set (
    option_set_id number,
    name varchar2(30)
);
-- shop_option_set sequence
create sequence seq_shop_option_set;
-- shop_basket table
create table shop_basket (
    basket_id number,
    user_id number,
    product_id number,
    option_id number,
    quantity number,
    option_text varchar2(150)
);
-- shop_basket sequence
create sequence seq_shop_basket;
-- shop_order table
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
    payment_type varchar2(20),
    order_date date,
    total_price number,
    total_delivery_fee number,
    amount number
);
-- shop_order sequence
create sequence seq_shop_order;
-- shop_order_product table
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
-- shop_order_product sequence
create sequence seq_shop_order_product;
-- shop_review table
create table shop_review (
    review_id number,
    product_id number,
    user_id number,
    score number,
    file_src varchar2(100),
    content varchar2(300),
    reg_date date
);
-- shop_review sequence
create sequence seq_shop_review;
-- shop_qna table
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
-- shop_qna sequence
create sequence seq_shop_qna;
-- shop_detail_img table
create table shop_detail_img (
    detail_img_id number,
    product_id number,
    file_src varchar2(100)
);
-- shop_detail_img sequence
create sequence seq_shop_detail_img;
-- shop_product_img table
create table shop_product_img (
    product_img_id number,
    product_id number,
    file_src varchar2(100)
);
-- shop_product_img sequence
create sequence seq_shop_product_img;