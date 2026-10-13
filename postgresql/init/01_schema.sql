-- ============================================================
-- 01_schema.sql
-- Base de datos: retail_db
-- Taller Data Warehouse y Dashboard
-- ============================================================

CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    contact_title VARCHAR(100),
    address VARCHAR(200),
    city VARCHAR(100),
    region VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    phone VARCHAR(50),
    fax VARCHAR(50)
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    title VARCHAR(100),
    birth_date DATE,
    hire_date DATE
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE shippers (
    shipper_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    phone VARCHAR(50)
);

CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    company_name VARCHAR(150) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE region (
    region_id INTEGER PRIMARY KEY,
    region_description VARCHAR(100) NOT NULL
);

CREATE TABLE territories (
    territory_id VARCHAR(20) PRIMARY KEY,
    territory_description VARCHAR(100) NOT NULL,
    region_id INTEGER NOT NULL,
    CONSTRAINT fk_territories_region
        FOREIGN KEY (region_id)
        REFERENCES region(region_id)
);

CREATE TABLE employee_territories (
    employee_id INTEGER NOT NULL,
    territory_id VARCHAR(20) NOT NULL,

    PRIMARY KEY (employee_id, territory_id),

    CONSTRAINT fk_employee_territories_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id),

    CONSTRAINT fk_employee_territories_territory
        FOREIGN KEY (territory_id)
        REFERENCES territories(territory_id)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    supplier_id INTEGER,
    category_id INTEGER,
    unit_price NUMERIC(10,2),
    units_in_stock INTEGER,

    CONSTRAINT fk_products_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES suppliers(supplier_id),

    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id VARCHAR(10),
    employee_id INTEGER,
    order_date DATE,
    ship_via INTEGER,
    freight NUMERIC(10,2),

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_orders_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id),

    CONSTRAINT fk_orders_shipper
        FOREIGN KEY (ship_via)
        REFERENCES shippers(shipper_id)
);

CREATE TABLE order_details (
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL,
    quantity INTEGER NOT NULL,
    discount NUMERIC(10,2) DEFAULT 0,

    PRIMARY KEY (order_id, product_id),

    CONSTRAINT fk_order_details_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT fk_order_details_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

CREATE TABLE customer_demographics (
    customer_type_id VARCHAR(20) PRIMARY KEY,
    customer_desc VARCHAR(100)
);

CREATE TABLE customer_customer_demo (
    customer_id VARCHAR(10) NOT NULL,
    customer_type_id VARCHAR(20) NOT NULL,

    PRIMARY KEY (customer_id, customer_type_id),

    CONSTRAINT fk_customer_demo_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_customer_demo_type
        FOREIGN KEY (customer_type_id)
        REFERENCES customer_demographics(customer_type_id)
);

