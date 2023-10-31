CREATE TABLE list_of_students (
    Name VARCHAR(32) NOT NULL,
    student_number INT NOT NULL,
    year_of_admission INT NOT NULL,
    major VARCHAR(32) NOT NULL,
    phone_number INT NOT NULL,
    address VARCHAR(128) NOT NULL,
    cumulative_credits INT NOT NULL DEFAULT 0,
    average_score INT NOT NULL DEFAULT 0.0,
    enrollment_information TINYINT(1) NOT NULL DEFAULT 1
)ENGINE=InnoDB DEFAULT CHARSET=utf8;