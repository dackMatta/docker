@echo off

REM Name of the Docker image
set IMAGE_NAME=my-apache-image

REM Name of the Docker container
set CONTAINER_NAME=my-apache-container

REM Build the Docker image
echo Building Docker image...
docker build -t %IMAGE_NAME% .

REM Stop the container if it is running
docker ps -q -f name=%CONTAINER_NAME% | findstr . && docker stop %CONTAINER_NAME%

REM Remove the container if it exists
docker ps -a -q -f name=%CONTAINER_NAME% | findstr . && docker rm %CONTAINER_NAME%

REM Run a new container from the built image
echo Running Docker container...
docker run -d -p 8080:80 --name %CONTAINER_NAME% %IMAGE_NAME%

echo Container is running at http://localhost:8080
