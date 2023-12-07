#!/bin/bash
docker build -t builder --file Dockerfile.build .
docker run -v ./myapp:/target/myapp  builder
docker build -t myapp:latest --file Dockerfile.ci .
docker run myapp:latest