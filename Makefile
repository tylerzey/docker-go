OK_COLOR=\033[32;01m
NO_COLOR=\033[0m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

D := docker
REPO := docker-go
AWS_REPO_NAME := REDACTED
IMAGE_NAME := tylerzey/$(REPO)
CONTAINER_NAME := cont-$(REPO)
DIR := $(shell pwd)


build: 
		@echo "$(OK_COLOR)Creating Docker Image$(NO_COLOR)"
		@$(D) build -t $(IMAGE_NAME) .

run: 
		@echo "$(OK_COLOR)Running Docker Image$(NO_COLOR)"
		@$(D) run -d -it --rm -p 8090:80 --name $(CONTAINER_NAME) $(IMAGE_NAME)

kill: 
		@echo "$(OK_COLOR)Killing container$(NO_COLOR)"
		@$(D) kill --signal=SIGHUP $(CONTAINER_NAME)

tag: 
	@echo "$(OK_COLOR)Tagging the container$(NO_COLOR)"
	@$(D) tag $(IMAGE_NAME) $(AWS_REPO_NAME)

login: 
	@echo "$(OK_COLOR) Logging in...$(NO_COLOR)"
	@eval $(aws ecr get-login --no-include-email)

push: 
	@$(D) push $(AWS_REPO_NAME)