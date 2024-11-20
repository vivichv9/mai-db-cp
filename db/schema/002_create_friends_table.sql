CREATE TABLE IF NOT EXISTS friends (
    user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    friend_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    status VARCHAR(20) NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, friend_id),
    CONSTRAINT no_self_friendship CHECK (user_id != friend_id)
);
