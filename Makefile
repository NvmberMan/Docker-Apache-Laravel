setup:
	@make build
	@make up 
	@make composer-update
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
up:
	docker-compose up -d
composer-update:
	docker exec app bash -c "composer update"
data:
	docker exec app bash -c "php artisan migrate:fresh --seed"
	docker exec app bash -c "php artisan db:seed"
permission:
	docker exec app bash -c "sudo chmod -R 777 storage"
	docker exec app bash -c "php artisan cache:clear"
	docker exec app bash -c "php artisan config:clear"
	docker exec app bash -c "php artisan config:cache"