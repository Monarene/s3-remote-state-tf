# Remote backend folder structure

## Folder structure conventions



    ├── global                                # contains globally used resources like S3 and DynamoDB config files
    │   ├── s3                             
    │   │   ├── main.tf                       # contains the terraform configuration to define the  S3 and DynamoDB 
    │   │   ├── outputs.tf                    # contains the outputs from the terraform configuration
    │   │   ├── variables.tf                  # contains the variables used to writing the configuration
    |
    ├── stage                                #  contains files for the staging webserver environment
    │   ├── web-server                             
    │   │   ├── main.tf                       # contains the terraform configuration for ec2 instance
    │   │   ├── outputs.tf                    # contains the outputs from the terraform configuration
    │   │   ├── variables.tf                  # contains the variables used to writing the configuration
