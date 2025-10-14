# motivalogi-pet

## S3 Bucket Provisioning Scripts

### Create S3 Bucket with Versioning
Run the following script to create an S3 bucket and enable versioning:

```bash
./create-s3-bucket.sh <bucket-name> <region>
```

### Destroy S3 Bucket
Run the following script to delete all objects (including versions) and remove the S3 bucket:

```bash
./destroy-s3-bucket.sh <bucket-name> <region>
```

**Note:** These scripts require AWS CLI and `jq` to be installed and configured with appropriate permissions.

## VPC and Subnet Terraform Configuration

The `vault-jenkins/main.tf` file contains Terraform resources to provision:

- A VPC
- Two subnets in different availability zones
- An Internet Gateway
- A Route Table and associations
- A Security Group allowing all inbound and outbound traffic

### Usage

1. Ensure you have Terraform and AWS credentials configured.
2. Edit the CIDR blocks, region, and tags as needed in `vault-jenkins/main.tf`.
3. Initialize and apply the configuration:

```bash
terraform init
terraform apply
```

This will create the VPC and its components in your AWS account.