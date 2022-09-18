# Build Docker image and deploy to Elastic Container Registry

VERSION=$1

docker build -t sftp-idp-function-test:$VERSION --build-arg VERSION=$VERSION .

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 924586450630.dkr.ecr.us-east-1.amazonaws.com
IMAGE_URI="924586450630.dkr.ecr.us-east-1.amazonaws.com/sftp-idp-function-test:$VERSION"
docker tag sftp-idp-function-test:$VERSION 924586450630.dkr.ecr.us-east-1.amazonaws.com/sftp-idp-function-test:$VERSION
docker push $IMAGE_URI

aws lambda update-function-code --region us-east-1 --function-name sftp-idp-function-test --image-uri $IMAGE_URI
