# DevOps-Practice-ELK-SQL
A small lab to prepare for my DevOps internship.

# Infrastructure
```
                                    VPC
+--------------------------------------------------------------------------+
|                                                                          |
| +--------------------+  +--------------------+   +---------------------+ |
| |      DATABASE 1    |  |      DATABASE 2    |   |      LOGGING        | |
| |                    |  |                    |   |                     | |
| |  - MYSQL MASTER    |  |  - MYSQL SLAVE     |   |   - ElasticSearch   | |
| |                    |  |                    |   |   | Beats           | |
| |                    |  |                    |   |   - Kibana          | |
| +--------------------+  +--------------------+   |                     | |
|                                                  +---------------------+ |
|             +--------------------+                                       |
|             |     APPLICATION    |          +------------------+         |
|             |                    |          |                  |         |
|             |  - NGINX           |          |     BASTION      |         |
|             |  - Spring App      |          |                  |         |
|             |                    |          +------------------+         |
|             +--------------------+                                       |
|                                                                          |
|                          +----------------------+                        |
|                          |     NAT GATEWAY      |                        |
+--------------------------+----------------------+------------------------+
```
# Setup
## Aws Credentials
__aws_access_key_id__ and __aws_secret_access_key__
#### With [Pass](https://www.passwordstore.org/)
```bash
export $(pass AWS/non_root_ami_user_api_keys)
```
