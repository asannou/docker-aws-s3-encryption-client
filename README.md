```
$ docker run -i --rm \
-e AWS_REGION \
-e AWS_ACCESS_KEY_ID \
-e AWS_SECRET_ACCESS_KEY \
-e AWS_SESSION_TOKEN \
asannou/aws-s3-encryption-client get-object --bucket <value> --key <value> > <outfile>
```
