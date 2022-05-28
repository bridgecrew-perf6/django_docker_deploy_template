# django_docker_deploy_template

#1 docker-compose build

#2 docker-compose run --rm app sh -c "django-admin startproject app ."

#3 docker-compose run --rm app sh -c "python3 manage.py startapp core"