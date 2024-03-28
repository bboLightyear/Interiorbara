--delete shop_option_set;
--delete shop_option;
--delete shop_product_data;
--drop table shop_option_set purge;
--drop table shop_option purge;
--drop table shop_product_data purge;
--drop sequence seq_shop_option_set;
--drop sequence seq_shop_option;
--drop sequence seq_shop_product_data;

create table shop_option_set (
    option_set_id number,
    name varchar2(100)
);

create table shop_option (
    option_id number,
    option_set_id number,
    sub_option_set_id number,
    product_data_id number,
    name varchar2(100)
);

create table shop_product_data (
    product_data_id number,
    stock number,
    price number,
    discounted_price number
);

select
    o.option_id, o.option_set_id, o.name, d.stock, d.price, d.discounted_price
from
    shop_option o
join
    shop_product_data d
on
    o.product_data_id = d.product_data_id
where
    o.option_id = 10;


create sequence seq_shop_option_set;
create sequence seq_shop_option;
create sequence seq_shop_product_data;

select * from shop_option_set;
select * from shop_option;
select * from shop_product_data;

commit;

select
    p.name
from
    shop_option o
join
    shop_option o2
on
    o2.sub_option_set_id = o.option_set_id
join
    shop_product p
on
    p.option_set_id = o2.option_set_id
where
    o.option_id = 4;


select
    option_set_id
from
    shop_option
where
    option_id = 4;


select
    *
from
    shop_product
where
    option_set_id = (
    select
        option_set_id
    from
        shop_option
    where
        option_id = 4);

select
    name
from
    shop_option_set
where
    option_set_id = (
    select
        option_set_id
    from
        shop_option
    where
        sub_option_set_id = (
            select
                option_set_id
            from
                shop_option
            where
                option_id = 4));

select
    name
from
    shop_option
where
    sub_option_set_id = (
        select
            option_set_id
        from
            shop_option
        where
            option_id = 4);

select
    name
from
    shop_option_set
where option_set_id = (
    select
        option_set_id
    from
        shop_option
    where
        option_id = 4);
    

select
    name
from
    shop_option
where
    option_id = 4;

select
    *
from
    shop_product_data
where
    product_data_id = (
    select
        min(product_data_id)
    from
        shop_option
    where
        option_set_id = (
        select
            min(option_set_id)
        from
            shop_option_set
        where
            option_set_id in (
            select
                sub_option_set_id
            from
                shop_option
            where
                option_set_id = (
                select
                    option_set_id
                from
                    shop_option_set
                where
                    option_set_id = (
                    select
                        option_set_id
                    from
                        shop_product
                    where
                        product_id = 2)))));


select
    *
from
    shop_option
where
    option_set_id = (
    select
        min(option_set_id)
    from
        shop_option_set
    where
        option_set_id in (
        select
            sub_option_set_id
        from
            shop_option
        where
            option_set_id = (
            select
                option_set_id
            from
                shop_option_set
            where
                option_set_id = (
                select
                    option_set_id
                from
                    shop_product
                where
                    product_id = 2))));

select
    *
from
    shop_option_set
where
    option_set_id in (
    select
        sub_option_set_id
    from
        shop_option
    where
        option_set_id = (
        select
            option_set_id
        from
            shop_option_set
        where
            option_set_id = (
            select
                option_set_id
            from
                shop_product
            where
                product_id = 2)));

select
    *
from
    shop_option
where
    option_set_id = (
    select
        option_set_id
    from
        shop_option_set
    where
        option_set_id = (
        select
            option_set_id
        from
            shop_product
        where
            product_id = 2));


select
    *
from
    shop_option_set
where
    option_set_id = (
    select
        option_set_id
    from
        shop_product
    where
        product_id = 2);
        
select
    *
from
    shop_product
    order by product_id;
--where
--    product_id = 2;

select
    min(d.price)
from
    shop_option o
join
    shop_product_data d
on
    o.product_data_id = d.product_data_id
where
    o.option_set_id in (
    select
        option_set_id
    from
        shop_option_set
    where
        option_set_id in (
        select
            sub_option_set_id
        from
            shop_option
        where
            option_set_id = 1));

select
    min(price)
