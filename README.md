# Remote backend folder structure

## Folder structure conventions



    ├── global                                # contains global resources like S3 and DynamoDB config files
    │   ├── s3                             
    │   │   ├── main.tf                       # contains the terraform configuration to define the S3 and DynamoDB configuration 
    │   │   ├── outputs.tf                    # contains outputs from the terraform configuration
    │   │   ├── variables.tf                  # contains variables used in writing the configuration
    |
    ├── stage                                #  contains files for the staging webserver environment
    │   ├── web-server                             
    │   │   ├── main.tf                       # contains the terraform configuration for the ec2 instance
    │   │   ├── outputs.tf                    # contains outputs from the terraform configuration
    │   │   ├── variables.tf                  # contains the variables used in writing the configuration
