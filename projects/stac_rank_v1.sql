-- STACK RANK PROJECT 

CREATE DATABASE stackrank_v1;

-- TABLE-1 : User Address
CREATE TABLE address(
id INT AUTO_INCREMENT PRIMARY KEY,
locality VARCHAR(64),
pin VARCHAR(10),
state VARCHAR(16),
country VARCHAR(16),
lat VARCHAR(16),
log VARCHAR(16)
);


-- TABLE-2 : User
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(32),
    mname VARCHAR(32),
    lname VARCHAR(32),
    mobile VARCHAR(16),
    email VARCHAR(16),
    dob DATE,
    img VARCHAR(128),
    user_type VARCHAR(10),
    address_id VARCHAR(16),
    collages_info VARCHAR(16),
    CONSTRAINT fk_address_id FOREIGN KEY (address_id)
        REFERENCES address (id),
    CONSTRAINT fk_collages_info FOREIGN KEY (collages_info)
        REFERENCES user_collage (id)
);


-- TABLE-3 : Collage
CREATE TABLE collage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(128),
    address_id VARCHAR(16),
    department_info VARCHAR(16),
    year_of_establishment DATE,
    CONSTRAINT fk_address_id FOREIGN KEY (address_id)
        REFERENCES address (id),
    CONSTRAINT fk_department_info FOREIGN KEY (department_info)
        REFERENCES collage_department (id)
);


-- TABLE-4 : Department
CREATE TABLE department (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dname VARCHAR(128),
    hod VARCHAR(16),
    CONSTRAINT fk_hod FOREIGN KEY (hod)
        REFERENCES user(id)
);

