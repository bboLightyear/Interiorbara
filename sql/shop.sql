--delete shop_product;
drop table shop_product purge;
drop sequence seq_shop_product;

SELECT
    P.PRODUCT_ID,
    P.SELLER_ID,
    P.CATEGORY_ID,
    P.NAME,
    P.REP_PRICE,
    P.REP_DISCOUNTED_PRICE,
    P.IS_DISCOUNTED,
    P.DISCOUNT_RATE,
    P.DELIVERY_FEE,
    P.DELIVERY_TYPE,
    P.REF_PRICE,
    P.OPTION_TYPE,
    P.OPTION1_SET_ID,
    P.OPTION2_SET_ID,
    P.REG_TIME,
    P.HITS,
    P.SALES,
    P.SCRAPS,
    P.REVIEWS,
    S.NICKNAME,
    I.FILE_SRC
FROM
    SHOP_PRODUCT P
JOIN
    SHOP_SELLER S
ON
    P.SELLER_ID = S.SELLER_ID
JOIN (
    SELECT
        ROWNUM, II.*
    FROM
        SHOP_PRODUCT_IMG II
    WHERE
        II.PRODUCT_ID = 42 AND ROWNUM = 1) I
ON
    P.PRODUCT_ID = I.PRODUCT_ID;
WHERE
    P.PRODUCT_ID = 42;
    
SELECT 
    p.*,
    pi.* 
FROM 
    shop_product p
JOIN 
    (SELECT 
         product_id,
         file_src,
         ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY product_img_id) AS rn
     FROM 
         shop_product_img) pi
ON 
    p.product_id = pi.product_id
WHERE 
    pi.rn = 1;


create table shop_product (
    product_id number,
    seller_id number,
    category_id number,
    option_set_id number,
    detail_info_id number,
    name varchar2(100)
);

create sequence seq_shop_product;

commit;

select
    category_id OPTION_NAME
from (
    select
        category_id
    from
        shop_category
    order by
        dbms_random.value)
where
    rownum = 1;
    
select * from shop_product;
    
--/
--begin
--    for i in 1..300 loop
--        insert into shop_product values (
--            seq_shop_product.nextval,
--            (select
--                category_id
--            from (
--                select
--                    category_id
--                from
--                    shop_category
--                order by
--                    dbms_random.value)
--            where
--                rownum = 1),
--            6,
--            '상품 이름 ' || dbms_random.string('L', 10));
--    end loop;
--    commit;
--end;
--/

commit;


--insert into shop_product_data values (seq_shop_product_data.nextval, 10, 499000, 169000);
--insert into shop_product_data values (seq_shop_product_data.nextval, 10, 619000, 209000);
--insert into shop_product_data values (seq_shop_product_data.nextval, 10, 589000, 199000);
--insert into shop_product_data values (seq_shop_product_data.nextval, 10, 739000, 249000);

--insert into shop_product values (seq_shop_product.nextval, 10104, 0, '상품이름1');
--insert into shop_product values (seq_shop_product.nextval, 10105, 0, '상품이름2');
--insert into shop_product values (seq_shop_product.nextval, 10106, 0, '상품이름3');
--insert into shop_product values (seq_shop_product.nextval, 10107, 0, '상품이름2');
--insert into shop_product values (seq_shop_product.nextval, 10108, 0, '상품이름3');
--insert into shop_product values (seq_shop_product.nextval, 10109, 0, '상품이름4');
--insert into shop_product values (seq_shop_product.nextval, 10103, 0, '상품이름77');
--
--insert into shop_product values (seq_shop_product.nextval, 13, 1, '아이비 원목 침대 프레임 (순면매트리스 선택) (슈퍼싱글/퀸)');
--insert into shop_product values (seq_shop_product.nextval, 3, 1, '아이비 원목 침대 프레임 (순면매트리스 선택) (슈퍼싱글/퀸)');
--insert into shop_product values (seq_shop_product.nextval, 14, 1, 'asdfasdf');
--insert into shop_product values (seq_shop_product.nextval, 18, 1, '112321312');
