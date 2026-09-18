create database flipkart;


create table products(
product_id SERIAL PRIMARY KEY,
name varchar(100) not null,
sku_code CHAR(8) UNIQUE not null check(char_length(sku_code) = 8),
price NUMERIC(7,2) CHECK (price > 0),
quantity INT DEFAULT 0 CHECK(quantity >= 0),
is_available BOOLEAN DEFAULT TRUE,
category TEXT NOT NULL,

-- Array 
tags TEXT[],

specification JSONB,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
last_updated TIMESTAMP DEFAULT now()

)


insert into products 
values(
1,
'bottle',
'BTL0012e',
21324.56,
10,
true,
'water bottle',
ARRAY['plastic','reusable'],
'{"color":"blue","capacity":"1lt","material":"plastic"}'
)




INSERT INTO products
(name, sku_code, price, quantity, is_available, category, tags, specification)
VALUES
(
    'Water Bottle',
    'BTL00001',
    499.99,
    50,
    TRUE,
    'Kitchen',
    ARRAY['plastic', 'reusable', '1L'],
    '{"color": "blue", "capacity": "1L", "material": "plastic"}'
),
(
    'Wireless Mouse',
    'MOU00001',
    799.50,
    25,
    TRUE,
    'Electronics',
    ARRAY['wireless', 'usb', 'mouse'],
    '{"color": "black", "dpi": 1600, "connection": "2.4GHz"}'
),
(
    'Mechanical Keyboard',
    'KEY00001',
    2499.00,
    15,
    TRUE,
    'Electronics',
    ARRAY['keyboard', 'mechanical', 'gaming'],
    '{"switch": "blue", "layout": "QWERTY", "backlit": true}'
),
(
    'Running Shoes',
    'SHO00001',
    3299.99,
    20,
    TRUE,
    'Footwear',
    ARRAY['shoes', 'running', 'sports'],
    '{"color": "white", "size": 9, "material": "mesh"}'
),
(
    'Backpack',
    'BAG00001',
    1499.00,
    30,
    TRUE,
    'Bags',
    ARRAY['backpack', 'travel', 'school'],
    '{"color": "black", "capacity": "25L", "waterproof": true}'
),
(
    'Coffee Mug',
    'MUG00001',
    299.50,
    100,
    TRUE,
    'Kitchen',
    ARRAY['mug', 'ceramic', 'coffee'],
    '{"color": "white", "capacity": "350ml", "material": "ceramic"}'
),
(
    'USB-C Cable',
    'CAB00001',
    349.99,
    75,
    TRUE,
    'Electronics',
    ARRAY['usb-c', 'charging', 'cable'],
    '{"length": "2m", "power": "100W", "material": "nylon"}'
),
(
    'Desk Lamp',
    'LAM00001',
    899.00,
    40,
    TRUE,
    'Home',
    ARRAY['lamp', 'desk', 'led'],
    '{"color": "white", "wattage": "12W", "type": "LED"}'
),
(
    'Notebook',
    'NOT00001',
    199.99,
    200,
    TRUE,
    'Stationery',
    ARRAY['notebook', 'paper', 'writing'],
    '{"pages": 200, "size": "A5", "paper": "80gsm"}'
),
(
    'Bluetooth Speaker',
    'SPK00001',
    1899.50,
    10,
    TRUE,
    'Electronics',
    ARRAY['speaker', 'bluetooth', 'portable'],
    '{"color": "black", "battery": "10 hours", "waterproof": true}'
);


select * from products;


select name, quantity, price from products;

select * from products
where specification ->> 'color' = 'blue';


select * from products 
where 'wireless' = Any(tags);



-- question 

select * from products;

-- 1
select name,price from products;

-- 2

select * from products
where category = 'Electronics';

-- 3
select category from products 
group by category;

-- 4

select category, count(*) from products
group by category
having count(*) > 1;


-- 5 

select * from products
order by price DESC;

-- 6

select * from products
limit 3;



-- 7

select name as item_name, price as item_price
from products;


--  8 
select Distinct category from products;




-- string function

select lower(name) from products;

select length(sku_code) from products


select substr('hassan ashraf',1,6);

select name, SUBSTR(sku_code,1,3) from products;

select name,
lower(substr(sku_code,1,2)) as sku_code_lower
from products;


select left('brother lololol',7);


select concat(name,' ',category) from products;

select concat_ws(' ',name,category)
from products;











-- comparison operator

select * from products where price < 1000;

select * from products 
where category != 'Electronics';



select * from products
where price < 1000 AND category = 'Electronics';

-- 

select * from products
where price < 1000 And price > 400;  

-- alternate 
-- you can use - between -

select * from products 
where price Between 400 AND 1000;

-- 


-- 

select * from products 
where category = 'Electronics' or
category = 'Kitchen';

 
-- alternate 
-- you can use - in -

select * from products 
where category In('Electronics','Home');

--

-- pattern matching 

select * from products
where sku_code like 'M%' 



select * from products
where not category = 'Electronics'



------------------------

-- Aggregation function 


select count(product_id) from products;

select sum(price) from products
where category = 'Electronics';


select name, min(price) from products;

-----

-- Test 2 

-- 1
select name, price from products
order by price
limit 1


-- 2
select category,avg(price)
from products
where category In ('Home','Kitchen','Footwear')
group by category;


-- 3

select name,quantity
from products
where is_available = true 
And quantity > 50 And
price != 299;




-- 4

select category, max(price)
from products
group by category;



-- 5

select Distinct
upper(category) 
from products
order by upper(category) DESC;

