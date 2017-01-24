# docker-jenkins-python

Docker Container for usage as a jenkins slave to build python projects.
Preinstalled Python/SQL/Dynamo/Redis/Rabbit.
Based on Ubuntu 16.04.

## Services installed

 - [Python](https://www.python.org/) 2.7
 - [MySQL](https://www.mysql.com/) 
 - [Redis](http://www.redis.io/) 
 - [DynamoDb](https://aws.amazon.com/dynamodb/)
 - [RabbitMq](https://www.rabbitmq.com/)

## SSH Usage

Starts a SSH server with User: jenkins/jenkins

Example: Start all services, install python dependenciesw and start testsuite

```
service mysql start
service redis-server start
ervice dynamo-server start
service rabbitmq-server start
mysql -h localhost -u root -proot -e "CREATE DATABASE mydb;"
python setup.py install
py.test
```
