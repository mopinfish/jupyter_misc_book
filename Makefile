start:
	docker-compose up
stop:
	docker-compose down
build:
	docker build -f Dockerfile -t mopinfish-jupyter:latest --no-cache=true .
shell:
	docker exec -it jupyter /bin/bash
