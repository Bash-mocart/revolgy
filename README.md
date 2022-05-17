# revolgy
## Revolgy CI/CD


## Summary
 This project automate the deployment of microservice application into AWS EKS using Github Actions CI/CD, Terraform and Helm  

## Detailed
  In github actions workflow, I first tested the infrastructure in my testing environment on terraform workspaces, I then lint, test, build docker image and scan the docker images. I moved to deploy it to a staging environments which is closely like the production environment. I used reusable workflow which I created located at https://raw.githubusercontent.com/Bash-mocart/workflow/main/.github/workflows/deploy.yml . I used helm to deploy the microservices into aws eks, I also installed prometheus and grafana for monitoring. I used alb controller to serve requests to my kubernetes pods. For database migrations, seeing I hide my postgres rds in my private subnet, I decided to use a kubernetes job that runs a container. The container will be responsible for migrating database into my postgres instance. The job deletes itself after completion to free up resources in eks cluster. So when the qa team successfully check and confirmed the staging environment, merging the newly created branch into master will trigger the workflow job to deploy the tested and confirmed application into production environment. 



## Infra Chart
![infra_chart](https://github.com/Bash-mocart/flugel/blob/main/flugel%20chart.png)  

## Requirements
* 

## Steps to evaluate the CI/CD

1. Go to the actions tab and see the results with the jobs ran

2. Check the logs for the test results
