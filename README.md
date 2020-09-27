# Description

This repository contains a .NET Core Web application, unit tests and Dockerfile.

This Dockerfile is horrible, you may want to fork this repository, fix all the problems and try to update the workflow.

I recommend you to use https://github.com/marketplace/actions/container-structure-test-action to ensure the docker image quality.


## How to run this application

``` bash
docker image build  -t asp-net-container:latest .
docker run -p 801:80 --name asp-net-container asp-net-container:latest
```

this will build an image, start a new container with would serve http requests on localhost, port 801.

http://localhost:801/health
