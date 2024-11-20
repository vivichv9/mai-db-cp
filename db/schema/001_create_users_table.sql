CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    login VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);
