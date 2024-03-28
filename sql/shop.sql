--delete shop_product;
drop table shop_product purge;
drop sequence seq_shop_product;

create table shop_product (
    product_id number,
    category_id number,
    option_set_id number,
    name varchar2(100)
);

create sequence seq_shop_product;

select
    category_id
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
