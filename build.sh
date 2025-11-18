#!/usr/bin/env bash
# exit on error
set -o errexit

# نصب پکیج‌های Python
pip install -r requirements.txt

# جمع‌آوری فایل‌های استاتیک
python manage.py collectstatic --no-input

# اجرای migrations
python manage.py migrate
