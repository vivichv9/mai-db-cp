CREATE TABLE IF NOT EXISTS user_activities (
    user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    activity_type VARCHAR(30) REFERENCES activity_types(activity_type) ON DELETE RESTRICT,
    start_dttm TIMESTAMP NOT NULL,
    end_dttm TIMESTAMP NOT NULL,
    kcals FLOAT NOT NULL,
    PRIMARY KEY (user_id, activity_type, start_dttm)
);
