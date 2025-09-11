-- CREATE DATABASE lic_portal;
USE lic_portal;


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin') NOT NULL DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE policies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    minAge INT NOT NULL,
    maxAge INT NOT NULL,
    description TEXT,
    rateTable JSON,
    bonus VARCHAR(255)
); 


INSERT INTO policies (name, minAge, maxAge, description, rateTable, bonus) VALUES
('LIC\'s New Endowment Plan', 18, 55, 'A classic plan for savings and protection.', JSON_OBJECT("20", 45.50, "25", 35.80), 'Reversionary Bonus'),
('LIC\'s Jeevan Labh', 8, 59, 'Pay premiums for a shorter duration and get long-term benefits.', JSON_OBJECT("16", 50.20, "21", 43.20, "25", 37.90), 'Loyalty Additions'),
('LIC\'s Jeevan Lakshya', 18, 50, 'Secures your child\'s future with annual income and a final payout.', JSON_OBJECT("20", 48.10, "25", 39.50), 'Survival Benefits'),
('LIC\'s Aadhaar Stambh (For Males)', 8, 55, 'Low-premium savings and protection plan exclusively for men.', JSON_OBJECT("20", 41.20), 'Guaranteed Returns'),
('LIC\'s Aadhaar Shila (For Females)', 8, 55, 'Low-premium savings and protection plan exclusively for women.', JSON_OBJECT("20", 40.80), 'Guaranteed Returns'),
('LIC\'s Single Premium Endowment Plan', 8, 65, 'A one-time investment for a hassle-free lump sum at maturity.', JSON_OBJECT("20", 450.0), 'One-Time Investment'),
('LIC\'s Bima Jyoti', 1, 60, 'Offers guaranteed additions to your sum assured every year.', JSON_OBJECT("15", 78.90, "16", 79.10, "17", 79.25, "18", 79.40, "19", 79.60, "20", 79.85), 'Yearly Guaranteed Additions'),
('LIC\'s Jeevan Azad', 1, 50, 'A simple and flexible endowment plan with limited premium payments.', JSON_OBJECT("20", 42.50), 'Flexible Benefits'),
('LIC\'s Jeevan Amar', 18, 65, 'High life cover at very affordable premiums to protect your family.', JSON_OBJECT("20", 6.80, "30", 8.50, "40", 12.10), 'Life Cover'),
('LIC\'s Tech Term Plan', 18, 65, 'An online-only term plan that offers even lower premiums.', JSON_OBJECT("20", 6.50, "30", 8.20, "40", 11.80), 'Online Rebate'),
('LIC\'s Saral Jeevan Bima', 18, 65, 'A standard, easy-to-understand term plan for everyone.', JSON_OBJECT("20", 7.20, "30", 9.0), 'Standardized Benefits'),
('LIC\'s Jeevan Anand', 18, 50, 'A popular plan combining savings with lifelong risk coverage.', JSON_OBJECT("20", 49.50, "25", 41.80), 'Reversionary Bonus + Final Bonus'),
('LIC\'s Jeevan Umang', 18, 55, 'Provides guaranteed annual income for life plus a lump sum.', JSON_OBJECT("20", 55.50, "25", 45.80), 'Annual Additions'),
('LIC\'s New Money Back Plan 20 Yrs', 13, 50, 'Get periodic payouts during the 20-year policy term.', JSON_OBJECT("20", 75.50), 'Periodic Payouts'),
('LIC\'s New Money Back Plan 25 Yrs', 13, 45, 'Longer term plan providing regular payouts over 25 years.', JSON_OBJECT("25", 62.80), 'Periodic Payouts'),
('LIC\'s Jeevan Shiromani', 18, 55, 'A premium money-back plan for HNIs.', JSON_OBJECT("20", 85.50), 'High Returns'),
('LIC\'s Bima Shree', 18, 55, 'Money-back plan for HNIs.', JSON_OBJECT("20", 82.30), 'Guaranteed Returns'),
('LIC\'s Dhan Rekha', 8, 60, 'Guaranteed survival benefits at regular intervals.', JSON_OBJECT("20", 78.50), 'Survival Benefits'),
('LIC\'s Amritbaal', 0, 13, 'Guaranteed fund for your child\'s higher education.', JSON_OBJECT("20", 51.20), 'Maturity Benefit'),
('LIC\'s New Children\'s Money Back Plan', 0, 12, 'Provides payouts at key milestones in your child\'s life.', JSON_OBJECT("25", 65.50), 'Milestone Payouts'),
('LIC\'s Bhagya Lakshmi', 18, 42, 'Protection plan for low-income groups with a maturity benefit.', JSON_OBJECT("13", 70.0), 'Maturity Benefit'),
('LIC\'s New Jeevan Mangal', 18, 55, 'Term plan for rural sectors with return of premiums.', JSON_OBJECT("10", 35.50), 'Return of Premiums'),
('LIC\'s Jeevan Shanti', 30, 79, 'Pay once and receive a guaranteed pension for life.', NULL, 'Guaranteed Pension'),
('LIC\'s New Jeevan Nidhi', 20, 60, 'Build your retirement fund and receive a pension later.', NULL, 'Guaranteed Pension'),
('LIC\'s Saral Pension', 40, 80, 'Immediate and regular pension for life.', NULL, 'Guaranteed Pension'),
('LIC\'s Nivesh Plus', 1, 70, 'Single premium plan combining insurance with market investments.', NULL, 'Market-Linked Bonus'),
('LIC\'s SIIP', 1, 65, 'Systematic investment plan with life cover.', NULL, 'Investment Returns'),
('LIC\'s Cancer Cover', 20, 65, 'Financial support on the diagnosis of early and major stage cancers.', NULL, 'Lump sum benefit'),
('LIC\'s Arogya Rakshak', 18, 65, 'Fixed benefits for hospitalization and surgeries.', NULL, 'Hospitalization Benefit'),
('LIC\'s Accidental Death & Disability Benefit Rider', 18, 65, 'Additional payout in case of accidental death.', NULL, 'Accidental Benefit'),
('LIC\'s New Term Assurance Rider', 18, 60, 'Increase your total life cover at a very low cost.', NULL, 'Term Cover'),
('LIC\'s New Critical Illness Benefit Rider', 18, 60, 'Lump sum on diagnosis of major illnesses.', NULL, 'Critical Illness Benefit');


SELECT * FROM users;
UPDATE users SET role = 'admin' WHERE username = 'myadmin';
SELECT username, role FROM users;
select *from policies;

UPDATE users SET role = 'admin' WHERE username = 'myadmin';
