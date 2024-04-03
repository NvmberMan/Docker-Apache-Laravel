# Docker Laravel Setup Guide With Apache

This guide will help you set up a Laravel project using Docker. Please follow the instructions carefully.

## For Linux :penguin:

### 1. Installation

To get started, update your package index and install the necessary packages:

```bash
sudo apt update
sudo apt install make
```

### 2. Update Docker Compose Configuration

Navigate to your project directory and update the `docker-compose.yml` file:

- In the `services > app > volumes` section, replace `./<your laravel folder>:/var/www/html` with the path to your Laravel folder.
- In the `services > mysql_db > environment` section, adjust the variables according to your Laravel `.env` file.

### 3. Update Laravel Configuration

Open the `.env` file in your Laravel project and update the `DB_HOST` variable to `mysql_db`.

### 4. Update Makefile

Open the `Makefile` in your project and update the `data` and `permission` sections. Replace `app` with the name of your Laravel app container.

### 5. Run Setup

Execute the following command to set up your Docker environment:

```bash
make setup
```

### 6. Add .htaccess File

Navigate to your Laravel directory and create an `.htaccess` file with the following content:

```apache
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteCond %{REQUEST_URI} !^public
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>
```

### 7. Run Data (Optional)

If you have migrations or seeders, you can run the following command:

```bash
make data
```

### 8. Resolve Permission Errors (Optional)

If you encounter permission errors, run the following command:

```bash
make permission
```


## For Windows :desktop_computer:

### 1. Update Docker Compose Configuration

Navigate to your project directory and update the `docker-compose.yml` file:

- In the `services > app > volumes` section, replace `./<your laravel folder>:/var/www/html` with the path to your Laravel folder.
- In the `services > mysql_db > environment` section, adjust the variables according to your Laravel `.env` file.

### 2. Update Laravel Configuration

Open the `.env` file in your Laravel project and update the `DB_HOST` variable to `mysql_db`.

### 3. Run Setup

Execute the following command to set up your Docker environment:

```bash
docker-compose build --no-cache --force-rm
```

### 4. Run Setup

Execute the following command to set up your Docker environment:

```bash
docker-compose build --no-cache --force-rm
docker-compose up -d
docker exec app bash -c "composer update"
```
Replace "app" with your Container Name that containing your laravel-app

### 5. Run Data Migration and Seeder (Optional)

If you have migrations or seeders, you can run the following command:

```bash
docker exec app bash -c "php artisan migrate:fresh --seed"
docker exec app bash -c "php artisan db:seed"
```
### 6. Resolve Permission Errors (Optional)

If you encounter permission errors, run the following command:

```bash
docker exec app bash -c "sudo chmod -R 777 storage"
docker exec app bash -c "php artisan cache:clear"
docker exec app bash -c "php artisan config:clear"
docker exec app bash -c "php artisan config:cache"
```









