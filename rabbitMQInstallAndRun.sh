#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# update and upgrade
sudo apt update
sudo apt upgrade -y

# Remove Existing RabbitMQ and Erlang Repositories:

sudo rm /etc/apt/sources.list.d/rabbitmq.list

# Install libssl3 / libssl1.1

sudo apt-get install libssl3

# Add Official RabbitMQ and Erlang Repositories Again:
curl -fsSL https://keys.openpgp.org/vks/v1/by-fingerprint/0A9AF2115F4687BD29803A206B73A36E6026DFCA | sudo tee /usr/share/keyrings/rabbitmq-archive-keyring.gpg > /dev/null

#  Add the RabbitMQ repository to your sources list:
echo "deb [signed-by=/usr/share/keyrings/rabbitmq-archive-keyring.gpg] https://ppa.launchpadcontent.net/rabbitmq/rabbitmq-server/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/rabbitmq.list

# sudo apt-get update
sudo apt-get update

# Install Required Packages:
sudo apt-get install erlang-nox rabbitmq-server -y

# Enable and Start RabbitMQ:

sudo systemctl enable rabbitmq-server
sudo systemctl start rabbitmq-server

# Check RabbitMQ Status:
sudo systemctl status rabbitmq-server



## Custom from my environment
## if you dont want to install plugin rabbitmq_management then comment below line

# ## view list of rabbitmq plugins 
    sudo rabbitmq-plugins list


# ## install and enable plugin rabbitmq_management

# ## Prompt the user for input
read -p "Do you want to run enable plugin rabbitmq_management ? (yes/no): " user_input

# ## Convert input to lowercase (to handle Yes, YES, etc.)
user_input=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')

## Check the user's input
if [ "$user_input" = "yes" ]; then
    echo " Running the enable rabbitmq_management..."
    ## enable or run admin UI server for manage rabbitmq server
    sudo rabbitmq-plugins enable rabbitmq_management
    
else
    echo "Script will not run."
fi

echo "All commands were successful!"
