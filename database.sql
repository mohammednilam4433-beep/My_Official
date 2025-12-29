CREATE DATABASE lifebridge_rural;
USE lifebridge_rural;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    icon VARCHAR(50)
);

CREATE TABLE solutions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE user_queries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    category_id INT,
    query_text TEXT NOT NULL,
    status ENUM('pending', 'resolved') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Insert default admin user (password: admin123)
INSERT INTO users (name, email, password, role) 
VALUES ('Admin User', 'admin@lifebridgelk.lk', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin');

-- Insert categories
INSERT INTO categories (name, description, icon) VALUES
('Government Schemes & Financial Aid', 'Information on government programs and financial assistance', 'fas fa-landmark'),
('Government Regulations & Permissions', 'Guidance on permits, licenses and regulatory requirements', 'fas fa-file-alt'),
('Health & Safety', 'Healthcare services, safety guidelines and wellness programs', 'fas fa-heartbeat'),
('Agriculture & Market', 'Farming techniques, market prices and agricultural support', 'fas fa-tractor'),
('Social Welfare & Others', 'Social programs, educational support and community services', 'fas fa-hands-helping');

-- Insert sample solutions
INSERT INTO solutions (category_id, title, description, content) VALUES
(1, 'Samurdhi Benefits Application', 'Learn how to apply for Samurdhi financial assistance program for low-income families.', 'To apply for Samurdhi benefits, visit your local Samurdhi office with your National Identity Card and proof of income. The program provides financial assistance to low-income families across Sri Lanka.'),
(1, 'Divi Neguma Program', 'Information about the national program for domestic economy enhancement.', 'The Divi Neguma program provides training and resources for household economic development. Contact your local Divi Neguma unit for information on upcoming training sessions.'),
(3, 'CKDu Prevention Guidelines', 'Important information about preventing Chronic Kidney Disease of unknown etiology.', 'To reduce risk of CKDu, ensure access to clean drinking water, reduce exposure to pesticides and fertilizers, and maintain regular health check-ups.'),
(4, 'Fertilizer Subsidy Program', 'How to access government fertilizer subsidies for farming.', 'Registered farmers can access fertilizer subsidies through the Department of Agriculture. You will need your farmer registration card and land ownership documents.');