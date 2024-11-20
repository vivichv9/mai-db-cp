CREATE TABLE IF NOT EXISTS user_achievements (
    user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    achievement_id INTEGER NOT NULL REFERENCES achievements(achievement_id) ON DELETE RESTRICT,
    receipt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (user_id, achievement_id)
);
