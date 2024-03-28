create table shop_basket (
    basket_id number,
    user_id number,
    product_id number,
    option_id number,
    quantity number
);

create sequence seq_shop_basket;


drop table shop_basket;
insert into shop_basket values (1, 1, 424, 4, 1);
--insert into shop_basket values (2, 1, 424, 10, 1);
--insert into shop_basket values (3, 1, 424, 13, 1);

commit;

select * from shop_basket;

select
    *
from
    shop_basket b
join
    shop_option o
on
    b.option_id = o.option_id;
    
select
    b.basket_id, b.user_id, b.option_id, b.quantity, o.option_set_id set_id, o.name
from
    shop_basket b
join
    shop_option o
on
    b.option_id = o.option_id;
    
select
    b.basket_id, b.user_id, b.option_id, b.quantity, o.name, s.name
from
    shop_basket b
join
    shop_option o
on
    b.option_id = o.option_id
join
    shop_option_set s
on
    o.option_set_id = s.option_set_id;
    
select
    b.basket_id, b.user_id, b.option_id, b.quantity, o.option_set_id set_id, o.name, s.name, o2.name
from
    shop_basket b
join
    shop_option o
on
    b.option_id = o.option_id
join
    shop_option_set s
on
    o.option_set_id = s.option_set_id
left outer join
    shop_option o2
on
    s.option_set_id = o2.sub_option_set_id;
    
select
    b.basket_id, b.user_id, b.option_id, b.quantity, s2.name, o2.name, s.name, o.name, d.price
from
    shop_basket b
join
    shop_option o
on
    b.option_id = o.option_id
join
    shop_product_data d
on
    o.product_data_id = d.product_data_id
join
    shop_option_set s
on
    o.option_set_id = s.option_set_id
left outer join
    shop_option o2
on
    s.option_set_id = o2.sub_option_set_id
left outer join
    shop_option_set s2
on
    o2.option_set_id = s2.option_set_id
where
    user_id = 1;