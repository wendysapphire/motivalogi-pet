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