## install and run RabbitMQ on local Ubuntu machine

    follow this video: https://www.youtube.com/watch?v=N-AqOeaP8Ag

#### Enabli file permission for run rabbitMQInstallAndRun.sh

    chmod +x rabbitMQInstallAndRun.sh

#### Run this file for install

    ./rabbitMQInstallAndRun.sh

#### check status rabbitmq server

    sudo systemctl status rabbitmq-server

#### enable and start server

    sudo systemctl enable rabbitmq-server
    sudo systemctl start rabbitmq-server

#### view list of rabbitmq plugins

    sudo rabbitmq-plugins list

#### enable or run admin UI server for manage rabbitmq server

    sudo rabbitmq-plugins enable rabbitmq_management

#### go to local server and default user and pass

    localhost:15672
    user: guest

#### amqplib

    advanced messaging queue protocol library
