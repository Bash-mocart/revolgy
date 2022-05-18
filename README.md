# revolgy
## Revolgy CI/CD


## Summary
 This project automate the deployment of microservice application into AWS EKS using Github Actions CI/CD, Terraform and Helm 

## Requirements
* Reactjs
* Nodejs
* Npm
* Postgres RDS
* Terraform
* Terratest
* Docker
* AWS EKS (Kubernetes)
* Github Actions (CI/CD)
* Prometheus
* Grafana
* Cloudwatch 

## Detailed
  In github actions workflow, I first tested the infrastructure in my testing environment on terraform workspaces, I then lint, test, build docker image and scan the docker images. I moved to deploy it to a staging environments which is closely like the production environment. I used reusable workflow which I created located at https://raw.githubusercontent.com/Bash-mocart/workflow/main/.github/workflows/deploy.yml . I used helm to deploy the microservices into aws eks, I also installed prometheus and grafana for monitoring. I used alb controller to serve requests to my kubernetes pods. For database migrations, seeing I hide my postgres rds in my private subnet, I decided to use a kubernetes job that runs a container. The container will be responsible for migrating database into my postgres instance. The job deletes itself after completion to free up resources in eks cluster. So when the qa team successfully check and confirmed the staging environment, merging the newly created branch into master will trigger the workflow job to deploy the tested and confirmed application into production environment. 


## Microservices Architecture
 The app was initially not built to be used on microservice architecture. The frontend (react app) serving html allowing the browser to make requests on behalf of the client to the backend. So the backend needs to have a public url.  As we all know this is a great security concern. So I edited the frontend source code  to have the browser sends requests back to the frontend server instead of backend. I added another security layer by implementing kubernetes ingress being satisfied by ALB Controller to provide external access to clients and while the ingress serving as reverse proxy. Whenever the browser sends a requests to the client via `/api` path, the ingress will redirect the request to the backend pod, otherwise it goes to the frontend.


## Monitoring
 For monitoring, I used prometheus and so cool grafana to monitor the kubernetes cluster and its resource


## Logging
 While I exported postgres logs to cloudwatch, the application logs can be seen by running kubectl logs {POD NAME}. To export the logs to cloudwatch, I will install fluentd using helm chart, After creating a log group in cloudwatch, fluentd will export container logs to cloudwatch with necessary permissions

## Purpose of the app
  The app saves a lists of employers in postgres database. The backend upon request gets the data from the database and sends it to the frontend to display to the client.


## Infra Chart
![infra_chart](./infra.png?raw=true "Title")  


## Steps to evaluate the CI/CD

1. Go to the actions tab and see the results with the jobs ran

2. Check the logs for the test results
