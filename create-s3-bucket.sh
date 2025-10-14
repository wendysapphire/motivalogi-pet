#!/bin/bash

# Usage: ./create-s3-bucket.sh <bucket-name> <region>
BUCKET_NAME="adoption-bucket1"
REGION="eu-west-1"

# Create the S3 bucket
aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION" \
  --create-bucket-configuration LocationConstraint="$REGION"

# Enable versioning on the bucket
aws s3api put-bucket-versioning --bucket "$BUCKET_NAME" \
  --versioning-configuration Status=Enabled

echo "S3 bucket '$BUCKET_NAME' created and versioning enabled."
