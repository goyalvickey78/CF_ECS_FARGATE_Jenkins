# CF_ECS_FARGATE_Jenkins
This Repository for "Everything as a code" through Jenkins. A Jenkins Pipeline will be triggered and all AWS CLI commands can be triggered through container.
However in this example; a Cloud Formation template will create Stack in AWS through Jenkins Pipeline. This particular example is having all things are managed by code and not relying on plugins & utility/software installed on Jenkins Master.

This Repository consists following folders and files:
1. Templates folder - contaning the yml file which has Cloud Formation code to create the ECS Fargate.
2. Parameters folder - containing the json file and it contians all the parameters which are required Cloud Formation yml
3. dockerfile - A customized dockerfile is created which has capabilities of AWS CLI and Cloud Formation Linting; no need to install these on Jenkins Master specifialy.
4. Jenkinsfile - Jenkins Pipeling which will trigger all the stages like "Poll SCM", "Validating CF teamplate & Json" and " Cloud Formation Stack creation". 
