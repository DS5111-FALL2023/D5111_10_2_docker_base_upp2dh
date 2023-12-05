default:
	@cat makefile

# This command should build the image on your local machine
.PHONY: build
build:
	docker build -t knn_iris .

# this will create a container from the image and run it
.PHONY: run
run:
	docker run knn_iris

# this will start a bash session inside the container, so you can verify the image was created
.PHONY: interbash
interbash:
	docker run -it knn_iris /bin/bash


# login to dockerhub
.PHONY: login
login:
	docker login -u "peu80"

# now push your image to dockerhub
# we need to change the image name to match with the destination docker repo name
.PHONY: push
push:
	docker tag knn_iris peu80/ds5111_docker_lab
	docker push peu80/ds5111_docker_lab:latest



.PHONY: clean_containers
clean_containers:
	docker ps -aq | xargs docker stop | xargs docker rm
