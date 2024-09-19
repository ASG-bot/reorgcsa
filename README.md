## reorgcsa

### Requirements

* Dockerfiles were created to containerize both applications within both the api and aws-lambda folders
* All the infrastructure was created with Terraform modules and is executed from the project's main.tf file
* In the .github/workflow/ directory, you can find the application deployments with github action
* FastApi use api-deployment.yaml to deploy in ECS service
* AWS lambda funtion use lambda-deploy.yaml to deploy as a service

### Deployments

The Terraform file is usually executed manually from the root of the project with local AWS credentials.

`terraform init`

`terraform plan`

`terraform apply`

### Github Action
The API workflow are configured for manual deployments or by push to the main branch in the api directory. 
It creates the image, uploads the image to an ECR repository, and then deploys it to ECS. It is configured with 
credentials and includes an OIDC connection in the comments if needed.

The Lambda workflow It is configured to run the Terraform Lambda module, read the code from the `aws-lambda/handler.py` 
file, generate a `lambda-python.zip` with the contents, and update it in the AWS service, deployed in the same VPC as 
the ECS. The deployment can also be manual or triggered by pushing changes to the `handler.py` file.
