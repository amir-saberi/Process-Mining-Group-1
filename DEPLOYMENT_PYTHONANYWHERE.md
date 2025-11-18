# 🚀 راهنمای استقرار روی PythonAnywhere

## مرحله 1: ثبت‌نام در PythonAnywhere

1. به https://www.pythonanywhere.com بروید
2. روی **"Pricing & signup"** کلیک کنید
3. پلن **"Beginner (Free)"** را انتخاب کنید
4. فرم ثبت‌نام را پر کنید:
   - Username (این نام در URL سایت شما خواهد بود)
   - Email
   - Password
5. ایمیل تأیید را چک کنید و تأیید کنید

---

## مرحله 2: باز کردن Bash Console

1. بعد از ورود، به داشبورد می‌رسید
2. در منوی بالا، روی **"Consoles"** کلیک کنید
3. در قسمت **"Start a new console"**، روی **"Bash"** کلیک کنید

---

## مرحله 3: کلون کردن پروژه از GitHub

در Console که باز شد، دستورات زیر را اجرا کنید:

```bash
# کلون کردن پروژه
git clone https://github.com/amir-saberi/Process-Mining-Group-1.git

# ورود به پوشه پروژه
cd Process-Mining-Group-1

# ساخت virtual environment
python3.10 -m venv venv

# فعال‌سازی virtual environment
source venv/bin/activate

# نصب وابستگی‌ها
pip install -r requirements.txt
```

---

## مرحله 4: تنظیم Web App

1. در منوی بالا، روی **"Web"** کلیک کنید
2. روی **"Add a new web app"** کلیک کنید
3. روی **"Next"** کلیک کنید (domain رایگان شما نمایش داده می‌شود)
4. **"Manual configuration"** را انتخاب کنید
5. **Python 3.10** را انتخاب کنید
6. روی **"Next"** کلیک کنید

---

## مرحله 5: پیکربندی Web App

### الف) تنظیم Source code:

در صفحه Web:
1. در بخش **"Code"**، قسمت **"Source code"** را پیدا کنید
2. مسیر را به این تغییر دهید:
   ```
   /home/YOUR_USERNAME/Process-Mining-Group-1
   ```
   (YOUR_USERNAME را با نام کاربری خود جایگزین کنید)

### ب) تنظیم Virtual Environment:

در بخش **"Virtualenv"**:
1. روی **"Enter path to a virtualenv"** کلیک کنید
2. مسیر را وارد کنید:
   ```
   /home/YOUR_USERNAME/Process-Mining-Group-1/venv
   ```

### ج) تنظیم WSGI file:

1. در بخش **"Code"**، روی لینک WSGI configuration file کلیک کنید
2. محتوای فایل را **پاک کنید**
3. کد زیر را جایگزین کنید:

```python
import os
import sys

# مسیر پروژه
path = '/home/YOUR_USERNAME/Process-Mining-Group-1'
if path not in sys.path:
    sys.path.append(path)

# تنظیم Django settings
os.environ['DJANGO_SETTINGS_MODULE'] = 'config.settings'

# بارگذاری Django
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
```

**نکته:** YOUR_USERNAME را با نام کاربری خود جایگزین کنید

4. روی **"Save"** کلیک کنید

---

## مرحله 6: تنظیم فایل‌های استاتیک

در صفحه Web، در بخش **"Static files"**:

1. روی **"Enter URL"** و **"Enter path"** کلیک کنید:
   - URL: `/static/`
   - Directory: `/home/YOUR_USERNAME/Process-Mining-Group-1/staticfiles`

2. یکی دیگر اضافه کنید:
   - URL: `/media/`
   - Directory: `/home/YOUR_USERNAME/Process-Mining-Group-1/media`

---

## مرحله 7: تنظیم دیتابیس

1. در منوی بالا، روی **"Databases"** کلیک کنید
2. رمز عبور دیتابیس را وارد کنید و **"Initialize MySQL"** را بزنید
3. یک دیتابیس با نام دلخواه بسازید (مثلاً `django_db`)

### تنظیم settings.py برای MySQL:

در Bash console، فایل .env بسازید:

```bash
cd ~/Process-Mining-Group-1
nano .env
```

محتوای زیر را وارد کنید:

```env
SECRET_KEY=your-secret-key-here-change-this
DEBUG=False
ALLOWED_HOSTS=YOUR_USERNAME.pythonanywhere.com
DATABASE_URL=mysql://YOUR_USERNAME:YOUR_DB_PASSWORD@YOUR_USERNAME.mysql.pythonanywhere.com/YOUR_DB_NAME
```

برای ذخیره: `Ctrl+X`، بعد `Y`، بعد `Enter`

---

## مرحله 8: اجرای Migrations

در Bash console:

```bash
cd ~/Process-Mining-Group-1
source venv/bin/activate

# جمع‌آوری فایل‌های استاتیک
python manage.py collectstatic --noinput

# اجرای migrations
python manage.py migrate

# ساخت superuser
python manage.py createsuperuser
# یا
python manage.py seed_admin
```

---

## مرحله 9: بازنشانی و تست

1. در صفحه **"Web"**، روی دکمه سبز **"Reload YOUR_USERNAME.pythonanywhere.com"** کلیک کنید
2. چند دقیقه صبر کنید
3. روی لینک سایت خود کلیک کنید

**آدرس سایت شما:**
```
http://YOUR_USERNAME.pythonanywhere.com
```

**پنل ادمین:**
```
http://YOUR_USERNAME.pythonanywhere.com/admin
```

---

## 🔧 رفع مشکلات رایج

### خطا در بارگذاری:
1. به **"Web"** بروید
2. روی **"Error log"** کلیک کنید
3. خطا را بخوانید و برطرف کنید

### مشکل Static files:
```bash
python manage.py collectstatic --noinput
```

### مشکل دیتابیس:
- مطمئن شوید اطلاعات DATABASE_URL درست است
- چک کنید که دیتابیس در بخش Databases ساخته شده باشد

---

## ✅ پایان!

سایت شما الان روی PythonAnywhere آنلاین است! 🎉

**نکته:** برای به‌روزرسانی کد:
```bash
cd ~/Process-Mining-Group-1
git pull origin main
python manage.py collectstatic --noinput
python manage.py migrate
```

بعد در صفحه Web روی Reload کلیک کنید.
