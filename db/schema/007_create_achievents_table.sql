CREATE TABLE IF NOT EXISTS achievements (
    achievement_id SERIAL PRIMARY KEY,
    description TEXT NOT NULL,
    prize INTEGER NOT NULL
);
