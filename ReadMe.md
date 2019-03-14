# Go And Docker

Go compiles to a single binary. It doesn't have a dependency manager.

Docker sets up a consistent enviroment for your program to run anywhere. It helps with a lot of scaling/consistency/deploying things.

Issues this setup resolves:

1. I'm using Go Dep during the Docker build to ensure vendor files are compiled to the Docker image.
2. I'm using Go's static binary build
3. I've setup a makefile to facilitate all the docker commands.

## Helpful links

[Logging in via aws](https://github.com/aws/aws-cli/issues/2351)
Sometimes can get login errors: `aws ecr get-login --no-include-email --region us-east-1 | sh`
