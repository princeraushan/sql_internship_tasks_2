-- =====================================================
-- Task 2: SQL Developer Internship
-- Topic: Data Types, Constraints & Table Design
-- =====================================================

-- Use existing database created in Task 1
USE intern_training_db;

-- -----------------------------------------------------
-- Step 1: Review existing table structure
-- (Helps understand current design before modification)
-- -----------------------------------------------------
DESCRIBE students;

-- -----------------------------------------------------
-- Step 2: Add PRIMARY KEY constraint
-- Ensures each record is uniquely identifiable
-- -----------------------------------------------------
ALTER TABLE students
ADD PRIMARY KEY (id);

-- -----------------------------------------------------
-- Step 3: Modify columns with proper data types & NOT NULL
-- Prevents missing and invalid data
-- -----------------------------------------------------
ALTER TABLE students
MODIFY name VARCHAR(100) NOT NULL,
MODIFY email VARCHAR(100) NOT NULL,
MODIFY age INT NOT NULL;

-- -----------------------------------------------------
-- Step 4: Add UNIQUE constraint on email
-- Prevents duplicate student records
-- -----------------------------------------------------
ALTER TABLE students
ADD CONSTRAINT unique_email UNIQUE (email);

-- =====================================================
-- Handling Duplicate Email Records Before Adding UNIQUE Constraint
-- =====================================================

-- Step 5.1: Identify duplicate email entries
-- This query finds email IDs that appear more than once
SELECT email, COUNT(*) AS duplicate_count
FROM students
GROUP BY email
HAVING COUNT(*) > 1;

-- -----------------------------------------------------

-- Step 5.2: View complete records of duplicate emails
-- Helps decide which records to keep or remove
SELECT *
FROM students
WHERE email IN (
    SELECT email
    FROM students
    GROUP BY email
    HAVING COUNT(*) > 1
);

-- -----------------------------------------------------

-- Step 5.3: Remove duplicate records safely
-- Keeps the record with the smallest ID and deletes others
-- This ensures one unique email per student
DELETE s1
FROM students s1
JOIN students s2
ON s1.email = s2.email
AND s1.id > s2.id;

-- -----------------------------------------------------
-- Disable Safe Update Mode temporarily
-- Required to delete duplicate records safely
-- -----------------------------------------------------
SET SQL_SAFE_UPDATES = 0;

-- -----------------------------------------------------

-- Step 5.4: Verify that duplicates have been removed
-- If this query returns no rows, duplicates are cleared
SELECT email, COUNT(*) AS count
FROM students
GROUP BY email
HAVING COUNT(*) > 1;

-- -----------------------------------------------------

-- Step 5.5: Add UNIQUE constraint on email column
-- This will succeed only after duplicate records are removed
ALTER TABLE students
ADD CONSTRAINT unique_email UNIQUE (email);


-- -----------------------------------------------------
-- Step 5: Add a DATE column using correct data type
-- Stores date of birth properly
-- -----------------------------------------------------
ALTER TABLE students
ADD COLUMN dob DATE;

-- -----------------------------------------------------
-- Step 6: Add a TIMESTAMP column
-- Automatically stores record creation time
-- -----------------------------------------------------
ALTER TABLE students
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- -----------------------------------------------------
-- Step 7: Insert valid data
-- Confirms constraints allow correct entries
-- -----------------------------------------------------
INSERT INTO students (name, email, age, dob) VALUES
('Rohit Kumar', 'rohit@gmail.com', 22, '2002-04-12');

-- -----------------------------------------------------
-- Step 8: Try inserting invalid data (Constraint Testing)
-- Demonstrates data integrity enforcement
-- -----------------------------------------------------

-- Duplicate email (UNIQUE constraint violation)
INSERT INTO students (name, email, age)
VALUES ('Test User', 'rohit@gmail.com', 20);

-- NULL value (NOT NULL constraint violation)
INSERT INTO students (name, email, age)
VALUES (NULL, 'nulltest@gmail.com', 21);

-- -----------------------------------------------------
-- Step 9: Add a new column using ALTER TABLE
-- Demonstrates table modification without data loss
-- -----------------------------------------------------
ALTER TABLE students
ADD COLUMN phone_number VARCHAR(15);

-- -----------------------------------------------------
-- Step 10: Rename a column
-- Improves column naming clarity
-- -----------------------------------------------------
ALTER TABLE students
RENAME COLUMN phone_number TO mobile_number;

-- -----------------------------------------------------
-- Step 11: Drop a column carefully
-- Demonstrates permanent column removal
-- -----------------------------------------------------
ALTER TABLE students
DROP COLUMN dob;

-- -----------------------------------------------------
-- Step 12: View final table structure
-- Confirms all redesign changes
-- -----------------------------------------------------
DESCRIBE students;
