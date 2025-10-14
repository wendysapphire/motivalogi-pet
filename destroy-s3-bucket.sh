#!/bin/bash

# Usage: ./destroy-s3-bucket.sh <bucket-name> <region>
BUCKET_NAME="adoption-bucket1"
REGION="eu-west-1"

# Remove all objects (including versions) from the bucket
aws s3api list-object-versions --bucket "$BUCKET_NAME" --region "$REGION" --output json \
  | jq -r '.Versions[]?, .DeleteMarkers[]? | {Key: .Key, VersionId: .VersionId} | "--key \"\(.Key)\" --version-id \"\(.VersionId)\""' \
  | xargs -I {} aws s3api delete-object --bucket "$BUCKET_NAME" {} --region "$REGION"

# Delete the bucket
aws s3api delete-bucket --bucket "$BUCKET_NAME" --region "$REGION"

echo "S3 bucket '$BUCKET_NAME' and all its objects have been deleted."
