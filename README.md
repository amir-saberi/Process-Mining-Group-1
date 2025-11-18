# Django File Upload System

A Django web application for managing file uploads and downloads with user authentication and REST API.

## Features

- User authentication system (Register, Login, Logout)
- File upload with metadata (title, description, size, content type)
- File download functionality
- User role management (Admin, Staff, Regular User)
- RESTful API with Django REST Framework
- Token-based API authentication
- User dashboard
- Persian language support

## Project Structure

```
django-file-upload/
├── accounts/           # User management application
│   ├── api/           # API endpoints
│   ├── management/    # Custom management commands
│   ├── models.py      # Custom User model
│   ├── forms.py       # Registration and login forms
│   └── views.py       # Authentication views
├── uploads/           # File upload application
│   ├── models.py      # UploadedFile model
│   ├── forms.py       # Upload form
│   └── views.py       # Upload/download views
├── config/            # Project settings
│   ├── settings.py    # Django settings
│   ├── urls.py        # Main URLs
│   └── wsgi.py        # WSGI configuration
├── templates/         # HTML templates
├── static/           # Static files (CSS, JS)
├── media/            # User uploaded files
├── requirements.txt  # Python dependencies
└── manage.py         # Django management script
```

## Prerequisites

- Python 3.10 or higher
- pip (Python package manager)

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/amir-saberi/Process-Mining-Group-1.git
cd Process-Mining-Group-1
```

### 2. Create virtual environment

```bash
python -m venv .venv
```

### 3. Activate virtual environment

**Windows (PowerShell):**
```powershell
.\.venv\Scripts\Activate.ps1
```

**Windows (CMD):**
```cmd
.venv\Scripts\activate
```

**Linux/Mac:**
```bash
source .venv/bin/activate
```

### 4. Install dependencies

```bash
pip install -r requirements.txt
```

### 5. Create .env file

Copy `.env.example` to `.env`:

```bash
cp .env.example .env
```

Edit `.env` file:

```env
SECRET_KEY=your-secret-key-here
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1
```

### 6. Run database migrations

```bash
python manage.py migrate
```

### 7. Create admin user

```bash
# Method 1: Create default admin
python manage.py seed_admin
# Username: admin
# Password: Admin@12345

# Method 2: Create custom superuser
python manage.py createsuperuser
```

### 8. Run development server

```bash
python manage.py runserver
```

### 9. Open in browser

http://127.0.0.1:8000/

## API Usage

Base URL: `http://127.0.0.1:8000/api/`

### Authentication

**Register:**
```bash
POST /api/register/
Content-Type: application/json

{
  "username": "testuser",
  "email": "test@example.com",
  "password": "password123"
}
```

**Login:**
```bash
POST /api/login/
Content-Type: application/json

{
  "username": "admin",
  "password": "Admin@12345"
}
```

### File Management

**List files:**
```bash
GET /api/uploads/files/
Authorization: Token YOUR_TOKEN_HERE
```

**Upload file:**
```bash
POST /api/uploads/files/
Authorization: Token YOUR_TOKEN_HERE
Content-Type: multipart/form-data

{
  "title": "File Title",
  "description": "Description",
  "file": [FILE]
}
```

**Download file:**
```bash
GET /api/uploads/files/{id}/download/
Authorization: Token YOUR_TOKEN_HERE
```

## Technologies Used

- Backend: Django 5.1.3
- API: Django REST Framework 3.15.2
- Database (Local): SQLite3
- Database (Production): PostgreSQL / MySQL
- Server (Production): Gunicorn
- Static Files: WhiteNoise

## Authors

Amir Hossein Saberi  
Reihane Rezaie

## Project Information

Repository: Process-Mining-Group-1  
Owner: amir-saberi
