# DTR System (Daily Time Record + Task Journal)

A Ruby on Rails-based attendance and task tracking system that automatically generates daily task records when a user times out. Designed for interns and employees to log attendance and reflect daily work through editable task journals.

---

## Features

### Attendance Tracking (DTR)
- Time In / Time Out functionality
- Automatic computation of rendered hours
- Daily attendance records per user

### Auto Task Generation
- Automatically creates a task entry when a user times out
- Each task is linked to its corresponding attendance record
- Ensures every work session has a journal entry

### Task Management
- Users can view, edit, and update daily task journals
- Task is tied to attendance date
- Simple CRUD interface for managing daily output

---

## Tech Stack

- Ruby on Rails 8
- SQLite / PostgreSQL (depending on setup)
- TailwindCSS
- ERB Views
- Minitest (default Rails testing)

---

## Core Models

### Attendance
- `time_in`
- `time_out`
- `rendered_hours`
- `date`

### Task
- `title`
- `description`
- `belongs_to :attendance`

---

## Workflow

1. User clicks **Time In**
   - Attendance record is created for today

2. User works throughout the day

3. User clicks **Time Out**
   - Attendance is updated with time_out
   - Rendered hours are calculated
   - A Task is automatically created and linked to that attendance

4. User edits the Task
   - Adds daily journal / notes / work summary

---
