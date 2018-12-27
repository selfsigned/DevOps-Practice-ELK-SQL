#!/bin/bash

TERRAFORM_PATH="terraform/"
INVENTORY_FILE="inventory"

# Host parameters
BASTION_PARAMS="ansible_user=ubuntu"
DB_PARAMS=""


cd $TERRAFORM_PATH

# Single IPs
BASTION_IP=$(terraform output -json bastion_ip | jq -r '.value[]')
# Arrays
DB_IPS=($(terraform output -json db_ips | jq -r '.value[]'))

cd ..


### INVENTORY FILE ###

SSH_PARAMS="ansible_ssh_common_args='-o ProxyCommand=\"ssh -W %h:%p -q ubuntu@$BASTION_IP\"'"

cat > $INVENTORY_FILE <<HERE
[BASTION]
$BASTION_IP $BASTION_PARAMS

[DB]
$(printf "%s ${DB_PARAMS}\n" ${DB_IPS[@]})

[all:vars]
$SSH_PARAMS
HERE
