# Laravel for Cloud Run
This project is a base project for running Laravel in Google Cloud Run.

###  Getting started
```bash
npx degit lpshanley/cloud-run-laravel new-project
cd app
composer install
php artisan key:generate
cd ..
docker-compose up -d
```