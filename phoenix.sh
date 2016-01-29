#!/bin/bash
docker-compose rm -f && docker-compose build --no-cache && docker-compose up 
