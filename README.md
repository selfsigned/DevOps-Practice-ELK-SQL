# DevOps-Practice-ELK-SQL
A small lab to prepare for my DevOps internship.

# Infrastructure
```
                                    VPC
+---------------------------------------------------------------------------+
|                              Private Subnet                               |
| +--------------------+  +--------------------+   +---------------------+  |
| |      DATABASE 1    |  |      DATABASE 2    |   |      LOGGING        |  |
| |                    |  |                    |   |                     |  |
| |  + MYSQL MASTER    |  |  + MYSQL SLAVE     |   |   + ElasticSearch   |  |
| |                    |  |                    |   |   | Beats           |  |
| |                    |  |                    |   |   + Kibana          |  |
| +--------------------+  +--------------------+   |                     |  |
|                                                  +---------------------+  |
+-----------------------------------------------+                           |
|              Public Subnet                    |                           |
|                                               |                           |
| +--------------------+                        |                           |
| |     APPLICATION    |                        |                           |
| |                    | +--------------------+ |                           |
| |  + NGINX           | |                    | |                           |
| |  + Spring App      | |      BASTION       | |                           |
| |                    | |                    | | +----------------------+  |
| +--------------------+ +--------------------+ | |      NAT GATEWAY     |  |
+-----------------------------------------------+-+----------------------+--+
```

### Subnets
Subnet CIDR Block: `10.0.0.0/16`

| Subnet     | Public        |
|------------|---------------|
| CIDR Block | `10.0.0.0/24` |
| Hosts      | Bastion, App  |

| Subnet     | Private        |
|------------|----------------|
| CIDR Block | `10.0.42.0/24` |

## Environment
Ressource names are prefixed with `${var.env}`. default to __lab__

## Provisioning
Only the __bastion__ host is allowed to SSH to the other instances.

- I'll look into using __packer__ with __ansible__ to build the AMI ahead of time for the DB instances

# Setup

## Aws Credentials
__aws_access_key_id__ and __aws_secret_access_key__
#### With [Pass](https://www.passwordstore.org/)
```bash
export $(pass AWS/non_root_ami_user_api_keys)
```

## SSH
Using `~/.ssh/id_rsa_alt` by default, change it in variables.tf
