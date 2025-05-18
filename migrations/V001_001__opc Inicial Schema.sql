-- Tabla de clientes
CREATE TABLE customers (
id INT IDENTITY(1,1) PRIMARY KEY,
name NVARCHAR(100) NOT NULL,
email NVARCHAR(100) NOT NULL UNIQUE,
created_at DATETIME DEFAULT GETDATE()
);
-- Tabla de cuentas
CREATE TABLE accounts (
id INT IDENTITY(1,1) PRIMARY KEY,
customer_id INT NOT NULL,
account_number NVARCHAR(20) NOT NULL UNIQUE,
balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
created_at DATETIME DEFAULT GETDATE(),
CONSTRAINT FK_accounts_customers FOREIGN KEY (customer_id) REFERENCES customers(id)
);
-- Tabla de auditoría
CREATE TABLE audit_log (
id INT IDENTITY(1,1) PRIMARY KEY,
action NVARCHAR(50) NOT NULL,
table_name NVARCHAR(50) NOT NULL,
record_id INT NOT NULL,
[user] NVARCHAR(100) NOT NULL,
change_date DATETIME DEFAULT GETDATE(),
details NVARCHAR(MAX)
);
