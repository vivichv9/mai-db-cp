CREATE TABLE IF NOT EXISTS activity_types (
    activity_type VARCHAR(30) PRIMARY KEY,
    action VARCHAR(30),
    met INTEGER,
    prize_per_hour INTEGER
);
