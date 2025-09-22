# Task1
# School Management System - Database Schema

## Overview
This project defines the database schema for a School Management System.  
It includes entities for Students, Teachers, Classes, Courses, Grades, and Schools.

## Entities
- **School** → manages classes, courses, teachers
- **Class** → contains students
- **Student** → enrolls in courses
- **Teacher** → teaches courses
- **Course** → offered by school
- **Grade** → stores results of students per course
- **Student_Course / Teacher_Course** → junction tables for many-to-many relations

## Relationships
- One School → Many Classes, Courses, Teachers
- One Class → Many Students
- Student ↔ Course → Many-to-Many (via Student_Course)
- Teacher ↔ Course → Many-to-Many (via Teacher_Course)
- Grade links Student and Course with performance

