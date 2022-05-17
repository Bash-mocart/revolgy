# revolgy
## Revolgy CI/CD


## Summary
 This project automate the deployment of microservice application into AWS EKS using Github Actions CI/CD, Terraform and Helm  


## Infra Chart
![infra_chart](https://github.com/Bash-mocart/flugel/blob/main/flugel%20chart.png)  

## Requirements
* 

## Steps to run and test the automation (Terratest)

The aim of this project is to automate deployments and database migrations into aws eks. So without being granted access to this repo, you cant test the work, however you could clone the repo and push it tonn your repository but you have to do a lot of reconfigurations as I used terraform workspaces, github environmemts (staging and prod) 

1. Create a new branch to the master
2. In your terminal, run `go init mod flugel` (flugel can be any name)
3. Next, run `go test -v`

Check the logs for the test results
