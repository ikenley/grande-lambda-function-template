# small-lambda-function-template

Template for a complex Lambda Function written in Typescript for the [Lambda base container image](https://docs.aws.amazon.com/lambda/latest/dg/nodejs-image.html) Node.js runtime

Lambda Functions have two sustainable equilibria:

1. [Small](https://github.com/ikenley/small-lambda-function-template):
   - Quick and dirty
   - A few lines of code that would fit in one `main.js` file
   - Zero external dependencies
   - 30 years ago these would have been Perl scripts
   - Managed via a zip archive in an S3 bucket
   - These tend to solve jobs like "when an S3 object drops, publish a message to an SQS queue"
2. [Big](https://github.com/ikenley/grande-lambda-function-template):
   - Fully featured services, with tests, a boostrapping service, etc.
   - Similar to a large REST API, except it uses a Lambda event for an entry point rather than a controller
   - External package dependencies
   - Managed via a Docker image that extends the base Lambda image
   - These exist because a Lambda hook is the only option available (e.g. Cognito event hook)

This repository has boilerplate code for (2), the complex function. Specifically, it manages a function which serves as an [AWS Transfer Family SFTP custom identity provider](https://docs.aws.amazon.com/transfer/latest/userguide/custom-identity-provider-users.html#authentication-lambda-examples)

---

## Getting Started

### Deploying the Docker Image to AWS ECR

```
cd sftp-idp-function
./deploy_docker.sh 0.0.1
```

--

### Terraform Deployment

```
cd terraform/env/dev/s3_notify_function
terraform init
terraform apply
```
