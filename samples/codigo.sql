CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone TEXT,
    email TEXT,
    street TEXT,
    city TEXT,
    state TEXT,
    zip_code TEXT
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    brand_id INTEGER,
    category_id INTEGER,
    model_year INTEGER,
    list_price REAL,
    FOREIGN KEY (brand_id) REFERENCES brands (brand_id),
    FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_status TEXT,
    order_date TEXT,
    required_date TEXT,
    shipped_date TEXT,
    store_id INTEGER,
    staff_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (store_id) REFERENCES stores (store_id),
    FOREIGN KEY (staff_id) REFERENCES staffs (staff_id)
);

CREATE TABLE staffs (
    staff_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT,
    phone TEXT,
    active INTEGER,
    store_id INTEGER,
    manager_id INTEGER,
    FOREIGN KEY (store_id) REFERENCES stores (store_id),
    FOREIGN KEY (manager_id) REFERENCES staffs (staff_id)
);

CREATE TABLE stores (
    store_id INTEGER PRIMARY KEY,
    store_name TEXT NOT NULL,
    phone TEXT,
    email TEXT,
    street TEXT,
    city TEXT,
    state TEXT,
    zip_code TEXT
);

CREATE TABLE order_items (
    order_id INTEGER,
    item_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    list_price REAL,
    discount REAL,
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT NOT NULL
);

CREATE TABLE brands (
    brand_id INTEGER PRIMARY KEY,
    brand_name TEXT NOT NULL
);

CREATE TABLE stocks (
    store_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    PRIMARY KEY (store_id, product_id),
    FOREIGN KEY (store_id) REFERENCES stores (store_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

-- Inserção de dados

INSERT INTO categories (category_id, category_name)
VALUES
(1, 'Speed'),
(2, 'Mountain'),
(3, 'Infantil');

INSERT INTO brands (brand_id, brand_name)
VALUES
(1, 'Caloi'),
(2, 'Specialized'),
(3, 'Trek');

INSERT INTO products (product_id, product_name, brand_id, category_id, model_year, list_price)
VALUES
(1, 'Bike Speed', 1, 1, 2023, 5000.00),
(2, 'Mountain Bike', 2, 2, 2023, 3000.00),
(3, 'Bike Infantil', 1, 3, 2023, 1500.00);

INSERT INTO stores (store_id, store_name, phone, email, street, city, state, zip_code)
VALUES
(1, 'Loja A', '11962053736', 'contato@lojaa.com.br', 'Av. Central', 'São Paulo', 'SP', '12345-000'),
(2, 'Loja B', '21962053736', 'contato@lojab.com.br', 'Rua da Praia', 'Rio de Janeiro', 'RJ', '98765-000'),
(3, 'Loja C', '11962053737', 'contato@lojac.com.br', 'Av. Marginal', 'São Paulo', 'SP', '56789-000');

INSERT INTO stocks (store_id, product_id, quantity)
VALUES
(1, 1, 10),
(1, 2, 5),
(1, 3, 3),
(2, 1, 5),
(2, 2, 5),
(2, 3, 5),
(3, 3, 50);

INSERT INTO customers (customer_id, first_name, last_name, phone, email, street, city, state, zip_code)
VALUES
(1, 'Augustin', 'Rossi', '11962053738', 'arossi@email.com.br', 'Rua A', 'São Paulo', 'SP', '12345-001'),
(2, 'Cristiane', 'Roseira', '21962053738', 'croseira@email.com.br', 'Rua C', 'Rio de Janeiro', 'RJ', '98765-001'),
(3, 'Gabriel', 'Barbosa', '11962053739', 'gbarbosa@email.com.br', 'Rua G', 'São Paulo', 'SP', '12345-002'),
(4, 'Eduarda', 'Silva', '21962053739', 'esilva@email.com.br', 'Rua E', 'Rio de Janeiro', 'RJ', '98765-002'),
(5, 'Felipe', 'Luiz', '11962053740', 'fluiz@email.com.br', 'Rua F', 'São Paulo', 'SP', '12345-003');

INSERT INTO staffs (staff_id, first_name, last_name, email, phone, active, store_id, manager_id)
VALUES
(1, 'Gabriela', 'Portilho', 'gportilho@lojaa.com.br', '11962053741', 1, 1, 1),
(2, 'David', 'Luiz', 'dluiz@lojaa.com.br', '11962053742', 1, 1, 1),
(3, 'Anna', 'Luiza', 'aluiza@lojab.com.br', '21962053740', 1, 2, 1),
(4, 'Gillermo', 'Varela', 'gvarela@lojab.com.br', '21962053741', 1, 2, 1),
(5, 'Wesley', 'Lima', 'wlima@lojac.com.br', '11962053743', 1, 3, 1),
(6, 'Georgian', 'Arrascaeta', 'garrascaeta@lojac.com.br', '11962053744', 1, 3, 1),
(7, 'Erik', 'Pulgar', 'epulgar@lojac.com.br', '11962053745', 1, 3, 1);

INSERT INTO orders (order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
VALUES
(1, 3, 'completed', '2024-03-01', '2024-03-05', '2024-03-06', 2, 4),
(2, 5, 'completed', '2024-06-10', '2024-06-15', '2024-06-16', 1, 1),
(3, 3, 'completed', '2024-06-11', '2024-06-16', '2024-06-17', 3, 6),
(4, 2, 'completed', '2024-09-01', '2024-09-05', '2024-09-06', 2, 3),
(5, 3, 'pending', '2024-09-10', NULL, NULL, 3, 7);

INSERT INTO order_items (order_id, item_id, product_id, quantity, list_price, discount)
VALUES
(1, 1, 1, 2, 5000.00, 200.00),
(1, 2, 2, 1, 3000.00, 0.00),
(2, 1, 3, 1, 1500.00, 0.00),
(3, 1, 3, 2, 1500.00, 50.00),
(4, 1, 1, 5, 5000.00, 500.00);

-- Consulta 1: Clientes que não realizaram uma compra
SELECT c.customer_id, c.first_name, c.last_name, c.email
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Consulta 2: Produtos que não foram comprados
SELECT p.product_id, p.product_name, p.list_price
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

-- Consulta 3: Produtos sem estoque
SELECT p.product_id, p.product_name, s.store_id, s.quantity
FROM products p
JOIN stocks s ON p.product_id = s.product_id
WHERE s.quantity = 0;

-- Consulta 4: Agrupar vendas por marca e loja
SELECT b.brand_name, st.store_name, SUM(oi.quantity) AS total_sold
FROM brands b
JOIN products p ON b.brand_id = p.brand_id
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN stores st ON o.store_id = st.store_id
GROUP BY b.brand_name, st.store_name;

-- Consulta 5: Funcionários que não estão relacionados a um pedido
SELECT s.staff_id, s.first_name, s.last_name, s.email
FROM staffs s
LEFT JOIN orders o ON s.staff_id = o.staff_id
WHERE o.staff_id IS NULL;
