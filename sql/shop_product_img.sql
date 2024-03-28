

create table shop_product_img (
    product_img_id number,
    product_id number,
    file_src varchar2(100)
);

create sequence seq_product_img;

/
begin
    for i in 1..300 loop
        insert into shop_product values (
            seq_shop_product.nextval,
            (select
                category_id
            from (
                select
                    category_id
                from
                    shop_category
                order by
                    dbms_random.value)
            where
                rownum = 1),
            1,
            '상품 이름 ' || dbms_random.string('L', 10));
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_chicken_burger.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_classic_cheese_burger.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_hanwu_bulgogi.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_ria_miracle_2.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_teri_burger.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'square_saewu_double_burger.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'thigh_burger.png');
            
    end loop;
    commit;
end;
/

/
begin
    for i in 1..300 loop
        insert into shop_product values (
            seq_shop_product.nextval,
            (select
                category_id
            from (
                select
                    category_id
                from
                    shop_category
                order by
                    dbms_random.value)
            where
                rownum = 1),
            5,
            '상품 이름 ' || dbms_random.string('L', 10));
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_chicken_burger.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_classic_cheese_burger.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_hanwu_bulgogi.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_ria_miracle_2.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_teri_burger.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'square_saewu_double_burger.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'thigh_burger.png');
            
    end loop;
    commit;
end;
/

/
begin
    for i in 1..300 loop
        insert into shop_product values (
            seq_shop_product.nextval,
            (select
                category_id
            from (
                select
                    category_id
                from
                    shop_category
                order by
                    dbms_random.value)
            where
                rownum = 1),
            6,
            '상품 이름 ' || dbms_random.string('L', 10));
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_chicken_burger.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_classic_cheese_burger.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_hanwu_bulgogi.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_ria_miracle_2.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'double_teri_burger.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'square_saewu_double_burger.png');
            
        insert into shop_product_img values (
            seq_product_img.nextval,
            seq_shop_product.currval,
            'thigh_burger.png');
            
    end loop;
    commit;
end;
/
    
select * from shop_product_img;

select
    *
from
    shop_product_img
where
    product_id = 1;