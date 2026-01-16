# SQL Developer Internship – Task 2  
## Data Types, Constraints & Table Design

## 📌 Task Overview
This task focuses on improving the existing `students` table created in Task 1 by redesigning it using proper SQL data types, constraints, and schema modification techniques without dropping the table.

The goal is to understand **data integrity**, **constraint enforcement**, and **real-world table evolution** using `ALTER TABLE`.

---

## 🛠 Tools Used
- MySQL Community Server  
- MySQL Workbench  

(All tools used are free, as per task guidelines)

---

## 📂 Task Objectives Covered
- Redesign the existing table using correct data types (`INT`, `VARCHAR`, `DATE`)
- Apply constraints such as `PRIMARY KEY`, `NOT NULL`, and `UNIQUE`
- Understand the importance of constraints for data integrity
- Handle existing duplicate data before applying constraints
- Modify table structure using `ALTER TABLE`
- Add, rename, and drop columns safely
- Understand MySQL Safe Update Mode

---

## 🔄 Table Redesign Approach
Instead of dropping the table, the redesign was done using `ALTER TABLE` to avoid data loss.  
This reflects real-world database practices where schemas evolve incrementally.

Key improvements:
- Added `PRIMARY KEY` to uniquely identify records
- Enforced `NOT NULL` constraints to prevent missing critical data
- Added a `UNIQUE` constraint on the email column to avoid duplicate student records
- Introduced new columns (`dob`, `created_at`, `mobile_number`) using appropriate data types

---

## ⚠ Handling Duplicate Email Records
While adding the `UNIQUE` constraint on the email column, duplicate email entries were detected in the existing data.

Steps taken:
1. Identified duplicate email values using `GROUP BY` and `HAVING`
2. Reviewed duplicate records to decide which entries to keep
3. Removed duplicate records while retaining the record with the smallest ID
4. Verified that no duplicates remained
5. Applied the `UNIQUE` constraint successfully

This ensured data consistency before enforcing the constraint.

---

## 🔐 MySQL Safe Update Mode
MySQL Workbench uses **Safe Update Mode** to prevent accidental data loss.  
Since duplicate removal required a `DELETE` operation without a simple key-based `WHERE` clause:

- Safe Update Mode was temporarily disabled using:

- Duplicate records were deleted safely
- Safe Update Mode was re-enabled after cleanup

This approach follows best practices for controlled data modification.

---

## 📄 Files Included
- `task2.sql` – Contains:
- Table modifications using `ALTER TABLE`
- Constraint additions
- Duplicate data handling
- Safe Update Mode handling
- Final schema verification

---

## 🎯 Learning Outcomes
- Learned how to redesign an existing table without dropping it
- Understood the importance of constraints for data integrity
- Gained experience handling real-world data issues like duplicates
- Learned how and when to use MySQL Safe Update Mode
- Improved understanding of schema evolution using SQL

---

## ✅ Status
Task 2 completed successfully and ready for submission.
<img width="1440" height="900" alt="Screenshot 2026-01-16 at 6 06 45 PM" src="https://github.com/user-attachments/assets/cf44de94-4d00-46e9-b31b-95fccfe6e12a" />
<img width="1440" height="900" alt="Screenshot 2026-01-16 at 6 06 36 PM" src="https://github.com/user-attachments/assets/d9bbe134-7b2d-4101-bdbe-d9647c2600c4" />
<img width="1440" height="900" alt="Screenshot 2026-01-16 at 6 06 21 PM" src="https://github.com/user-attachments/assets/5dc9958a-39e5-4ba8-9e3a-5a6dbf8baf78" />
<img width="1440" height="900" alt="Screenshot 2026-01-16 at 6 06 08 PM" src="https://github.com/user-attachments/assets/25a83154-c1ef-4ea1-ac47-5bf2a7aa6ab5" />
<img width="1440" height="900" alt="Screenshot 2026-01-16 at 6 05 58 PM" src="https://github.com/user-attachments/assets/e4919a3f-a298-402a-a9de-01524a9a07c9" />
<img width="1440" height="900" alt="Screenshot 2026-01-16 at 6 04 42 PM" src="https://github.com/user-attachments/assets/1ac26f45-0049-495e-9896-438d7f187658" />
<img width="1440" height="900" alt="Screenshot 2026-01-16 at 6 04 22 PM" src="https://github.com/user-attachments/assets/1058c38c-ef79-4022-8811-c0a4f061ff68" />
<img width="1440" height="900" alt="Screenshot 2026-01-16 at 6 01 53 PM" src="https://github.com/user-attachments/assets/5eb882bc-83ab-4bcc-ba49-5469a66a805b" />
<img width="1440" height="900" alt="Screenshot 2026-01-16 at 6 01 46 PM" src="https://github.com/user-attachments/assets/2790c2b5-1bcb-41fe-a9b8-2c92e10238b6" />
<img width="1440" height="900" alt="Screenshot 2026-01-16 at 6 00 08 PM" src="https://github.com/user-attachments/assets/a67695c8-3d0b-4820-ae86-988f76265a28" />
<img width="1440" height="900" alt="Screenshot 2026-01-16 at 5 59 01 PM" src="https://github.com/user-attachments/assets/ee15a970-52aa-4fd2-8862-f10bcc083105" />
