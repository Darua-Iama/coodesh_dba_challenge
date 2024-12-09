   ...> sqlite>
   ...> .open bikestores.db
   ...>
sqlite> CREATE TABLE customers (
(x1...>     customer_id INTEGER PRIMARY KEY,
(x1...>     first_name TEXT NOT NULL,
(x1...>     last_name TEXT NOT NULL,
(x1...>     phone TEXT,
(x1...>     email TEXT,
(x1...>     street TEXT,
(x1...>     city TEXT,
(x1...>     state TEXT,
(x1...>     zip_code TEXT
(x1...> );
sqlite> .tables
customers
sqlite> CREATE TABLE products (
(x1...>     product_id INTEGER PRIMARY KEY,
(x1...>     product_name TEXT NOT NULL,
(x1...>     brand_id INTEGER,
(x1...>     category_id INTEGER,
(x1...>     model_year INTEGER,
(x1...>     list_price REAL,
(x1...>     FOREIGN KEY (brand_id) REFERENCES brands (brand_id),
(x1...>     FOREIGN KEY (category_id) REFERENCES categories (category_id)
(x1...> );
sqlite> CREATE TABLE orders (
(x1...>     order_id INTEGER PRIMARY KEY,
(x1...>     customer_id INTEGER,
(x1...>     order_status TEXT,
(x1...>     order_date TEXT,
(x1...>     required_date TEXT,
(x1...>     shipped_date TEXT,
(x1...>     store_id INTEGER,
(x1...>     staff_id INTEGER,
(x1...>     FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
(x1...>     FOREIGN KEY (store_id) REFERENCES stores (store_id),
(x1...>     FOREIGN KEY (staff_id) REFERENCES staffs (staff_id)
(x1...> );
sqlite> INSERT INTO customers (customer_id, first_name, last_name, phone, email, street, city, state, zip_code)
   ...> VALUES
   ...> (1, 'João', 'Silva', '123456789', 'joao@email.com.br', 'Rua A', 'São Paulo', 'SP', '12345-000'),
   ...> (2, 'Maria', 'Souza', '987654321', 'maria@email.com.br', 'Rua B', 'Rio de Janeiro', 'RJ', '98765-000');
sqlite> CREATE TABLE staffs (
(x1...>     staff_id INTEGER PRIMARY KEY,
(x1...>     first_name TEXT NOT NULL,
(x1...>     last_name TEXT NOT NULL,
(x1...>     email TEXT,
(x1...>     phone TEXT,
(x1...>     active INTEGER,
(x1...>     store_id INTEGER,
(x1...>     manager_id INTEGER,
(x1...>     FOREIGN KEY (store_id) REFERENCES stores (store_id),
(x1...>     FOREIGN KEY (manager_id) REFERENCES staffs (staff_id)
(x1...> );
sqlite> CREATE TABLE stores (
(x1...>     store_id INTEGER PRIMARY KEY,
(x1...>     store_name TEXT NOT NULL,
(x1...>     phone TEXT,
(x1...>     email TEXT,
(x1...>     street TEXT,
(x1...>     city TEXT,
(x1...>     state TEXT,
(x1...>     zip_code TEXT
(x1...> );
customers  orders     products   staffs     stores
sqlite> CREATE TABLE order_items (
(x1...>     order_id INTEGER,
(x1...>     item_id INTEGER,
(x1...>     product_id INTEGER,
(x1...>     quantity INTEGER,
(x1...>     list_price REAL,
(x1...>     discount REAL,
(x1...>     PRIMARY KEY (order_id, item_id),
(x1...>     FOREIGN KEY (order_id) REFERENCES orders (order_id),
(x1...>     FOREIGN KEY (product_id) REFERENCES products (product_id)
(x1...> );
sqlite> CREATE TABLE categories (
(x1...>     category_id INTEGER PRIMARY KEY,
(x1...>     category_name TEXT NOT NULL
(x1...> );
categories   order_items  products     stores
customers    orders       staffs
sqlite> CREATE TABLE brands (
(x1...>     brand_id INTEGER PRIMARY KEY,
(x1...>     brand_name TEXT NOT NULL
(x1...> );
sqlite>
sqlite> CREATE TABLE stocks (
(x1...>     store_id INTEGER,
(x1...>     product_id INTEGER,
(x1...>     quantity INTEGER,
(x1...>     PRIMARY KEY (store_id, product_id),
(x1...>     FOREIGN KEY (store_id) REFERENCES stores (store_id),
(x1...>     FOREIGN KEY (product_id) REFERENCES products (product_id)
(x1...> );
sqlite>
sqlite> .tables
brands       customers    orders       staffs       stores
categories   order_items  products     stocks
sqlite> INSERT INTO categories (category_id, category_name)
   ...> VALUES
   ...> (1, 'Speed'),
   ...> (2, 'Mountain'),
   ...> (3, 'Infantil');
sqlite> INSERT INTO brands (brand_id, brand_name)
   ...> VALUES
   ...> (1, 'Caloi'),
   ...> (2, 'Specialized'),
   ...> (3, 'Trek');
sqlite> INSERT INTO products (product_id, product_name, brand_id, category_id, model_year, list_price)
   ...> VALUES
   ...> (1, 'Bike Speed', 1, 1, 2023, 5000.00),
   ...> (2, 'Mountain Bike', 2, 2, 3000.00),
   ...> (3, 'Bike Infantil', 1, 3, 1500.00);
Parse error: all VALUES must have the same number of terms
sqlite> INSERT INTO products (product_id, product_name, brand_id, category_id, model_year, list_price)
   ...> VALUES (1, 'Bike Speed', 1, 1, 2023, 5000.00);
sqlite> INSERT INTO products (product_id, product_name, brand_id, category_id, model_year, list_price)
   ...> VALUES (2, 'Mountain Bike', 2, 2, 2022, 3000.00);
sqlite> INSERT INTO products (product_id, product_name, brand_id, category_id, model_year, list_price)
   ...> VALUES (3, 'Bike Infantil', 1, 3, 2021, 1500.00);
sqlite> INSERT INTO stores (store_id, store_name, phone, email, street, city, state, zip_code)
   ...> VALUES
   ...> (1, 'Loja A', '11962053736', 'contato@lojaa.com.br', 'Av. Central', 'São Paulo', 'SP', '12345-000'),
   ...> (2, 'Loja B', '21962053736', 'contato@lojab.com.br', 'Rua da Praia', 'Rio de Janeiro', 'RJ', '98765-000'),
   ...> (3, 'Loja C', '11962053737', 'contato@lojac.com.br', 'Av. Marginal', 'São Paulo', 'SP', '56789-000');
sqlite> INSERT INTO stocks (store_id, product_id, quantity)
   ...> VALUES
   ...> (1, 1, 10),
   ...> (1, 2, 5),
   ...> (1, 3, 3),
   ...> (2, 1, 5),
   ...> (2, 2, 5),
   ...> (2, 3, 5),
   ...> (3, 3, 50);
sqlite> INSERT INTO customers (customer_id, first_name, last_name, phone, email, street, city, state, zip_code)
   ...> VALUES
   ...> (1, 'Augustin', 'Rossi', '11962053738', 'arossi@email.com.br', 'Rua A', 'São Paulo', 'SP', '12345-001'),
   ...> (2, 'Cristiane', 'Roseira', '21962053738', 'croseira@email.com.br', 'Rua C', 'Rio de Janeiro', 'RJ', '98765-001'),
   ...> (3, 'Gabriel', 'Barbosa', '11962053739', 'gbarbosa@email.com.br', 'Rua G', 'São Paulo', 'SP', '12345-002'),
   ...> (4, 'Eduarda', 'Silva', '21962053739', 'esilva@email.com.br', 'Rua E', 'Rio de Janeiro', 'RJ', '98765-002'),
   ...> (5, 'Felipe', 'Luiz', '11962053740', 'fluiz@email.com.br', 'Rua F', 'São Paulo', 'SP', '12345-003');
Runtime error: UNIQUE constraint failed: customers.customer_id (19)
sqlite> SELECT * FROM customers;
1|João|Silva|123456789|joao@email.com|Rua A|São Paulo|SP|12345-678
2|Maria|Souza|987654321|maria@email.com|Rua B|Rio de Janeiro|RJ|98765-432
sqlite> UPDATE customers
   ...> SET first_name = 'Augustin',
   ...>     last_name = 'Rossi',
   ...>     phone = '11962053738',
   ...>     email = 'arossi@email.com.br',
   ...>     street = 'Rua A',
   ...>     city = 'São Paulo',
   ...>     state = 'SP',
   ...>     zip_code = '12345-001'
   ...> WHERE customer_id = 1;
sqlite> UPDATE customers
   ...> SET first_name = 'Cristiane',
   ...>     last_name = 'Roseira',
   ...>     phone = '21962053738',
   ...>     email = 'croseira@email.com.br',
   ...>     street = 'Rua C',
   ...>     city = 'Rio de Janeiro',
   ...>     state = 'RJ',
   ...>     zip_code = '98765-001'
   ...> WHERE customer_id = 2;
sqlite> INSERT INTO customers (customer_id, first_name, last_name, phone, email, street, city, state, zip_code)
   ...> VALUES
   ...> (3, 'Gabriel', 'Barbosa', '11962053739', 'gbarbosa@email.com.br', 'Rua G', 'São Paulo', 'SP', '12345-002'),
   ...> (4, 'Eduarda', 'Silva', '21962053739', 'esilva@email.com.br', 'Rua E', 'Rio de Janeiro', 'RJ', '98765-002'),
   ...> (5, 'Felipe', 'Luiz', '11962053740', 'fluiz@email.com.br', 'Rua F', 'São Paulo', 'SP', '12345-003');
sqlite> UPDATE categories
   ...> SET category_id = 3
   ...> ,   category_name = child;
Parse error: no such column: child
  ategories SET category_id = 3 ,   category_name = child;
                                      error here ---^
sqlite> UPDATE categories
   ...> SET category_id = 3,
   ...>     category_name = 'kids'
   ...> WHERE category_id = 3;
sqlite> select * categories
   ...>
   ...> select * categories
   ...> select * categories;
Parse error: near "categories": syntax error
  select * categories  select * categories select * categories;
           ^--- error here
sqlite> select * categories;
Parse error: near "categories": syntax error
  select * categories;
           ^--- error here
sqlite> SELECT * FROM categories;
1|Speed
2|Mountain
3|kids
sqlite> INSERT INTO staffs (staff_id, first_name, last_name, email, phone, active, store_id, manager_id)
   ...> VALUES
   ...> (1, 'Gabriela', 'Portilho', 'gportilho@lojaa.com.br', '11962053741', 1, 1, 1),
   ...> (2, 'David', 'Luiz', 'dluiz@lojaa.com.br', '11962053742', 1, 1, 1),
   ...> (3, 'Anna', 'Luiza', 'aluiza@lojab.com.br', '21962053740', 1, 2, 1),
   ...> (4, 'Gillermo', 'Varela', 'gvarela@lojab.com.br', '21962053741', 1, 2, 1),
   ...> (5, 'Wesley', 'Lima', 'wlima@lojac.com.br', '11962053743', 1, 3, 1),
   ...> (6, 'Georgian', 'Arrascaeta', 'garrascaeta@lojac.com.br', '11962053744', 1, 3, 1),
   ...>
   ...> (7, 'Erik', 'Pulgar', 'epulgar@lojac.com.br', '11962053745', 1, 3, 1);
sqlite> INSERT INTO order_items (order_id, item_id, product_id, quantity, list_price, discount)
   ...> VALUES
   ...> (1, 1, 1, 2, 7000.00, 20.00),
   ...> (2, 1, 2, 1, 3000.00, 0.00),
   ...> (3, 1, 3, 1, 2000.00, 0.00),
   ...> (4, 1, 3, 2, 4000.00, 50.00),
   ...> (5, 1, 3, 5, 10000.00, 200.00);
sqlite> SELECT * FROM customers;
1|Augustin|Rossi|11962053738|arossi@email.com.br|Rua A|São Paulo|SP|12345-001
2|Cristiane|Roseira|21962053738|croseira@email.com.br|Rua C|Rio de Janeiro|RJ|98765-001
3|Gabriel|Barbosa|11962053739|gbarbosa@email.com.br|Rua G|São Paulo|SP|12345-002
4|Eduarda|Silva|21962053739|esilva@email.com.br|Rua E|Rio de Janeiro|RJ|98765-002
5|Felipe|Luiz|11962053740|fluiz@email.com.br|Rua F|São Paulo|SP|12345-003
sqlite> SELECT * FROM staffs;
1|Gabriela|Portilho|gportilho@lojaa.com.br|11962053741|1|1|1
2|David|Luiz|dluiz@lojaa.com.br|11962053742|1|1|1
3|Anna|Luiza|aluiza@lojab.com.br|21962053740|1|2|1
4|Gillermo|Varela|gvarela@lojab.com.br|21962053741|1|2|1
5|Wesley|Lima|wlima@lojac.com.br|11962053743|1|3|1
6|Georgian|Arrascaeta|garrascaeta@lojac.com.br|11962053744|1|3|1
7|Erik|Pulgar|epulgar@lojac.com.br|11962053745|1|3|1
sqlite> SELECT * FROM stores;
1|Loja A|11962053736|contato@lojaa.com.br|Av. Central|São Paulo|SP|12345-000
2|Loja B|21962053736|contato@lojab.com.br|Rua da Praia|Rio de Janeiro|RJ|98765-000
3|Loja C|11962053737|contato@lojac.com.br|Av. Marginal|São Paulo|SP|56789-000
sqlite> SELECT * FROM orders;
sqlite> SELECT * FROM order_items;
1|1|1|2|7000.0|20.0
2|1|2|1|3000.0|0.0
3|1|3|1|2000.0|0.0
4|1|3|2|4000.0|50.0
5|1|3|5|10000.0|200.0
sqlite>  SELECT * FROM orders;
sqlite> INSERT INTO orders (order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
   ...> VALUES
   ...> (1, 3, 'completed', '2024-03-01', '2024-03-05', '2024-03-06', 2, 4),
   ...> (2, 5, 'completed', '2024-06-10', '2024-06-15', '2024-06-16', 1, 1),
   ...> (3, 3, 'completed', '2024-06-11', '2024-06-16', '2024-06-17', 3, 6),
   ...> (4, 2, 'completed', '2024-09-01', '2024-09-05', '2024-09-06', 2, 3),
   ...> (5, 3, 'pending', '2024-09-10', NULL, NULL, 3, 7);
sqlite> SELECT c.customer_id, c.first_name, c.last_name, c.email
   ...> FROM customers c
   ...> LEFT JOIN orders o ON c.customer_id = o.customer_id
   ...> WHERE o.order_id IS NULL;
1|Augustin|Rossi|arossi@email.com.br
4|Eduarda|Silva|esilva@email.com.br
sqlite> SELECT p.product_id, p.product_name, p.list_price
   ...> FROM products p
   ...> LEFT JOIN order_items oi ON p.product_id = oi.product_id
   ...> WHERE oi.product_id IS NULL;
sqlite> SELECT p.product_id, p.product_name, s.store_id, s.quantity
   ...> FROM products p
   ...> JOIN stocks s ON p.product_id = s.product_id
   ...> WHERE s.quantity = 0;
sqlite> SELECT p.product_id, p.product_name, s.store_id, s.quantity
   ...> FROM products p
   ...> JOIN stocks s ON p.product_id = s.product_id
   ...> WHERE s.quantity = 0;
sqlite> SELECT b.brand_name, st.store_name, SUM(oi.quantity) AS total_sold
   ...> FROM brands b
   ...> JOIN products p ON b.brand_id = p.brand_id
   ...> JOIN order_items oi ON p.product_id = oi.product_id
   ...> JOIN orders o ON oi.order_id = o.order_id
   ...> JOIN stores st ON o.store_id = st.store_id
   ...> GROUP BY b.brand_name, st.store_name;
Caloi|Loja B|4
Caloi|Loja C|6
Specialized|Loja A|1
sqlite> SELECT s.staff_id, s.first_name, s.last_name, s.email
   ...> FROM staffs s
   ...> LEFT JOIN orders o ON s.staff_id = o.staff_id
   ...> WHERE o.staff_id IS NULL;
2|David|Luiz|dluiz@lojaa.com.br
5|Wesley|Lima|wlima@lojac.com.br