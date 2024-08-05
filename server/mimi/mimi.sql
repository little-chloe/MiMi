SET DEFINE OFF;

DROP TABLE mimi_token;

DROP TABLE mimi_user;

CREATE TABLE mimi_user (
    id NVARCHAR2 (255) NOT NULL PRIMARY KEY,
    phone_number NVARCHAR2 (255),
    password NVARCHAR2 (255),
    name NVARCHAR2 (255),
    role NVARCHAR2 (255),
    created_at DATE,
    password_updated_at DATE,
    is_active NUMBER (1) DEFAULT 1,
    CONSTRAINT chk_mimi_user_role CHECK (
        role IN (
            'admin',
            'user'
        )
    )
);

INSERT INTO mimi_user(id,phone_number, password, name, role) VALUES ('F0C8CB35F1434C8BABE8E736E36A1A0E','000000001', '$2a$10$OK0gQxDSMaBXN6f8rdIqYu8U/ebzue7Px8tRhRQ0xYS6vpA0bNWH6', 'admin', 'admin');
INSERT INTO mimi_user(id,phone_number, password, name, role) VALUES ('F0C8CB35F1434C8BABE8E736E36A2A0E','000000002', '$2a$10$OK0gQxDSMaBXN6f8rdIqYu8U/ebzue7Px8tRhRQ0xYS6vpA0bNWH6', 'user 1', 'user');
INSERT INTO mimi_user(id,phone_number, password, name, role) VALUES ('F0C8CB35F1434C8BABE8E736E36A3A0E','000000003', '$2a$10$OK0gQxDSMaBXN6f8rdIqYu8U/ebzue7Px8tRhRQ0xYS6vpA0bNWH6', 'user 2', 'user');
INSERT INTO mimi_user(id,phone_number, password, name, role) VALUES ('F0C8CB35F1434C8BABE8E736E36A4A0E','000000004', '$2a$10$OK0gQxDSMaBXN6f8rdIqYu8U/ebzue7Px8tRhRQ0xYS6vpA0bNWH6', 'user 3', 'user');
INSERT INTO mimi_user(id,phone_number, password, name, role) VALUES ('F0C8CB35F1434C8BABE8E736E31A4A0E','000000006', '$2a$10$OK0gQxDSMaBXN6f8rdIqYu8U/ebzue7Px8tRhRQ0xYS6vpA0bNWH6', 'user 4', 'user');
INSERT INTO mimi_user(id,phone_number, password, name, role) VALUES ('F0C8CB35F1434C8BABE8E736E32A4A0E','000000007', '$2a$10$OK0gQxDSMaBXN6f8rdIqYu8U/ebzue7Px8tRhRQ0xYS6vpA0bNWH6', 'user 5', 'user');
INSERT INTO mimi_user(id,phone_number, password, name, role) VALUES ('F0C8CB35F1434C8BABE8E736E33A4A0E','000000008', '$2a$10$OK0gQxDSMaBXN6f8rdIqYu8U/ebzue7Px8tRhRQ0xYS6vpA0bNWH6', 'user 6', 'user');
INSERT INTO mimi_user(id,phone_number, password, name, role) VALUES ('F0C8CB35F1434C8BABE8E736E34A4A0E','000000009', '$2a$10$OK0gQxDSMaBXN6f8rdIqYu8U/ebzue7Px8tRhRQ0xYS6vpA0bNWH6', 'user 7', 'user');
INSERT INTO mimi_user(id,phone_number, password, name, role) VALUES ('F0C8CB35F1434C8BABE8E736E35A4A0E','000000010', '$2a$10$OK0gQxDSMaBXN6f8rdIqYu8U/ebzue7Px8tRhRQ0xYS6vpA0bNWH6', 'user 8', 'user');
INSERT INTO mimi_user(id,phone_number, password, name, role) VALUES ('F0C8CB35F1434C8BABE8E736E37A4A0E','000000011', '$2a$10$OK0gQxDSMaBXN6f8rdIqYu8U/ebzue7Px8tRhRQ0xYS6vpA0bNWH6', 'user 9', 'user');


CREATE TABLE mimi_token (
    id NVARCHAR2 (255) NOT NULL PRIMARY KEY,
    token VARCHAR2 (255) UNIQUE NOT NULL,
    token_type VARCHAR2 (255) NOT NULL,
    expiration_date DATE,
    revoked NUMBER (1) NOT NULL,
    expired NUMBER (1) NOT NULL,
    refresh_token VARCHAR2 (255) NOT NULL,
    refresh_expiration_date DATE,
    user_id NVARCHAR2 (255),
    CONSTRAINT fk_user_id_mimi_token FOREIGN KEY (user_id) REFERENCES mimi_user (id)
);