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

## VPC
### Subnets

| Subnet     | Public        |
|------------|---------------|
| CIDR Block | 10.13.37.0/24 |
| Hosts      | Bastion, App  |

| Subnet     | Private     |
|------------|-------------|
| CIDR Block | 10.4.2.0/24 |


# Setup
## Aws Credentials
__aws_access_key_id__ and __aws_secret_access_key__
#### With [Pass](https://www.passwordstore.org/)
```bash
export $(pass AWS/non_root_ami_user_api_keys)
```