from
    (select
        product_data_id, stock, price, discounted_price
    from
        shop_product_data
    where
        product_data_id in (
        select
            product_data_id
        from
            shop_option
        where
            option_set_id in (
            select
                option_set_id
            from
                shop_option_set
            where
                option_set_id in (
                select
                    sub_option_set_id
                from
                    shop_option
                where
                    option_set_id = 1))));

select
    *
from
    shop_option
where
    option_set_id in (
    select
        option_set_id
    from
        shop_option_set
    where
        option_set_id in (
        select
            sub_option_set_id
        from
            shop_option
        where
            option_set_id = 1));


select
    *
from
    shop_option_set
where
    option_set_id in (
    select
        sub_option_set_id
    from
        shop_option
    where
        option_set_id = (
        select
            option_set_id
        from
            shop_option_set
        where
            option_set_id = 1));


select
    *
from
    shop_option
where
    option_set_id = (
    select
        option_set_id
    from
        shop_option_set
    where
        option_set_id = 1);
    
    
select
    option_set_id
from
    shop_option_set
where
    option_set_id = 1;

select
    o.option_id, o.option_set_id, o.name, d.stock, d.price, d.discounted_price
from
    shop_option o
join
    shop_product_data d
on
    o.product_data_id = d.product_data_id
where
    o.option_id = 10;

commit;

insert into shop_option_set values (1, '사이즈');
insert into shop_option_set values (2, '색상');
insert into shop_option_set values (3, '색상');
insert into shop_option_set values (4, '색상');
insert into shop_option_set values (5, '길이');
insert into shop_option_set values (6, null);

insert into shop_product_data values (1, 10, 20000, 10000);
insert into shop_product_data values (2, 10, 20000, 10000);
insert into shop_product_data values (3, 10, 30000, 15000);
insert into shop_product_data values (4, 10, 30000, 15000);
insert into shop_product_data values (5, 10, 40000, 20000);
insert into shop_product_data values (6, 10, 40000, 20000);

insert into shop_product_data values (7, 100, 3000, null);
insert into shop_product_data values (8, 100, 4000, null);
insert into shop_product_data values (9, 100, 5000, null);

insert into shop_product_data values (10, 100, 10000, null);

insert into shop_option values (1, 1, 2, null, '소');
insert into shop_option values (2, 1, 3, null, '중');
insert into shop_option values (3, 1, 4, null, '대');

insert into shop_option values (4, 2, null, 1, '검정');
insert into shop_option values (5, 2, null, 2, '하양');
insert into shop_option values (6, 3, null, 3, '검정');
insert into shop_option values (7, 3, null, 4, '하양');
insert into shop_option values (8, 4, null, 5, '검정');
insert into shop_option values (9, 4, null, 6, '하양');

insert into shop_option values (10, 5, null, 7, '30cm');
insert into shop_option values (11, 5, null, 8, '40cm');
insert into shop_option values (12, 5, null, 9, '50cm');

insert into shop_option values (13, 6, null, 10, '옵션이 없는 상품');

commit;

--insert into shop_product_data values (seq_shop_product_data.nextval, 10, 499000, 169000);
--insert into shop_product_data values (seq_shop_product_data.nextval, 10, 619000, 209000);
--insert into shop_product_data values (seq_shop_product_data.nextval, 10, 589000, 199000);
--insert into shop_product_data values (seq_shop_product_data.nextval, 10, 739000, 249000);

--insert into shop_option_set values (seq_shop_option_set.nextval, '사이즈');
--insert into shop_option_set values (seq_shop_option_set.nextval, '색상');
--insert into shop_option_set values (seq_shop_option_set.nextval, '색상');

--insert into shop_option values (seq_shop_option.nextval, 1, 2, null, '슈퍼싱글(SS)');
--insert into shop_option values (seq_shop_option.nextval, 1, 3, null, '퀸(Q)');
--insert into shop_option values (seq_shop_option.nextval, 2, null, 1, '네추럴(UL01005)');
--insert into shop_option values (seq_shop_option.nextval, 2, null, 2, '브라운(UL01007)');
--insert into shop_option values (seq_shop_option.nextval, 3, null, 3, '네추럴(UL01006)');
--insert into shop_option values (seq_shop_option.nextval, 3, null, 4, '브라운(UL01008)');



